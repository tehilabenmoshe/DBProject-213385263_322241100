CREATE OR REPLACE FUNCTION Calculate_Location_Value (p_category_location VARCHAR2)
RETURN NUMBER
IS
  -- Declare variables and types
  TYPE tool_rec IS RECORD (
    Tool_name Tool.Tool_name%TYPE,
    weight Tool.weight%TYPE
  );

  TYPE tool_cursor IS REF CURSOR;

  v_tool tool_rec;
  v_tool_cursor tool_cursor;
  
  v_total_weight FLOAT := 0;
  v_tool_count NUMBER := 0;
  v_category_count NUMBER := 0;
  v_avg_weight FLOAT := 0;
  v_location_value FLOAT := 0;

  -- Declare implicit cursor
  CURSOR category_cursor IS
    SELECT Category_name
    FROM TCategory
    WHERE Category_location = p_category_location;

BEGIN
  -- Get the number of categories in the location
  OPEN category_cursor;
  LOOP
    FETCH category_cursor INTO v_tool.Tool_name;
    EXIT WHEN category_cursor%NOTFOUND;
    v_category_count := v_category_count + 1;

    -- Explicit cursor to get tools for each category
    OPEN v_tool_cursor FOR
      SELECT Tool_name, weight
      FROM Tool
      WHERE Category_name = v_tool.Tool_name;

    LOOP
      FETCH v_tool_cursor INTO v_tool;
      EXIT WHEN v_tool_cursor%NOTFOUND;
      v_total_weight := v_total_weight + v_tool.weight;
      v_tool_count := v_tool_count + 1;
    END LOOP;

    CLOSE v_tool_cursor;
  END LOOP;
  
  CLOSE category_cursor;

  -- Calculate the average weight
  IF v_tool_count > 0 THEN
    v_avg_weight := v_total_weight / v_tool_count;
  ELSE
    v_avg_weight := 0;
  END IF;

  -- Calculate the location value
  IF v_avg_weight > 0 THEN
    v_location_value := (v_category_count * v_tool_count) / v_avg_weight;
  ELSE
    v_location_value := 0;
  END IF;

  -- Return the calculated location value
  RETURN v_location_value;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found for the given category location.');
    RETURN 0;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    RETURN 0;
END Calculate_Location_Value;
/
