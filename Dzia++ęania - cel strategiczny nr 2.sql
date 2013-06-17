
--�r�d�o finansowania
insert into zrodlo_finansowania(nazwa)
values ('�rodki UAM')
insert into zrodlo_finansowania(nazwa)
values ('�rodki UAM i zewn�trzne')
insert into zrodlo_finansowania(nazwa)
values ('�rodki wydzia��w')
insert into zrodlo_finansowania(nazwa)
values ('Bez koszt�w')
insert into zrodlo_finansowania(nazwa)
values ('�rodki zewn�trzne')
insert into zrodlo_finansowania(nazwa)
values ('Fundusz os�b niepe�nosprawnych')
insert into zrodlo_finansowania(nazwa)
values ('�rodki UAM, UMP, MNiSW')

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
values (1, 'Biuro ds. Procesu Bolo�skiego', '', '', 1)
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
values (1, '�U', '', '', 1)
insert into osoby_odpowiedzialne(lp, stanowisko, tytul, nazwisko, id_startegii)
values (1, 'Pe�nomocnik JMR ds. USOS', '', '', 1)
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

--dzia�ania 

--2.1.1.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie Biura ds. Procesu Bolo�skiego', 1, 'Biuro','', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (1,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 1)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,1)

--2.1.1.2

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo�anie Uczelnianego Zespo�u ds. Zapewnienia Jako�ci Kszta�cenia oraz Koordynator�w ds. ECTS, LLL, e-learningu, zasob�w i �rodk�w wsparcia, USOS i Mobilno�ci(Program Erasmus)', 2, 'Powo�any Zesp�', '', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (2,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 2)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,2)

--2.1.1.3

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie Zespo�u Oceniaj�cego Jako�� Kszta�cenia', 3, 'Powo�any Zesp�', '', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (3,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 3)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,3)

--2.1.1.4

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo�anie wydzia�owych/instytutowych Zespo��w ds. Oceny Jako�ci Kszta�cenia', 4, 'Powo�ane Zespo�y', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (4,3);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 4)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,4)

--2.1.1.5

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie wydzia�owego Systemu Zapewniania Jako�ci Kszta�cenia', 5, 'System Zapewniania Jako�ci Kszta�cenia', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (5,3);

insert into dzialanie_cel(id_celu, id_dzialania)
values(10, 5)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,5)

