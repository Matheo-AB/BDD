INSERT INTO Livre VALUES (1, 'Le Petit Prince', 'Antoine de Saint-Exupery', 'Jeunesse');
INSERT INTO Livre VALUES (2, '1984', 'George Orwell', 'Science-Fiction');
INSERT INTO Livre VALUES (3, 'Le Seigneur des Anneaux', 'J.R.R. Tolkien', 'Fantasy');
INSERT INTO Livre VALUES (4, 'Harry Potter', 'J.K. Rowling', 'Fantasy');
INSERT INTO Livre VALUES (5, 'L''etranger', 'Albert Camus', 'Littérature');
INSERT INTO Livre VALUES (6, 'L''etranger', 'Albert Camus', 'Littérature');
INSERT INTO livre VALUES (22, 'Le Hobbit', 'J.R.R. Tolkien', 'Fantasy');

INSERT INTO Livre2 VALUES (6, 'Dune', 'Frank Herbert', 'Science-Fiction');
INSERT INTO Livre2 VALUES (7, 'Le Comte de Monte-Cristo', 'Alexandre Dumas', 'Aventure');
INSERT INTO Livre2 VALUES (3, 'Le Seigneur des Anneaux', 'J.R.R. Tolkien', 'Fantasy');
INSERT INTO Livre2 VALUES (8, 'Les Miserables', 'Victor Hugo', 'Littérature');
INSERT INTO Livre2 VALUES (10, 'Le Petit Prince', 'Antoine de Saint-Exupéry', 'Jeunesse');
INSERT INTO Livre2 VALUES (1, 'Le Petit Prince', 'Antoine de Saint-Exupéry', 'Jeunesse');

INSERT INTO Emprunt VALUES (1, 2, 11, TO_DATE('2024-11-01', 'YYYY-MM-DD'));
INSERT INTO Emprunt VALUES (2, 3, 12, TO_DATE('2024-11-10', 'YYYY-MM-DD'));
INSERT INTO Emprunt VALUES (3, 10, 13, TO_DATE('2024-11-01', 'YYYY-MM-DD'));

INSERT INTO Membre VALUES (11, 'Alice', 'Paris');
INSERT INTO Membre VALUES (12, 'Bob', 'Lyon');
INSERT INTO Membre VALUES (13, 'Charlie', 'Marseille');
insert into membre values (14, 'Xavier', 'Rodez');

SELECT TO_DATE('2024/11/01', 'YYYY/MM/DD') FROM dual;

