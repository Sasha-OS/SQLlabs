--Задача 1
--1. Необхідно знайти кількість рядків в таблиці, що містить більше ніж 2147483647 записів.
-- Напишіть код для MS SQL Server та ще однієї СУБД (на власний вибір).
--PostgreSQL
select count(*) as RowsAmount from tablename  
--Microsoft SQL Server
SELECT COUNT_BIG(*) AS RowsAmount from TableName

--2. Підрахувати довжину свого прізвища, імені та по-батькові за допомогою SQL.    
--Результат вивести в три колонки.
select length('Грибинюк') as "Lastname length", length('Олександр') as "Firstname length", length('Сергійович') as "Middlename length"

--3. Взявши рядок з виконавцем та назвою пісні, яку ви слухали останньою, замінити пробіли на
--знаки нижнього підкреслювання.
select replace('Twenty one pilots', ' ', '_') as Performer, replace('Stressed Out', ' ', '_') as SongName

--4.Створити генератор імені електронної поштової скриньки, що шляхом конкатенації
--об’єднував би дві перші літери з колонки імені, та чотири перші літери з колонки прізвища
--користувача, що зберігаються в базі даних, а також домену з вашим прізвищем.

select concat(substring(firstname from 1 for 2), substring(surname from 1 for 4), '@', surname, '.com') as "GeneratedEmail" from "TableName"

--5. За допомогою SQL визначити, в який день тижня ви народилися.
select extract(isodow from timestamp ‘2001-09-13')

--Завдання 2.
--1. Вивести усі данні по продуктам, їх категоріям, та постачальникам, навіть якщо останні з
--певних причин відсутні.
select * from products p join categories c on p."CategoryID" = c."CategoryID" join suppliers s on p."SupplierID" = s."SupplierID"
--2. Показати усі замовлення, що були зроблені в квітні 1998 року та не були відправлені.
select * from orders where extract(month from "OrderDate" ) = 4 and extract(year from "OrderDate") = 1998 and "ShippedDate" is null 

--3. Відібрати усіх працівників, що відповідають за південний регіон.
select * from employees e where e."EmployeeID" in (select e."EmployeeID" from employeeterritories em where em."TerritoryID" in (select em."TerritoryID" from territories t where t."RegionID" in (select t."RegionID" from region r where r."RegionDescription" = ‘Southern')))



--4. Вирахувати загальну вартість з урахуванням знижки усіх замовлень, що були здійснені на
--непарну дату.

select sum((od."Quantity")*(od."UnitPrice" * (1 - od."Discount"))) as "Загальна вартість" from orders o join order_details od on o."OrderID" = od."OrderID" where mod(cast(extract(day from o."OrderDate") as int), 2) = 1

--5. Знайти адресу відправлення замовлення з найбільшою ціною (враховуючи усі позиції
--замовлення, їх вартість, кількість, та наявність знижки).


select "ShipAddress" from orders o join order_details od on o."OrderID" = od."OrderID" order by ((od."Quantity")*(od."UnitPrice" * (1 - od."Discount"))) desc limit 1
