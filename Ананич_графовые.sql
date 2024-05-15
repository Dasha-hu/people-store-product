USE master; 
GO

DROP DATABASE IF EXISTS ShopDB;
GO

CREATE DATABASE ShopDB; 
GO

USE ShopDB; 
GO

-- 1. Создание таблиц узлов
CREATE TABLE Products (
    ProductID INT PRIMARY KEY NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    ProductDescription TEXT NOT NULL,
    ProductPrice DECIMAL(10, 2) NOT NULL
) AS NODE;
GO

CREATE TABLE People (
    PersonID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Address TEXT NOT NULL
) AS NODE;
GO

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY NOT NULL,
    StoreName VARCHAR(255) NOT NULL,
    StoreAddress TEXT NOT NULL,
    StoreType VARCHAR(255) NOT NULL
) AS NODE;
GO

-- 2. Создание таблиц ребер

CREATE TABLE Knows AS EDGE;
GO
ALTER TABLE Knows ADD CONSTRAINT EC_Knows
CONNECTION (People to People);

CREATE TABLE Purchases AS EDGE;
GO
ALTER TABLE Purchases ADD CONSTRAINT EC_Purchases 
CONNECTION (People to Products);

CREATE TABLE Sales AS EDGE;
GO
ALTER TABLE Sales ADD CONSTRAINT EC_Sales 
CONNECTION (Products to Stores);

CREATE TABLE Employment AS EDGE;
GO
ALTER TABLE Employment ADD CONSTRAINT EC_Employment 
CONNECTION (People to Stores);

-- 3. Заполнение таблиц узлов

INSERT INTO Products (ProductID, ProductName, ProductDescription, ProductPrice)
VALUES 
(1, 'Product1', 'Description1', 100.00),
(2, 'Product2', 'Description2', 200.00),
(3, 'Product3', 'Description3', 300.00),
(4, 'Product4', 'Description4', 400.00),
(5, 'Product5', 'Description5', 500.00),
(6, 'Product6', 'Description6', 600.00),
(7, 'Product7', 'Description7', 700.00),
(8, 'Product8', 'Description8', 800.00),
(9, 'Product9', 'Description9', 900.00),
(10, 'Product10', 'Description10', 1000.00);
GO

INSERT INTO People (PersonID, FirstName, LastName, Age, Address)
VALUES 
(1, 'FirstName1', 'LastName1', 30, 'Address1'),
(2, 'FirstName2', 'LastName2', 31, 'Address2'),
(3, 'FirstName3', 'LastName3', 32, 'Address3'),
(4, 'FirstName4', 'LastName4', 33, 'Address4'),
(5, 'FirstName5', 'LastName5', 34, 'Address5'),
(6, 'FirstName6', 'LastName6', 35, 'Address6'),
(7, 'FirstName7', 'LastName7', 36, 'Address7'),
(8, 'FirstName8', 'LastName8', 37, 'Address8'),
(9, 'FirstName9', 'LastName9', 38, 'Address9'),
(10, 'FirstName10', 'LastName10', 39, 'Address10');
GO

INSERT INTO Stores (StoreID, StoreName, StoreAddress, StoreType)
VALUES 
(1, 'Store1', 'StoreAddress1', 'Type1'),
(2, 'Store2', 'StoreAddress2', 'Type2'),
(3, 'Store3', 'StoreAddress3', 'Type3'),
(4, 'Store4', 'StoreAddress4', 'Type4'),
(5, 'Store5', 'StoreAddress5', 'Type5'),
(6, 'Store6', 'StoreAddress6', 'Type6'),
(7, 'Store7', 'StoreAddress7', 'Type7'),
(8, 'Store8', 'StoreAddress8', 'Type8'),
(9, 'Store9', 'StoreAddress9', 'Type9'),
(10, 'Store10', 'StoreAddress10', 'Type10');
GO

-- 4. Заполнение таблиц ребер

INSERT INTO Knows ($from_id, $to_id)
VALUES
(
    (SELECT $node_id FROM People WHERE PersonID = 1),
    (SELECT $node_id FROM People WHERE PersonID = 2)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 2),
    (SELECT $node_id FROM People WHERE PersonID = 3)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 3),
    (SELECT $node_id FROM People WHERE PersonID = 4)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 4),
    (SELECT $node_id FROM People WHERE PersonID = 5)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 5),
    (SELECT $node_id FROM People WHERE PersonID = 6)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 6),
    (SELECT $node_id FROM People WHERE PersonID = 7)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 7),
    (SELECT $node_id FROM People WHERE PersonID = 8)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 8),
    (SELECT $node_id FROM People WHERE PersonID = 9)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 9),
    (SELECT $node_id FROM People WHERE PersonID = 10)
);
GO

