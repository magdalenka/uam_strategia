-- usuwanie tabeli

drop table dzialanie_cel
drop table cel
drop table dzialanie
drop table osoby_odpowiedzialne
drop table strategia
drop table dzialanie_odpowiedzialnosc
drop table strategia_autor
drop table podjete_dzialanie
drop table zrodlo_finansowania
drop table dzialanie_zrodlo
drop table autor

-- tworzenie tabeli

CREATE TABLE strategia(
id int IDENTITY(1,1) primary key,
id_parent int references strategia(id),
lp int not null,
organization_key varchar(max),
nazwa_strategii varchar(max),
nazwa_jednostki varchar(max),
widocznosc tinyint default 1
)

CREATE TABLE osoby_odpowiedzialne(
id int IDENTITY(1,1) primary key,
lp int not null,
stanowisko varchar(100),
tytul varchar(20),
nazwisko varchar(100),
id_startegii int references strategia(id)
)

CREATE TABLE autor(
id int IDENTITY(1,1) primary key,
lp int not null,
tytul varchar(100),
nazwisko varchar(100),
)

CREATE TABLE cel
(id int IDENTITY(1,1) primary key,
lp int not null,
id_strategii int references strategia(id),
id_parent int references cel(id), 
tresc varchar(max),
widocznosc tinyint default 1
)

CREATE TABLE dzialanie
(id int IDENTITY(1,1) primary key,
nazwa varchar(max),
lp int not null,
wskaznik_rezultat varchar(max),
okres_od date,
okres_do date,
waga int,
zatwierdzenie tinyint default 0,
widocznosc tinyint default 1
)

CREATE TABLE podjete_dzialanie
(id int IDENTITY(1,1) primary key,
dzialanie int references dzialanie(id),
opis varchar(max),
okres_od date,
okres_do date,
realizacja int,
komentarz varchar(max)
)

CREATE TABLE zrodlo_finansowania
(id int IDENTITY(1,1) primary key,
nazwa varchar(max)
)

CREATE TABLE dzialanie_zrodlo
(id_dzialania int foreign key references dzialanie(id),
id_zrodlo_finansowania int foreign key references zrodlo_finansowania(id),
primary key (id_dzialania, id_zrodlo_finansowania)
)


CREATE TABLE dzialanie_odpowiedzialnosc (
id_osoby int foreign key references osoby_odpowiedzialne(id),
id_dzialania int foreign key references dzialanie(id),
primary key (id_osoby, id_dzialania)
)

CREATE TABLE strategia_autor (
id_osoby int foreign key references autor(id),
id_strategii int foreign key references strategia(id),
primary key (id_osoby, id_strategii)
)

CREATE TABLE dzialanie_cel(
id_celu int foreign key references cel(id),
id_dzialania int foreign key references dzialanie(id),
primary key (id_celu, id_dzialania)
)




-- wstawianie do tabeli

insert into strategia(id_parent, lp, nazwa_strategii, nazwa_jednostki, widocznosc, organization_key)
values (null, 1, 'Strategia Rozwoju Uniwersytetu Im. Adama Mickiewicza', 'Uniwersytet im. Adama Mickiewicza', 1, '0000000000')



insert into autor (lp, tytul, nazwisko)
values (1, 'prof.', 'Jacek Guli�ski');
insert into autor (lp, tytul, nazwisko)
values (2, 'prof.', 'Andrzej Lesicki');
insert into autor (lp, tytul, nazwisko)
values (3, ' ', 'Natalia Chromi�ska');
insert into autor (lp, tytul, nazwisko)
values (4, 'prof.', 'Rafa� Drozdowski');
insert into autor (lp, tytul, nazwisko)
values (5, 'prof.', 'Katarzyna Dziubalska-Ko�aczyk');
insert into autor (lp, tytul, nazwisko)
values (6, 'prof.', 'Witold Mazurczak');
insert into autor (lp, tytul, nazwisko)
values (7, 'prof.', 'Zbyszko Melosik');
insert into autor (lp, tytul, nazwisko)
values (8, 'prof.', 'Bogus�aw Mr�z');
insert into autor (lp, tytul, nazwisko)
values (9, ' ', 'Dorotoa Nicewicz-Modrzewska');
insert into autor (lp, tytul, nazwisko)
values (10, 'prof.', 'Henryk Rogacki');
insert into autor (lp, tytul, nazwisko)
values (11, 'prof.', 'Grzegorz Schroeder');
insert into autor (lp, tytul, nazwisko)
values (12, 'prof.', 'Tadeusz Stryjakiewicz');

insert into strategia_autor(id_strategii, id_osoby)
values (1, 3)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 4)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 5)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 6)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 7)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 8)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 9)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 10)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 11)
insert into strategia_autor(id_strategii, id_osoby)
values (1, 12)

