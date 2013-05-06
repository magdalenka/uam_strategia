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

insert into strategia(id_parent, lp, nazwa_strategii, nazwa_jednostki, widocznosc)
values (null, 1, 'Strategia Rozwoju Uniwersytetu Im. Adama Mickiewicza', 'Uniwersytet im. Adama Mickiewicza', 1)

insert into zrodlo_finansowania(nazwa)
values ('Œrodki wydzia³ów')

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
values (3, 3)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 4)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 5)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 6)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 7)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 8)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 9)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 10)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 11)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 12)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 13)
insert into strategia_autor(id_strategii, id_osoby)
values (3, 14)

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 3, null, 'BADANIA NAUKOWE na œwiatowym poziomie')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 3, 16, 'Wspieranie rozwoju naukowego pracowników')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 3, 16, 'Poszerzanie interdyscyplinarnoœci badañ naukowych')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 3, 16, 'Umiêdzynarodowienie badañ')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 3, 16, 'Wzmacnianie infrastrutury badawczej')
insert into cel (lp, id_strategii, id_parent, tresc)
values (5, 3, 16, 'Wdro¿enie systemu ochrony i korzystania z w³asnoœci intelektualnej')

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 3, 27, 'Osi¹ganie najwy¿szych kategorii naukowych przez wszystkie podstawowe jednostki organizacyjne')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 3, 27, 'Budowa systemu jakoœci badañ oraz powi¹zania finansowania badañ z efektami naukowymi')
insert into cel (lp, id_strategii, id_parent, tresc)
values (3, 3, 27, 'Wy³anianie i wspieranie jednostek o wybitnym potencjale naukowym i intelektualnym')
insert into cel (lp, id_strategii, id_parent, tresc)
values (4, 3, 27, 'Kszta³towanie sylwetki uczonego - kierownika zespo³u badawczego')

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wspieranie dzia³añ maj¹cych na celu utrzymanie i podnoszenie kategorii parametryzacji naukowej jednostek', 1, 'Liczba wydzia³ów z l.kategori¹', '2009-01-01', '2019-12-31', 10, 1, 1)
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Zwiêkszenie liczby uprawnieñ do nadawania stopni naukowych i tytu³u naukowego', 2, 'Liczba kierunków i wydzia³ów posiadaj¹cyh takie uprawnienia', '2009-01-01', '2019-12-31', 10, 1, 1)

select * from zrodlo_finansowania
select * from dzialanie
insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania)
values (6,1);
insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania)
values (7,1);


insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'dziekan', 'prof', 'Kowalski', 2)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'sprz¹tacz', 'dr', 'Nowak', 1)

select * from osoby_odpowiedzialne


-- zadanie ci¹g³e to wpisywaæ koniec wa¿noœci strategii?
-- a datê od, to datê kiedy powsta³a strategia?
delete from dzialanie
select * from dzialanie

-- zrobiæ inserty dla:
-- podjete_dzialanie
-- zrodlo_finansowania
-- dzialanie_zrodlo
-- dzialanie_odpowiedzialnosc
-- strategia_autor
-- dzialanie_cel





-- wyswietlanie
-- Ÿród³a finansowania do okreœlonego dzia³ania
select D.nazwa, Z.nazwa
from dzialanie as D, zrodlo_finansowania as Z
where D.id = 6
-- autorzy strategii o id =3 (UAM)
select A.tytul, A.nazwisko 
from autor as A, strategia as S
where S.id = 3

select * from strategia
select * from osoby_odpowiedzialne
select * from autor
select * from cel
select * from dzialanie