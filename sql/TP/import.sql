CREATE temp TABLE import (
n1 text, n2 text, n3 text, n4 text, n5 text, n6 text, n7 text, n8 int, n9 int, n10 text, n11 int,
n12 text, n13 int, n14 text, n15 text, n16 int, n17 text, n18 text, n19 int, n20 text, n21 text,
n22 int, n23 text, n24 text, n25 text, n26 int, n27 text, n28 text,
n29 int, n30 text, n31 text, n32 text, n33 int, n34 text, n35 text,
n36 int, n37 text, n38 text, n39 text, n40 int, n41 text, n42 text,
n43 int, n44 text, n45 text, n46 text, n47 int, n48 text, n49 text,
n50 int, n51 text, n52 text, n53 text, n54 int, n55 text, n56 text,
n57 int, n58 text, n59 text, n60 text, n61 int, n62 text, n63 text,
n64 int, n65 text, n66 text, n67 text, n68 int, n69 text, n70 text,
n71 int, n72 text, n73 text, n74 text, n75 int, n76 text, n77 text,
n78 int, n79 text, n80 text, n81 text, n82 int, n83 text, n84 text,
n85 int, n86 text, n87 text, n88 text, n89 int, n90 text, n91 text,
n92 int, n93 text, n94 text, n95 text, n96 int, n97 text, n98 text,
n99 int, n100 text, n101 text, n102 text, n103 int, n104 text, n105 text);


CREATE TABLE candidats(cand int,nom text,prenom text,genre text);
INSERT INTO candidats VALUES(1,'ARTHAUD','Nathalie','F');
INSERT INTO candidats VALUES(2,'ROUSSEL','Fabien','M');
INSERT INTO candidats VALUES(3,'MACRON','Emmanuel','M');
INSERT INTO candidats VALUES(4,'LASSALLE','Jean','M');
INSERT INTO candidats VALUES(5,'LE PEN','Marine','F');
INSERT INTO candidats VALUES(6,'ZEMMOUR','Eric','M');
INSERT INTO candidats VALUES(7,'MELANCHON','Jean-Luc','M');
INSERT INTO candidats VALUES(8,'HIDALGO','Anne','F');
INSERT INTO candidats VALUES(9,'JADOT','Yannick','M');
INSERT INTO candidats VALUES(10,'PECRESSE','Valérie','F');
INSERT INTO candidats VALUES(11,'POUTOU','Philippe','M');
INSERT INTO candidats VALUES(12,'DUPONT-AIGNAN','Nicolas','M');

CREATE TABLE commune(dno,cno,libelle) AS SELECT DISTINCT n1,n5,n6 FROM import;

CREATE TABLE bureaux(dno,cno,bno,inscrits,votant) AS SELECT DISTINCT n1,n5,n7,n8,n11 FROM import;

CREATE TABLE votes (dno,cno,bno,cand,suffrages)
AS SELECT n1,n5,n7,1,n26 FROM import
UNION ALL SELECT n1,n5,n7,2,n33 FROM import
UNION ALL SELECT n1,n5,n7,3,n40 FROM import
UNION ALL SELECT n1,n5,n7,4,n47 FROM import
UNION ALL SELECT n1,n5,n7,5,n54 FROM import
UNION ALL SELECT n1,n5,n7,6,n61 FROM import
UNION ALL SELECT n1,n5,n7,7,n68 FROM import
UNION ALL SELECT n1,n5,n7,8,n75 FROM import
UNION ALL SELECT n1,n5,n7,9,n82 FROM import
UNION ALL SELECT n1,n5,n7, 10,n89 FROM import
UNION ALL SELECT n1,n5,n7, 11,n96 FROM import
UNION ALL SELECT n1,n5,n7, 12,n103 FROM import;

select n1,n5,n7,cand,n26 from import as i, candidats as c where i.n24=c.nom ;

CREATE TABLE departements(dno,libelle) AS SELECT DISTINCT n1,n6 FROM import;
