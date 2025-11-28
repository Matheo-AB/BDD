4/  - SELECT NomCoureur FROM coureur INNER JOIN equipe ON coureur.CodeEquipe = equipe.CodeEquipe WHERE equipe.NomEquipe = 'O.N.C.E.'
    - SELECT SUM (nbkm) FROM ETAPE
    - SELECT coureur.nomCoureur FROM COUREUR INNER JOIN EQUIPE ON coureur.CodeEquipe = equipe.CodeEquipe INNER JOIN pays ON coureur.codePays = pays.codePays WHERE equipe.NomEquipe = 'O.N.C.E.' AND pays.nomPays = 'FRANCE'

/*Donner la liste des coureurs qui ont gagnés une étape.*/
SELECT numeroCoureur , MIN(tempsRealise) FROM classement GROUP BY numeroEtape;
--Numéro du coureur correspondant au temps miniml de réalisation.
SELECT CL1.numeroCoureur, CL1.numeroEtape, CL1.tempsRealise FROM classement CL1
                    INNER JOIN (SELECT numeroEtape, MIN(temp-tempsRealise) AS minTps FROM classement GROUP BY numeroEtape) CL2
                    ON CL2.numeroEtape = CL1.numeroEtape AND CL2.minTps = CL1.tempsRealise;
--Jointure avec la table coureur pour connaitre le nom du coureur.
SELECT nomCoureur FROM coureur C
                    INNER JOIN 
                        {
                            SELECT CL1.numeroCoureur, CL1.numeroEtape, CL1.tempsRealise FROM classement CL1
                                    INNER JOIN (SELECT numeroEtape, MIN(temp-tempsRealise) AS minTps FROM classement GROUP BY numeroEtape) CL2
                                    ON CL2.numeroEtape = CL1.numeroEtape AND CL2.minTps = CL1.tempsRealise
                        }CL3
                        ON C.numeroCoureur = CL3.numeroCoureur;