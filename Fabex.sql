/* ZAPYTANIA CREATE, USE, INSERT */


/*Stworzenie i korzystanie z bazy danych Fabex.*/

CREATE DATABASE Fabex;
USE Fabex;

/*Utworzenie tabeli Lokalizacje.*/

CREATE TABLE Lokalizacje 
(Id INT NOT NULL AUTO_INCREMENT, 
Ulica VARCHAR(255), 
Adres VARCHAR(6), 
Miasto VARCHAR(255), 
PRIMARY KEY (id)
);

/*Utworzenie tabeli Stanowiska.*/

CREATE TABLE Stanowiska 
(Id INT NOT NULL AUTO_INCREMENT,
 Zawód VARCHAR(255),
 Min_Pensja INT,
 Max_Pensja INT,
 PRIMARY KEY (id)
 );

/*Utworzenie tabeli Pracownicy.*/

CREATE TABLE Pracownicy 
(Id INT NOT NULL AUTO_INCREMENT, 
Imię VARCHAR(255), 
Nazwisko VARCHAR(255), 
Email VARCHAR(255), 
Data_Urodzenia DATETIME, 
Data_Zatrudnienia DATETIME, 
Stanowiska_Id INT NOT NULL, 
Lokalizacje_Id INT NOT NULL, 
PRIMARY KEY (Id), 
FOREIGN KEY (Stanowiska_Id) REFERENCES Stanowiska(Id), 
FOREIGN KEY (Lokalizacje_Id) REFERENCES Lokalizacje(Id)
);

/*Wprowadzanie rekordów do tabeli Lokalizacje.*/

INSERT INTO Lokalizacje 
(Id, Ulica, Adres, Miasto) 
VALUES
(1, 'Szkolna 22/1', '53-455', 'Warszawa'),
(2, 'Dominikańska 7', '41-222', 'Poznań'),
(3, 'Mickiewicza 61/2', '01-767', 'Rzeszów'),
(4, 'Cicha 104', '11-933', 'Opole'),
(5, 'Rejowiecka 44/11', '28-924', 'Lublin');

 /*Wprowadzanie rekordów do tabeli Stanowiska.*/

INSERT INTO Stanowiska
(Id, Zawód, Min_Pensja, Max_Pensja) 
VALUES
(1, 'Sprzątaczka', 2000, 2500), 
(2, 'Hostessa', 2100, 2600),
(3, 'Magazynier', 2200, 2700),
 (4, 'Kasjer sprzedawca', 2300, 2800),
 (5, 'Kierowca', 2600, 3100), 
(6, 'Kierownik zmiany', 3200, 3700), 
(7, 'Księgowy', 2900, 3400),
(8, 'Kierownik sklepu', 3900, 4400),  
(9, 'Logistyk', 2800, 3300);

/*Wprowadzanie rekordów do tabeli Pracownicy.*/