--cele strategiczne
insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, null, 'BADANIA NAUKOWE na �wiatowym poziomie')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, null, 'Najwy�sza jako�� KSZTA�CENIA')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, null, 'Uniwersytet OTWARTY na otoczenie')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, null, 'Uczelnia profesjonalnie ZARZ�DZANA')

--cele operacyjne
insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 1, 'Wspieranie rozwoju naukowego pracownik�w')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 1, 'Poszerzanie interdyscyplinarno�ci bada� naukowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 1, 'Umi�dzynarodowienie bada�')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 1, 'Wzmacnianie infrastrutury badawczej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 1, 'Wdro�enie systemu ochrony i korzystania z w�asno�ci intelektualnej')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 2, 'Wprowadzenie wewn�trznego systemu oceny i zapewnienia jako�ci kszta�cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 2, 'Uporz�dkowanie zasad organizayjnych i programowych na trzech poziomach studi�w')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 2, 'Podnoszenie kompetencji dydaktycznych nauczycieli akademickich')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 2, 'Zr�nicowanie i zwi�kszenie oferty i tryb�w studi�w')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 2, 'Kszta�towanie sylwetki absolwenta')
insert into cel (lp, id_strategii, id_parent, tresc)
values (6, 1, 2, 'Wspieranie samodzielno�ci student�w I i II stopnia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (7, 1, 2, 'Internacjonalizacja kszta�cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (8, 1, 2, 'Rozbudowa nowoczesnej infrastruktury kaszta�cenia')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 3, 'Wzrost znaczenia kulturoznawczej roli uczelni w regionie')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 3, 'Otwarcie na potrzeby i aspiracje edukacyjne spo�eczno�ci miasta i regionu')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 3, 'Otwarcie uniwersytetu na potrzeby gospodarki opartej na wiedzy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 3, 'Wzmacnianie wi�zi z absolwentami uczelni')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 3, 'Intensyfikacja wsp�pracy z w�adzami miasta i regionu')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 4, 'Wprowadzanie strategicznego zarz�dzania uczelni�')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 4, 'Udoskonalenie kultury organizacyjnej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 4, 'Zwi�kszenie efektywno�ci organizacji pracy administracji centralnej , wydzia�owej i innych jednostej organizacyjnych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 4, 'Przekszta�cenie procesu administrowania w proces zarz�dzania kadrami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 4, 'Doskonalenie systemu zarz�dzania finansami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (6, 1, 4, 'Rozw�j infrastruktury Uniwersytetu dla zapewnienia najwy�szej efektywno�ci bada� i kszta�cenia')

