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
