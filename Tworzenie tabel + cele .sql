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
values (1, 'prof.', 'Jacek Guliñski');
insert into autor (lp, tytul, nazwisko)
values (2, 'prof.', 'Andrzej Lesicki');
insert into autor (lp, tytul, nazwisko)
values (3, ' ', 'Natalia Chromiñska');
insert into autor (lp, tytul, nazwisko)
values (4, 'prof.', 'Rafa³ Drozdowski');
insert into autor (lp, tytul, nazwisko)
values (5, 'prof.', 'Katarzyna Dziubalska-Ko³aczyk');
insert into autor (lp, tytul, nazwisko)
values (6, 'prof.', 'Witold Mazurczak');
insert into autor (lp, tytul, nazwisko)
values (7, 'prof.', 'Zbyszko Melosik');
insert into autor (lp, tytul, nazwisko)
values (8, 'prof.', 'Bogus³aw Mróz');
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
values (1, 1, null, 'BADANIA NAUKOWE na œwiatowym poziomie')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, null, 'Najwy¿sza jakoœæ KSZTA£CENIA')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, null, 'Uniwersytet OTWARTY na otoczenie')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, null, 'Uczelnia profesjonalnie ZARZ¥DZANA')

--cele operacyjne
insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 1, 'Wspieranie rozwoju naukowego pracowników')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 1, 'Poszerzanie interdyscyplinarnoœci badañ naukowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 1, 'Umiêdzynarodowienie badañ')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 1, 'Wzmacnianie infrastrutury badawczej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 1, 'Wdro¿enie systemu ochrony i korzystania z w³asnoœci intelektualnej')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 2, 'Wprowadzenie wewnêtrznego systemu oceny i zapewnienia jakoœci kszta³cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 2, 'Uporz¹dkowanie zasad organizayjnych i programowych na trzech poziomach studiów')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 2, 'Podnoszenie kompetencji dydaktycznych nauczycieli akademickich')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 2, 'Zró¿nicowanie i zwiêkszenie oferty i trybów studiów')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 2, 'Kszta³towanie sylwetki absolwenta')
insert into cel (lp, id_strategii, id_parent, tresc)
values (6, 1, 2, 'Wspieranie samodzielnoœci studentów I i II stopnia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (7, 1, 2, 'Internacjonalizacja kszta³cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (8, 1, 2, 'Rozbudowa nowoczesnej infrastruktury kaszta³cenia')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 3, 'Wzrost znaczenia kulturoznawczej roli uczelni w regionie')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 3, 'Otwarcie na potrzeby i aspiracje edukacyjne spo³ecznoœci miasta i regionu')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 3, 'Otwarcie uniwersytetu na potrzeby gospodarki opartej na wiedzy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 3, 'Wzmacnianie wiêzi z absolwentami uczelni')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 3, 'Intensyfikacja wspó³pracy z w³adzami miasta i regionu')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 4, 'Wprowadzanie strategicznego zarz¹dzania uczelni¹')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 4, 'Udoskonalenie kultury organizacyjnej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 4, 'Zwiêkszenie efektywnoœci organizacji pracy administracji centralnej , wydzia³owej i innych jednostej organizacyjnych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 4, 'Przekszta³cenie procesu administrowania w proces zarz¹dzania kadrami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 4, 'Doskonalenie systemu zarz¹dzania finansami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (6, 1, 4, 'Rozwój infrastruktury Uniwersytetu dla zapewnienia najwy¿szej efektywnoœci badañ i kszta³cenia')