INSERT INTO Pracownicy
(Id, Imię, Nazwisko, Email, Data_Urodzenia, Data_Zatrudnienia, Stanowiska_Id, Lokalizacje_Id) 
VALUES
(1, 'Katarzyna', 'Książek', 'kassia22@wp.pl', '1993-04-12 00:00:00', '2021-06-01 00:00:00', 4, 2),
(2, 'Dorota', 'Prokop', 'prokop.d@onet.pl', '1981-07-26 00:00:00', '2018-01-01 00:00:00', 7, 1),
(3, 'Dominik', 'Andrus', 'anddom19@gmail.com', '1979-11-3 00:00:00', '2018-01-01 00:00:00',5 ,1),
(4, 'Zenek', 'Wawer', 'wawer_zenek@interia.pl', '1984-09-30 00:00:00', '2018-06-02 00:00:00',8 ,1),
(5, 'Adrian', 'Martyn', 'ad12martyn@gmail.com', '1995-02-27 00:00:00', '2022-03-01 00:00:00',4 ,3),
(6, 'Damian', 'Zając', 'damianekz@interia.pl', '1985-10-11 00:00:00', '2020-07-10 00:00:00', 4, 4),
(7, 'Stefan', 'Kowalczyk', 'stef1kowalczyk1@wp.pl', '1978-01-18 00:00:00', '2019-02-03 00:00:00', 4, 2),
(8, 'Andrzej', 'Gleń', 'glen999@o2.pl', '1978-01-18 00:00:00', '2021-09-01 00:00:00', 6, 2),
(9, 'Krzysztof', 'Czwartek', 'krzysczwartek@wp.pl', '1992-12-03 00:00:00', '2021-01-10 00:00:00', 6, 3),
(10, 'Grażyna', 'Wolszczak', 'wolszczak17@gmail.com', '1988-09-027 00:00:00', '2019-10-02 00:00:00', 9, 1),
(11, 'Tadeusz', 'Kos', 'tadzio_kos@interia.pl', '1995-11-30 00:00:00', '2022-03-01 00:00:00', 4, 3),
(12, 'Joanna', 'Flak', 'asia2277@interia.pl', '1992-12-03 00:00:00', '2021-01-10 00:00:00', 4, 5),
(13, 'Paweł', 'Magiera', 'pawmag@wp.pl', '1986-06-25 00:00:00', '2020-05-04 00:00:00', 3, 1),
(14, 'Barbara', 'Tomczyk', 'barbara1998@o2.pl','1965-08-29 00:00:00', '2018-02-20 00:00:00', 1, 2),
(15, 'Maciej', 'Zadura', 'zadura.maciej@gmail.com','1971-02-23 00:00:00', '2019-11-01 00:00:00', 1, 3),
(16, 'Piotr', 'Mazur', 'pit111@gmail.com', '1974-07-10 00:00:00', '2019-01-10 00:00:00', 1, 1);


/* ZAPYTANIA SELECT */


/*Pokaż id jako numer_pracownika, imię jako imię_pracownika, 
email jako adres_email pracowników z Warszawy.*/

SELECT Id AS numer_pracownika,
Imię AS imię_pracownika,
Email AS adres_email 
FROM pracownicy 
WHERE Lokalizacje_Id = 1;

/*Pokaż średnią minimalną pensję w firmie Fabex.*/

SELECT avg(min_pensja) 
AS Średnia_Minimalna_Pensja 
FROM stanowiska;

/*Pokaż imię, nazwisko, email pracowników oraz datę ich zatrudnienia, gdzie trzecia cyfra to 2.*/

SELECT Imię, Nazwisko, Email, Data_Zatrudnienia 
FROM pracownicy 
WHERE Data_Zatrudnienia LIKE '__2%';

/*Pokaż pracowników, którzy pracują na stanowisku zawierającym słowo kierownik.*/

SELECT * FROM pracownicy
INNER JOIN stanowiska
ON pracownicy.Stanowiska_Id = stanowiska.Id
WHERE Zawód LIKE 'Kierownik%';

/*Pokaż imię, nazwisko, email pracowników na stanowisku kasjer sprzedawca zatrudnionych w tym roku.*/

SELECT imię, nazwisko, email 
FROM pracownicy  
WHERE Stanowiska_Id = 4 
and Data_Zatrudnienia >= '2022-01-01 00:00:00';

/*Pokaż liczbę pracowników pracujących we wszystkich innych miastach, poza Warszawą. 
Kolumnę nazwij liczba_pracowników_poza_Warszawą.*/ 

SELECT COUNT(Id) 
AS liczba_pracowników_poza_Warszawą
FROM pracownicy 
WHERE NOT Lokalizacje_Id = 1;

/*Pokaż imię lub email zaczynający się na literę A.*/

SELECT *
FROM pracownicy
WHERE Imię OR Email LIKE 'A%';

/*Pokaż liczbę pracowników pracujących w Warszawie oraz średnią pensję w Warszawie. 
Pierwszą kolumnę nazwij Liczba_Pracowników_Warszawa, drugą Średnia_Max_Pensja_Warszawa.*/

SELECT COUNT(*) 
AS Liczba_Pracowników_Warszawa,
 AVG(stanowiska.Max_Pensja) 
