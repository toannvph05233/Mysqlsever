use assingment;

create table Class(
	classId int primary key auto_increment,
    className nvarchar (50) not null,
    startDate date not null,
    statusC bit  
);

create table Student(
	studentId int primary key,
    studentName nvarchar (30) not null,
    address nvarchar (50),
    phone nvarchar(20),
    statusS bit,
    classId int,
    foreign key(classId) references Class(classId)
);

create table Subjeck(
	subId int primary key auto_increment,
    subName nvarchar (50) not null,
    credit tinyint not null default 1 check (credit >=1),
    statusSub bit default 1
);

create table Mark(
	markId int primary key auto_increment,
    subId int not null,
    studentId int not null,
    mark float default 0 check ( mark between 0 and 100),
    foreign key(subId) references Subjeck(subId),
    foreign key(studentId) references Student(studentId)
);

drop table Class;
drop table Student;
drop table Subjeck;
drop table Mark;

-- 3.b
alter table class
add check (startDate = current_date());

-- 3.c
alter table student
alter statusS set default 1 ;

-- 4:Thêm DL vào bang Class                         
INSERT INTO `assingment`.`class` (`classId`, `className`, `startDate`, `statusC`) VALUES (1, 'A1', '2020/2/2', 1);
INSERT INTO `assingment`.`class` (`classId`, `className`, `startDate`, `statusC`) VALUES (2, 'A2', '2020/5/5', 1);
INSERT INTO `assingment`.`class` (`classId`, `className`, `startDate`, `statusC`) VALUES (3, 'B1', '2020/5/5', 0);
select *
from class;

update class
set startDate = current_date()
where classid = '3';

-- thêm Dl vào bang Student
INSERT INTO `assingment`.`student` (`studentId`, `studentName`, `address`, `phone`, `statusS`, `classId`) VALUES (1, 'Hung', 'Ha Noi', '09123456789', 1, 1);
INSERT INTO `assingment`.`student` (`studentId`, `studentName`, `address`, `statusS`, `classId`) VALUES (2, 'Hoa', 'Bac Ninh', 1, 1);
INSERT INTO `assingment`.`student` (`studentId`, `studentName`, `address`, `phone`, `statusS`, `classId`) VALUES (3, 'Manh', 'HCM', '09123456789', 0, 2);
select *
from student;

-- thêm DL vào bang Subjeck
INSERT INTO `assingment`.`subjeck` (`subId`, `subName`, `credit`, `statusSub`) VALUES (1,'CF', 5, 1);
INSERT INTO `assingment`.`subjeck` (`subId`, `subName`, `credit`, `statusSub`) VALUES (2, 'C', 6, 1);
INSERT INTO `assingment`.`subjeck` (`subId`, `subName`, `credit`, `statusSub`) VALUES (3, 'HDJ', 5, 1);
INSERT INTO `assingment`.`subjeck` (`subId`, `subName`, `credit`, `statusSub`) VALUES (4, 'RDBMS', 10, 1);
select *
from subjeck;

-- thêm DL vào bang Mark:
alter table mark
add examtimes bit default 1;
INSERT INTO `assingment`.`mark` (`markId`, `subId`, `studentId`, `mark`, `examtimes`) VALUES (1,1,1,8,1);
INSERT INTO `assingment`.`mark` (`markId`, `subId`, `studentId`, `mark`, `examtimes`) VALUES (2,1,2,10,0);
INSERT INTO `assingment`.`mark` (`markId`, `subId`, `studentId`, `mark`, `examtimes`) VALUES (3,2,1,12,1);
select *
from mark;

-- thay đôi mã lop cua Hung = 2
update student
set  classId = 2
where studentName ='Hung';

-- neu phone == null => no phone

update student
set phone = "No phone"
where phone is null;

-- (Stutas) là 0 thì thêm tu ‘New’ vào truoc tên lop.
update class
set className = concat('new',class.className)
where statusC = 0;

-- 5.e neu lop ko co hs ==> status = 0
update class
set statusC = 0
where classId not in(select distinct classId from student);

-- 5.f neu mon thi chua co hs thi --> stasus = 0
update subjeck
set statusSub = 0
where subid not in (select distinct subid from mark);

-- 6.a: hien thi sv co ky tu h
select *
from student
where studentName like 'h%';

-- 6.b: ht sv có thoi gian bat dau bang thang 12:
select *
from class
where month(startDate) = 2;

-- 6.c: hiên thi crit max
select max(credit) as maxcredit
from subjeck;

-- 6.d: 
select max(credit),subname,statusSub
from subjeck;

-- 6.e:
select *
from subjeck
where credit >3 and credit <7;

-- 6.g:
select *
from subjeck
where subjeck.subid not in(select mark.subid from subjeck inner join mark on subjeck.subId = mark.subid);

-- 6.l:
select studentName,subname,mark
from mark inner join subjeck on mark.subId = subjeck.subid
			inner join student on mark.studentId = student.studentId
order by mark,studentname;

-- 7.a
delete from class
where statusC = 0;

-- 8.b
alter table class
change column statusC StatusClass bit;

-- 8.c
rename table mark to SubjeckTest;

-- 8.d


