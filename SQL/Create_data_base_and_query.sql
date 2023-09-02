/*CREATE TABLE IF NOT EXISTS list_manu (
  Transaction_id INTEGER,
  Manu_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Selling (
  transaction_id INTEGER,
  date_of_tran DATE,
  amount NUMERIC,
  Customer_ID INTEGER
);

CREATE TABLE IF NOT EXISTS Customer (
  Customer_ID INTEGER,
  Point_of_Customer NUMERIC,
  First_name VARCHAR(50),
  Last_name VARCHAR(50),
  Age NUMERIC
);

Create Table Cost_of_meat (
  meat varchar(50),
  Price_of_meat numeric
);

ALTER TABLE Manu
ADD meat varchar(100);*/

/*INSERT into Manu VALUES
('Pad Thai',120,'shrimp'),
('Green Curry',120,'Chicken'),
('Tom Yum Soup',100,'shrimp'),
('Massaman Curry',120,'Pork belly'),
('Pad Kra Pao',80,'Pork'),
('Satay',50,'Pork belly'),
('Green Papaya Salad',100,'Beef'),
('Red Curry',100,'Duck'),
('Spicy minced beef',120,'Beef'),
('Spicy minced pork',90,'Pork'),
('Spicy minced chicken salad',80,'Chicken'),
('Fried rice with shrimp',100,'shrimp'),
('Porridge with fish',80,'Fish'),
('Fried chicken',80,'Chicken'),
('Chicken and galangal in coconut milk soup',120,'Chicken'),
('Steamed duck',150,'Duck');

INSERT into Cost_of_meat VALUES
('Chicken',20),
('Pork',30),
('Pork belly',20),
('Duck',20),
('Beef',40),
('shrimp',30),
('Fish',40);



INSERT INTO Selling VALUES
(123783421, '2022-12-08', 200, 10003141),
(123783422, '2022-12-08', 400, 10003142),
(123783423, '2022-12-08', 600, 10003143),
(123783424, '2022-12-09', 400, 10003144),
(123783426, '2022-12-09', 800, 10003141),
(123783427, '2022-12-10', 200, 10003142),
(123783428, '2022-12-10', 400, 10003143),
(123783431, '2022-12-11', 600, 10003145),
(123783432, '2022-12-12', 400, 10003141),
(123783433, '2022-12-12', 600, 10003141),
(123783435, '2022-12-12', 800, 10003143);

INSERT into Customer VALUES
(10003141,500,'John','olsen',25),
(10003142,600,'Supper','Buss',28),
(10003143,700,'Thee','luvfamily',23),
(10003144,800,'Nat','Yeol',22),
(10003145,900,'Boom','Burapa',30);

INSERT into list_manu VALUES
(123783421,'Pad Thai'),
(123783422,'Green Curry'),
(123783423,'Tom Yum Soup'),
(123783424,'Massaman Curry'),
(123783426,'Pad Kra Pao'),
(123783427,'Satay'),
(123783428,'Green Papaya Salad'),
(123783431,'Pad Thai'),
(123783432,'Green Curry'),
(123783433,'Tom Yum Soup'),
(123783426,'Massaman Curry'),
(123783427,'Pad Kra Pao'),
(123783428,'Satay'),
(123783431,'Green Papaya Salad'),
(123783423,'Spicy minced pork'),
(123783424,'Spicy minced chicken salad'),
(123783426,'Fried rice with shrimp'),
(123783427,'Porridge with fish'),
(123783431,'Fried chicken'),
(123783432,'Chicken and galangal in coconut milk soup'),
(123783433,'Green Papaya Salad'),
(123783435,'Red Curry'),
(123783421,'Spicy minced beef'),
(123783422,'Spicy minced pork'),
(123783423,'Spicy minced chicken salad'); */


/*Select * from manu;*/

/*Select 
  Transaction_id,
  date_of_Tran,
  Max(amount)
From selling;*/

/*select 
  count(Transaction_id) as N0_tran,
  Min(amount) as min_amount,
  Max(amount) as max_amount,
  Round(AVG(amount),2) as average_amount
From Selling;*/

/*Select 
Manu.Manu_name,
count(Manu.Manu_name) as Count_order
From Manu
Join list_manu
  on list_manu.manu_name=Manu.Manu_name
join Selling
  on selling.Transaction_id=list_manu.transaction_id
Group by Manu.Manu_name
Order by Count_order desc
limit 3;*/

/*Select 
  First_name||Last_name as Full_name,
  sub1.Customer_ID
from
  (select *from Customer where Age > 26) as sub1
Join (Select * from selling where amount > 500) as sub2
on sub2.Customer_id=sub1.Customer_id
Group by Full_name;*/

/*With 
  sub1 as (
    select * From Customer
    Where First_name = 'Supper'),
  sub2 as (select * from Selling),
  sub3 as (select * from list_manu),
  sub4 as (select * from manu)
  
select 
meat,
count(meat) as Count_MEat
From sub1
join sub2 
on sub2.customer_id=sub1.customer_id
join sub3
on sub3.transaction_id=sub2.transaction_id
join sub4 
on sub4.manu_name=sub3.manu_name
Group by meat
ORDER by Count_MEat DESC
LIMIT 2 ;*/