--podcele operacyjne
insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 5, 'Osi�ganie najwy�szych kategorii naukowych przez wszystkie podstawowe jednostki organizacyjne')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 5, 'Budowa systemu jako�ci bada� oraz powi�zania finansowania bada� z efektami naukowymi')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 5, 'Wy�anianie i wspieranie jednostek o wybitnym potencjale naukowym i intelektualnym')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 5, 'Kszta�towanie sylwetki uczonego - kierownika zespo�u badawczego')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 6, 'Przezwyci�anie barier dziel�cych poszczeg�lne dyscypliny nauki poprzez tworzenie wsp�lnych p�aszczyzn i zespo��w badawczych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 6, 'Rozw�j og�lnouniwersyteckich interdyscyplinarnych centr�w badawczych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 6, 'Prowadzenie wsp�lnych bada� z innymi o�rodkami naukowo-badawczymi')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 7, 'Zwi�kszenie mi�dzynarodowej wymiany badaczy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 7, 'Wzrost aktywno�ci w pozyskiwaniu �rodk�w na badania z zagranicy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 7, 'Upowszechnianie i promocja wynik�w bada�')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 7, 'Udzia� w rozwi�zywaniu globalnych problem�w')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 7, 'Zwi�kszenie liczby publikacji o zasi�gu mi�dzynardowym ')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 8, 'Rozwi�zanie organizacyjne zmierzajace do efektywnego wykorzystania infrastruktury badawczej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 8, 'Rozbudowa systemu biblioteczno-informacyjnego')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 8, 'Ci�g�a rozbudowa systemu informatycznego')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 8, 'Wzmocnienie i reorganizacja jednostek UAM wspomagaj�cych nauk�')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 8, 'Dokumentacja i archiwizacja zbior�w materialnych i elektronicznych dla cel�w spo�eczno-kulturowych oraz badawczych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 13, 'Wprowadzenie studi�w interdyscyplinarnych: mi�dzykierunkowych, makrokierunkowych oraz kierunk�w unikatowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 13, 'Budowa i oferty promowania kszta�cenia ustawicznego (LLL)')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 13, 'Wspieranie nowych technologii kszta�cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 13, 'Przystosowanie procesu i warunk�w kszta�cenia do potrzeb os�b niepe�nosprawnych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 14, 'Kszta�towanie kwalifikacji i kompetencji osobowo�ciowych zgodnych z oczekiwaniami spo�ecznymi rynku pracy oraz Krajowymi Ramami Kwlaifikacji')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 14, 'Wspieranie samorz�dno�ci studenckiej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 14, 'Wspieranie kultury i sportu studenckiego')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 15, 'Zwi�kszenie udzia�u pracy w�asnej w programach studi�w')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 15, 'Indywidualizacja procesu kszta�cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 15, 'Rozw�j studenckiego ruchu naukowego')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 16, 'Zwi�kszenie oferty zaj�� w j�zykach kongresowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 16, 'Wzrost mobilno�ci student�w i nauczycieli akademickich')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 16, 'Tworzenie wsp�lnych program�w studi�w z uczelniami zagranicznymi')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 17, 'Informatyzacja procesu kszta�cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 17, 'Nowoczesne laboratoria dydaktyczne')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 17, 'Infrastruktura dla sportu i kultury')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 17, 'Poprawa infrastruktury mieszkaniowej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 17, 'Niwelowanie barier architektonicznych dla os�b niepe�nosprawnych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 18, 'Wzmocenie promocji nauki i edukacji')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 18, 'Udost�pnienie infrastruktury uczelni dla potrzeb kultury, sztuki i sportu (rekreacji)')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 18, 'Mecenat i organizacja przedsi�wzi�� artystycznych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 19, 'Wsp�praca z powszechnym systemem edukacyjnym')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 19, 'Racjonalizacja dzia�alno�ci o�rodk�w zamiejscowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 19, 'Doskonalenie kwalifikacji zawodowych i uzyskiwanie stopni naukowych dla os�b spoza sektora naukowego')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 19, 'Wsp�praca ze stowarzyszeniami i towarzystwami naukowymi, kulturalnymi i technicznymi (w tym PTPN)')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 20, 'Transfer wiedzy do gospodarki i wsp�praca z przedsi�biorstwami oraz rynkiem pracy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 20, 'Wspieranie przedsi�biorczo�ci akademickiej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 20, 'Wzmocnienie dzia�a� Biura Karier UAM')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 23, 'Opracowanie i wdra�anie Strategii rozwoju UAM na lata 2009-2019')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 23, 'Demokratyzacja zarz�dzania')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 23, 'Zarz�dzanie mark� i kszta�towanie wizerunku UAM')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 24, 'Kszta�towanie umiej�tno�ci organizacyjnych promuj�cych profesjonalizm zawodowy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 24, 'Promowanie postaw aktywnych i innowacyjnych wspieraj�cych sta�e doskonalenie procesow organizacyjnych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 24, 'Budowanie umiej�tno�ci organizacyjnych i kultury spotka�')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 25, 'Wprowadzenie mechanizm�w stalego podnoszenia jako�ci proces�w organizayjnych poprzez wdro�enie systemu zarz�dzania jako�ci� i zarz�dzania problemami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 25, 'Dostosowanie struktur organizayjnych do bie��cych potrzeb uczelni')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 25, 'Wprowadzenie elektronicznego obiegu dokument�w')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 25, 'Zbudowanie systemu sprawozdawczo�ci zarz�dczej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 25, 'Informatyzacja procesu zarz�dzania')
insert into cel (lp, id_strategii, id_parent, tresc)
values (6, 1, 25, 'Usprawnienie obs�ugi prawnej Uniwersytetu')
insert into cel (lp, id_strategii, id_parent, tresc)
values (7, 1, 25, 'Optymalizacja procedur zam�wie� publicznych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (8, 1, 25, 'Usprawnienie obs�ugi prawnej Uniwersytetu')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 26, 'Podniesienie rangi zasob�w ludzkich do poziomu zasob�w strategicznych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 26, 'Podniesienie atrakcyjno�ci uczelni jako pracodawcy')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 27, 'Wdro�enie procesu planowania finansowego i kontroli finansowej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 27, 'Usprawnienie analit6yki finansowej')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 28, 'Waloryzacja programu wieloletniego dla zrealizowania jego pe�nego zakresu')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 28, 'Realizacja programu rozwoju infrastruktury UAM finansowanego z innych �r�de�')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 28, 'Opracowanie kompleksowego projektu racjonalnej gospodarki nieruchomo�ciami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 28, 'Pozyskiwanie �rodk�w zewn�trznych na inwestycje/adaptacje/remonty')

