-- Composition équipe ONCE
-- code équipe
SELECT codeEquipe FROM equipe WHERE nomEquipe = 'O.N.C.E.';
SELECT nomCoureur FROM coureur 
	WHERE codeequipe = (SELECT codeEquipe FROM equipe WHERE nomEquipe = 'O.N.C.E.');

SELECT nomCoureur FROM coureur C INNER JOIN equipe E
	ON C.codeEquipe = E.codeEquipe
	WHERE nomEquipe = 'O.N.C.E.';
	
SELECT nomCoureur 	FROM 
						coureur C 
					INNER JOIN 
						(SELECT codeEquipe, nomEquipe FROM equipe WHERE nomEquipe = 'O.N.C.E.') E
					ON C.codeEquipe = E.codeEquipe;	