create or replace function ReturnInstractorSalary(instructorID in number) return number is
    Result NUMBER := 0;
    registrationCount INTEGER;
    CURSOR courseCursor IS 
        SELECT C.Course_ID, C.price
        FROM Course C
        WHERE C.Instructor_ID = instructorID;
    courseRecord courseCursor%ROWTYPE;
   
BEGIN
    -- Open the cursor
    OPEN courseCursor;

    -- Loop through each course taught by the instructor
    LOOP
        -- Fetch the next course
        FETCH courseCursor INTO courseRecord;
        EXIT WHEN courseCursor%NOTFOUND;
        
        -- Get the number of registrations for the current course
        BEGIN
            SELECT COUNT(*)
            INTO registrationCount
            FROM Registration R
            WHERE R.Course_ID = courseRecord.Course_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                registrationCount := 0;
        END;
        
        -- Calculate the salary contribution from the current course
        Result := Result + (registrationCount * courseRecord.price * 0.1);
    END LOOP;
    
    -- Close the cursor
    CLOSE courseCursor;
    
    -- Return the calculated salary
    RETURN Result;
END ReturnInstractorSalary;
/
