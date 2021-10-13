create table Hospitals(host_id int primary key identity,host_name varchar(50)not null)
go
insert into Hospitals values('Agha khan')
insert into Hospitals values('Dow')
insert into Hospitals values('Liqauat National')
insert into Hospitals values('Maamji')
insert into Hospitals values('Imam Clinic')
insert into Hospitals values('Saifi')
insert into Hospitals values('Ziaduddin')
go
select * from Hospitals

create table User_Donors(d_id int primary key identity,d_email nvarchar(50) not null unique,d_password varchar(max)not null,d_cninc nvarchar(59)not null unique,d_name varchar(50)not null,d_age int,d_hospital int foreign key references Hospitals(host_id),d_contact nvarchar(50)not null unique)
go
alter table User_Donors add d_blood varchar(10)
go

create procedure sp_insert_donor 
@d_email nvarchar(50),@d_password varchar(max),@d_cninc nvarchar(59),@d_name varchar(50),@d_age int,@d_hospital int,@d_contact nvarchar(50),@d_blood varchar(10)
as
begin
insert into User_Donors values(@d_email,@d_password,@d_cninc,@d_name,@d_age,@d_hospital,@d_contact,@d_blood)
end

select * from User_Donors

select * from Hospitals

select A.d_name,A.d_cninc,A.d_email,A.d_contact,A.d_age,A.d_blood,B.host_name from User_Donors as A
inner join Hospitals as B
on A.d_hospital=B.host_id where A.d_email='a@gmail.com';

alter procedure sp_Demo
@email varchar(max)
as
begin
select A.d_name,A.d_cninc,A.d_email,A.d_contact,A.d_age,A.d_blood,B.host_name from User_Donors as A
inner join Hospitals as B
on A.d_hospital=B.host_id where A.d_email=@email;
end
go
sp_Demo @email='a@gmail.com'