--podcele operacyjne
insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 5, 'Osi¹ganie najwy¿szych kategorii naukowych przez wszystkie podstawowe jednostki organizacyjne')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 5, 'Budowa systemu jakoœci badañ oraz powi¹zania finansowania badañ z efektami naukowymi')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 5, 'Wy³anianie i wspieranie jednostek o wybitnym potencjale naukowym i intelektualnym')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 5, 'Kszta³towanie sylwetki uczonego - kierownika zespo³u badawczego')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 6, 'Przezwyciê¿anie barier dziel¹cych poszczególne dyscypliny nauki poprzez tworzenie wspólnych p³aszczyzn i zespo³ów badawczych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 6, 'Rozwój ogólnouniwersyteckich interdyscyplinarnych centrów badawczych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 6, 'Prowadzenie wspólnych badañ z innymi oœrodkami naukowo-badawczymi')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 7, 'Zwiêkszenie miêdzynarodowej wymiany badaczy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 7, 'Wzrost aktywnoœci w pozyskiwaniu œrodków na badania z zagranicy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 7, 'Upowszechnianie i promocja wyników badañ')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 7, 'Udzia³ w rozwi¹zywaniu globalnych problemów')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 7, 'Zwiêkszenie liczby publikacji o zasiêgu miêdzynardowym ')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 8, 'Rozwi¹zanie organizacyjne zmierzajace do efektywnego wykorzystania infrastruktury badawczej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 8, 'Rozbudowa systemu biblioteczno-informacyjnego')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 8, 'Ci¹g³a rozbudowa systemu informatycznego')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 8, 'Wzmocnienie i reorganizacja jednostek UAM wspomagaj¹cych naukê')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 8, 'Dokumentacja i archiwizacja zbiorów materialnych i elektronicznych dla celów spo³eczno-kulturowych oraz badawczych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 13, 'Wprowadzenie studiów interdyscyplinarnych: miêdzykierunkowych, makrokierunkowych oraz kierunków unikatowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 13, 'Budowa i oferty promowania kszta³cenia ustawicznego (LLL)')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 13, 'Wspieranie nowych technologii kszta³cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 13, 'Przystosowanie procesu i warunków kszta³cenia do potrzeb osób niepe³nosprawnych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 14, 'Kszta³towanie kwalifikacji i kompetencji osobowoœciowych zgodnych z oczekiwaniami spo³ecznymi rynku pracy oraz Krajowymi Ramami Kwlaifikacji')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 14, 'Wspieranie samorz¹dnoœci studenckiej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 14, 'Wspieranie kultury i sportu studenckiego')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 15, 'Zwiêkszenie udzia³u pracy w³asnej w programach studiów')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 15, 'Indywidualizacja procesu kszta³cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 15, 'Rozwój studenckiego ruchu naukowego')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 16, 'Zwiêkszenie oferty zajêæ w jêzykach kongresowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 16, 'Wzrost mobilnoœci studentów i nauczycieli akademickich')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 16, 'Tworzenie wspólnych programów studiów z uczelniami zagranicznymi')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 17, 'Informatyzacja procesu kszta³cenia')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 17, 'Nowoczesne laboratoria dydaktyczne')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 17, 'Infrastruktura dla sportu i kultury')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 17, 'Poprawa infrastruktury mieszkaniowej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 17, 'Niwelowanie barier architektonicznych dla osób niepe³nosprawnych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 18, 'Wzmocenie promocji nauki i edukacji')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 18, 'Udostêpnienie infrastruktury uczelni dla potrzeb kultury, sztuki i sportu (rekreacji)')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 18, 'Mecenat i organizacja przedsiêwziêæ artystycznych')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 19, 'Wspó³praca z powszechnym systemem edukacyjnym')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 19, 'Racjonalizacja dzia³alnoœci oœrodków zamiejscowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 19, 'Doskonalenie kwalifikacji zawodowych i uzyskiwanie stopni naukowych dla osób spoza sektora naukowego')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 19, 'Wspó³praca ze stowarzyszeniami i towarzystwami naukowymi, kulturalnymi i technicznymi (w tym PTPN)')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 20, 'Transfer wiedzy do gospodarki i wspó³praca z przedsiêbiorstwami oraz rynkiem pracy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 20, 'Wspieranie przedsiêbiorczoœci akademickiej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 20, 'Wzmocnienie dzia³añ Biura Karier UAM')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 23, 'Opracowanie i wdra¿anie Strategii rozwoju UAM na lata 2009-2019')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 23, 'Demokratyzacja zarz¹dzania')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 23, 'Zarz¹dzanie mark¹ i kszta³towanie wizerunku UAM')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 24, 'Kszta³towanie umiejêtnoœci organizacyjnych promuj¹cych profesjonalizm zawodowy')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 24, 'Promowanie postaw aktywnych i innowacyjnych wspieraj¹cych sta³e doskonalenie procesow organizacyjnych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 24, 'Budowanie umiejêtnoœci organizacyjnych i kultury spotkañ')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 25, 'Wprowadzenie mechanizmów stalego podnoszenia jakoœci procesów organizayjnych poprzez wdro¿enie systemu zarz¹dzania jakoœci¹ i zarz¹dzania problemami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 25, 'Dostosowanie struktur organizayjnych do bie¿¹cych potrzeb uczelni')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 25, 'Wprowadzenie elektronicznego obiegu dokumentów')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 25, 'Zbudowanie systemu sprawozdawczoœci zarz¹dczej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 1, 25, 'Informatyzacja procesu zarz¹dzania')
insert into cel (lp, id_strategii, id_parent, tresc)
values (6, 1, 25, 'Usprawnienie obs³ugi prawnej Uniwersytetu')
insert into cel (lp, id_strategii, id_parent, tresc)
values (7, 1, 25, 'Optymalizacja procedur zamówieñ publicznych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (8, 1, 25, 'Usprawnienie obs³ugi prawnej Uniwersytetu')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 26, 'Podniesienie rangi zasobów ludzkich do poziomu zasobów strategicznych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 26, 'Podniesienie atrakcyjnoœci uczelni jako pracodawcy')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 27, 'Wdro¿enie procesu planowania finansowego i kontroli finansowej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 27, 'Usprawnienie analit6yki finansowej')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, 28, 'Waloryzacja programu wieloletniego dla zrealizowania jego pe³nego zakresu')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 1, 28, 'Realizacja programu rozwoju infrastruktury UAM finansowanego z innych Ÿróde³')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 1, 28, 'Opracowanie kompleksowego projektu racjonalnej gospodarki nieruchomoœciami')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 1, 28, 'Pozyskiwanie œrodków zewnêtrznych na inwestycje/adaptacje/remonty')

