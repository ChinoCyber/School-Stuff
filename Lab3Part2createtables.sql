use lab3
create table customers (
	Cid		char(4) not null,
	Cname		varchar(13),
	City		varchar(20),
	Discnt		real
);


create table agents (
	Aid		char(3) not null,
	Aname		varchar(13),
	City		varchar(20),
	Commission	integer 
);

create table products (
	Pid		char(3) not null,
	Pname		varchar(13),
	City		varchar(20),
	Quantity	integer,
	Price		real
);

create table orders (
	Ordno		integer not null,
	OrdMonth	char(3),
	Cid		char(4),
	Aid		char(3),
	Pid		char(3),
	Qty		integer,
	Dollars		float
);

