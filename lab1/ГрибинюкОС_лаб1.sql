--1.Вивести за допомогою команди SELECT своє прізвище, ім’я, по-батькові та групу на 
-- екран. Українською мовою.
SELECT 'Олександр' AS first_name, 'Грибинюк' AS surname, 'Сергійович' as middle_name, 'ІП-96' as "group";
--2. Вибрати всі дані з таблиці Orders.
SELECT * FROM Orders;
--3.Обрати всі назви товарів з таблиці Products, продаж яких не припинено.
SELECT ProductName FROM Products AS p WHERE p.Discontinued = 0;
--4.Вивести всі міста клієнтів уникаючи дублікатів.
SELECT DISTINCT Customers.City FROM Customers;
--.5 Вибрати всі назви компаній-постачальників в порядку зворотному алфавітному.
SELECT CompanyName FROM Shippers ORDER BY CompanyName DESC;
--6.Отримати всі деталі замовлень, замінивши назви в назвахстовпчиківIDнаNumber.
SELECT od.OrderID AS OrderNumber, od.ProductID as ProductNumber, od.UnitPrice, od.Quantity, od.Discount
FROM order_details AS od;
--7. Знайти трьох постачальників з США. Вивести назву, адресу тателефон. 
SELECT CompanyName, Address, Phone FROM Suppliers WHERE Country = 'USA' LIMIT 3;
--8. Вивести всі контактні імена клієнтів, що починаються з першої літери вашого   - --прізвища, імені, по-батькові. Врахувати чутливість до регістру.
SELECT ContactName FROM Customers WHERE ContactName LIKE '[Gg]%' OR ContactName LIKE '[Oo%]' OR ContactName LIKE '[Ss]%';
--9.Показати усі замовлення, в адресах доставки яких немає крапок.
SELECT * FROM Orders WHERE ShipAddress NOT LIKE '%.%';
--10. Вивести назви тих продуктів, що починаються на знак % або _, а закінчуються --на останню літеру вашого імені. Навіть якщо такі відсутні. 
SELECT ProductName FROM Products WHERE (ProductName LIKE '\%%' OR ProductName LIKE '\_%') AND (ProductName NOT LIKE '%r');