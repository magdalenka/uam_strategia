-- usuwanie tabeli

drop table dzialanie_cel
drop table cel
drop table dzialanie
drop table osoby_powiazane
drop table strategia
drop table dzialanie_odpowiedzialnosc
drop table strategia_autor
drop table podjete_dzialanie
drop table zrodlo_finansowania
drop table dzialanie_zrodlo

-- tworzenie tabeli

CREATE TABLE strategia(
id int IDENTITY(1,1) primary key,
id_parent int references strategia(id),
lp varchar(10),
nazwa_strategii varchar(max),
nazwa_jednostki varchar(max),
widocznosc tinyint default 1
)

CREATE TABLE osoby_odpowiedzialne(
id int IDENTITY(1,1) primary key,
lp int,
stanowisko varchar(100),
tytul varchar(20),
nazwisko varchar(100),
rola varchar(100),
id_startegii int references strategia(id)
)

CREATE TABLE autor(
id int IDENTITY(1,1) primary key,
lp int,
tytul varchar(100),
nazwisko varchar(100),
)

CREATE TABLE cel
(id int IDENTITY(1,1) primary key,
lp varchar(10),
id_strategii int references strategia(id),
id_parent int references cel(id), 
tresc varchar(max),
widocznosc tinyint default 1
)

CREATE TABLE dzialanie
(id int IDENTITY(1,1) primary key,
nazwa varchar(max),
lp varchar(10),
termin varchar(max),
wskaznik_rezultat varchar(max),
okres_od date,
okres_do date,
waga int,
widocznosc tinyint default 1
)




CREATE TABLE podjete_dzialanie
(id int IDENTITY(1,1) primary key,
dzialanie int references dzialanie(id),
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

insert into strategia(id_parent, nazwa_strategii, nazwa_jednostki, widocznosc)
values (null, 'Strategia Kasia', 'blelee', 0)
insert into strategia(id_parent, nazwa_strategii, nazwa_jednostki, widocznosc)
values (1, 'Strategia Basia', 'blelee', 1)

insert into autor (nazwisko, id_startegii)
values ('Kowalski', 1);
insert into autor (nazwisko, id_startegii)
values ('Nowak', 1);
insert into autor (nazwisko, id_startegii)
values ('Kowalski', 2);

insert into cel (id_strateg, id_parent, tresc)
values (1, null, 'To jest jakis cel' )
insert into cel (id_strateg, id_parent, tresc)
values (2, null, 'To jest jakis cel 2' )
insert into cel (id_strateg, id_parent, tresc)
values (2, 1, 'Cel 3' )

insert into dzialanie (nazwa, odpowiedzialnosc, termin, wskaznik_rezultat, zrodlo_finansowania, widocznosc )
values ('Nazwa dzialania', 'Mrowka', 'powinna byc chyba data zamiast varchar', 'tutaj nie wiem co', 'brak finansowania', 1)

insert into dzialanie (nazwa, odpowiedzialnosc, termin, wskaznik_rezultat, zrodlo_finansowania, widocznosc )
values ('Dzialanie 2', 'Mrowka', 'powinna byc chyba data zamiast varchar', 'tutaj nie wiem co', 'brak finansowania', 1)

insert into polaczenie(id_celu, id_dzialania)
values (1,1)
insert into polaczenie(id_celu, id_dzialania)
values (3,2)

-- wyswietlanie
select * from strategia
select * from cel
select * from dzialanie
select * from polaczenie
