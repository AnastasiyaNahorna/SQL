## <a id="section-1"></a> SQL

### <a id="section-1"></a> Steps
#### <a id="section-1"></a> Table 1. *'employees'*.
1. Create table `employees` with the following columns:
- id serial, primary key,
- employee_name varchar(50), not null.

```postgresql
create table employees(
    id serial primary key,
    employee_name varchar(50) not null
);
```
2. Fill the table with 70 records (rows). </br>
- generate 70 names on one of appropriate websites and downloaded a .csv file,
- modify the list of those to an array
- add this array to values with an `unnest`
```postgresql
insert into employees(employee_name)
select unnest (array['Charlotte','Aiden','Elian','Adelaide','Penelope','Mike','Connie','Stuart','Brooke','Oscar','Roland','Victor','Deanna','Honey','Justin','George','Max','Tiana','Vincent','James','Alina','Aida','Bruce','Dale','Amy','Sydney','Maria','Martin','Jessica','Frederick','Maya','Sabrina','Aston','Amanda','Brianna','Rubie','Florrie','Stuart','Clark','Adison','Agata','Lyndon','Alisa','Tyler','Alexander','Natalie','Aldus','Sarah','Vincent','Melanie','Abraham','Honey','Lucas','Blake','Garry','Arianna','Kelsey','Lana','Darcy','Emily','Marcus','Robert','Edgar','Vanessa','Catherine','Sabrina','Frederick','Jordan','Tyler','Adelaide']);
```
#### <a id="section-1"></a> Table 2. *'salary'*.
3. Create table `salary` with the following columns:
- id serial, primary key,
- monthly_salary int, not null.
```postgresql
create table salary(
    id serial primary key,
    monthly_salary int not null
);
```
4. Fill the table with 15 records (1000, 1100 ... 2500). </br>
-a loop:
```postgresql
do $$
begin
	for i in 10..25 -- range of 10 to 25 in a loop
	loop
		insert into salary(monthly_salary)
		values (i*100); -- multiplying each loop value by 100 and inserting this value to monthly_salary
	end loop;
end $$;
```
#### <a id="section-1"></a> Table 3. *'employee_salary'*.
5. Create table `employee_salary` with the following columns:
- id serial, primary key,
- employee_id int, not null, unique,
- salary_id int, not null

```postgresql
create table employee_salary(
    id serial primary key,
    employee_id int not null unique,
    salary_id int not null
);
```
6. Fill the table with 40 records (10 rows of 40 must be with non-existing employee IDs).</br>
**Step 1:** </br>
-take the first 30 IDs from `employees` table to and randomly choose one out of 16 IDs from `salary` table. </br>
-use a block code `do` and a `for` loop to insert the data to employee_id and salary_id of the `employee_salary` table. </br>
```postgresql
do $$
declare
	v_row record; -- define that variable 'row' in table 'employees' is a record (row)
	v_max_salary_id int; -- define that variable 'max salary id' is an integer
begin
	select max(id)
	into v_max_salary_id
	from salary; -- looking for a maximum salary_id to pass to the random()
	for v_row in select * from employees limit 30 -- looping 30 records (rows) from 'employees' table
	loop
		insert into employee_salary(employee_id, salary_id) values(v_row.id, floor(random() * v_max_salary_id + 1)); -- passing the IDs from 'employee' and 'salary'
	end loop;
end $$;
```
-`employee_salary` table with 30 records, where employee_id values are from 1 to 30 and salary_id column values from 1 to 16. </br>

**Step 2:** </br>
-the rest of 10 records? </br>
-specific values range (from 200 to 209) for non-existent employee IDs and only one value for salary_id (1).
```postgresql
insert into employee_salary(employee_id, salary_id) values(generate_series(200, 209), 1);
```
#### <a id="section-1"></a> Table 4. *'roles'*.
7. Create table `roles` with the following columns:
- id serial, primary key,
- role_name int, not null, unique.

```postgresql
create table roles(
    id serial primary key,
    role_name int not null unique
);
```
8. Change type of the role_name column to varchar(30):
```postgresql
alter table roles
alter column role_name type varchar(30);
```
9. Fill the table with 20 records:

| id  | role_name |
|-----|-----------|
| 1   |   Junior Python developer |
| 2   | Middle Python developer   |
| 3   | Senior Python developer   |
| 4   | Junior Java developer     |
| 5   | Middle Java developer     |
| 6   | Senior Java developer     |
| 7   | Junior JavaScript developer |
| 8   | Middle JavaScript developer |
| 9   |Senior JavaScript developer  |
| 10  | Junior Manual QA engineer |
| 11  | Middle Manual QA engineer          |
| 12  | Senior Manual QA engineer          |
| 13  | Project Manager          |
| 14  | Designer          |
| 15  | HR          |
| 16  | CEO          |
| 17  | Sales manager          |
| 18  | Junior Automation QA engineer          |
| 19  | Middle Automation QA engineer          |
| 20  | Senior Automation QA engineer          |

-make an array and add the array elements to the column:
```postgresql
insert into roles(role_name)
select unnest(array['Junior Python developer', 'Middle Python developer', 'Senior Python developer', 'Junior Java developer', 'Middle Java developer', 'Senior Java developer', 'Junior JavaScript developer', 'Middle JavaScript developer', 'Senior JavaScript developer', 'Junior Manual QA engineer', 'Middle Manual QA engineer', 'Senior Manual QA engineer', 'Project Manager', 'Designer', 'HR', 'CEO', 'Sales manager', 'Junior Automation QA engineer', 'Middle Automation QA engineer', 'Senior Automation QA engineer']);
```
#### <a id="section-1"></a> Table 5. *'roles_employee'*.
10. Create table `roles_employee` with the following columns:
- id serial, primary key,
- employee_id int, not null, unique (foreign key for 'id' column of the `employees` table),
- role_id int, not null (foreign key for 'id' column of the `roles` table).
```postgresql
create table roles_employee(
    id serial primary key,
    employee_id int not null unique references employees(id),
    role_id int not null references roles(id)
);
```
11. Fill the table with 40 records:
use 'do' block code to insert data. Took this data from other tables:
```postgresql
do $$
declare
	v_row record; -- define that variable 'row' in table 'employees' is a record (row)
	v_max_role_id int; -- define that variable 'max role id' is an integer
begin
	select max(id)
	into v_max_role_id
	from roles; -- looking for a maximum role_id to pass to the random()
	for v_row in select * from employees limit 40 -- looping 40 records (rows) from 'employees' table
	loop
		insert into roles_employee(employee_id, role_id) values(v_row.id, floor(random() * v_max_role_id + 1)); -- passing the IDs from 'employee' and 'roles'
	end loop;
end $$;
```



