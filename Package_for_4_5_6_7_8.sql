create or replace package PK_EMPLOYEE_MAINTAIN as

procedure salary_inc(Emp_id IN NUMBER);
procedure Department_upd(Emp_id IN NUMBER, NEW_Dept_name IN VARCHAR2);
 Function Emp_salary(Emp_id IN NUMBER) return number;
Procedure P_employee_report(dept_name IN VARCHAR2);
Procedure P_employee_sal_report(dept_name IN VARCHAR2);

end;

/


create or replace package body "PK_EMPLOYEE_MAINTAIN" is

 --4.Create an appropriate executable database object to allow the Salary for an
---Employee to be increased or decreased by a percentage 

procedure salary_inc(Emp_id IN NUMBER) is
    Begin
    

        UPDATE employees
        SET    salary = salary + salary * (case 
        when salary < 15000 then 0.15
        else 0.10
        end)
        where employee_id=Emp_id;
        dbms_output.put_line('Employee salary updated with increased by 0.15 or .10');
                  
END salary_inc;


--5. Create an appropriate executable database object to allow the transfer of an
--Employee to a different Department
procedure Department_upd(Emp_id IN NUMBER,
new_dept_name IN VARCHAR2) is
    Begin
    

        UPDATE employees
        SET    department_id = (select department_id from department where trim(department_name) = new_dept_name)
        where employee_id=Emp_id;

          dbms_output.put_line('Employee transfered to new Department:='|| new_dept_name );
       
END Department_upd;

--6. Create an appropriate executable database object to return the Salary for an
--Employee.
 Function Emp_salary(Emp_id IN NUMBER)
 return number is
 Emp_salary NUMBER;
 Begin
 Select salary INTO EMP_salary from employees where employee_id=emp_id;
 dbms_output.put_line('Employee Salary:='|| EMP_salary || 'for Emp_id := '||Emp_id );
 return Emp_salary;
 EXCEPTION
 when no_data_found then
 dbms_output.put_line('emp_salary query returns no data'); 
end Emp_salary;

----7. Write a report to show all Employees for a Department

Procedure P_employee_report(dept_name IN VARCHAR2) is

  v_file  UTL_FILE.FILE_TYPE;
  v_string VARCHAR2(4000);

  CURSOR c_emp IS
        SELECT e.employee_id,e.Employee_name,d.department_name FROM employees e join department d
        on e.department_id=d.department_id
        where d.department_name=dept_name;
      
begin
--We have to create Report_directory on unix box and create .csv file where report can be written 
--else we can produce report through OBIEE or APEX tool

  v_file := UTL_FILE.FOPEN('Report_directory', 'all_Emp.csv', 'w');

      v_string := 'employee_id,Employee_name,department_name';
      UTL_FILE.put_line(v_file, v_string);
      FOR cur IN c_emp LOOP
        v_string := cur.employee_id || ',' || cur.Employee_name || ',' || cur.department_name;
        UTL_FILE.put_line(v_file, v_string);
      END LOOP;
      UTL_FILE.fclose(v_file);
       dbms_output.put_line('Report generated for all Employees for a Department');
    EXCEPTION
      WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
        IF UTL_FILE.is_open(v_file) THEN
          UTL_FILE.fclose(v_file);
        END IF;       
End P_employee_report ;

----8. Write a report to show the total of Employee Salary for a Department


Procedure P_employee_sal_report(dept_name IN VARCHAR2) is

  v_file  UTL_FILE.FILE_TYPE;
  v_string VARCHAR2(4000);
  v_department VARCHAR2(50);
  v_total number(10,0); 
      
begin
--We have to create Report_directory on unix box and create .csv file where report can be written 
--else we can produce report through OBIEE or APEX tool

  v_file := UTL_FILE.FOPEN('Report_directory', 'total_Emp_salary.csv', 'w');

      v_string := 'Department, Total_of_Employee_salary';
      UTL_FILE.put_line(v_file, v_string);
     
        SELECT d.department_name,sum(e.salary) total INTO v_department,v_total  FROM employees e join department d
        on e.department_id=d.department_id
        where d.department_name=dept_name
        group by d.department_name;
        v_string := v_department|| ',' || v_total ;
        UTL_FILE.put_line(v_file, v_string);
            UTL_FILE.fclose(v_file);
             dbms_output.put_line('total of Employee Salary for a Department');
    EXCEPTION
      WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
        IF UTL_FILE.is_open(v_file) THEN
          UTL_FILE.fclose(v_file);
        END IF;
        
End P_employee_sal_report ;



end "PK_EMPLOYEE_MAINTAIN";
/