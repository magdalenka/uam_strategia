
--Ÿród³o finansowania
insert into zrodlo_finansowania(nazwa)
values ('Œrodki UAM')
insert into zrodlo_finansowania(nazwa)
values ('Œrodki UAM i zewnêtrzne')
insert into zrodlo_finansowania(nazwa)
values ('Œrodki wydzia³ów')
insert into zrodlo_finansowania(nazwa)
values ('Bez kosztów')
insert into zrodlo_finansowania(nazwa)
values ('Œrodki zewnêtrzne')
insert into zrodlo_finansowania(nazwa)
values ('Fundusz osób niepe³nosprawnych')
insert into zrodlo_finansowania(nazwa)
values ('Œrodki UAM, UMP, MNiSW')

--osoby odpowiedzialne
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Pror-S', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Pror-K', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Dziek', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Pror-KR', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'DKiO', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'BON', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Biuro ds. Procesu Boloñskiego', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'BK', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Pror-PE', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'JMR', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'DWZ', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'BiP', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'AMU-PIE', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, '¯U', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Pe³nomocnik JMR ds. USOS', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'CI', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Pror-N', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'BU', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Kanc','','', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'SWFiS','', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'DT', '', '', 1)

--dzia³ania 

--2.1.1.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie Biura ds. Procesu Boloñskiego', 1, 'Biuro','', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (1,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 1)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,1)

--2.1.1.2

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo³anie Uczelnianego Zespo³u ds. Zapewnienia Jakoœci Kszta³cenia oraz Koordynatorów ds. ECTS, LLL, e-learningu, zasobów i œrodków wsparcia, USOS i Mobilnoœci(Program Erasmus)', 2, 'Powo³any Zespó³', '', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (2,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 2)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,2)

--2.1.1.3

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie Zespo³u Oceniaj¹cego Jakoœæ Kszta³cenia', 3, 'Powo³any Zespó³', '', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (3,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 3)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,3)

--2.1.1.4

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo³anie wydzia³owych/instytutowych Zespo³ów ds. Oceny Jakoœci Kszta³cenia', 4, 'Powo³ane Zespo³y', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (4,3);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 4)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,4)

--2.1.1.5

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie wydzia³owego Systemu Zapewniania Jakoœci Kszta³cenia', 5, 'System Zapewniania Jakoœci Kszta³cenia', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (5,3);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 5)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,5)

--2.2.1.1

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Usprawnianie procesu rekrutacji na studia I stopnia', 1, 'Liczba studentów na I roku', '2009-01-01', '2019-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (6,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11,6)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,6)

--2.2.1.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Upowszechnienie oraz uproszczenie procesu studiowania na studiach I stopnia', 2, 'Jasne i proste zasady studiowania na studiach licencjackich', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (7,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11,7)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,7)

--2.2.1.3

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Ujednolicenie zasad rekrutacji na studia II stopnia', 3, 'Przyjête zasady', '2009-01-01', '2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (9,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 9)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,9)	

--2.2.1.4

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie jasnych kryteriów programowych podzia³u studiów I i II stopnia, uwzglêdniaj¹cych równie¿ podejmowanie studiów na II stopniu przez absolwentów studiów licencjackich z innych kierunków. Okreœlenie wyraŸnie celu studiów I i II stopnia', 4, 'Opracowane kryteria', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (8,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 8)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,8)	


--2.2.1.5
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przegl¹d i nowelizacja regulaminu studiów i regulaminu studiów doktoranckich', 5, 'Nowe regulaminy', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (10,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 10)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,10)	

--2.2.1.6
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Konsolidacja  niektórych kierunków i specjalnoœci studiów', 6, 'Liczba kierunków i specjalizacji', '2009-01-01', '2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (11,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 11)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,11)	
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,11)	

--2.2.1.7
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie zasad powo³ywania nowych kierunków studiów ograniczaj¹cych konkurencyjnoœæ miêdzy wydzia³ami' , 7, 'Zasady', '2009-01-01', '2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (12,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 12)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,12)
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,12)	

