CREATE OR REPLACE PROCEDURE InstructorSummary(InstructorID IN NUMBER) IS
  -- Cursor to fetch the courses taught by the instructor
  CURSOR courses_cur IS
    SELECT c.Course_ID, c.Course_name, c.Course_date
    FROM Course c
    WHERE c.Instructor_ID = InstructorID
    ORDER BY c.Course_date DESC;
  
  -- Variable to hold each fetched row from courses_cur
  course_record courses_cur%ROWTYPE;
  
  -- Variables to hold instructor details
  v_instructor_fname Instructor.fname%TYPE;
  v_instructor_lname Instructor.lname%TYPE;
  v_instructor_qualification Instructor.qualification%TYPE;
  
  -- Variable to check if instructor exists
  v_instructor_exists NUMBER := 0;
BEGIN
  -- Increase the buffer size to 1,000,000 bytes
  DBMS_OUTPUT.ENABLE(1000000);

  -- Fetch instructor's name and qualification
  SELECT fname, lname, qualification INTO v_instructor_fname, v_instructor_lname, v_instructor_qualification
  FROM Instructor
  WHERE Instructor_ID = InstructorID;

  -- Check if instructor exists
  SELECT COUNT(*)
  INTO v_instructor_exists
  FROM Instructor
  WHERE Instructor_ID = InstructorID;

  IF v_instructor_exists = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Instructor with ID ' || InstructorID || ' does not exist.');
    RETURN;
  END IF;

  -- Enhance qualification with "excellent"
  v_instructor_qualification := v_instructor_qualification || ' excellent';

  -- Update instructor's qualification in the database
  UPDATE Instructor
  SET qualification = v_instructor_qualification
  WHERE Instructor_ID = InstructorID;

  -- Commit the update
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('---------------------------------');
  DBMS_OUTPUT.PUT_LINE(' Instructor Summary');
  DBMS_OUTPUT.PUT_LINE('---------------------------------');
  DBMS_OUTPUT.PUT_LINE('Instructor: ' || v_instructor_fname || ' ' || v_instructor_lname);
  DBMS_OUTPUT.PUT_LINE('Qualification: ' || v_instructor_qualification);
  DBMS_OUTPUT.PUT_LINE('');

  -- Open the cursor for courses
  OPEN courses_cur;
  LOOP
    FETCH courses_cur INTO course_record;
    EXIT WHEN courses_cur%NOTFOUND;

    -- Print course details
    DBMS_OUTPUT.PUT_LINE('Course Name: ' || course_record.Course_name);
    DBMS_OUTPUT.PUT_LINE('Course Date: ' || TO_CHAR(course_record.Course_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Participants:');
    
    -- Cursor to fetch the participants for the current course
    FOR participant_record IN (
      SELECT p.fname, p.lname
      FROM Participant p
      JOIN Registration r ON r.Participant_ID = p.Participant_ID
      WHERE r.Course_ID = course_record.Course_ID
      ORDER BY p.lname, p.fname
    ) LOOP
      -- Print participant details
      DBMS_OUTPUT.PUT_LINE(' - ' || participant_record.fname || ' ' || participant_record.lname);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
  CLOSE courses_cur;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found for this Instructor ' || InstructorID);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END InstructorSummary;
/
