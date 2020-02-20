use johntoan;

create table Class(
	idClass nvarchar(10) primary key,
    nameClass nvarchar(50) not null,
    indextClass nvarchar(50)
);

create table sinhvien(
	idSV nvarchar(10) primary key,
    nameSV nvarchar(50) not null
);

create table sinhvien_Class(
	idClass nvarchar(10),
    idSV nvarchar(10),
    primary key(idClass,idSV),
    foreign key(idClass) references Class(idClass),
    foreign key(idSV) references sinhvien(idSV)
);

drop table Class;
drop table sinhvien;
drop table sinhvien_Class;

insert into Class values 
				("class01","class 1","indext 1"),
				("class02","class 2","indext 2"),
				("class03","class 3","indext 3");
                
insert into sinhvien values
				("ph01","Nguyen van a"),
				("ph02","Nguyen van b");
						
                        
select * from sinhvien,Class;

select distinct idSV,nameSV
from sinhvien,Class
where idSV = "ph01";

select * from sinhvien_Class;

delete from sinhvien where idSV = "ph01";

update sinhvien
set nameSV = "nguyen van toan"
where idSV = "ph02";

select *
from Class
order by idClass asc;

select * from class
where idclass like "%a%";

select * from sinhvien as sinhvienca;