--2.3.1.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wprowadzenie dla doktorantów obowi¹zku uczestnictwa w zajêciach podnosz¹cych ich umiejêtnoœci dydaktyczne', 1, 'Liczba zajêæ/ doktorantów', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (13,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 13)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,13)	

--2.3.1.2

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Organizowanie corocznych konferencji dydaktycznych dla pracowników' , 2, 'Liczba uczestników', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (14,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 14)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,14)	
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,14)	

--2.3.1.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Og³oszenie konkursu dla najlepszego dydaktyka na wydzia³ach', 3, 'Liczba nagrodzonych', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (15,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 15)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(3,15)	

--2.3.1.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Zorganizowanie konkursu na najlepsze podrêczniki akademickie w UAM (nagrody rektora)',4,'Liczba nagrodzonych', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (16,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 16)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,16)	

--2.3.1.5
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie systemu dokszta³cania nauczycieli akademickich (jêzyk angielski, nowe metodologie i technologie kszta³cenia, Ÿród³a informacji)', 5, 'System', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (17,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 17)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(4,17)	
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(5,17)	

--2.4.1.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Poszerzenie oferty makrokierunków i studiów unikatowych', 1, 'Liczba uruchomionych kierunków studiów', '2009-01-01', '2019-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (18,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46, 18)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,18)	

--2.4.1.2

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie w ramach UAM Szko³y Nauk Humanistycznych i Spo³ecznych oraz Nauk Przyrodniczych i Œcis³ych', 2, 'Powo³anie szkó³', '2009-01-01', '2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (19,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46, 19)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,19)	

--2.4.1.3

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Uruchomienie uczelnianych i œrodowiskowych interdyscyplinarnych studiów doktoranckich', 3, 'Liczba studiów', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (20,5);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46,20)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,20)	

---2.4.1.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie wspólnych studiów z uczelniami zagranicznymi w GnieŸnie i w S³ubicach', 4, 'Liczba studentów', '2009-01-01', '2012-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (21,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46,21)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,21)	

--2.4.2.1

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo³anie pe³nomocnika i opracowanie koncepcji kszta³cenia ustawicznego na UAM',1, 'Pe³nomocnik/ koncepcja', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (22,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(47,22)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,22)	

--2.4.2.2

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Koordynacja wprowadzania nowych form LLL',2, 'Liczba nowych form', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (23,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(47,23)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,23)	

--2.4.2.3

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Nawi¹zanie wspó³pracy z innymi organizacjami i instytucjami zajmuj¹cymi siê LLL', 3, 'Liczba kontaktów', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (24,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(47,24)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,24)	

--2.4.2.4

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przegl¹d najnowszych badañ z poszczególnych dziedzin – coroczne weekendowe zjazdy', 4, 'Liczba uczestników', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (25,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(47,25)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,25)	
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(17,25)	

--2.4.3.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie koncepcji wprowadzania nowych technologii kszta³cenia',1, 'Koncepcja', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (26,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(48, 26)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,26)	

--2.4.3.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo³anie Rady Programowej ds. wprowadzenia e-learningu',2, 'Rada', '', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (27,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(48, 27)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,27)	

--2.4.3.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie zespo³ów wydzia³owych ds. wprowadzania e-learningu',3, 'Zespo³y','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (28,3);

insert into dzialanie_cel(id_celu, id_dzialania)
values(48, 28)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,28)

--2.4.4.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przyznawanie Indywidualnej Organizacji Studiów dla osób niepe³nosprawnych',1, 'Odsetek studentów niepe³nosprawnych z IOS','2009-01-01','2019-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (29,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(49, 29)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,29)

--2.4.4.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przygotowanie materia³ów dydaktycznych dla niepe³nosprawnych(œrodowiskowa pracownia przygotowania materia³ów dydaktycznych',2, 'Liczba materia³ów','2009-01-01','2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (30,6);

insert into dzialanie_cel(id_celu, id_dzialania)
values(49, 30)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,30)
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(6,30)

