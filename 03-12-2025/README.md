BDD -> FACEBOOK

Utilisateur : Système de login
Ami : Accord de partage d'informations avec un autre utilisateur
Mur : Affichage des messages publics entre utilisateurs

---

Un membre peut communiquer avec d'autres membres sans forcément devenir un Ami.
Les Amis peuvent discuter sur un canal privé. (Format : 1message / 1réponse)

---

Procédures -> Dossier "PackFasseBouc"

1 - ajouterUtilisateur(loginUtilisateur) / Création d'un utilisateur
2 - supprimerUtilisateur() / Suppression de l'utilisater courant
3 - connexion(loginUtilisateur) / Connexion d'un Utilisateur
4 - deconnexion() Déconnexion d'un utilisateur
5 - ajouterAmi(loginAmi) / Ajouter un ami sans acceptation
6 - supprimerAmi(loginAmi) / Suppression du lien d'amitié
7 - afficherMur(loginUtilisateur) / Affichage des messages publics reçus par un utilisateur en particulier.
8 - ajouterMessageMur(loginAmi, message) / Ajouter un message sur le mur d'un ami ou sur son propre mur
9 - supprimerMessageMur(id_message) / Supprimer un message sur le mur d'un ami ou sur son propre mur
10 - repondreMessageMur(id_message, messageReponse) / Répondre aux messages sur le mur d'un ami
11 - afficherAmi(loginUtilisateur) / Afficher la liste des amis
12 - compterAmi(loginUtilisateur) / Compter le nombre d'amis d'un utilisateur
13 - chercherMembre(prefixeLoginMembre) / Permet de rechercher un membre sur la plateforme

---
Message : id/date_de_publication/
Réponse : message_id/(afficher_si_lien_amitié)
---