INSERT INTO Purchases ($from_id, $to_id)
VALUES
(
    (SELECT $node_id FROM People WHERE PersonID = 1),
    (SELECT $node_id FROM Products WHERE ProductID = 1)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 2),
    (SELECT $node_id FROM Products WHERE ProductID = 2)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 3),
    (SELECT $node_id FROM Products WHERE ProductID = 3)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 4),
    (SELECT $node_id FROM Products WHERE ProductID = 4)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 5),
    (SELECT $node_id FROM Products WHERE ProductID = 5)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 6),
    (SELECT $node_id FROM Products WHERE ProductID = 6)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 7),
    (SELECT $node_id FROM Products WHERE ProductID = 7)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 8),
    (SELECT $node_id FROM Products WHERE ProductID = 8)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 9),
    (SELECT $node_id FROM Products WHERE ProductID = 9)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 10),
    (SELECT $node_id FROM Products WHERE ProductID = 10)
);
GO

INSERT INTO Sales ($from_id, $to_id)
VALUES
(
    (SELECT $node_id FROM Products WHERE ProductID = 1),
    (SELECT $node_id FROM Stores WHERE StoreID = 1)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 2),
    (SELECT $node_id FROM Stores WHERE StoreID = 2)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 3),
    (SELECT $node_id FROM Stores WHERE StoreID = 3)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 4),
    (SELECT $node_id FROM Stores WHERE StoreID = 4)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 5),
    (SELECT $node_id FROM Stores WHERE StoreID = 5)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 6),
    (SELECT $node_id FROM Stores WHERE StoreID = 6)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 7),
    (SELECT $node_id FROM Stores WHERE StoreID = 7)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 8),
    (SELECT $node_id FROM Stores WHERE StoreID = 8)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 9),
    (SELECT $node_id FROM Stores WHERE StoreID = 9)
),
(
    (SELECT $node_id FROM Products WHERE ProductID = 10),
    (SELECT $node_id FROM Stores WHERE StoreID = 10)
);
GO

INSERT INTO Employment ($from_id, $to_id)
VALUES
(
    (SELECT $node_id FROM People WHERE PersonID = 1),
    (SELECT $node_id FROM Stores WHERE StoreID = 1)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 2),
    (SELECT $node_id FROM Stores WHERE StoreID = 2)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 3),
    (SELECT $node_id FROM Stores WHERE StoreID = 3)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 4),
    (SELECT $node_id FROM Stores WHERE StoreID = 4)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 5),
    (SELECT $node_id FROM Stores WHERE StoreID = 5)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 6),
    (SELECT $node_id FROM Stores WHERE StoreID = 6)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 7),
    (SELECT $node_id FROM Stores WHERE StoreID = 7)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 8),
    (SELECT $node_id FROM Stores WHERE StoreID = 8)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 9),
    (SELECT $node_id FROM Stores WHERE StoreID = 9)
),
(
    (SELECT $node_id FROM People WHERE PersonID = 10),
    (SELECT $node_id FROM Stores WHERE StoreID = 10)
);
GO

-- 5. Запросы с функцией MATCH

--Продукты, которые купил FirstName1
SELECT Pr.*
FROM People as P, Purchases as Pu, Products as Pr
WHERE P.FirstName = 'FirstName1'
AND MATCH (P-(Pu)->Pr);

--Магазины, где работает FirstName2
SELECT S.*
FROM People as P, Employment as E, Stores as S
WHERE P.FirstName = 'FirstName2'
AND MATCH (P-(E)->S);

--Люди, которые знают FirstName3
SELECT P2.*
FROM People as P1, Knows as K, People as P2
WHERE P1.FirstName = 'FirstName3'
AND MATCH (P1-(K)->P2);

--Магазины, где покупали продукты люди, знакомые с FirstName3:
SELECT S.*
FROM People as P1, Knows as K, People as P2, Purchases as Pu, Products as Pr, Sales as Sa, Stores as S
WHERE P1.FirstName = 'FirstName3'
AND MATCH (P1-(K)->P2-(Pu)->Pr-(Sa)->S);

-- 6. Запросы с функцией SHORTEST_PATH

--Кратчайший путь от FirstName1 до любого продукта:
SELECT 
    P.FirstName AS PersonName,
    STRING_AGG(Pr.ProductName, '->') WITHIN GROUP (GRAPH PATH) AS ProductPath
FROM 
    People AS P,
	Products FOR PATH AS Pr,
	Purchases FOR PATH AS Pu
WHERE MATCH(SHORTEST_PATH(P(-(Pu)->Pr)+))
	AND P.FirstName = 'FirstName1';

--выбираем имя человека (FirstName), ищет путь родственных связей (Knows) между этим человеком и другими людьми (People2) в пределах 1 или 2 степеней связи

SELECT 
    People1.FirstName AS FirstName,
    STRING_AGG(People2.FirstName, '->') WITHIN GROUP (GRAPH PATH) AS EmployeePath
FROM 
    People AS People1,
	People FOR PATH AS People2, 
	Knows FOR PATH AS Knows
WHERE MATCH(SHORTEST_PATH(People1(-(Knows)->People2){1,2}))
	and People1.FirstName = 'FirstName1';