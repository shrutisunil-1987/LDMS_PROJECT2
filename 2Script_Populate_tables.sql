-- 2.Populating data can be done by using SQL loader or TOAD or any ETL tool if the data is in file format, 
-- else we have to manually run 'Insert statemets' to insert each records from the paper

--Populating Department table
INSERT INTO Department( Department_Id, Department_Name,Location)
VALUES (1,'Management','London');
/
INSERT INTO Department( Department_Id, Department_Name,Location)
VALUES (2, 'Engineering ', 'Cardiff');
/
INSERT INTO Department( Department_Id, Department_Name,Location)
VALUES (3,'Research & Development','Edinburgh');
/
INSERT INTO Department( Department_Id, Department_Name,Location)
VALUES (4,'Sales ','Belfast');
/


--Populating Employees table

INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90001, 'John Smith', 'CEO',NULL, '01/01/95', 100000, 1);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90002 ,'Jimmy Willis', 'Manager', 90001, '23/09/03', 52500, 4);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90003, 'Roxy Jones', 'Salesperson', 90002, '11/02/17', 35000, 4);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90004, 'Selwyn Field', 'Salesperson', 90003, '20/05/15', 32000 ,4);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90005, 'David Hallett', 'Engineer', 90006, '17/04/18', 40000, 2);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90005, 'David Hallett', 'Engineer', 90006, '17/04/18', 40000, 2);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90006, 'Sarah Phelps', 'Manager', 90001, '21/03/15', 45000, 2);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90007, 'Louise Harper', 'Engineer', 90006, '01/01/13', 47000, 2);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90008, 'Tina Hart','Engineer', 90009, '28/07/14', 45000, 3);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90009, 'Gus Jones', 'Manager', 90001, '15/05/18', 50000, 3);
/
INSERT INTO Employees ( Employee_ID ,Employee_NAME,Job_Title,Manger_ID,Date_Hired, Salary, Department_Id)
VALUES (90010, 'Mildred Hall', 'Secretary', 90001,'12/10/96', 35000, 1);
/
commit;
/