--2.2.1.1

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Usprawnianie procesu rekrutacji na studia I stopnia', 1, 'Liczba student�w na I roku', '2009-01-01', '2019-12-31', 10, 1, 1)

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
values ('Ujednolicenie zasad rekrutacji na studia II stopnia', 3, 'Przyj�te zasady', '2009-01-01', '2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (9,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 9)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,9)	

--2.2.1.4

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie jasnych kryteri�w programowych podzia�u studi�w I i II stopnia, uwzgl�dniaj�cych r�wnie� podejmowanie studi�w na II stopniu przez absolwent�w studi�w licencjackich z innych kierunk�w. Okre�lenie wyra�nie celu studi�w I i II stopnia', 4, 'Opracowane kryteria', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (8,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 8)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,8)	


--2.2.1.5
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przegl�d i nowelizacja regulaminu studi�w i regulaminu studi�w doktoranckich', 5, 'Nowe regulaminy', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (10,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(11, 10)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,10)	

--2.2.1.6
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Konsolidacja  niekt�rych kierunk�w i specjalno�ci studi�w', 6, 'Liczba kierunk�w i specjalizacji', '2009-01-01', '2011-12-31', 10, 1, 1)

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
values ('Opracowanie zasad powo�ywania nowych kierunk�w studi�w ograniczaj�cych konkurencyjno�� mi�dzy wydzia�ami' , 7, 'Zasady', '2009-01-01', '2011-12-31', 10, 1, 1)

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
values ('Wprowadzenie dla doktorant�w obowi�zku uczestnictwa w zaj�ciach podnosz�cych ich umiej�tno�ci dydaktyczne', 1, 'Liczba zaj��/ doktorant�w', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (13,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 13)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,13)	

--2.3.1.2

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Organizowanie corocznych konferencji dydaktycznych dla pracownik�w' , 2, 'Liczba uczestnik�w', '2009-01-01', '2010-12-31', 10, 1, 1)

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
values ('Og�oszenie konkursu dla najlepszego dydaktyka na wydzia�ach', 3, 'Liczba nagrodzonych', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (15,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 15)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(3,15)	

--2.3.1.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Zorganizowanie konkursu na najlepsze podr�czniki akademickie w UAM (nagrody rektora)',4,'Liczba nagrodzonych', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (16,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(12, 16)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,16)	

--2.3.1.5
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie systemu dokszta�cania nauczycieli akademickich (j�zyk angielski, nowe metodologie i technologie kszta�cenia, �r�d�a informacji)', 5, 'System', '2009-01-01', '2010-12-31', 10, 1, 1)

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
values ('Poszerzenie oferty makrokierunk�w i studi�w unikatowych', 1, 'Liczba uruchomionych kierunk�w studi�w', '2009-01-01', '2019-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (18,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46, 18)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,18)	

--2.4.1.2

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie w ramach UAM Szko�y Nauk Humanistycznych i Spo�ecznych oraz Nauk Przyrodniczych i �cis�ych', 2, 'Powo�anie szk�', '2009-01-01', '2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (19,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46, 19)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,19)	

--2.4.1.3

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Uruchomienie uczelnianych i �rodowiskowych interdyscyplinarnych studi�w doktoranckich', 3, 'Liczba studi�w', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (20,5);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46,20)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,20)	

---2.4.1.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie wsp�lnych studi�w z uczelniami zagranicznymi w Gnie�nie i w S�ubicach', 4, 'Liczba student�w', '2009-01-01', '2012-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (21,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(46,21)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,21)	

--2.4.2.1

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo�anie pe�nomocnika i opracowanie koncepcji kszta�cenia ustawicznego na UAM',1, 'Pe�nomocnik/ koncepcja', '2009-01-01', '2010-12-31', 10, 1, 1)

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
values ('Nawi�zanie wsp�pracy z innymi organizacjami i instytucjami zajmuj�cymi si� LLL', 3, 'Liczba kontakt�w', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (24,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(47,24)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,24)	

--2.4.2.4

insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przegl�d najnowszych bada� z poszczeg�lnych dziedzin � coroczne weekendowe zjazdy', 4, 'Liczba uczestnik�w', '2009-01-01', '2010-12-31', 10, 1, 1)

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
values ('Opracowanie koncepcji wprowadzania nowych technologii kszta�cenia',1, 'Koncepcja', '2009-01-01', '2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (26,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(48, 26)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,26)	

--2.4.3.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Powo�anie Rady Programowej ds. wprowadzenia e-learningu',2, 'Rada', '', '', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (27,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(48, 27)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,27)	

--2.4.3.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Utworzenie zespo��w wydzia�owych ds. wprowadzania e-learningu',3, 'Zespo�y','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (28,3);

insert into dzialanie_cel(id_celu, id_dzialania)
values(48, 28)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(2,28)

--2.4.4.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przyznawanie Indywidualnej Organizacji Studi�w dla os�b niepe�nosprawnych',1, 'Odsetek student�w niepe�nosprawnych z IOS','2009-01-01','2019-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (29,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(49, 29)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,29)

--2.4.4.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przygotowanie materia��w dydaktycznych dla niepe�nosprawnych(�rodowiskowa pracownia przygotowania materia��w dydaktycznych',2, 'Liczba materia��w','2009-01-01','2011-12-31', 10, 1, 1)

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
values ('Przygotowanie konferencji naukowej na temat udzia�u  niepe�nosprawnych w �yciu Uniwersytetu',3, 'Liczba uczestnik�w','2009-01-01','2010-12-31', 10, 1, 1)

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
values ('Propagowanie i rozw�j kwalifikowanego sportu akademickiego os�b niepe�nosprawnych',4, 'Liczba sekcji sportowych student�w niepe�nosprawnych','','', 10, 1, 1)

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
values ('Opracowanie opis�w kwalifikacji absolwenta na wszystkich kierunkach i wszystkich cyklach studi�w oraz efekt�w kszta�cenia dla wszystkich przedmiot�w',1, 'Opisy kwalifikacji','','', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (33,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50, 33)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(7,33)

--2.5.1.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przebudowa program�w studi�w zgodnie z Krajowymi Ramami Kwalifikacji',2, 'Nowe programy','2009-01-01','2012-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (34,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50,34)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,34)

--2.5.1.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wprowadzanie dzia�a� antyplagiatowych w �rodowisku studenckim (seminaria informacyjne + system antyplagiatowy)',3, 'Liczba seminari�w oraz prac obj�tych systemem','2009-01-01','2011-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (35,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50,35)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,35)

--2.5.1.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Przegl�d program�w studi�w pod k�tem optymalizacji liczby zaj�� praktycznych',4, 'Udzia� zaj�� praktycznych w programach studi�w','2009-01-01','2010-12-31', 10, 1, 1)

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
values ('Rozwijanie idei studenckiego inkubatora przedsi�biorczo�ci',5, 'Liczba uczestnik�w/konsultacji','','', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (37,2);

insert into dzialanie_cel(id_celu, id_dzialania)
values(50, 37)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(9,37)

--2.5.1.6
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wprowadzenie do program�w studi�w tre�ci zwi�zanych z w�asno�ci� intelektualn�, rynkiem pracy oraz przedsi�biorczo�ci� i innowacyjno�ci�',6,'Liczba nowych program�w i uczestnik�w','2009-01-01','2011-12-31', 10, 1, 1)

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
values ('Wzmacnianie struktur samorz�d�w wydzia�owych',1,'Liczba dzia�aczy/ inicjatyw','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (39,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(51,39)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,39)

--2.5.2.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wspieranie inicjatyw Parlamentu Samorz�du Studenckiego',2,'Liczba inicjatyw','','', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (40,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(51,40)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,40)

--2.5.2.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Zorganizowanie szko�y samorz�dowo�ci i wiedzy o funkcjonowaniu szko�y wy�szej dla przyszlych student�w',3,'Szko�a samorz�dowo�ci','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (41,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(51,41)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,41)

--2.5.3.1
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Opracowanie zasad przyznawania pomocy dla student�w - sportowc�w (Indywidualna Organizacja Studi�w)',1,'Zasady','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (42,4);

insert into dzialanie_cel(id_celu, id_dzialania)
values(52,42)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,42)

--2.5.3.2
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wspieranie rozwoju kwalifikowanego sportu studenckiego',2,'Liczba dru�yn ligowych','2009-01-01','2012-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (43,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(52,43)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,43)

--2.5.3.3
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Organizowanie Festiwalu Kultury Studenckiej - Dzie� Kultury Studenckiej na UAM',3,'Liczba uczestnik�w','2009-01-01','2010-12-31', 10, 1, 1)

insert into dzialanie_zrodlo (id_dzialania, id_zrodlo_finansowania) 
values (44,1);

insert into dzialanie_cel(id_celu, id_dzialania)
values(52,44)

insert into dzialanie_odpowiedzialnosc(id_osoby, id_dzialania)
values(1,44)

--2.5.3.4
insert into dzialanie (nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc )
values ('Wspieranie organizacji corocznych juwenali�w',4,'Liczba uczestnik�w','2009-01-01','2019-12-31', 10, 1, 1)

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
