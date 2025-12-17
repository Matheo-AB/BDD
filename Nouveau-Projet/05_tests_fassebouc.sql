SET SERVEROUTPUT ON;

-- 1. Test de connexion/déconnexion
DECLARE
    v_connecte BOOLEAN;
BEGIN
    v_connecte := PackFasseBouc.connexion('jdoe', 'mdp123');
    IF v_connecte THEN
        DBMS_OUTPUT.PUT_LINE('Test 1.1: Connexion de jdoe réussie.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Test 1.1: ÉCHEC de la connexion de jdoe.');
    END IF;
    PackFasseBouc.deconnexion;
    
    v_connecte := PackFasseBouc.connexion('jdoe', 'mauvais_mdp');
    IF NOT v_connecte THEN
        DBMS_OUTPUT.PUT_LINE('Test 1.2: Échec de connexion (mauvais mdp) OK.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Test 1.2: ÉCHEC du test mauvais mdp.');
    END IF;
END;
/

-- 2. Test de compterAmi
SELECT PackFasseBouc.compterAmi('jdoe') AS Nb_Amis_jdoe, 
       PackFasseBouc.compterAmi('user_a') AS Nb_Amis_user_a
FROM DUAL;

-- 3. Test de afficherAmi
EXEC PackFasseBouc.afficherAmi('jdoe');

-- 4. Test de chercherMembre
EXEC PackFasseBouc.chercherMembre('a');

-- 5. Test d'affichage du Mur (doit montrer les messages et les réponses)
EXEC PackFasseBouc.afficherMur('asmith');

-- 6. Test de suppression de message (suppression autorisée par l'auteur)
EXEC PackFasseBouc.supprimerMessageMur(2, 'asmith'); -- Supprime le message 2 (asmith est l'auteur)

-- 7. Test de suppression de message (suppression non autorisée)
BEGIN
    PackFasseBouc.supprimerMessageMur(1, 'tdupont'); -- tdupont n'est pas l'auteur du message 1
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Test 7: Erreur d''autorisation attendue levée : ' || REPLACE(SQLERRM, CHR(10), ''));
END;
/

-- 8. Test de suppression d'ami
EXEC PackFasseBouc.supprimerAmi('jdoe', 'tdupont');
SELECT PackFasseBouc.compterAmi('jdoe') AS Nb_Amis_jdoe_apres_suppr FROM DUAL;

COMMIT;