INSERT INTO fournisseur VALUES (0, '3A', 'Adresse 3A', 'Onet');
INSERT INTO fournisseur VALUES (1, 'BureauVale', 'Adresse BV', 'Toulouse');
INSERT INTO fournisseur VALUES (2, 'Leclerc', 'AdresseLec', 'Sebazac');

INSERT INTO article VALUES(0, 'PCportable', 300);
INSERT INTO article VALUES(1, 'Souris', 20);
INSERT INTO article VALUES(2, 'Tour', 250);
INSERT INTO article VALUES(3, 'Ecran', 150);
INSERT INTO article VALUES(4, 'PCportable', 200);
INSERT INTO article VALUES(5, 'Armoire', 75);
INSERT INTO article VALUES(6, 'Stylo', 1.5);
INSERT INTO article VALUES(7, 'Crayon', 0.75);

INSERT INTO livrer VALUES(0, 0, sysdate, 10);
INSERT INTO livrer VALUES(0, 0, TO_DATE('2021-10-05-16-24-00', 'YYYY-MM-DD-HH24-MI-SS'), 10);
INSERT INTO livrer VALUES(1, 0, TO_DATE('2021-10-05-16-24-00', 'YYYY-MM-DD-HH24-MI-SS'), 10);
INSERT INTO livrer VALUES(0, 2, sysdate, 10);
INSERT INTO livrer VALUES(1, 0, sysdate, 5);
INSERT INTO livrer VALUES(1, 2, TO_DATE('2021-10-05-16-24-00', 'YYYY-MM-DD-HH24-MI-SS'), 10);
INSERT INTO livrer VALUES(2, 3, sysdate, 5);
INSERT INTO livrer VALUES(2, 5, sysdate, 3);
INSERT INTO livrer VALUES(2, 6, sysdate, 3);
INSERT INTO livrer VALUES(1, 6, sysdate, 2);
INSERT INTO livrer VALUES(1, 7, sysdate, 2);