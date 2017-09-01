CREATE DATABASE Bamazon;

USE bamazon;

CREATE TABLE Products (
item_id int NOT NULL,
product_name varchar(50) NOT NULL,
department_name varchar(50) NOT NULL,
price DECIMAL(4,2) NOT NULL,
stock_quantity int NOT NULL);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
75450,
'Centon 2GB USB 2.0 Flash Drive, 10pk',
'Electronics',
45.51,
25);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
48044,
'Star Wars Smart R2-D2',
'Toys',
75.00,
25);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
55440,
'Men\'s Belmar Athletic Shoe',
'Shoes',
9.99,
10);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
74958,
'Maestro by Gibson MA41BKCH Guitar Kit',
'Musical Instruments',
99.99,
8);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
89537,
'Igloo 60-Quart Ice Cube Roller Cooler',
'Camping',
24.44,
30);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
89123,
'Arrow Professional Heavy Duty Staple Gun, Steel',
'Hardware',
17.91,
8);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
45678,
'Mens Knit Beanie - Blue',
'Mens Clothing',
21.99,
15);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
91234,
'Striped Jersey Cotton Sheets - Queen',
'Home',
49.99,
10);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
54265,
'Purina Dog Chow Small Dog Dry Dog Food 32 lb. Bag',
'Pets',
25.19,
10);

INSERT INTO Products (item_id, product_name, department_name, price, stock_quantity) VALUES (
14708,
'Parent\'s Choice Sensitive Baby Wipes',
'Baby',
4.77,
50);

USE bamazon;
CREATE TABLE Departments(
DepartmentId int AUTO_INCREMENT,
PRIMARY KEY(DepartmentId),
department_name varchar(50) NOT NULL,
OverHeadCosts DECIMAL(11,2) NOT NULL,
TotalSales DECIMAL(11,2) NOT NULL);


INSERT INTO Departments (department_name, OverHeadCosts, TotalSales) VALUES (
'Mens Clothing',
10000,
0);

INSERT INTO Departments (department_name, OverHeadCosts, TotalSales) VALUES (
'Pets',
10000,
0);

INSERT INTO Departments (department_name, OverHeadCosts, TotalSales) VALUES (
'Camping',
20000,
0);

INSERT INTO Departments (department_name, OverHeadCosts, TotalSales) VALUES (
'Shoes',
15000,
0);

INSERT INTO Departments (department_name, OverHeadCosts, TotalSales) VALUES (
'Electronics',
50000,
0);

INSERT INTO Departments (department_name, OverHeadCosts, TotalSales) VALUES (
'Sports',
25000,
0);


-- This creates the alias table TotalProfits that will exist only when requested by the executive 
SHOW TABLES;
CREATE VIEW bamazon.TotalProfits AS SELECT DepartmentId, department_name, OverHeadCosts, TotalSales, TotalSales-OverHeadCosts AS TotalProfit FROM Departments;
