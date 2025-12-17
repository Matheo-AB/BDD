CREATE OR REPLACE PACKAGE BODY PackFasseBouc AS

    -- =======================================================
    -- Gestion utilisateurs & variables
    -- =======================================================

    -- Variable de session / Simulation utilisateur.
    g_utilisateur_connecte UTILISATEUR.LOGIN%TYPE := NULL;

    PROCEDURE ajouterUtilisateur (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE, p_nom IN UTILISATEUR.NOM%TYPE, p_mdp IN UTILISATEUR.MDP%TYPE)
    IS
    BEGIN
        INSERT INTO UTILISATEUR (LOGIN, NOM, MDP)
        VALUES (p_loginUtilisateur, p_nom, p_mdp);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20001, 'Ce login existe déjà.');
    END ajouterUtilisateur;

    PROCEDURE supprimerUtilisateur (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE)
    IS
    BEGIN
        -- Suppressions dans AMI, MESSAGE_MUR, REPONSE sont gérées par CASCADE
        DELETE FROM AMI
        WHERE LOGIN = 

        DELETE FROM MESSAGE_MUR
        WHERE LOGIN = 

        DELETE FROM REPONSE
        WHERE LOGIN = 

        -- Nous comptons sur les contraintes ON DELETE CASCADE si elles sont bien implémentées.
        DELETE FROM UTILISATEUR
        WHERE LOGIN = p_loginUtilisateur;
        
        IF SQL%ROWCOUNT = 0 THEN
             RAISE_APPLICATION_ERROR(-20002, 'Utilisateur non trouvé.');
        END IF;
    END supprimerUtilisateur;

    FUNCTION connexion (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE, p_mdp IN UTILISATEUR.MDP%TYPE) RETURN BOOLEAN
    IS
        v_mdp UTILISATEUR.MDP%TYPE;
    BEGIN
        SELECT MDP INTO v_mdp
        FROM UTILISATEUR
        WHERE LOGIN = p_loginUtilisateur;

        IF v_mdp = p_mdp THEN
            g_utilisateur_connecte := p_loginUtilisateur;
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;
    END connexion;

    PROCEDURE deconnexion
    IS
    BEGIN
        g_utilisateur_connecte := NULL;
        DBMS_OUTPUT.PUT_LINE('Déconnexion effectuée.');
    END deconnexion;
    -- =======================================================
    -- Gestion Amis
    -- =======================================================
    -- Ajout d'ami sans acceptation, gestion de l'ordre canonique
    PROCEDURE ajouterAmi (p_loginAmi1 IN AMI.LOGIN_UTILISATEUR1%TYPE, p_loginAmi2 IN AMI.LOGIN_UTILISATEUR2%TYPE)
    IS
        v_login1 AMI.LOGIN_UTILISATEUR1%TYPE;
        v_login2 AMI.LOGIN_UTILISATEUR2%TYPE;
    BEGIN
        IF p_loginAmi1 = p_loginAmi2 THEN
             RAISE_APPLICATION_ERROR(-20005, 'Un utilisateur ne peut pas s''ajouter lui-même comme ami.');
        END IF;

        IF p_loginAmi1 < p_loginAmi2 THEN
            v_login1 := p_loginAmi1;
            v_login2 := p_loginAmi2;
        ELSE
            v_login1 := p_loginAmi2;
            v_login2 := p_loginAmi1;
        END IF;

        INSERT INTO AMI (LOGIN_UTILISATEUR1, LOGIN_UTILISATEUR2)
        VALUES (v_login1, v_login2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Amitié déjà existante
    END ajouterAmi;
    
    -- Suppression d'ami
    PROCEDURE supprimerAmi (p_loginAmi1 IN AMI.LOGIN_UTILISATEUR1%TYPE, p_loginAmi2 IN AMI.LOGIN_UTILISATEUR2%TYPE)
    IS
        v_login1 AMI.LOGIN_UTILISATEUR1%TYPE;
        v_login2 AMI.LOGIN_UTILISATEUR2%TYPE;
    BEGIN
        IF p_loginAmi1 < p_loginAmi2 THEN
            v_login1 := p_loginAmi1;
            v_login2 := p_loginAmi2;
        ELSE
            v_login1 := p_loginAmi2;
            v_login2 := p_loginAmi1;
        END IF;

        DELETE FROM AMI
        WHERE LOGIN_UTILISATEUR1 = v_login1
          AND LOGIN_UTILISATEUR2 = v_login2;
        IF SQL%ROWCOUNT = 0 THEN
             DBMS_OUTPUT.PUT_LINE('Le lien d''amitié n''existait pas.');
        ELSE
             DBMS_OUTPUT.PUT_LINE('Le lien d''amitié entre ' || p_loginAmi1 || ' et ' || p_loginAmi2 || ' a été supprimé.');
        END IF;
    END supprimerAmi;

    -- Affichage de la liste des amis
    PROCEDURE afficherAmi (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- Amis de ' || p_loginUtilisateur || ' ---');
        
        FOR ami_rec IN (
            SELECT
                CASE
                    WHEN a.LOGIN_UTILISATEUR1 = p_loginUtilisateur THEN u2.NOM || ' (' || u2.LOGIN || ')'
                    ELSE u1.NOM || ' (' || u1.LOGIN || ')'
                END AS ami_details
            FROM AMI a
            JOIN UTILISATEUR u1 ON a.LOGIN_UTILISATEUR1 = u1.LOGIN
            JOIN UTILISATEUR u2 ON a.LOGIN_UTILISATEUR2 = u2.LOGIN
            WHERE a.LOGIN_UTILISATEUR1 = p_loginUtilisateur
               OR a.LOGIN_UTILISATEUR2 = p_loginUtilisateur
            ORDER BY ami_details
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('* ' || ami_rec.ami_details);
        END LOOP;
    END afficherAmi;

    -- Compter le nombre d'amis
    FUNCTION compterAmi (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE)
    RETURN NUMBER
    IS
        v_nombre NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_nombre
        FROM AMI
        WHERE LOGIN_UTILISATEUR1 = p_loginUtilisateur
           OR LOGIN_UTILISATEUR2 = p_loginUtilisateur;
           
        RETURN v_nombre;
    END compterAmi;

    -- =======================================================
    -- Messages Mur
    -- =======================================================

    -- Affichage du Mur (Messages + Réponses)
    PROCEDURE afficherMur (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- Mur de ' || p_loginUtilisateur || ' ---');

        FOR msg_rec IN (
            SELECT ID_MESSAGE, LOGIN_AUTEUR, CONTENU, DATE_PUBLICATION
            FROM MESSAGE_MUR
            WHERE LOGIN_PROPRIETAIRE = p_loginUtilisateur
            ORDER BY DATE_PUBLICATION DESC 
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('------------------------------------');
            DBMS_OUTPUT.PUT_LINE('ID: ' || msg_rec.ID_MESSAGE || ' | Auteur: ' || msg_rec.LOGIN_AUTEUR || ' | Date: ' || TO_CHAR(msg_rec.DATE_PUBLICATION, 'DD/MM/YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('Message: ' || msg_rec.CONTENU);

            FOR rep_rec IN (
                SELECT LOGIN_AUTEUR, CONTENU, DATE_REPONSE
                FROM REPONSE
                WHERE ID_MESSAGE_PARENT = msg_rec.ID_MESSAGE
                ORDER BY DATE_REPONSE ASC
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE('   -> Reponse de ' || rep_rec.LOGIN_AUTEUR || ' (' || TO_CHAR(rep_rec.DATE_REPONSE, 'HH24:MI') || '): ' || rep_rec.CONTENU);
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('------------------------------------');
    END afficherMur;

    -- Ajout de message sur le mur
    PROCEDURE ajouterMessageMur (p_loginAuteur IN UTILISATEUR.LOGIN%TYPE, p_loginProprietaire IN UTILISATEUR.LOGIN%TYPE, p_message IN MESSAGE_MUR.CONTENU%TYPE)
    IS
    BEGIN
        INSERT INTO MESSAGE_MUR (LOGIN_PROPRIETAIRE, LOGIN_AUTEUR, CONTENU)
        VALUES (p_loginProprietaire, p_loginAuteur, p_message);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20006, 'Auteur ou propriétaire du mur non trouvé.');
    END ajouterMessageMur;

    -- Suppression de message (seul l'auteur peut supprimer)
    PROCEDURE supprimerMessageMur (p_id_message IN MESSAGE_MUR.ID_MESSAGE%TYPE, p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE)
    IS
        v_auteur_message MESSAGE_MUR.LOGIN_AUTEUR%TYPE;
    BEGIN
        SELECT LOGIN_AUTEUR
        INTO v_auteur_message
        FROM MESSAGE_MUR
        WHERE ID_MESSAGE = p_id_message;

        IF v_auteur_message = p_loginUtilisateur THEN
            DELETE FROM MESSAGE_MUR
            WHERE ID_MESSAGE = p_id_message;
            DBMS_OUTPUT.PUT_LINE('Message ID ' || p_id_message || ' supprimé avec succès.');
        ELSE
            RAISE_APPLICATION_ERROR(-20003, 'Action non autorisée. Vous n''êtes pas l''auteur de ce message.');
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20004, 'Message ID ' || p_id_message || ' non trouvé.');
    END supprimerMessageMur;
    
    -- Répondre à un message (Ajout d'une réponse)
    PROCEDURE repondreMessageMur (p_id_message IN MESSAGE_MUR.ID_MESSAGE%TYPE, p_loginAuteur IN UTILISATEUR.LOGIN%TYPE, p_messageReponse IN REPONSE.CONTENU%TYPE)
    IS
        v_dummy NUMBER;
    BEGIN
        -- Vérifie que le message parent existe
        SELECT 1 INTO v_dummy FROM MESSAGE_MUR WHERE ID_MESSAGE = p_id_message;
        
        INSERT INTO REPONSE (ID_MESSAGE_PARENT, LOGIN_AUTEUR, CONTENU)
        VALUES (p_id_message, p_loginAuteur, p_messageReponse);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20007, 'Le message parent ID ' || p_id_message || ' n''existe pas.');
    END repondreMessageMur;

    -- =======================================================
    -- Recherche
    -- =======================================================

    -- Recherche par préfixe de login
    PROCEDURE chercherMembre (p_prefixeLoginMembre IN UTILISATEUR.LOGIN%TYPE)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- Résultats de la recherche pour le préfixe : ' || p_prefixeLoginMembre || ' ---');
        
        FOR membre_rec IN (
            SELECT LOGIN, NOM
            FROM UTILISATEUR
            WHERE LOGIN LIKE UPPER(p_prefixeLoginMembre) || '%' 
            ORDER BY LOGIN
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Login: ' || membre_rec.LOGIN || ' | Nom complet: ' || membre_rec.NOM);
        END LOOP;
    END chercherMembre;

END PackFasseBouc;
/