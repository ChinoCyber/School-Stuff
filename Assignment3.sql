/***************************/
/* Name: Danny Tran */
/* Class: CS 3410 */
/* Term: Fall 2026 */
/* Assgn #: 3 */
/***************************/

USE Cape_Codd;

/* 2.28 Write an SQL statement to display SKU, SKU_Description, and WarehouseID for all products that have a QuantityOnHand equal to 0 or a QuantityOnOrder equal to 0. Sort the results in descending order by WarehouseID and in ascending order by SKU. */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

/* 2.29 Write an SQL statement to display the SKU, SKU_Description, WarehouseID, and QuantityOnHand for all products having a QuantityOnHand greater than 1 and less than 10. Do not use the BETWEEN keyword. */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand>1 AND QuantityOnHand<10;

/* 2.30 Write an SQL statement to display the SKU, SKU_Description, WarehouseID, and QuantityOnHand for all products having a QuantityOnHand greater than 1 and less than 10. Use the BETWEEN keyword. */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 2 AND 9;

/* 2.31 Write an SQL statement to show a unique SKU and SKU_Description for all products having an SKU description starting with 'Half-dome'. */
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'Half-dome%';

/* 2.32 Write an SQL statement to show a unique SKU and SKU_Description for all products having a description that includes the word 'Climb'. */
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';

/* 2.33 Write an SQL statement to show a unique SKU and SKU_Description for all products having a 'd' in the third position from the left in SKU_Description. */
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';

/* 2.34 Write an SQL statement that uses all of the SQL built-in functions on the QuantityOnHand column. Include meaningful column names in the result. */
SELECT COUNT(QuantityOnHand) AS CountOfRows,
       SUM(QuantityOnHand) AS TotalOnHand,
       AVG(QuantityOnHand) AS AverageOnHand,
       MIN(QuantityOnHand) AS MinimumOnHand,
       MAX(QuantityOnHand) AS MaximumOnHand
FROM INVENTORY;

/* 2.35 Explain the difference between the SQL built-in functions COUNT and SUM. */
/*
COUNT counts how many rows there are, and works on any data type.
SUM adds up the values in a column, and only works on numeric columns.
*/

/* 2.36 Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand, grouped by WarehouseID. Name the sum TotalItemsOnHand and display the results in descending order of TotalItemsOnHand. */
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

/* 2.37 Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand, grouped by WarehouseID. Omit all SKU items that have 3 or more items on hand from the sum, and name the sum TotalItemsOnHandLT3 and display the results in descending order of TotalItemsOnHandLT3. */
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

/* 2.38 Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand grouped by WarehouseID. Omit all SKU items that have 3 or more items on hand from the sum, and name the sum TotalItemsOnHandLT3. Show Warehouse ID only for warehouses having fewer than 2 SKUs in their TotalItemsOnHandLT3 and display the results in descending order of TotalItemsOnHandLT3. */
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(*) < 2
ORDER BY TotalItemsOnHandLT3 DESC;

/* 2.39 In your answer to Review Question 2.38, was the WHERE or HAVING applied first? Why? */
/*
The WHERE clause was applied first. WHERE filters individual rows before they are grouped,
so SKUs with 3 or more items on hand are removed first. Then GROUP BY forms the groups, and
HAVING filters those groups afterward, keeping only warehouses with fewer than 2 SKUs left.
*/

/* 2.40 Write an SQL statement to display the SKU, SKU_Description, and WarehouseID, WarehouseCity, and WarehouseState for all items stored in the Atlanta, Bangor, or Chicago warehouse. Do not use the IN keyword. */
SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID,
       WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.WarehouseCity = 'Atlanta'
   OR WAREHOUSE.WarehouseCity = 'Bangor'
   OR WAREHOUSE.WarehouseCity = 'Chicago';

/* 2.41 Write an SQL statement to display the SKU, SKU_Description, and WarehouseID, WarehouseCity, and WarehouseState for all items stored in the Atlanta, Bangor, or Chicago warehouse. Use the IN keyword. */
SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID,
       WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

/* 2.42 Write an SQL statement to display the SKU, SKU_Description, WarehouseID, WarehouseCity, and WarehouseState of all items not stored in the Atlanta, Bangor, or Chicago warehouse. Do not use the NOT IN keyword. */
SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID,
       WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.WarehouseCity <> 'Atlanta'
  AND WAREHOUSE.WarehouseCity <> 'Bangor'
  AND WAREHOUSE.WarehouseCity <> 'Chicago';

/* 2.43 Write an SQL statement to display the SKU, SKU_Description, WarehouseID, WarehouseCity, and WarehouseState of all items not stored in the Atlanta, Bangor, or Chicago warehouse. Use the NOT IN keyword. */
SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID,
       WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

/* 2.44 Write an SQL statement to produce a single column called ItemLocation that combines the SKU_Description, the phrase "is in a warehouse in", and WarehouseCity. Do not be concerned with removing leading or trailing blanks. */
SELECT INVENTORY.SKU_Description + ' is in a warehouse in ' + WAREHOUSE.WarehouseCity AS ItemLocation
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

/* 2.45 Write an SQL statement to show the SKU, SKU_Description, WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a subquery. */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE WarehouseID IN
    (SELECT WarehouseID
     FROM WAREHOUSE
     WHERE Manager = 'Lucille Smith');

/* 2.46 Write an SQL statement to show the SKU, SKU_Description, WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a join, but do not use JOIN ON syntax. */
SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
  AND WAREHOUSE.Manager = 'Lucille Smith';

/* 2.47 Write an SQL statement to show the SKU, SKU_Description, WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a join using JOIN ON syntax. */
SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.Manager = 'Lucille Smith';

/* 2.48 Write an SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a subquery. */
SELECT WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY
WHERE WarehouseID IN
    (SELECT WarehouseID
     FROM WAREHOUSE
     WHERE Manager = 'Lucille Smith')
GROUP BY WarehouseID;

/* 2.49 Write an SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a join, but do not use JOIN ON syntax. */
SELECT INVENTORY.WarehouseID, AVG(INVENTORY.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
  AND WAREHOUSE.Manager = 'Lucille Smith'
GROUP BY INVENTORY.WarehouseID;

/* 2.50 Write an SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a join using JOIN ON syntax. */
SELECT INVENTORY.WarehouseID, AVG(INVENTORY.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.Manager = 'Lucille Smith'
GROUP BY INVENTORY.WarehouseID;