AS Średnia_Max_Pensja_Warszawa
FROM pracownicy
JOIN stanowiska
ON pracownicy.Stanowiska_Id = stanowiska.Id
WHERE Lokalizacje_Id = 1;

/*Pokaż datę urodzenia najstarszego pracownika jako Data_Urodzenia, Imię, Nazwisko, 
Data_Zatrudnienia, Stanowiska_Id, Lokalizacje_Id.*/

SELECT Data_Urodzenia, Imię, Nazwisko, Data_Zatrudnienia, Stanowiska_Id, Lokalizacje_Id
FROM pracownicy
WHERE Data_Urodzenia = (
SELECT MIN(Data_Urodzenia)
FROM pracownicy);

/*Pokaż imiona pracowników zaczynające się na literę D oraz liczbę pracowników, 
którzy posiadają dane imię.*/

SELECT Imię, COUNT(*) AS Liczba_Pracowników
FROM pracownicy
WHERE Imię LIKE 'D%'
GROUP BY Imię;

/*Pokaż, czy w firmie Fabex pracują pracownicy o tym samym imieniu w kolumnie Liczba_Pracowników.*/

SELECT COUNT(*) AS Liczba_Pracowników
FROM pracownicy
GROUP BY Imię
HAVING COUNT(*) > 1;

/*Pokaż Id, Imię, Nazwisko, Email, Lokalizacje_Id oraz min_pensja pracówników,
którzy zarabiają conajmniej 3000 lub pracują w Warszawie. Uporządkuj rosnąco według lokalizacje_Id.*/ 

SELECT pracownicy.Id, pracownicy.Imię, pracownicy.Nazwisko, pracownicy.Email,
pracownicy.Lokalizacje_Id, stanowiska.min_pensja 
FROM pracownicy
JOIN stanowiska 
ON pracownicy.stanowiska_Id = stanowiska.Id
WHERE stanowiska.min_pensja >= 3000
OR pracownicy.Lokalizacje_Id = 1
ORDER BY pracownicy.Lokalizacje_Id ASC;

/*Pokaż trzech najlepiej zarabiających pracowników. Uporządkuj według max_pensja malejąco,
a w drugiej kolejności uporządkuj alfabetycznie według imienia.*/

SELECT pracownicy.Id, pracownicy.Imię, pracownicy.Nazwisko,
pracownicy.Lokalizacje_Id, stanowiska.Max_Pensja 
FROM pracownicy
JOIN stanowiska 
ON pracownicy.stanowiska_Id = stanowiska.Id
ORDER BY stanowiska.Max_Pensja DESC,
pracownicy.Imię ASC
LIMIT 3;

/*Pokaż datę urodzenia najmłodszego pracownika jako Najmłodszy_Pracownik, datę urodzenia,
jego imię, nazwisko, email, miasto oraz zawód.*/

SELECT pracownicy.Data_Urodzenia 
AS Najmłodszy_Pracownik,
pracownicy.Imię, pracownicy.Nazwisko, pracownicy.Email, lokalizacje.Miasto, stanowiska.Zawód
FROM pracownicy
JOIN lokalizacje
ON pracownicy.Lokalizacje_Id = lokalizacje.Id
JOIN stanowiska
ON stanowiska.Id = pracownicy.Stanowiska_Id
ORDER BY pracownicy.Data_Urodzenia DESC 
LIMIT 1;

/*Pokaż wszystkich pracowników, którzy mają inny adres niż gmail.com. 
Rekordy posortuj po kolumnie Lokalizacje_Id.*/

SELECT * FROM pracownicy 
WHERE Email NOT LIKE '%@gmail.com' 
ORDER BY Lokalizacje_Id;

/*Pokaż wszystkich pracowników z lokalizacji 1,2,3 i którzy byli zatrudnieni w 2018 roku. 
Uporządkuj wyniki po Lokalizacje_Id.*/

SELECT * FROM pracownicy 
WHERE Lokalizacje_Id IN (1, 2, 3)
AND Data_Zatrudnienia < '2019-01-01 00:00:00'
ORDER BY Lokalizacje_Id;

