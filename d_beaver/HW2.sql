--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id 
join salary s on s.id = es.salary_id order by monthly_salary;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id 
join salary s on s.id = es.salary_id 
where monthly_salary < 2000 order by monthly_salary;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary from salary s 
where s.id not in (select salary_id from employee_salary es);

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary from salary s 
where s.id not in (select salary_id from employee_salary es) 
and monthly_salary <2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name from employees e 
where e.id not in (select employee_id from employee_salary es);

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Java%' 
and role_name not like '%JavaScript%';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Automation QA%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary from roles r 
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%Java%' 
and role_name not like '%JavaScript%' 
order by monthly_salary;

-- 16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary from roles r 
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select role_name, monthly_salary from roles r 
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
join employees e on e.id =re.employee_id 
where role_name like '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select role_name, monthly_salary from roles r 
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
join employees e on e.id =re.employee_id where role_name like '%Middle JavaS%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select role_name, monthly_salary from roles r 
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
join employees e on e.id =re.employee_id 
where role_name like '%Senior Java%'and role_name not like '%JavaScript%';

-- 20. Вывести зарплаты Junior QA инженеров
select role_name, monthly_salary from roles r 
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from roles r
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from roles r
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%JavaS%';

-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from roles r
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from roles r
join roles_employee re on r.id  = re.role_id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров
select count(e.id) from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(e.id) from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(e.id) from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
where role_name like '%develop%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where role_name like '%develop%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
order by monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where monthly_salary > 1700 and monthly_salary < 2300
order by monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where monthly_salary < 2300
order by monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from roles r
join roles_employee re on r.id  = re.role_id 
join employees e on re.employee_id = e.id 
join employee_salary es on re.employee_id =es.employee_id 
join salary s on s.id = es.salary_id 
where monthly_salary in(1100, 1500, 2000)
order by monthly_salary;