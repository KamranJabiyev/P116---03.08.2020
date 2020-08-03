create table GroupTypes(
	Id int identity primary key,
	Name nvarchar(50) not null
)

--drop table GroupType

create table Groups(
	Id int identity primary key,
	Name nvarchar(10) not null,
	MaxSize int check(MaxSize<=18),
	GroupTypesId int references GroupTypes(Id)
)

select g.Name 'Group',MaxSize,gt.Name 'Type' from Groups as g
inner join GroupTypes as gt
on g.GroupTypesId=gt.Id

select g.Name 'Group',MaxSize,gt.Name 'Type' from Groups as g
left outer join GroupTypes as gt
on g.GroupTypesId=gt.Id

select g.Name 'Group',MaxSize,gt.Name 'Type' from Groups as g
right join GroupTypes as gt
on g.GroupTypesId=gt.Id

select * from Groups as g
full join GroupTypes as gt
on g.GroupTypesId=gt.Id

create table StudentGroups(
	Id int identity primary key,
	GroupsId int references Groups(Id),
	StudentsId int references Students(Id)
)

select Firstname,Lastname,Email,Age,g.Name 'Group',MaxSize,gt.Name 'Type' from Students as st

join StudentGroups as stg
on stg.StudentsId=st.Id

join Groups as g
on g.Id=stg.GroupsId

join GroupTypes as gt
on g.GroupTypesId=gt.Id

create table Positions(
	Id int identity primary key,
	Position nvarchar(250),
	Dependency int
)

--self join
select p1.Position,p2.Position 'Dependency' from Positions p1
left join Positions  p2
on p1.Dependency=p2.Id


alter table Students
add Grade int

create table Grades(
	Id int identity primary key,
	Letter char,
	MaxGrade int,
	MinGrade int
)

select * from Students

select * from Grades

--non-equal join

select Firstname,Lastname,Email,Age,Grade,Letter from Students st
join Grades g
on st.Grade Between g.MinGrade AND g.MaxGrade

--cross join

create table Sizes(
	Id int identity primary key,
	Size nvarchar(10)
)

create table Product(
	Id int identity primary key,
	Name nvarchar(100)
)

--cross join
select Name,Size from Product
cross join Sizes
