/***************************/
/* Name: Danny Tran */
/* Class: CS 3410 */
/* Term: Fall 2026 */
/* Lab #: 3 Part 2 */
/***************************/

/* 1) List the name of all products for which an order was placed. */
SELECT DISTINCT PRODUCTS.pname
FROM PRODUCTS JOIN ORDERS
ON PRODUCTS.pid = ORDERS.pid;

/* 2) List the name of customers that ordered product 'p07'. */
USE lab3;
SELECT DISTINCT CUSTOMERS.cname
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.cid = ORDERS.cid
WHERE ORDERS.pid = 'p07';

/* 3) List name of agents that placed an order for customer c003 or customer c006. */
USE lab3;
SELECT DISTINCT AGENTS.aname
FROM AGENTS JOIN ORDERS
ON AGENTS.aid = ORDERS.aid
WHERE ORDERS.cid = 'c003' OR ORDERS.cid = 'c006';

/* 4) List name of customers that ordered product 'p01' through agent 'a01'. */
USE lab3;
SELECT DISTINCT CUSTOMERS.cname
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.cid = ORDERS.cid
WHERE ORDERS.pid = 'p01' AND ORDERS.aid = 'a01';

/* 5) List the name of each customer that placed an order, the pid of what they ordered. */
USE lab3;
SELECT DISTINCT CUSTOMERS.cname, ORDERS.pid
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.cid = ORDERS.cid;

/* 6) List the name of each customer that placed an order and the product name for each product they ordered. */
USE lab3;
SELECT DISTINCT CUSTOMERS.cname, PRODUCTS.pname
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.cid = ORDERS.cid
JOIN PRODUCTS
ON ORDERS.pid = PRODUCTS.pid;

/* 7) List the name of each customer and the total amount ordered by the customers and also list the customers that did not place an order. */
USE lab3;
SELECT CUSTOMERS.cname, SUM(ORDERS.dollars) AS TotalAmount
FROM CUSTOMERS LEFT OUTER JOIN ORDERS
ON CUSTOMERS.cid = ORDERS.cid
GROUP BY CUSTOMERS.cid, CUSTOMERS.cname;

/* 8) List the name and the sum of dollars for each customer that ordered more than $1,000. */
USE lab3;
SELECT CUSTOMERS.cname, SUM(ORDERS.dollars) AS TotalDollars
FROM CUSTOMERS LEFT OUTER JOIN ORDERS
ON CUSTOMERS.cid = ORDERS.cid
GROUP BY CUSTOMERS.cid, CUSTOMERS.cname
HAVING SUM(ORDERS.dollars) > 1000;

/* 9) List the agent name, product name and customer name for each product ordered. */
USE lab3;
SELECT AGENTS.aname, PRODUCTS.pname, CUSTOMERS.cname
FROM ORDERS JOIN AGENTS
ON ORDERS.aid = AGENTS.aid
JOIN PRODUCTS
ON ORDERS.pid = PRODUCTS.pid
JOIN CUSTOMERS
ON ORDERS.cid = CUSTOMERS.cid;

/* 10) What would be the result of the following SQL Statement: SELECT * From CUSTOMERS, PRODUCTS */

/* The result of the following SQL Statement: SELECT * From CUSTOMERS, PRODUCTS
Cid	Cname	City	Discnt	Pid	Pname	City	Quantity	Price
c001	Tiptop	Duluth	10	p01	comb	Dallas	111400	0.5
c001	Tiptop	Duluth	10	p02	brush	Newark	203000	0.5
c001	Tiptop	Duluth	10	p03	razor	Duluth	150600	1
c001	Tiptop	Duluth	10	p04	pen	Duluth	125300	1
c001	Tiptop	Duluth	10	p05	pencil	Dallas	221400	1
c001	Tiptop	Duluth	10	p06	folder	Dallas	123100	2
c001	Tiptop	Duluth	10	p07	case	Newark	100500	1
c002	Basics	Dallas	12	p01	comb	Dallas	111400	0.5
c002	Basics	Dallas	12	p02	brush	Newark	203000	0.5
c002	Basics	Dallas	12	p03	razor	Duluth	150600	1
c002	Basics	Dallas	12	p04	pen	Duluth	125300	1
c002	Basics	Dallas	12	p05	pencil	Dallas	221400	1
c002	Basics	Dallas	12	p06	folder	Dallas	123100	2
c002	Basics	Dallas	12	p07	case	Newark	100500	1
c003	Allied	Dallas	8	p01	comb	Dallas	111400	0.5
c003	Allied	Dallas	8	p02	brush	Newark	203000	0.5
c003	Allied	Dallas	8	p03	razor	Duluth	150600	1
c003	Allied	Dallas	8	p04	pen	Duluth	125300	1
c003	Allied	Dallas	8	p05	pencil	Dallas	221400	1
c003	Allied	Dallas	8	p06	folder	Dallas	123100	2
c003	Allied	Dallas	8	p07	case	Newark	100500	1
c004	ACME	Duluth	8	p01	comb	Dallas	111400	0.5
c004	ACME	Duluth	8	p02	brush	Newark	203000	0.5
c004	ACME	Duluth	8	p03	razor	Duluth	150600	1
c004	ACME	Duluth	8	p04	pen	Duluth	125300	1
c004	ACME	Duluth	8	p05	pencil	Dallas	221400	1
c004	ACME	Duluth	8	p06	folder	Dallas	123100	2
c004	ACME	Duluth	8	p07	case	Newark	100500	1
c006	ACME	Kyoto	0	p01	comb	Dallas	111400	0.5
c006	ACME	Kyoto	0	p02	brush	Newark	203000	0.5
c006	ACME	Kyoto	0	p03	razor	Duluth	150600	1
c006	ACME	Kyoto	0	p04	pen	Duluth	125300	1
c006	ACME	Kyoto	0	p05	pencil	Dallas	221400	1
c006	ACME	Kyoto	0	p06	folder	Dallas	123100	2
c006	ACME	Kyoto	0	p07	case	Newark	100500	1
*/