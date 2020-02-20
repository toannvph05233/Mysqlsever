use quanly_thuvien;

create table people(
	IDpeople nvarchar(10) primary key,
    namepeople nvarchar(50),
	address nvarchar(100)
);

create table book(
	IDbook nvarchar(10) primary key,
    namebook nvarchar(50),
    IDloaibook nvarchar(10),
    foreign key (idloaibook) references loaibook(idloaibook)
);

create table loaibook(
	IDloaibook nvarchar(10) primary key,
    nameloaibook nvarchar(50)
);

create table borrow_books(
	IDborrow nvarchar(10) primary key,
    IDpeople nvarchar(10),
    IDbook nvarchar(10),
    Time_borrow time,
    foreign key(IDbook) references book(IDbook),
    foreign key(IDpeople) references people(IDpeople)
    
);