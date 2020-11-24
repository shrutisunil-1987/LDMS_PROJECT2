-- 3.Create an appropriate executable database object to allow an Employee to be created

	
CREATE TRIGGER  EMPLOYEES_BIU1
    before insert or update  
    on employees 
    for each row 
begin 
    if (inserting and :new.Department_id Not IN (select Department_id from department) then 
---We can have any validation based on requiremnt to allow creation of new employee, here I am validating Department_id
      RAISE_APPLICATION_ERROR(-20000,'Department doesnot exists');
     
else if updating then 
insert into Employees_history ( 
        Employee_ID,Employee_name,Job_Title,Manger_id,date_hired,salary,department_id    )
 values ( 
        :old.Employee_ID,:old.Employee_name,:old.Job_Title,:old.Manger_id,:old.date_hired,:old.salary,:old.department_id    ); 
        
else if deleting then 
insert into Employees_history ( 
        Employee_ID,Employee_name,Job_Title,Manger_id,date_hired,salary,department_id    )
 values ( 
        :old.Employee_ID,:old.Employee_name,:old.Job_Title,:old.Manger_id,:old.date_hired,:old.salary,:old.department_id    ); 
end if;
end employees_biu1; 

/