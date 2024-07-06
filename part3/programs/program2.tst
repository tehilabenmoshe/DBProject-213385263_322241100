PL/SQL Developer Test script 3.0
21
declare
  v_success      BOOLEAN := TRUE; -- Flag to check if the procedure worked
  v_function_res NUMBER; -- Variable to hold the function result

begin
  
  v_function_res := calculate_location_value(p_category_location => :p_category_location);
    :result := v_function_res; -- Store the function result in a bind variable
    
    -- Output the function result
    DBMS_OUTPUT.PUT_LINE('Function Result: ' || v_function_res);



  transferParticipants(from_course_id => :from_course_id,
                         to_course_id => :to_course_id);     
                              
end;
                       
 
                       
5
from_course_id
1
﻿1018
5
to_course_id
1
﻿1356
5
ref_cur
0
-5
p_category_location
1
﻿Storage Room 1
5
result
1
﻿6421.994884910485933503836317135549872123
5
0
