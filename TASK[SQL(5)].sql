CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    price INTEGER NOT NULL
);


INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 55000),
(2, 'Smartphone', 'Electronics', 30000),
(3, 'Desk Chair', 'Furniture', 7000),
(4, 'Monitor', 'Electronics', 12000),
(5, 'Water Bottle', 'Accessories', 500),
(6, 'Headphones', 'Electronics', 2500),
(7, 'Notebook', 'Stationery', 60),
(8, 'Pen Pack', 'Stationery', 100),
(9, 'Mouse', 'Electronics', 800),
(10, 'Keyboard', 'Electronics', 1500),
(11, 'Whiteboard', 'Furniture', 3000),
(12, 'Backpack', 'Accessories', 900),
(13, 'Lamp', 'Furniture', 2200),
(14, 'File Holder', 'Stationery', 150),
(15, 'Speaker', 'Electronics', 1800);

select*from products;

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER,
    sale_date DATE,
    employee_id TEXT,
    region TEXT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO sales (sale_id, product_id, quantity, sale_date, employee_id, region) VALUES
(101, 1, 3, '2024-01-12', 'E101', 'South'),
(102, 2, 2, '2024-01-13', 'E102', 'North'),
(103, 3, 5, '2024-01-13', 'E103', 'East'),
(104, 4, 4, '2024-01-14', 'E104', 'West'),
(105, 5, 10, '2024-01-15', 'E101', 'South'),
(106, 6, 6, '2024-01-15', 'E102', 'North'),
(107, 7, 15, '2024-01-16', 'E103', 'East'),
(108, 8, 20, '2024-01-16', 'E104', 'West'),
(109, 9, 12, '2024-01-17', 'E101', 'South'),
(110, 10, 8, '2024-01-18', 'E102', 'North'),
(111, 11, 1, '2024-01-18', 'E103', 'East'),
(112, 12, 7, '2024-01-19', 'E104', 'West'),
(113, 13, 3, '2024-01-20', 'E101', 'South'),
(114, 14, 18, '2024-01-20', 'E102', 'North'),
(115, 15, 5, '2024-01-21', 'E103', 'East');

select*from sales;

SELECT p.product_name, SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

SELECT region, COUNT(*) AS number_of_sales
FROM sales
GROUP BY region;

SELECT region, AVG(quantity) AS avg_quantity
FROM sales
GROUP BY region
HAVING AVG(quantity) > 5;

SELECT category, MAX(price) AS highest_price
FROM products
GROUP BY category;

SELECT p.product_name, SUM(s.quantity * p.price) AS total_sales_value
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

SELECT p.product_name, ROUND(SUM(s.quantity * p.price), 2) AS rounded_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;




