-- CSCI 43500 - Project Part 1
-- Food Delivery Service


-- Creating the relations. - Alysa Vega

-- Drops the existing database if it exists
DROP DATABASE IF EXISTS FoodDelivery;

-- Creates a new database called 'FoodDelivery'
CREATE DATABASE FoodDelivery;

-- Use the newly created database
USE FoodDelivery;

-- Create the CUSTOMER table
CREATE TABLE CUSTOMER (
	customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    contact VARCHAR(15),
    address VARCHAR(50),
    payment VARCHAR(20)
);

-- Create the PERSONNEL table
CREATE TABLE PERSONNEL (
	employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    contact VARCHAR(15),
    status VARCHAR(20)
);

-- Create the RESTAURANT table
CREATE TABLE RESTAURANT (
	restaurant_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    contact VARCHAR(15),
    cuisine VARCHAR(20)
);

-- Create the MENU table
CREATE TABLE MENU (
	item_id INT PRIMARY KEY,
    restaurant_id INT,
    price DECIMAL(5, 2),
    description VARCHAR(50),
    availability VARCHAR(20),
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);

-- Create the ORDERS table
CREATE TABLE ORDERS (
	order_id INT PRIMARY KEY,
    restaurant_id INT,
    customer_id INT,
    date DATE,
    employee_id INT,
    payment_status VARCHAR(10),
    delivery_status VARCHAR(20),
    estimated_time TIME,
    subtotal DECIMAL(5, 2),
    delivery_fee DECIMAL(5, 2),
    taxes DECIMAL(5, 2),
    total DECIMAL(5, 2),
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (employee_id) REFERENCES PERSONNEL(employee_id)
);

-- Create the ORDERLINES table
CREATE TABLE ORDERLINES (
	line_id INT PRIMARY KEY,
	order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (item_id) REFERENCES MENU(item_id)
);


-- Populating the relations. - Malak Shuja

-- Populate the CUSTOMER Table
INSERT INTO CUSTOMER (customer_id, name, contact, address, payment) VALUES 
(101, 'Thomas Vera', '926-946-3200', '23 E 126th St', 'Visa 3217'),
(102, 'Lisa Miller', '545-333-1222', '130 6th Ave', 'Discover 4345'),
(103, 'Ivory Weaver', '929-338-1934', '1334 Highland View Drive', 'MasterCard 3567');

-- Populate the PERSONNEL Table
INSERT INTO PERSONNEL (employee_id, name, contact, status) VALUES 
(201, 'Rachel Berry', '326-744-0992', 'Unavailable'),
(202, 'Aaron Forde', '347-928-0128', 'Unavailable'),
(203, 'Ana Smith', '929-881-0012', 'Available'),
(204, 'Brandon Burgess', '646-202-2201', 'Available'),
(205, 'Dani Logan', '347-929-2110', 'Unavailable'),
(206, 'Lana Navarro', '646-122-9021', 'Available');

-- Populate the RESTAURANT Table
INSERT INTO RESTAURANT (restaurant_id, name, address, contact, cuisine) VALUES 
(301, 'Chill Tamale', '616 Creek St. Williamsport', '929-646-2001', 'Mexican'),
(302, 'La Villa', '89 Peachtree Lane', '646-238-1013', 'Italian'),
(303, 'Fajita Fervor', '9057 Glenholme St', '347-013-2298', 'Mexican'),
(304, 'Am Thai Bistro', '1003 Church Ave', '347-908-7172', 'Thai');

-- Populate the MENU Table
INSERT INTO MENU (item_id, restaurant_id, price, description, availability) VALUES 
(1, 301, 21.90, 'Chicken Fajita Skillet Casserole', 'Available'),
(2, 301, 16.75, 'Beef Enchilada Bake', 'Available'),
(3, 301, 10.49, 'Enchiladas', 'Available'),
(4, 302, 12.95, 'Pasta Primavera', 'Available'),
(5, 302, 22.49, 'Tuna & Avocado Carpaccio', 'Available'),
(6, 302, 12.95, '3-Cheese Tortellini', 'Available'),
(7, 303, 10.00, 'Shrimp Tacos', 'Available'),
(8, 303, 12.00, 'Chicken Tamales', 'Available'),
(9, 303, 6.50, 'Tres Leches', 'Available'),
(10, 304, 11.00, 'Chicken Pad Thai', 'Available'),
(11, 304, 13.99, 'Salmon Rice Bowl', 'Available'),
(12, 304, 16.00, 'Bibimbap', 'Available');

