CREATE PACKAGE PackFasseBouc AS

    -- =======================================================
    -- 1. Utilisateurs
    -- =======================================================

    PROCEDURE ajouterUtilisateur (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE, p_nom IN UTILISATEUR.NOM%TYPE, p_mdp IN UTILISATEUR.MDP%TYPE);
    PROCEDURE supprimerUtilisateur (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE);
    FUNCTION connexion (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE, p_mdp IN UTILISATEUR.MDP%TYPE) RETURN BOOLEAN;
    PROCEDURE deconnexion;

    -- =======================================================
    -- 2. Amis
    -- =======================================================
    
    PROCEDURE ajouterAmi (p_loginAmi1 IN AMI.LOGIN_UTILISATEUR1%TYPE, p_loginAmi2 IN AMI.LOGIN_UTILISATEUR2%TYPE);
    PROCEDURE supprimerAmi (p_loginAmi1 IN AMI.LOGIN_UTILISATEUR1%TYPE, p_loginAmi2 IN AMI.LOGIN_UTILISATEUR2%TYPE);
    PROCEDURE afficherAmi (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE);
    FUNCTION compterAmi (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE) RETURN NUMBER;

    -- =======================================================
    -- 3. Mur
    -- =======================================================

    PROCEDURE afficherMur (p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE);
    PROCEDURE ajouterMessageMur (p_loginAuteur IN UTILISATEUR.LOGIN%TYPE, p_loginProprietaire IN UTILISATEUR.LOGIN%TYPE, p_message IN MESSAGE_MUR.CONTENU%TYPE);
    PROCEDURE supprimerMessageMur (p_id_message IN MESSAGE_MUR.ID_MESSAGE%TYPE, p_loginUtilisateur IN UTILISATEUR.LOGIN%TYPE);
    PROCEDURE repondreMessageMur (p_id_message IN MESSAGE_MUR.ID_MESSAGE%TYPE, p_loginAuteur IN UTILISATEUR.LOGIN%TYPE, p_messageReponse IN REPONSE.CONTENU%TYPE);

    -- =======================================================
    -- 4. Recherche des membres.
    -- =======================================================


    PROCEDURE chercherMembre (p_prefixeLoginMembre IN UTILISATEUR.LOGIN%TYPE);

END PackFasseBouc;
/