--2.4.4.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przygotowanie konferencji naukowej na temat udzia³u  niepe³nosprawnych w ¿yciu Uniwersytetu',3, 'Liczba uczestników','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (31,6);

insert into dzialanie_cel(id_celu, id_dzialania)
values(49, 31)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,31)
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(6,31)

--2.4.4.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Propagowanie i rozwój kwalifikowanego sportu akademickiego osób niepe³nosprawnych',4, 'Liczba sekcji sportowych studentów niepe³nosprawnych','','', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (32,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(49,32)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(6,32)
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(20,32)

--2.5.1.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie opisów kwalifikacji absolwenta na wszystkich kierunkach i wszystkich cyklach studiów oraz efektów kszta³cenia dla wszystkich przedmiotów',1, 'Opisy kwalifikacji','','', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (33,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50, 33)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(7,33)

--2.5.1.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przebudowa programów studiów zgodnie z Krajowymi Ramami Kwalifikacji',2, 'Nowe programy','2009-01-01','2012-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (34,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50,34)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,34)

--2.5.1.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wprowadzanie dzia³añ antyplagiatowych w œrodowisku studenckim (seminaria informacyjne + system antyplagiatowy)',3, 'Liczba seminariów oraz prac objêtych systemem','2009-01-01','2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (35,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50,35)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,35)

--2.5.1.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przegl¹d programów studiów pod k¹tem optymalizacji liczby zajêæ praktycznych',4, 'Udzia³ zajêæ praktycznych w programach studiów','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (36,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50, 36)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,36)
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(8,36)

--2.5.1.5
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Rozwijanie idei studenckiego inkubatora przedsiêbiorczoœci',5, 'Liczba uczestników/konsultacji','','', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (37,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50, 37)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(9,37)

--2.5.1.6
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wprowadzenie do programów studiów treœci zwi¹zanych z w³asnoœci¹ intelektualn¹, rynkiem pracy oraz przedsiêbiorczoœci¹ i innowacyjnoœci¹',6,'Liczba nowych programów i uczestników','2009-01-01','2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (38,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50,38)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,38)
insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(8,38)

--2.5.2.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wzmacnianie struktur samorz¹dów wydzia³owych',1,'Liczba dzia³aczy/ inicjatyw','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (39,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(51,39)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,39)

--2.5.2.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wspieranie inicjatyw Parlamentu Samorz¹du Studenckiego',2,'Liczba inicjatyw','','', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (40,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(51,40)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,40)

--2.5.2.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Zorganizowanie szko³y samorz¹dowoœci i wiedzy o funkcjonowaniu szko³y wy¿szej dla przyszlych studentów',3,'Szko³a samorz¹dowoœci','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (41,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(51,41)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,41)

--2.5.3.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie zasad przyznawania pomocy dla studentów - sportowców (Indywidualna Organizacja Studiów)',1,'Zasady','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (42,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(52,42)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,42)

--2.5.3.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wspieranie rozwoju kwalifikowanego sportu studenckiego',2,'Liczba dru¿yn ligowych','2009-01-01','2012-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (43,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(52,43)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,43)

--2.5.3.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Organizowanie Festiwalu Kultury Studenckiej - Dzieñ Kultury Studenckiej na UAM',3,'Liczba uczestników','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (44,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(52,44)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,44)

--2.5.3.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wspieranie organizacji corocznych juwenaliów',4,'Liczba uczestników','2009-01-01','2019-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (45,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(52,45)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,45)

select * from [dbo].[cel]
select * from [dbo].[dzialanie]
select * from [dbo].[strategia]
select * from [dbo].[osoby_odpowiedzialne]
select * from [dbo].[zrodlo_finansowania]
select * from [dbo].[dzialanie_zrodlo]
select * from [dbo].[dzialanie_cel]
select * from [dbo].[dzialanie_odpowiedzialnosc]