/*Pokaż wszystkich pracowników poza Warszawą, imię, nazwisko, data_urodzenia, zawód, miasto. 
Uporządkuj wyniki po Lokalizacje_Id.*/

SELECT CONCAT
(pracownicy.Imię, ' ', pracownicy.Nazwisko, ' - ', pracownicy.Data_Urodzenia,
' - ', stanowiska.Zawód,' - ', lokalizacje.Miasto )
AS pracownicy 
FROM pracownicy
JOIN stanowiska
ON pracownicy.Stanowiska_Id = stanowiska.Id
JOIN lokalizacje
ON lokalizacje.Id = pracownicy.Lokalizacje_Id
WHERE NOT Lokalizacje_Id  = 1
ORDER BY Lokalizacje_Id;

/*Pokaż wszystkich pracowników z poza lokalizacji 4, 5 i którzy byli zatrudnieni między 2018 a 2020 rokiem. 
Uporządkuj wyniki po Data_Urodzenia.*/

SELECT * FROM pracownicy
WHERE Lokalizacje_Id NOT IN (4,5) AND
Data_Zatrudnienia BETWEEN '2018-01-01 00:00:00' AND '2020-01-01 00:00:00'
ORDER BY Data_Urodzenia;

/*Pokaż ilu jest pracowników w każdym dziale. Uporządkuj wyniki w kolumnie Liczba_Pracowników 
według Lokalizacje_Id.*/

SELECT Lokalizacje_Id, COUNT(*) AS Liczba_Pracowników
FROM pracownicy
GROUP BY Lokalizacje_Id;

/*Pokaż ilu jest pracowników na każdym stanowisku pracy w kolumnach Zawód, Id, Liczba_Pracowników. 
Uporządkuj wyniki według liczy pracowników na każdym stanowisku pracy malejąco.*/

SELECT stanowiska.Zawód, 
pracownicy.Stanowiska_Id AS Id,
COUNT(*) AS Liczba_Pracowników
FROM pracownicy
JOIN stanowiska
ON pracownicy.Stanowiska_Id = stanowiska.Id
GROUP BY Stanowiska_Id
ORDER BY COUNT(*) DESC;
  
/*Pokaż wszystkie lokalizacje, w których pracuje przynajmniej trzech pracowników, 
w kolumnach Miasto i Liczba_Pracowników. Rekordy posortuj po lokalizacje.Miasto rosnąco.*/

SELECT lokalizacje.Miasto, COUNT(*) AS Liczba_Pracowników
FROM pracownicy
JOIN lokalizacje
ON pracownicy.Lokalizacje_Id = lokalizacje.Id
GROUP BY Lokalizacje_Id
HAVING COUNT(*) > 2
ORDER BY lokalizacje.Miasto;

/*Pokaż ilu jest pracowników na każdym stanowisku pracy w poszczególnych działach w kolumnach 
Miasto, Zawód, Liczba_Pracowników.*/

SELECT lokalizacje.Miasto, stanowiska.Zawód, COUNT(*) AS Liczba_Pracowników
FROM pracownicy
JOIN stanowiska
ON pracownicy.Stanowiska_Id = stanowiska.Id
JOIN lokalizacje
ON lokalizacje.Id = pracownicy.Lokalizacje_Id
GROUP BY Lokalizacje_Id, Stanowiska_Id
ORDER BY Lokalizacje_Id;
  
/*Pokaż wszystkie zawody, które wykonuje przynajmniej dwóch pracowników w kolumnach 
Zawód oraz Liczba_Pracowników. Rekordy posortuj po liczbie pracowników malejąco.*/

SELECT stanowiska.Zawód, COUNT(*) AS Liczba_Pracowników
FROM pracownicy
JOIN stanowiska
ON pracownicy.Stanowiska_Id = stanowiska.Id
GROUP BY Stanowiska_Id
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;


/* AKTUALIZACJA DANYCH W BAZIE FABEX, UPDATE, USUWANIE DANYCH */


