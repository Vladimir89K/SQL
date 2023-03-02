Select model,speed, hd
from PC
where price < CAST ('500' AS MONEY);

SELECT distinct maker from Product 
WHERE type = 'printer';

SELECT model, ram, screen 
FROM Laptop 
WHERE price > CAST('1000' AS MONEY);

SELECT * 
FROM printer
WHERE color = 'y';

SELECT model, speed, hd
FROM PC
WHERE (cd = '12x' or cd = '24x') and price < CAST('600' AS MONEY);

SELECT DISTINCT maker, speed
FROM Laptop L JOIN Product P ON L.model = P.model
WHERE hd >= 10;

SELECT *
FROM (SELECT model, price FROM Pc 
UNION SELECT model, price FROM laptop 
UNION SELECT model, price FROM printer) AS a
WHERE a.model IN (SELECT model FROM product WHERE maker = 'B');

SELECT maker FROM product
WHERE type IN ('pc')
EXCEPT SELECT maker FROM product
WHERE type IN ('laptop');

SELECT DISTINCT maker FROM product p
JOIN pc ON p.model = pc.model
WHERE type = 'pc' and speed >= 450;

SELECT model, price
FROM printer 
WHERE price = (SELECT MAX(price) FROM printer);

SELECT avg(speed) AS avg_speed FROM pc;

SELECT AVG(speed) AS middle_speed FROM Laptop
WHERE price > CAST(1000 AS MONEY);

SELECT AVG(speed) AS middle_speed FROM pc
JOIN product p ON p.model = pc.model
WHERE maker = 'A';

SELECT cl.class, name, country 
FROM Classes cl JOIN Ships sh ON cl.class = sh.class
WHERE numGuns >= 10;

SELECT hd FROM pc
GROUP BY hd
HAVING COUNT(hd) >1;

SELECT DISTINCT A.model AS model, B.model AS model, A.speed, A.ram 
FROM pc AS A, pc B
WHERE A.model > B.model and A.speed = B.speed and A.ram = B.ram;

SELECT DISTINCT type,l.model,speed 
FROM laptop l JOIN product pr ON l.model = pr.model
WHERE speed < (SELECT MIN(speed) FROM Pc);

SELECT DISTINCT prod.maker, p.price
FROM product prod JOIN Printer p ON prod.model = p.model
WHERE price = (SELECT MIN(price) FROM Printer WHERE Color ='y')
AND Color ='y';

select distinct maker, max(pc.price) as max_price
FROM product p join pc on p.model = pc.model
group by maker;

Select distinct speed, avg(price) 
from pc
where speed > 600
group by speed;

Select maker 
from product p join (select model from pc where speed >= 750) as a on p.model=a.model
intersect
Select maker 
from product p join (select model from laptop l where speed >= 750) as b on p.model=b.model

with models as(select model, price from pc
union all select model,price from laptop
union all select model, price from printer)
select distinct model from models 
where price = (select max(price) from models)

