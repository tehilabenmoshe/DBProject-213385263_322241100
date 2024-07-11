PL/SQL Developer Test script 3.0
49
DECLARE
  v_success      BOOLEAN := TRUE;    -- Flag to check if the procedure worked
  v_function_res NUMBER;             -- Variable to hold the function result
  v_error_message VARCHAR2(4000);    -- Variable to hold any error message

  -- Define a cursor to fetch tools in the destination course's warehouse
  CURSOR tool_cursor IS
    SELECT t.Tool_name, t.Category_name
    FROM Tool t
    JOIN Course_tool ct ON t.Tool_name = ct.Tool_name
    WHERE ct.Course_ID = :to_course_id;

  v_tool tool_cursor%ROWTYPE;        -- Variable to hold each fetched tool

BEGIN
  DBMS_OUTPUT.ENABLE(500000);

  -- Call the procedure to transfer participants
  TransferParticipants(from_course_id => :from_course_id, to_course_id => :to_course_id);
  DBMS_OUTPUT.PUT_LINE('Participants transferred successfully.');

  -- Open the cursor to fetch tools in the destination course's warehouse
  OPEN tool_cursor;

  LOOP
    -- Fetch the next tool
    FETCH tool_cursor INTO v_tool;
    EXIT WHEN tool_cursor%NOTFOUND;

    -- Call the function to calculate the tool's location value
    v_function_res := Calculate_Location_Value(p_category_location => v_tool.Category_name);

    -- Output the function result for each tool
    DBMS_OUTPUT.PUT_LINE('Tool: ' || v_tool.Tool_name || ', Category: ' || v_tool.Category_name || ', Location Value: ' || v_function_res);
  END LOOP;

  -- Close the cursor
  CLOSE tool_cursor;

  -- Commit the changes
  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    v_success := FALSE;
    v_error_message := SQLERRM;
    DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    ROLLBACK;
END;
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
-5
result
1
﻿639720.5778491171749598715890850722311396
-5
0
