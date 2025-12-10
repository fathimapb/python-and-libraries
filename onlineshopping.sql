create database onlineshopping;
use onlineshopping;
create table Products (ProductID int PRIMARY KEY, Name varchar(50), Price int, Stock int, Category varchar(100));
create table Customers (CustomerID int PRIMARY KEY, Name varchar(50), Email varchar(100), Phone varchar(20));
CREATE TABLE Orders (OrderID INT PRIMARY KEY,CustomerID INT,OrderDate date,TotalAmount INT,FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
create table OrderDetails (OrderDetailID int, OrderID int, ProductID int, Quantity int,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
INSERT INTO Products (ProductID, Name, Price, Stock, Category) VALUES
(1, 'Laptop', 850.00, 20, 'Electronics'),
(2, 'Smartphone', 600.00, 35, 'Electronics'),
(3, 'Headphones', 40.00, 100, 'Accessories'),
(4, 'Keyboard', 25.00, 60, 'Accessories'),
(5, 'Shoes', 50.00, 80, 'Fashion'),
(6, 'Backpack', 30.00, 50, 'Fashion'),
(7, 'Coffee Maker', 75.00, 25, 'Home Appliances'),
(8, 'Office Chair', 120.00, 15, 'Furniture'),
(9, 'Water Bottle', 10.00, 200, 'Accessories'),
(10, 'Desk Lamp', 20.00, 40, 'Home Appliances');
INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(1, 'John Doe', 'john@example.com', '555-1234'),
(2, 'Mary Smith', 'mary@example.com', '555-5678'),
(3, 'Alice Johnson', 'alice@example.com', '555-8765'),
(4, 'Bob Williams', 'bob@example.com', '555-1122'),
(5, 'Emma Davis', 'emma@example.com', '555-3344'),
(6, 'Michael Brown', 'michael@example.com', '555-9988'),
(7, 'Sophia Wilson', 'sophia@example.com', '555-7788'),
(8, 'Daniel Taylor', 'daniel@example.com', '555-6677'),
(9, 'Olivia Miller', 'olivia@example.com', '555-4433'),
(10, 'James Anderson', 'james@example.com', '555-2211');
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2025-01-01', 150.00),
(2, 2, '2025-01-02', 600.00),
(3, 3, '2025-01-03',40.00),
(4, 4, '2025-01-04',75.00),
(5, 5, '2025-11-10',850.00),
(6, 6, '2025-11-11',30.00),
(7, 7, '2025-11-12',120.00),
(8, 8, '2025-11-13',20.00),
(9, 9, '2025-11-14',50.00),
(10, 10, '2025-11-15',200.00);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 3, 2),
(2, 2, 2, 1),
(3, 3, 9, 4),
(4, 4, 7, 1),
(5, 5, 1, 1),
(6, 6, 6, 1),
(7, 7, 8, 1),
(8, 8, 10, 1),
(9, 9, 5, 1),
(10, 10, 4, 2);
select * from Products;
select * from Customers;
select * from Orders;
select * from OrderDetails;
select p.ProductID,p.Name,sum(od.Quantity) as total_quantity from  OrderDetails od join Products p on od.ProductID=p.ProductID group by p.ProductID,p.Name order by total_quantity desc limit 5;
select p.Name,o.OrderDate,od.OrderID from OrderDetails od join Orders o on od.OrderID=o.OrderID join Products p on od.ProductID=p.ProductId where o.OrderDate>=current_date-interval 30 day;
select sum(o.TotalAmount) as total_sales from Orders o;
