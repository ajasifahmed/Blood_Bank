--CREATING HOSPITAL TABLE
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
--CREATING USER DONOR'S TABLE
create table User_Donors(d_id int primary key identity,d_email nvarchar(50) not null unique,d_password varchar(max)not null,d_cninc nvarchar(59)not null unique,d_name varchar(50)not null,d_age int,d_hospital int foreign key references Hospitals(host_id),d_contact nvarchar(50)not null unique)
go
alter table User_Donors add d_blood varchar(10)
go

--CREATING SP FOR USER
create procedure sp_insert_donor 
--@d_id int out,
@d_email nvarchar(50),@d_password varchar(max),@d_cninc nvarchar(59),@d_name varchar(50),@d_age int,@d_hospital int,@d_contact nvarchar(50),@d_blood varchar(10)
as
begin
insert into User_Donors values(@d_email,@d_password,@d_cninc,@d_name,@d_age,@d_hospital,@d_contact,@d_blood)
--select @d_id=SCOPE_IDENTITY()
--insert into Donor_Img values('~/img/profile-icon-9.png',@d_id)
end

sp_insert_donor @d_email='ds@',@d_password='22212d',@d_cninc='3434343',@d_name='sdds',@d_age=22,@d_hospital=2,@d_contact='7777',@d_blood='r+'
select * from User_Donors

select * from Hospitals
--CREATING SP FOR JOIING HOSP AND DONOR TABLE
select A.d_name,A.d_cninc,A.d_email,A.d_contact,A.d_age,A.d_blood,B.host_name from User_Donors as A
inner join Hospitals as B
on A.d_hospital=B.host_id where A.d_email='a@gmail.com';
--FINAL
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
--CREATING DONOR IMAGE TABLE
create table Donor_Img(img_id int primary key identity,img_path varchar(max),d_id int foreign key references User_Donors(d_id))
go

--CREATING SP TO INSERT IMAGES
create procedure sp_insert_img
@img_path varchar(max),@d_id int
as
begin
delete from Donor_Img where d_id=@d_id
insert into Donor_Img values(@img_path,@d_id)
end

--sp_insert_img @img_path='img3',@d_id=1
--insert into Donor_Img values('img1',1)
--insert into Donor_Img values('img2',1)
--truncate table Donor_Img

--CREATING COMMENTS TABLE
create table Comments(com_id int primary key identity,com_txt nvarchar(max),com_fk_on int foreign key references User_Donors(d_id),com_fk_from int foreign key references User_Donors(d_id),com_date date)
go
select * from Comments
--CREATING SP FOR INSERT COMMNENT
create procedure sp_insert_comment
@com_txt nvarchar(max),@com_fk_on int,@com_fk_from int
as
begin
insert into Comments values(@com_txt,@com_fk_on,@com_fk_from,GETDATE())
end

--CREATING SP FOR JOINING HOSP,DONOR AND IMAGE TABLES
create procedure sp_getProfile
as
begin
select a.d_id,a.d_name,a.d_email,a.d_age,a.d_contact,a.d_blood,b.host_name,c.img_path from User_Donors as a
inner join Hospitals as b
on A.d_hospital=B.host_id 
inner join Donor_Img as c
on A.d_id=C.d_id
end
--count commnets
select count(b.com_id) from User_Donors as a
inner join Comments as b
on b.com_fk_on=a.d_id
where b.com_fk_on=1

select count(com_id) from Comments where com_fk_on=1
select * from Comments
select d_id from User_Donors

select a.d_id,a.d_name,a.d_email,a.d_age,a.d_contact,a.d_blood,b.host_name,c.img_path from User_Donors as a
inner join Hospitals as b
on A.d_hospital=B.host_id 
inner join Donor_Img as c
on A.d_id=C.d_id
where b.host_id=3 and a.d_blood='A-'
order by a.d_id


--CREATING SP FOR VIEW PROFILE BY ID
create procedure sp_view_profile
@id int
as
begin
select A.d_name,A.d_cninc,A.d_email,A.d_contact,A.d_age,A.d_blood,B.host_name from User_Donors as A
inner join Hospitals as B
on A.d_hospital=B.host_id where A.d_id=@id;
end
--FOR VIEW COMMENT
select a.com_id, a.com_txt,bb.d_name,a.com_date,c.img_path from Comments as a
inner join User_Donors as b
on a.com_fk_on=b.d_id
inner join User_Donors as bb
on a.com_fk_from=bb.d_id
inner join Donor_Img as c
on c.d_id=b.d_id
where com_fk_on=1
order by a.com_id desc

select a.com_id, a.com_txt,bb.d_name,a.com_date,c.img_path from Comments as a
inner join User_Donors as b
on a.com_fk_on=b.d_id
inner join User_Donors as bb
on a.com_fk_from=bb.d_id
inner join Donor_Img as c
on c.d_id=bb.d_id
where com_fk_on=1
order by a.com_id desc


select count(d_id) from Donor_Img where d_id=20
select * from Hospitals
select * from Donor_Img
select *from User_Donors
select * from Comments

--FOR SEARCHING
select count(a.d_id) from User_Donors as a
inner join Hospitals as b 
on A.d_hospital = B.host_id 
inner join Donor_Img as c 
on A.d_id = C.d_id 
where b.host_id =2 and a.d_blood ='A+'

--count commnets
create procedure sp_Count
@id int,
@c int output
as
begin
select @c=count(com_fk_on) from Comments
where com_fk_on=@id
end

declare @total int
execute sp_Count 2,@total output
select @total
