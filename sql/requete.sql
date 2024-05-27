--Question n°1
SELECT n56, n57+n58+n59 AS recalcul FROM import;

--Question n°2

SELECT n56 FROM import
EXCEPT
SELECT n57+n58+n59 FROM import;

--Question n°3

SELECT
  n74, n47, n51,
  CASE
    WHEN n47 = 0 THEN 0.0
    ELSE ROUND(ROUND(n51,2) / ROUND(n47, 2)*100)
  END AS resultat
FROM import;

--Question n°4

SELECT n74 FROM import
EXCEPT
SELECT 
  CASE
    WHEN n47 = 0 THEN 0.0
    ELSE ROUND(ROUND(n51,2) / ROUND(n47, 2)*100)
  END
FROM import;

--Question n°5 

SELECT
  n75,
  CASE
    WHEN n47 = 0 THEN 0
    ELSE ROUND(ROUND(n52,2) / ROUND(n47, 2)*100)
  END AS resultat
FROM import;

-- Question n°6

SELECT
  CASE
    WHEN nbAdminAPE = 0 THEN 0
    ELSE ROUND(ROUND(nbPropoAB,2) / ROUND(nbAdminAPE, 2)*100)
  END AS resultat
FROM Info;

-- Question n°7

SELECT n81, 
  CASE
    WHEN n56=0 THEN 0
    ELSE ROUND(ROUND(n55,2)/ROUND(n56,2)*100)
    END AS resultat
FROM import;

-- Question n°8

SELECT 
  CASE
    WHEN nbAdmisNeoBac=0 THEN 0
    ELSE ROUND(ROUND(nbAdmisBoursier,2)/ROUND(nbAdmisNeoBac,2)*100)
    END AS resultat
FROM info;