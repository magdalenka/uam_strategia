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
values (null, 1, 'nazwa str 1', 'nazwa jednostki', 0)
insert into strategia(id_parent, lp, nazwa_strategii, nazwa_jednostki, widocznosc)
values (1, 2, 'nazwa str 2', 'nazwa jedn 2', 1)

insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'dziekan', 'prof', 'Kowalski', 2)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'sprz¹tacz', 'dr', 'Nowak', 1)

insert into autor (lp, tytul, nazwisko)
values (1, 'prof', 'Kowalski');
insert into autor (lp, tytul, nazwisko)
values (2, 'dr', 'Suse³');

insert into cel (lp, id_strategii, id_parent, tresc)
values (1, 1, null, 'To jest jakis cel')
insert into cel (lp, id_strategii, id_parent, tresc)
values (2, 2, 1, 'To jest jakis cel potomny')

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Nazwa dzialania', 1, 'liczba mrówek', GETDATE(), '2017-02-27', 87, 1, 1)
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Nazwa dzialania 2', 2, 'liczba pieniêdzy', '2007-02-27', '2017-02-27', 75, 0, 0)

-- zrobiæ inserty dla:
-- podjete_dzialanie
-- zrodlo_finansowania
-- dzialanie_zrodlo
-- dzialanie_odpowiedzialnosc
-- strategia_autor
-- dzialanie_cel





-- wyswietlanie
select * from strategia
select * from osoby_odpowiedzialne
select * from autor
select * from cel
select * from dzialanie