/*Dodaj nowe stanowisko pracy (10, 'Telefoniczna obsługa klienta', 2000, 2500).*/

INSERT INTO Stanowiska
(Id, Zawód, Min_Pensja, Max_Pensja) 
VALUES
(10, 'Telefoniczna obsługa klienta', 2000, 2500);

/*Dodaj nowe miasto 'Toruń', następnie pokaż wszystkie lokalizacje.*/

INSERT INTO Lokalizacje
(Miasto) 
VALUES
('Toruń');

/*Zmień najniższe wypłaty z 2000 na 2050.*/

UPDATE stanowiska
SET Min_Pensja = 2050
WHERE Min_Pensja = 2000;

/*Zmień nazwisko i maila pracownikowi o imieniu Katarzyna na nazwisko Dobrowolska, 
email k.dobrowolska22@gmail.com, następnie pokaż tylko tego pracownika.*/

UPDATE pracownicy		
SET Nazwisko = 'Dobrowolska',
Email = 'k.dobrowolska22@gmail.com'
WHERE Imię = 'Katarzyna';
SELECT * FROM pracownicy
WHERE Id = 1;

/*Zmień maila z @gmail.com na @wp.pl wszystkim pracownikom, poza Katarzyną Dobrowolską, 
następnie pokaż wszystkich pracowników.*/

UPDATE pracownicy
SET Email = REPLACE(Email, '@gmail.com', '@wp.pl')
WHERE NOT Id = 1;

/*Podwyższ wszystkie maksymalne pensje o pięć procent.*/

UPDATE stanowiska
SET Max_Pensja = Max_Pensja * 1.05;

/*Zamień lokalizację o Id = 4 na ulicę Opatowską 33, o adresie 19-413 i miasto na Kraków.*/

UPDATE lokalizacje
SET  
Ulica = 'Opatowska 33',
Adres = '19-413',
Miasto = 'Kraków'
WHERE Id = 4;

/*Stwórz lokalizacje_kopia i skopiuj rekordy z lokalizacje z kolumn Id, Miasto.*/
 
CREATE TABLE lokalizacje_kopia
AS
SELECT Id, Miasto
FROM lokalizacje;


/*Usuń pracownika o imieniu 'Maciej' i nazwisku 'Zadura'.*/

DELETE FROM pracownicy
WHERE Imię = 'Maciej' 
AND Nazwisko = 'Zadura';

/*Usuń pracowników, którzy posiadają adres email z domeną '@o2.pl', 
następnie policz pozostałych pracowników.*/

DELETE FROM pracownicy
WHERE Email LIKE '%@o2.pl';
SELECT COUNT(*) FROM pracownicy;

/*Usuń pracowników, którzy są zatrudnieni w mieście Lublin, 
następnie wyświetl wszystkich pracowników porządkując według Lokalizacje_Id.*/

DELETE pracownicy FROM pracownicy
INNER JOIN lokalizacje
ON pracownicy.Lokalizacje_Id = lokalizacje.Id
WHERE lokalizacje.Miasto = 'Lublin';
SELECT * FROM pracownicy 
ORDER BY Lokalizacje_Id;

/*Usuń najstarszego pracownika, który zatrudniony jest w Lokalizacji o numerze Id 2, 
następnie wyświetl pozostałych pracowników z Lokalizacji o numerze Id 2.*/

DELETE FROM pracownicy
WHERE Lokalizacje_Id = 2
ORDER BY Data_Urodzenia
LIMIT 1;
SELECT * FROM pracownicy
WHERE Lokalizacje_Id = 2;

/*Dodaj kolumnę Uwagi do tabeli pracownicy.*/

ALTER TABLE pracownicy
ADD Uwagi VARCHAR(255); 

/*Usuń kolumnę Uwagi z tabeli pracownicy.*/

ALTER TABLE pracownicy 
DROP COLUMN Uwagi;

/*Zmień nazwę kolumny stanowiska na etaty.*/

ALTER TABLE stanowiska
RENAME AS etaty;

