-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.
-- Вывести: model, speed и hd
Select model,speed, hd
from PC
where price < CAST ('500' AS MONEY);

-- Найдите производителей принтеров. Вывести: maker
SELECT distinct maker from Product 
WHERE type = 'printer';

-- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT model, ram, screen 
FROM Laptop 
WHERE price > CAST('1000' AS MONEY);

-- Найдите все записи таблицы Printer для цветных принтеров.
SELECT * 
FROM printer
WHERE color = 'y';

-- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
SELECT model, speed, hd
FROM PC
WHERE (cd = '12x' or cd = '24x') and price < CAST('600' AS MONEY);

-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, 
-- найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT DISTINCT maker, speed
FROM Laptop L JOIN Product P ON L.model = P.model
WHERE hd >= 10;

-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT *
FROM (SELECT model, price FROM Pc 
UNION SELECT model, price FROM laptop 
UNION SELECT model, price FROM printer) AS a
WHERE a.model IN (SELECT model FROM product WHERE maker = 'B');

-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT maker FROM product
WHERE type IN ('pc')
EXCEPT SELECT maker FROM product
WHERE type IN ('laptop');

-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker FROM product p
JOIN pc ON p.model = pc.model
WHERE type = 'pc' and speed >= 450;

-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT model, price
FROM printer 
WHERE price = (SELECT MAX(price) FROM printer);

-- Найдите среднюю скорость ПК.
SELECT avg(speed) AS avg_speed FROM pc;

-- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed) AS middle_speed FROM Laptop
WHERE price > CAST(1000 AS MONEY);

-- Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(speed) AS middle_speed FROM pc
JOIN product p ON p.model = pc.model
WHERE maker = 'A';

-- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT cl.class, name, country 
FROM Classes cl JOIN Ships sh ON cl.class = sh.class
WHERE numGuns >= 10;

-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT hd FROM pc
GROUP BY hd
HAVING COUNT(hd) >1;

-- Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
-- В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
-- Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT A.model AS model, B.model AS model, A.speed, A.ram 
FROM pc AS A, pc B
WHERE A.model > B.model and A.speed = B.speed and A.ram = B.ram;

-- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
-- Вывести: type, model, speed
SELECT DISTINCT type,l.model,speed 
FROM laptop l JOIN product pr ON l.model = pr.model
WHERE speed < (SELECT MIN(speed) FROM Pc);

-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
SELECT DISTINCT prod.maker, p.price
FROM product prod JOIN Printer p ON prod.model = p.model
WHERE price = (SELECT MIN(price) FROM Printer WHERE Color ='y')
AND Color ='y';

-- Для каждого производителя, имеющего модели в таблице Laptop, 
-- найдите средний размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана.
SELECT maker, AVG(screen) as avg_screen
FROM laptop l JOIN product p ON l.model = p.model
GROUP BY maker;

-- Найдите производителей, выпускающих по меньшей мере три различных модели ПК. 
-- Вывести: Maker, число моделей ПК.
SELECT DISTINCT maker, COUNT (DISTINCT model) as quantiti
FROM Product p WHERE type = 'pc'
Group BY maker
HAVING COUNT(DISTINCT model)>=3;

-- Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
-- Вывести: maker, максимальная цена.
select distinct maker, max(pc.price) as max_price
FROM product p join pc on p.model = pc.model
group by maker;

-- Для каждого значения скорости ПК, превышающего 600 МГц, 
-- определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
Select distinct speed, avg(price) 
from pc
where speed > 600
group by speed;

-- Найдите производителей, которые производили бы как ПК
-- со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
-- Вывести: Maker
Select maker 
from product p join (select model from pc where speed >= 750) as a on p.model=a.model
intersect
Select maker 
from product p join (select model from laptop l where speed >= 750) as b on p.model=b.model

-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
with models as(select model, price from pc
union all select model,price from laptop
union all select model, price from printer)
select distinct model from models 
where price = (select max(price) from models)

-- Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM 
-- и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
select distinct maker from product p
where type = 'printer' and maker in (select maker from product p
join pc on p.model = pc.model 
where speed = (select max(speed) from pc where ram =(select min(ram) from pc))
and ram = (select min(ram) from pc));

-- Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). 
-- Вывести: одна общая средняя цена.
select avg(price) as avg_price from (Select price from product p
join pc on p.model = pc.model
where maker = 'A'
union all select price from product p
join laptop l on p.model = l.model
where maker = 'A') as a;

-- Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. 
-- Вывести: maker, средний размер HD.
Select maker, avg(hd) as avg_hd from product p
join pc on p.model = pc.model
where maker in (select maker from product where type = 'printer')
group by maker;

-- Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
Select count(qti) FROM (select count (maker) as qti from product p 
group by maker
having count(model) = 1) as a;

-- В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день 
-- [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход).
-- Использовать таблицы Income_o и Outcome_o.
SELECT i.point, i.date, 
  CASE 
    WHEN i.inc IS NULL THEN "inc" 
    ELSE CAST(i.inc AS CHAR(20)) 
  END AS inc, 
  CASE 
    WHEN o.out IS NULL THEN "out" 
    ELSE CAST(o.out AS CHAR(20)) 
  END AS out
FROM Income_o i 
LEFT JOIN Outcome_o o ON i.date = o.date AND i.point = o.point
UNION ALL
SELECT o.point, o.date,
  CASE 
    WHEN i.inc IS NULL THEN "inc" 
    ELSE CAST(i.inc AS CHAR(20)) 
  END AS inc,
  CASE 
    WHEN o.out IS NULL THEN "out" 
    ELSE CAST(o.out AS CHAR(20)) 
  END AS out
FROM Income_o i 
RIGHT JOIN Outcome_o o ON i.date = o.date AND i.point = o.point
WHERE i.date IS NULL;
