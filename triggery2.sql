drop trigger tworzenie_potomnych_strategii_usunietych

create trigger tworzenie_potomnych_strategii_usunietych
on strategia
for insert
as
    if 0 in (select widocznosc from strategia where id= (select id_parent from inserted))
begin
   print('Nie mozesz utworzyc strategii, strategia nadrzedna dla niej nie istnieje')
   rollback
end

--aktywowanie triggera
alter table strategia
enable trigger tworzenie_potomnych_strategii_usunietych;

--wywolanie 
insert into strategia(id_parent, lp, nazwa_strategii, nazwa_jednostki, widocznosc, organization_key)
values (4, 1, 'Strategia niewidoczna', 'niewidoczna jednostka', 0, '0000000099')

--dezaktywowanie triggera
alter table strategia
disable trigger tworzenie_potomnych_strategii_usunietych



--------------------------------------------------------------
drop trigger ukryj_podcele_ukrytego_celu

create trigger ukryj_podcele_ukrytego_celu 
on cel
for update
as
begin
	update cel set widocznosc = 0
	where id_parent in (select id from deleted)
end
 
--aktywowanie triggera
alter table cel
enable trigger ukryj_podcele_ukrytego_celu;

--dezaktywowanie triggera
alter table cel
disable trigger ukryj_podcele_ukrytego_celu;