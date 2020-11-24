declare

EMP_id number(10,0) :=90001 ;
new_dept_name varchar2(50) :='Engineering';
dept_name varchar2(50) :='Management';
Emp_salary Number(10,0);

begin

PK_EMPLOYEE_MAINTAIN.salary_inc(Emp_id);
PK_EMPLOYEE_MAINTAIN.Department_upd(Emp_id , NEW_Dept_name );
 Emp_salary := PK_EMPLOYEE_MAINTAIN.Emp_salary(Emp_id );
PK_EMPLOYEE_MAINTAIN.P_employee_report(dept_name );
PK_EMPLOYEE_MAINTAIN.P_employee_sal_report(dept_name);
exception
WHEN OTHERS THEN

  dbms_output.put_line('Backtrace => '||dbms_utility.format_error_backtrace);

  dbms_output.put_line('SQLCODE => '||SQLCODE);
end;
/
