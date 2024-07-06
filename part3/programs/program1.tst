PL/SQL Developer Test script 3.0
18
DECLARE
  i_instructorid Instructor.Instructor_ID%TYPE := :instructorid; 
  i_salary       NUMBER; -- Variable to hold the function result

BEGIN
  -- Call the function and store the result
  i_salary := ReturnInstractorSalary(instructorid => i_instructorid);
    
  -- Store the function result in a bind variable if needed
  :result := i_salary;
  
  -- Call the procedure
  InstructorSummary(instructorid => i_instructorid);
  
    -- Display the salary result with the instructor report
  DBMS_OUTPUT.PUT_LINE('Instructor Salary: ' || i_salary);

END;
2
result
1
﻿2493
5
instructorid
1
﻿118793930
5
0
