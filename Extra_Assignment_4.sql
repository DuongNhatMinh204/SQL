create database if not exists assignment4 ;
use assignment4 ;
create table department(
	department_number int primary key auto_increment ,
    department_name varchar (50) not null
);
create table employee_table(
	employee_number int primary key auto_increment ,
    employee_name varchar(50) not null,
    department_number int ,
    foreign key(department_number) references department(department_number)
);
create table employee_skill_table(
	employee_number int ,
    skill_code varchar(50) ,
    date_registered Date ,
	PRIMARY KEY (employee_number, skill_code), 
    foreign key(employee_number) references employee_table(employee_number)
);
-- question 3 : Query all Employee (include: name) who has Java skill Instruction: Using UNION
select employee_number , employee_name
from employee_table 
where employee_number in (
							select employee_number from employee_skill_table where skill_code = 'Java'
                        )
union
select employee_number , employee_name
from employee_table 
where employee_number in (
							select employee_number from employee_skill_table where skill_code = 'Java'
                        ) ;

-- question 4: query all  department which has more than  3 employee
select d.department_number , d.department_name , count(e.employee_number) TotalNV
from department d
join employee_table e  on d.department_number = e.department_number
group by d.department_number
having count(e.employee_number) >= 3 ;

-- question 5 : query all employee of each department . Using group by
select d.department_name, e.employee_number , e.employee_name 
from employee_table e
left join department d on e.department_number = d.department_number  
group by d.department_name , e.employee_number , e.employee_name  ;
-- có thể dùng cách này 
SELECT d.department_name, 
       GROUP_CONCAT(e.employee_name ORDER BY e.employee_name SEPARATOR ', ') AS employees
FROM employee_table e
LEFT JOIN department d ON e.department_number = d.department_number  
GROUP BY d.department_name;

-- question 6 : query all employee (include : name) who has more than 1 skills . Using Distinct
select distinct e.employee_number ,e.employee_name
from employee_table e
where e.employee_number in (
							select employee_number 
                            from employee_skill_table
							group by employee_number
                            having count(skill_code) > 1
)