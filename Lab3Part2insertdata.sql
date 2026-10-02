insert into customers (cid, cname, city, discnt) values
('c001','Tiptop','Duluth',10.00);
insert into customers (cid, cname, city, discnt) values
('c002','Basics','Dallas',12.00);
insert into customers (cid, cname, city, discnt) values
('c003','Allied','Dallas',8.00);
insert into customers (cid, cname, city, discnt) values
('c004','ACME','Duluth',8.00);
insert into customers (cid, cname, city, discnt) values
('c006','ACME','Kyoto',0.00);
insert into products (pid, pname, city, quantity, price) values
('p01','comb','Dallas',111400,0.5);
insert into products (pid, pname, city, quantity, price) values
('p02', 'brush','Newark',203000,0.5);
insert into products (pid, pname, city, quantity, price) values
('p03','razor','Duluth',150600,1.00);
insert into products (pid, pname, city, quantity, price) values
('p04','pen','Duluth',125300,1.00);
insert into products (pid, pname, city, quantity, price) values
('p05','pencil','Dallas',221400,1.00);
insert into products (pid, pname, city, quantity, price) values
('p06','folder','Dallas',123100,2.00);
insert into products (pid, pname, city, quantity, price) values
('p07','case','Newark',100500,1.00);
insert into agents (aid, aname, city, commission) values
('a01','Smith','New York',6);
insert into agents (aid, aname, city, commission) values
('a02','Jones','Newark',6);
insert into agents (aid, aname, city, commission) values
('a03','Brown','Tokyo',7);
insert into agents (aid, aname, city, commission) values
('a04','Gray','New York',6);
insert into agents (aid, aname, city, commission) values
('a05','Otasi','Duluth',5);
insert into agents (aid, aname, city, commission) values
('a06','Smith','Dallas',5);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1011,'jan','c001','a01','p01',1000,450.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1012,'jan','c001','a01','p01',1000,450.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1019,'feb','c001','a02','p02',400,180.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1017,'feb','c001','a06','p03',600,540.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1018,'feb','c001','a03','p04',600,540.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1023,'mar','c001','a04','p05',500,450.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1022,'mar','c001','a05','p06',400,720.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1025,'apr','c001','a05','p07',800,720.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1013,'jan','c002','a03','p03',1000,880.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1026,'may','c002','a05','p03',800,704.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1015,'jan','c003','a03','p05',1200,1104.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1014,'jan','c003','a03','p05',1200,1104.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1021,'feb','c004','a06','p01',1000,460.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1016,'jan','c006','a01','p01',1000,500.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1020,'feb','c006','a03','p07',600,600.00);
insert into orders (ordno,ordmonth,cid,aid,pid,qty,dollars) values
(1024,'mar','c006','a06','p01',800,400.00);