
CREATE SCHEMA db_atividade2;

USE db_atividade2;

CREATE TABLE db_atividade2.Employees (
    Employee_id INT PRIMARY KEY,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
    Email VARCHAR(255),
    Phone_number VARCHAR(15),
    Hire_date DATETIME,
    Jobs_id VARCHAR(10),
    Manager_id INT,
    Departament_id INT,
    FOREIGN KEY (Manager_id) REFERENCES db_atividade2.Employees(Employee_id)
);

CREATE TABLE db_atividade2.Salaries (
    Employee_id INT PRIMARY KEY,
    Salary DECIMAL(10, 2),
    Commission_pct DECIMAL(5, 2),
    FOREIGN KEY (Employee_id) REFERENCES db_atividade2.Employees(Employee_id)
);

CREATE TABLE Jobs (
    Jobs_id VARCHAR(10) PRIMARY KEY,
    Job_title VARCHAR(255)
);

ALTER TABLE db_atividade2.Employees
ADD FOREIGN KEY (Jobs_id) REFERENCES db_atividade2.Jobs(Jobs_id);


-- Inserting data into the Employees table
INSERT INTO db_atividade2.Employees (Employee_id, First_name, Last_name, Email, Phone_number, Hire_date, Jobs_id, Manager_id, Departament_id)
VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17 00:00:00', 'AD_PRES', NULL, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21 00:00:00', 'AD_VP', NULL, 100),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13 00:00:00', 'AD_VP', NULL, 100),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03 00:00:00', 'IT_PROG', NULL, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21 00:00:00', 'IT_PROG', NULL, 60),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2005-06-25 00:00:00', 'IT_PROG', NULL, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05 00:00:00', 'IT_PROG', NULL, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07 00:00:00', 'IT_PROG', NULL, 60),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17 00:00:00', 'FI_MGR', NULL, 100),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2002-08-16 00:00:00', 'FI_ACCOUNT', NULL, 100),
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '2005-09-28 00:00:00', 'FI_ACCOUNT', NULL, 100),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '2005-09-30 00:00:00', 'FI_ACCOUNT', NULL, 100),
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '2006-03-07 00:00:00', 'FI_ACCOUNT', NULL, 100),
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '2007-12-07 00:00:00', 'FI_ACCOUNT', NULL, 100),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07 00:00:00', 'PU_MAN', NULL, 30),
(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '2003-05-18 00:00:00', 'PU_CLERK', NULL, 30),
(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '2005-12-24 00:00:00', 'PU_CLERK', NULL, 30),
(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '2005-07-24 00:00:00', 'PU_CLERK', NULL, 30),
(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '2006-11-15 00:00:00', 'PU_CLERK', NULL, 30),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '2007-08-10 00:00:00', 'PU_CLERK', NULL, 30),
(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '2004-07-18 00:00:00', 'ST_MAN', NULL, 50),
(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '2005-04-10 00:00:00', 'ST_MAN', NULL, 50),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01 00:00:00', 'ST_MAN', NULL, 50),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '2005-10-10 00:00:00', 'ST_MAN', NULL, 50),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '2007-11-16 00:00:00', 'ST_MAN', NULL, 50),
(125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '2005-07-16 00:00:00', 'ST_CLERK', NULL, 50),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '2006-09-28 00:00:00', 'ST_CLERK', NULL, 50),
(127, 'James', 'Landry', 'JLANDRY', '650.124.1334', '2007-01-14 00:00:00', 'ST_CLERK', NULL, 50),
(128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '2008-03-08 00:00:00', 'ST_CLERK', NULL, 50),
(129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '2005-08-20 00:00:00', 'ST_CLERK', NULL, 50),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '2005-10-30 00:00:00', 'ST_CLERK', NULL, 50),
(131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '2005-02-16 00:00:00', 'ST_CLERK', NULL, 50),
(132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '2007-04-10 00:00:00', 'ST_CLERK', NULL, 50),
(133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '2004-06-14 00:00:00', 'ST_CLERK', NULL, 50),
(134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '2006-08-26 00:00:00', 'ST_CLERK', NULL, 50),
(135, 'Ki', 'Gee', 'KGEE', '650.127.1734', '2007-12-12 00:00:00', 'ST_CLERK', NULL, 50),
(136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '2008-02-06 00:00:00', 'ST_CLERK', NULL, 50),
(137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '2003-07-14 00:00:00', 'ST_CLERK', NULL, 123);

-- Inserting data into the Salaries table
INSERT INTO db_atividade2.Salaries (Employee_id, Salary, Commission_pct)
VALUES
(100, 24000.00, NULL),
(101, 17000.00, NULL),
(102, 17000.00, NULL),
(103, 9000.00, NULL),
(104, 6000.00, NULL),
(105, 4800.00, NULL),
(106, 4800.00, NULL),
(107, 4200.00, NULL),
(108, 12008.00, NULL),
(109, 9000.00, NULL),
(110, 8200.00, NULL),
(111, 7700.00, NULL),
(112, 7800.00, NULL),
(113, 6900.00, NULL),
(114, 11000.00, NULL),
(115, 3100.00, NULL),
(116, 2900.00, NULL),
(117, 2800.00, NULL),
(118, 2600.00, NULL),
(119, 2500.00, NULL),
(120, 8000.00, NULL),
(121, 8200.00, NULL),
(122, 7900.00, NULL),
(123, 6500.00, NULL),
(124, 5800.00, NULL),
(125, 3200.00, NULL),
(126, 2700.00, NULL),
(127, 2400.00, NULL),
(128, 2200.00, NULL),
(129, 3300.00, NULL),
(130, 2800.00, NULL),
(131, 2500.00, NULL),
(132, 2100.00, NULL),
(133, 3300.00, NULL),
(134, 2900.00, NULL),
(135, 2400.00, NULL);

-- Inserting data into the Jobs table
INSERT INTO db_atividade2.Jobs (Jobs_id, Job_title)
VALUES
('AD_PRES', 'President'),
('AD_VP', 'Administration Vice President'),
('IT_PROG', 'Programmer'),
('FI_MGR', 'Finance Manager'),
('FI_ACCOUNT', 'Accountant'),
('PU_MAN', 'Purchasing Manager'),
('PU_CLERK', 'Purchasing Clerk'),
('ST_MAN', 'Stock Manager'),
('ST_CLERK', 'Stock Clerk');
