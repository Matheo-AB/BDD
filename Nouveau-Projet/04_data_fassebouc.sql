    -- =======================================================
    -- Utilisateurs
    -- =======================================================

EXEC PackFasseBouc.ajouterUtilisateur('jdoe', 'John DOE', 'mdp123');
EXEC PackFasseBouc.ajouterUtilisateur('asmith', 'Alice SMITH', 'secret');
EXEC PackFasseBouc.ajouterUtilisateur('tdupont', 'Thierry DUPONT', 'titi');
EXEC PackFasseBouc.ajouterUtilisateur('user_a', 'User A', 'pass');

    -- =======================================================
    -- Ajout d'amis
    -- =======================================================

EXEC PackFasseBouc.ajouterAmi('jdoe', 'asmith');
EXEC PackFasseBouc.ajouterAmi('jdoe', 'tdupont');

    -- =======================================================
    -- Exemples de Messages
    -- =======================================================

-- Message 1: jdoe écrit sur le mur de asmith
EXEC PackFasseBouc.ajouterMessageMur('jdoe', 'asmith', 'Salut Alice ! Bienvenue sur FasseBouc !');

-- Message 2: asmith écrit sur son propre mur
EXEC PackFasseBouc.ajouterMessageMur('asmith', 'asmith', 'Première publication ici !');

-- Message 3: tdupont écrit sur le mur de jdoe
EXEC PackFasseBouc.ajouterMessageMur('tdupont', 'jdoe', 'Salut John, on se voit demain ?');

-- Réponses (au Message 1)
EXEC PackFasseBouc.repondreMessageMur(1, 'asmith', 'Merci John ! Ca fait plaisir de te voir ici.');
EXEC PackFasseBouc.repondreMessageMur(1, 'tdupont', 'Je suis là aussi !');

COMMIT;