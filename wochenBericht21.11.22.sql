
/* SQL :http://localhost/phpmyadmin*/
ich habe Tabelle von Teilnehmers der heißt : Teilnehmers
diese Tabelle hat sieben Spalten
id,name,vorname,alter,adresse,email,noten,nationalität
__________________________________________________________
SELECT * FROM Teilnehmers                                    /* es gibt uns die alle informationen für die Tabelle*/
SELECT name FROM Teilnehmers                                 /* es gibt uns die alle namen von der Tabelle*/
SELECT name,alter FROM Teilnehmers                           /* es gibt uns die alle namen und ältern von der Tabelle*/
SELECT * FROM Teilnehmers ORDER BY alter                     /*  es gibt uns die alle informationen für die Tabelle aber sortiert nach alter : normalerweise is es sortiert von kleiner bis grosser*/
SELECT * FROM Teilnehmers ORDER BY alter DESC                /* mit DESC würder die Sortiernug von gross nach klein gemacht*/
SELECT * FROM Teilnehmers ORDER BY noten DESC LIMT 3         /* gibt uns die grosste drei Noten sotiert von grosser zu kleiner*/
SELECT * FROM Teilnehmers WHERE noten >80                    /* es gibt uns die Informationen von Teinehmer dssen Noten grosser als 80 ist */
SELECT name FROM Teilnehmers WHERE noten >80                 /* so gibt uns nur die Namen von dieser Teilnehmer*/
SELECT name FROM Teilnehmers WHERE noten >80 AND alter<15    /* ich kann mehrere Voraussetzungen machen*/
SELECT name FROM Teilnehmers WHERE noten >80 OR noten < 50   /* Man kann AND oder OR oder NOT benutzen*/
INSERT INTO Teilnehmers (id,name,vorname,alter,adresse,email,noten,nationalität)VALUES(NULL,'z','h',20,'Kasseler Straße 30','z.h.15@gmail.com',75 ,'Deutscher');
                                                            // so fügt man ein Teilnehmer ein
INSERT INTO Teilnehmers (id,name,vorname,alter,adresse,email,noten)VALUES(NULL,'z','h',20,'Kasseler Straße 30','z.h.15@gmail.com',75,'Syrer' ),(NULL,'z','h',20,'Kasseler Straße 30','z.h.15@gmail.com',75 ,'Deutscher'),(NULL,'z','h',20,'Kasseler Straße 30','z.h.15@gmail.com',75,'Costarica' )
                                                            /* so kann man mehrere Teinehmern einfügen*/

       /* so kann ich die informationen von Teinehmern ändern : in diesem Beispiel werden die alle Teinehmern die 15 Jahr alt sind ein Jahr grosser*/
UPDATE Teilnehmers SET noten =noten+1 WHERE vorname='housni'  /* so bekommen die alle Teinehmern die housni heißen 10 noten mehr ;-) */
SELECT DISTINCT nationalität FROM Teilnehmers                      /* es vermeidet die abermalige Ergebnisse : DISTINCT */
DELETE * FROM Teilnehmers WHERE noten < 40                    /* es löscht die Teinehmern deren Noten kleiner als 40 sind */
SELECT MAX (alter) FROM Teilnehmers                         /* es gibt uns der älterste Teilnehmer */
SELECT MAX (noten) FROM Teilnehmers                         /* es gibt uns der beste Teilnehmer nach noten */
SELECT AVG (alter) FROM Teilnehmers                         /* es gibt uns den durchnitlicher Alter von Teinehmern */
SELECT COUNT (name) FROM Teilnehmers                        /* es gibt uns die Anzahl vom Teilnehmern*/
SELECT COUNT (DISTINCT nationalität) FROM Teilnehmers       /* es gibt uns die Anzahl der Nationalitäten ohne Wiederholung */
SELECT SUM (noten) FROM Teilnehmers                         /* es gibt uns die Summe von alle noten */
SELECT * FROM Teilnehmers WHERE name LIKE 's%'              /* es gibt uns die alle Teilnehmern deren Namen mit s anfangen */
SELECT * FROM Teilnehmers WHERE name LIKE '%s'             /* es gibt uns die alle Teilnehmern deren Namen mit s enden */
SELECT * FROM Teilnehmers WHERE name LIKE '%s%'             /* es gibt uns die alle Teilnehmern deren Namen s behalten */
SELECT * FROM Teilnehmers WHERE name LIKE '_s%'            /* es gibt uns die alle Teilnehmern deren zweitene Buchstab ihrer Namen s ist */
SELECT * FROM Teilnehmers WHERE name LIKE 's_%'            /* es gibt uns die alle Teilnehmern deren Namen mit s anfangen und haben mindestens andere Buchstab*/
SELECT * FROM Teilnehmers WHERE name LIKE 's__%'           /* es gibt uns die alle Teilnehmern deren Namen mit s anfangen und haben mindestens zwei andere Buchstaben*/
SELECT * FROM Teilnehmers WHERE name LIKE 'sa%n'            /* es gibt uns die alle Teilnehmern deren Namen mit s anfangen und mit n enden */
SELECT * FROM Teilnehmers WHERE nationalität IN ('Deutsch', 'Turkisch') /* es gibt uns die alle Teilnehmern deren Nationalitäten Deutsch oder Turkisch sind */
SELECT * FROM Teilnehmers WHERE name IN ('jgsf', 'frg','wrgt','swergt')
SELECT * FROM Teilnehmers WHERE noten BETWEEN 40 AND 50    /* es gibt uns die alle Teilnehmern deren Noten zwischen 40 und 50 sind */
SELECT alter , SUM(noten) FROM Teilnehmers GROUP BY alter  /* es gibt uns sie Summe von noten für jedes alter */
SELECT name , SUM(noten) FROM Teilnehmers GROUP BY name    /* es gibt uns sie Summe von noten für jedes name */
SELECT name , AVG(noten) AS notensumme FROM Teilnehmers GROUP BY id HAVING notensumme >49  /* es gibt uns die Namen deren notensumme grosser als 49 (bestanden) : AS schaft eine neue Liste deren name notensumme ist aber diese Liste temporar ist */
SELECT Teilnehmers.noten , IFNULL(Teilnehmers.noten,0) as noten FROM Teilnehmers /* fals noten = null (der teilnehmer ist zur Prüfung nicht gekommen) dann noten =0 */
SELECT Teilnehmers.noten , COALESCE(Teilnehmers.noten,0) as noten FROM Teilnehmers /* fals noten = null (der teilnehmer ist zur Prüfung nicht gekommen) dann noten =0 */
CREATE VIEW erfolgreicheTeilnehmern
AS
SELECT Teilnehmers.* FROM Teilnehmers WHERE noten > 49  /* so erstllt man eine View die aus die erfolgreiche Teilnehmern bestäht */
/* Das Unterschied zwischen Primary und Unique ist : erstens nur eine Spalte des Tabels kann Primay werden aber viel Spalte können Unique sein zweitens Primary kann nicht Null sein aber Unique kann */