/*Zmień typ danych w tabeli pracownicy, w kolumnie Data_Zatrudnienia, Data_Urodzenia na DATE,
następnie pokaż kolumny z tabeli pracownicy.*/

ALTER TABLE pracownicy
MODIFY COLUMN Data_Urodzenia DATE;
ALTER TABLE pracownicy
MODIFY COLUMN Data_Zatrudnienia DATE;
SHOW COLUMNS FROM pracownicy;

/*Zmień kolumnę Imię tak, aby zawsze posiadała wartość, następnie sprawdź zawartość tabeli pracownicy.*/

ALTER TABLE pracownicy
MODIFY Imię varchar(255)
NOT NULL;
SHOW COLUMNS FROM pracownicy;

/*Zmień kolumnę Imię tak, aby posiadała wartości bez powtórzeń,  
następnie pokaż klucze w tabeli pracownicy.*/

ALTER TABLE pracownicy
ADD UNIQUE (Imię);
SHOW INDEX IN pracownicy;

/*Dodaj klucz obcy łączący tabelę lokalizacje_kopia z tabelą lokalizacje poprzez Id,
następnie pokaż klucze w tabeli lokalizacje_kopia.*/

ALTER TABLE lokalizacje_kopia
ADD CONSTRAINT FOREIGN KEY (Id) 
REFERENCES lokalizacje(Id);
SHOW INDEX IN lokalizacje_kopia;

/*Zmień kolumnę Zawód tak, aby zawsze posiadała wartość, następnie sprawdź zawartość tabeli etaty.*/

ALTER TABLE etaty
MODIFY Zawód varchar(255)
NOT NULL;
SHOW COLUMNS FROM etaty;

/*Zmień kolumnę Zawód tak, aby ustawić wartość domyślną w przypadku nie wprowadzenia konkretnej danej. 
Wprowadź nowy zawód 'Pracownik' ale tylko wartości Min_Pensja równa 1900 oraz Max_Pensja równa 2400.*/

ALTER TABLE etaty
ALTER Zawód 
SET DEFAULT 'Pracownik';
INSERT INTO etaty
(Min_Pensja, Max_Pensja) 
VALUES
(1900, 2400);

/*Zmień kolumnę Ulica oraz Adres tak, aby posiadała wartości bez powtórzeń,  
następnie pokaż kolumny w tabeli lokalizacje.*/

ALTER TABLE lokalizacje
ADD UNIQUE (Ulica);
ALTER TABLE lokalizacje
ADD UNIQUE (Adres);
SHOW COLUMNS FROM lokalizacje;

/*Zmień kolumnę Imię tak, aby wartości w tej kolumnie mogły się powtarzać.*/

ALTER TABLE pracownicy 
DROP INDEX Imię;

/*Dodaj kolumnę Państwo varchar(255) tak, aby wartości w tej kolumnie automatycznie miały 
domyślną wartość Polska oraz żeby kolumna Państwo była pierwszą kolumną w tabeli lokalizacje. 
Pokaż kolumny z tabeli lokalizacje.*/

ALTER TABLE lokalizacje
ADD COLUMN Państwo varchar(255) 
DEFAULT 'Polska' 
FIRST;
SHOW COLUMNS FROM lokalizacje;

/*Dodaj kolumnę Zakres_Obowiązków varchar(255) tak, aby była to trzecia kolumna w tabeli etaty, 
za kolumną Zawód.*/

ALTER TABLE etaty
ADD COLUMN Zakres_Obowiązków varchar(255)
AFTER Zawód;

/*Usuń klucz obcy łączący tabelę lokalizacje_kopia z tabelą lokalizacje poprzez Id.*/

ALTER TABLE lokalizacje_kopia
DROP FOREIGN KEY lokalizacje_kopia_ibfk_1;

/*Usuń wszystkich pracowników.*/

DELETE FROM pracownicy;

/*Usuń tabelę pracownicy.*/

DROP TABLE pracownicy;

/*Usuń bazę danych Fabex.*/

DROP DATABASE Fabex;
