1. Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null

create table employees(
id serial primary key,
employee_name Varchar(50) not null);

2.Наполнить таблицу employee 70 строками.

insert into employees (employee_name)
values ('Reggie Batey'), 
('Clara Poore'), 
('Tammy Galindo'), 
('Rickey Jones'), 
('Jill Anspach'), 
('Lacy Racicot'), 
('David Macias'), 
('Jessica Manns'), 
('Amber Holcomb'), 
('Betty Wells'), 
('Miguel Fletcher'), 
('Joseph Hodges'), 
('Ida Bohannon'), 
('Cindy Merrifield'), 
('Mary Dowell'), 
('Marie Thomas'), 
('Donald Fierro'), 
('Anna Wick'), 
('Robert Harian'), 
('Michael Mark'), 
('Lucius Patterson'), 
('Lorna Rose'), 
('Karen Santiago'), 
('Peggy Beachler'), 
('Chester Baird'), 
('Ronda Colley'), 
('Robert Chapman'), 
('Sandra Hibbard'), 
('Steven Pagano'), 
('Ramona Russell'), 
('Ryan Morgan'), 
('Shannon Daugherty'), 
('Charlene Little'), 
('Steve Lewandowski'), 
('Donnie Shoemaker'), 
('Veronica Treto'), 
('Jonathon Belanger'), 
('William Hughes'), 
('Courtney Alston'), 
('Isaac Walters'), 
('Leon Ashcraft'), 
('Daniel Patterson'), 
('Randall Phillips'), 
('James Williams'), 
('Nancy Searles'), 
('Edward Hilliard'), 
('Joel Vandevelde'), 
('Nancy Bravo'), 
('Jesse Clark'), 
('Gregory Magelssen'), 
('Ella Cortez'), 
('Michael Diaz'), 
('Robert Walsh'), 
('Valorie Seibert'), 
('Yoshiko Miller'), 
('Timothy Johnson'), 
('Lita Webb'), 
('Lindsay Barrera'), 
('Jacqulyn Matthews'), 
('Lee Rehart'), 
('Fred Spencer'), 
('Melinda Webster'), 
('Shawn Pretti'), 
('Betty Schaefer'), 
('Barbara Teets'), 
('Patricia Tomas'), 
('Mattie Kelley'), 
('Mary Yates'), 
('Andrea Croes'), 
('Amanda Riley');

3. Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null

create table salary (
id serial primary key, 
monthly_salary int not null
);

4. Наполнить таблицу salary 15 строками:

insert into salary(monthly_salary) 
values (1100),(1200),(1300),(1400),(1500),(1600),
(1700),(1800),(1900),(2000),(2100),(2200),(2300),(2400),(2500);

5.Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null

create table employee_salary(
id serial  primary key,
employee_id Int not null unique,
salary_id Int not null);

6. Наполнить таблицу employee_salary 40 строками:
- â 10 ñòðîê èç 40 âñòàâèòü íåñóùåñòâóþùèå employee_id

insert into employee_salary (id, employee_id, salary_id)
values(1,3,7),
(2,1,4),
(3,5,9),
(4,40,13),
(5,23,4),
(6,11,2),
(7,52,10),
(8,15,13),
(9,26,4),
(10,16,1),
(11,20,7),
(12,21,1),
(13,2,1),
(14,22,3),
(15,4,5),
(16,6,7),
(17,7,10),
(18,24,12),
(19,8,14),
(20,25,15),
(21,9,14),
(22,10,20),
(23,31,22),
(24,17,18),
(25,27,19),
(26,28,20),
(27,12,21),
(28,29,22),
(29,14,23),
(30,30,1),
(31,18,2),
(32,13,3),
(33,48,4),
(34,47,5),
(35,46,6),
(36,45,7),
(37,44,8),
(38,43,9),
(39,42,10),
(40,41,11);

7.Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique

create table roles (
id serial primary key,
role_name int unique not null
);

8. Поменять тип столба role_name с int на varchar(30)

alter table roles alter column role_name type varchar(30);

9. Наполнить таблицу roles 20 строками:

insert into roles (id, role_name)
values (1, 'Junior Python developer'),
(2, 'Middle Python developer'),
(3, 'Senior Python developer'),
(4, 'Junior Java developer'),
(5, 'Middle Java developer'),
(6, 'Senior Java developer'),
(7, 'Junior JavaScript developer'),
(8, 'Middle JavaScript developer'),
(9, 'Senior JavaScript developer'),
(10, 'Junior Manual QA engineer'),
(11, 'Middle Manual QA engineer'),
(12, 'Senior Manual QA engineer'),
(13, 'Project Manager'),
(14, 'Designer'),
(15, 'HR'),
(16, 'CEO'),
(17, 'Sales manager'),
(18, 'Junior Automation QA engineer'),
(19, 'Middle Automation QA engineer'),
(20, 'Senior Automation QA engineer');

10.Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)


create table roles_employee(
id Serial  primary key,
employee_id Int not null unique, 
role_id Int not null, 
foreign key (employee_id)
references employees(id),
foreign key (role_id)
references roles(id));

11.Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(id,employee_id,role_id)
values(1,7,2),
(2,20,4),
(3,3,9),
(4,5,13),
(5,23,4),
(6,11,2),
(7,10,9),
(8,22,13),
(9,21,3),
(10,34,4),
(11,6,7),
(12,12,12),
(13,9,17),
(14,1,18),
(15,4,19),
(16,8,1),
(17,15,2),
(18,25,3),
(19,17,4),
(20,64,5),
(21,19,6),
(22,14,9),
(23,18,8),
(24,16,7),
(25,31,12),
(26,32,14),
(27,33,19),
(28,24,20),
(29,2,11),
(30,13,3),
(31,41,5),
(32,43,7),
(33,44,9),
(34,46,16),
(35,45,15),
(36,50,17),
(37,58,11),
(38,56,6),
(39,54,8),
(40,49,13);
