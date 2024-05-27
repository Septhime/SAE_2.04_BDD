DROP TABLE IF EXISTS Info;
DROP TABLE IF EXISTS Etablissement;
DROP TABLE IF EXISTS Formation;
DROP TABLE IF EXISTS Departement;

CREATE TABLE Departement(
    code_departement text, --N5
    nom_departement text, --N6
    region text, --n7
    academie text, --n8
    PRIMARY KEY (code_departement));
    
CREATE TABLE Formation(
    code_AF int PRIMARY KEY, --n110
    selectivite text, --n11
    ffd text, --n13
    ffta text, --n12
    ff14 text, --n14
    ff10 text, --n10
    ffdb text, --n15
    estLong boolean);

CREATE TABLE Etablissement(
    UAI text, --n3
    code_departement text , --n5
    nom_etablissement text, --n4
    commune text,--n9
    PRIMARY KEY (UAI, commune),
    FOREIGN KEY (code_departement) REFERENCES Departement(code_departement) ON UPDATE CASCADE);
    
CREATE TABLE Info(
    code_AF int, --n110
    commune text, --n9
    UAI text, --n3
    GPS text, --n17
    capacite int, --n18
    nbAdminAPE int, --n47
    nbAdmisPP int, --n49
    nbPropoAOPP int, --n51
    nbPropoAB int, --n52
    nbPropoAFPP int, --n53
    nbAdmisBoursier int, --n55
    nbAdmisNeoBac int, --n56
    nbAdmisNeoBacG int, --n57
    nbAdmisNeoBacT int, --n58
    nbCandidatH int, -- = n19-n20
    nbCanditatF int, --n20
    PRIMARY KEY (code_AF, UAI, commune),
    FOREIGN KEY (code_AF) REFERENCES Formation(code_AF) ON UPDATE CASCADE,
    FOREIGN KEY (UAI,commune) REFERENCES Etablissement(UAI,commune) ON UPDATE CASCADE);
    
INSERT INTO Departement
SELECT DISTINCT n5,n6,n7,n8 FROM import;

INSERT INTO Formation
SELECT DISTINCT n110, n11, n13, n12, n14, n10, n15, false FROM import;

UPDATE Formation
SET estLong = true WHERE ffta LIKE '%Ingénieur%' OR ffta LIKE '%CPGE%' OR ffd LIKE '%Bac + 5%' OR ff14 LIKE '%Bac + 5%' OR ff14 LIKE '%Bac + 5%' OR ffdb LIKE '%Bac + 5%' OR ffd LIKE '%Classe préparatoire%';

INSERT INTO Etablissement
SELECT DISTINCT n3, n5, n4, n9 FROM import;

INSERT INTO Info
SELECT DISTINCT n110, n9, n3, n17, n18, n47, n49, n51, n52, n53, n55, n56, n57, n58, n19-n20, n20 FROM import;
