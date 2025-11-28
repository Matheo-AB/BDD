-- Table Equipe
insert into Equipe values ('BAN', 'BANESTO', 'Eusebio UNZE');
insert into Equipe values ('COF', 'COFIDIS', 'Cyrille GUIMARD');
insert into Equipe values ('CSO', 'CASINO', 'Vincent LAVENU');
insert into Equipe values ('FDJ', 'LA FRANCAISE DES JEUX', 'Marc MADIOT');
insert into Equipe values ('FES', 'FESTINA', 'Bruno ROUSSEL');
insert into Equipe values ('GAN', 'GAN', 'Roger LEGEAY');
insert into Equipe values ('ONC', 'O.N.C.E.', 'Manolo SAIZ');
insert into Equipe values ('TEL', 'TELEKOM', 'Walter GODFROOT');
insert into Equipe values ('SAE', 'SAECO', 'Antonio SALUTINI');

-- Table Pays
insert into Pays values('ALL', 'ALLEMAGNE');
insert into Pays values('AUT', 'AUTRICHE');
insert into Pays values('BEL', 'BELGIQUE');
insert into Pays values('DAN', 'DANEMARK');
insert into Pays values('ESP', 'ESPAGNE');
insert into Pays values('FRA', 'FRANCE');
insert into Pays values('G-B', 'GRANDE BRETAGNE');
insert into Pays values('ITA', 'ITALIE');
insert into Pays values('P-B', 'PAYS-BAS');
insert into Pays values('RUS', 'RUSSIE');
insert into Pays values('SUI', 'SUISSE');

-- Table Coureur
insert into Coureur values (8, 'ULLRICH Jan', 'TEL', 'ALL');
insert into Coureur values (31, 'JALABERT Laurent', 'ONC', 'FRA');
insert into Coureur values (61, 'ROMINGER Tony', 'COF', 'SUI');
insert into Coureur values (91, 'BOARDMAN Chris', 'GAN', 'G-B');
insert into Coureur values (151, 'OLANO Abraham', 'BAN', 'ESP');
insert into Coureur values (114, 'CIPOLINI Mario', 'SAE', 'ITA');

-- Table Etapes
insert into Etape values (1, '06-jul-97', 'ROUEN', 'FORGES-LES-EAUX', 192);
insert into Etape values (2, '07-jul-97', 'ST-VALEY-EN-CAUX', 'VIRE', 262);
insert into Etape values (3, '08-jul-97', 'VIRE', 'PLUMELEC', 224);

-- Table Classement
insert into Classement values (8, 3, '04:54:33');
insert into Classement values (8, 1, '04:48:21');
insert into Classement values (8, 2, '06:27:47');
insert into Classement values (31, 3, '04:54:33');
insert into Classement values (31, 1, '04:48:37');
insert into Classement values (31, 2, '06:27:47');
insert into Classement values (61, 1, '04:48:24');
insert into Classement values (61, 2, '06:27:47');
insert into Classement values (91, 3, '04:54:33');
insert into Classement values (91, 1, '04:48:19');
insert into Classement values (91, 2, '06:27:47');
insert into Classement values (114, 3, '04:54:44');
insert into Classement values (114, 1, '04:48:09');
insert into Classement values (114, 2, '06:27:47');
insert into Classement values (151, 3, '04:54:33');
insert into Classement values (151, 1, '04:48:29');
insert into Classement values (151, 2, '06:27:47');

-- DOnnées temporelles dans la table classement en secondes
insert into Classement2 values (8, 3, 17673);
insert into Classement2 values (8, 1, 17301);
insert into Classement2 values (8, 2, 23267);
insert into Classement2 values (31, 3, 17673);
insert into Classement2 values (31, 1, 17317);
insert into Classement2 values (31, 2, 23267);
insert into Classement2 values (61, 1, 17304);
insert into Classement2 values (61, 2, 23267);
insert into Classement2 values (91, 3, 17673);
insert into Classement2 values (91, 1, 17299);
insert into Classement2 values (91, 2, 23267);
insert into Classement2 values (114, 3, 17684);
insert into Classement2 values (114, 1, 17289);
insert into Classement2 values (114, 2, 23267);
insert into Classement2 values (151, 3, 17673);
insert into Classement2 values (151, 1, 17309);
insert into Classement2 values (151, 2, 23267);