-- Populate the ORDERS Table
INSERT INTO ORDERS (order_id, restaurant_id, customer_id, date, employee_id, payment_status, delivery_status, estimated_time, subtotal, delivery_fee, taxes, total) VALUES 
(1001, 302, 103, '2024-10-09', 203, 'Paid', 'Delivered', '00:00:00', 35.44, 4.00, 2.84, 42.28),
(1002, 301, 101, '2024-10-10', 205, 'Refunded', 'Delivered', '00:00:00', 20.98, 4.00, 1.68, 26.66),
(1003, 303, 103, '2024-10-10', 201, 'Paid', 'Delivered', '00:00:00', 16.50, 4.00, 1.32, 21.82),
(1004, 301, 102, '2024-10-11', 201, 'Paid', 'Out for delivery', '00:05:00', 54.48, 4.00, 4.36, 62.84),
(1005, 304, 101, '2024-10-14', 204, 'Refunded', 'Delivered', '00:00:00', 61.99, 4.00, 4.96, 70.95),
(1006, 302, 102, '2024-10-16', 202, 'Paid', 'Out for delivery', '00:04:35', 22.49, 4.00, 1.80, 28.29),
(1007, 303, 101, '2024-10-16', 205, 'Pending', 'Pending', '00:14:28', 36.00, 4.00, 2.88, 42.88),
(1008, 304, 103, '2024-10-16', 201, 'Pending', 'Preparing', '00:42:54', 32.00, 4.00, 2.56, 38.56);

-- Populate the ORDERLINES Table
INSERT INTO ORDERLINES (line_id, order_id, item_id, quantity) VALUES 
(1, 1001, 4, 1),
(2, 1001, 5, 1),
(3, 1002, 3, 2),
(4, 1003, 7, 1),
(5, 1003, 9, 1),
(6, 1004, 2, 2),
(7, 1004, 3, 2),
(8, 1005, 11, 1),
(9, 1005, 12, 3),
(10, 1006, 5, 1),
(11, 1007, 8, 3),
(12, 1008, 12, 2);


-- Query operations based on the created and populated relations. -  Arielle Seechan

-- Query 1: Retrieve all orders placed by a particular customer. (Ivory Weaver - Customer ID = 3)
SELECT * FROM ORDERS WHERE customer_id = 103;

-- Query 2: Get details of all menu items for a specific restaurant.
SELECT * FROM MENU WHERE restaurant_id = 302;

-- Query 3: List all items in a particular order.
SELECT * FROM MENU ORDER BY price ASC;

-- Query 4: Find the total amount charged for a specific order.
SELECT total FROM ORDERS WHERE order_id = 1001;

-- Query 5: List all restaurants that offer a specific cuisine.
SELECT * FROM RESTAURANT WHERE cuisine = 'Mexican';

-- Query 6: Find all orders with a ”pending” delivery status.
SELECT * FROM ORDERS WHERE delivery_status = 'Pending';

-- Query 7: Retrieve the most recent order placed by a customer.
SELECT * FROM ORDERS WHERE customer_id = 103 ORDER BY date DESC LIMIT 1;

-- Query 8: List all completed orders within a specific date range.
SELECT * FROM ORDERS WHERE delivery_status = 'Delivered' AND DATE BETWEEN '2024-10-09' AND '2024-10-16';

-- Query 9: Find all available delivery personnel.
SELECT * FROM PERSONNEL WHERE status = 'Available';

-- Query 10: List the most popular menu items across all restaurants.
SELECT r.name AS restaurant, m.description FROM ORDERLINES o JOIN MENU m ON m.item_id = o.item_id JOIN RESTAURANT r ON r.restaurant_id = m.restaurant_id GROUP BY o.item_id ORDER BY SUM(o.quantity) DESC limit 5;