TINYINT : - 128 => 127 
SMALLINT : -32768 => 32767
MEDIUMINT : - 8388608 => 8388607
INT : -2147483648 => 2147483647
/* es ist total wichtig diese werte zubenutzen um die grosse der Databank so klein wie öglich zu machen weil grosse kostet Geld*/
/* Vergleich zwichen VARCHAR und CHAR als Datatype : 
VARCHAR benutzt dynamic Memory das heißt es konsumiert nur die grosse die er wirklich braucht 
aber der CHAR benutzt static Memory dre konsumiert die gantze mögliche Memory die er hat 
andereseits CHAR ist viel schneller als VARCHAR weil static Memory viel schneller als dynamic ist 
Wenn man weißt gennau die Grosse die man braucht dann ist CHAR besser ansonsten ist VARCHAR besser*/
/* Vergleich zwichen ENUM und SET als Datatype : 
Die Beide sind wie eine drop List ... aber mit ENUM kann man nur eine Wahl wählen aber mit SET kann man mehrere*/

CREATE DATABASE project ;                     /* Ein Database die heißt project erstellen*/
DROP DATABASE project ;                       /* das Database das heißt project löschen*/

/* betrachten wir haben ein Tabelle der heißt categories */
/* wir wollen eine Tabelle der heißt items durch code erstellen deren i_category hat eine Relation mit dem id von der categories Tabelle */
CREATE TABLE items (                            
    ColumnName Datatype Constraint ,            /* jede Tabelle bestät aus mehrer Spalten und jede Spalte mus ein Name unr Type haben und Vorraussetzungen wenn nötig */                      
    i_id int(11) not NULL AUTO_INCREMENT ,
    i_name varchar(255) not NULL ,
    i_price float ,
    i_category int (11)
    /* nach den Spalten können wir Primary KEY und FOREIGN KEY wenn nötig erstellen */
    Primary KEY (i_id)
    FOREIGN KEY (i_category) REFERENCES categories (c_id), 
  );

  DROP TABLE items ;                         /* die Tabelle items löschen */                         

ALTER TABLE items MODIFY c_name CHAR         /* so ändert man das Type der Spalte */
ALTER TABLE items DROP c_name CHAR           /* so löscht man die Spalte */
ALTER TABLE items ADD c_name CHAR            /* eine Spalte addieren */
ALTER TABLE items ADD UNIQUE(c_name)         /* so addiert man Vorraussetzungen */
ALTER TABLE items DROP INDEX c_name          /* so löscht man eine Voraussetzung */


/* betrachten wir haben zwei Tabelle 
 Autos Tabelle dere besteht aus zwei Spalten : id und hersteller
 Marken Tabelle besteht aus drei Spalten : m_id und marke und m_herstellr
 wir wollen eine neue Tabelle die gibt usn die marke von Auto und Ihr Hersteller erstellen
 es gibt zwei möglichkeiten :
 */
SELECT marken.name , autos.hersteller FROM autos , marken WHERE marken.m_hersteller=autos.id
/*oder*/
SELECT marken.* , autos.hersteller FROM marken
INNER JOIN autos on marken.m_hersteller=autos.id








