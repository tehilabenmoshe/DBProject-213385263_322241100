PL/SQL Developer Test script 3.0
41
DECLARE
    CURSOR instructorCursor IS 
        SELECT Instructor_ID
        FROM Instructor;
    i_instructorid Instructor.Instructor_ID%TYPE;
    i_bonus       NUMBER; -- Variable to hold the function result

BEGIN  
    DBMS_OUTPUT.ENABLE(500000);
    -- Open the cursor to iterate over each instructor
    OPEN instructorCursor;

    LOOP
        -- Fetch the next instructor
        FETCH instructorCursor INTO i_instructorid;
        EXIT WHEN instructorCursor%NOTFOUND;

        -- Call the function and store the result
        i_bonus := ReturnInstructorSalary(instructorid => i_instructorid);
        
        -- Check if the bonus is greater than 200
        IF i_bonus > 200 THEN
            -- Update the instructor's salary
            UPDATE Instructor
            SET instructor_salary = instructor_salary + i_bonus
            WHERE Instructor_ID = i_instructorid;

            -- Call the procedure
            InstructorSummary(instructorid => i_instructorid);

            -- Display the salary result with the instructor report
            DBMS_OUTPUT.PUT_LINE('Instructor ID: ' || i_instructorid || ' - Bonus Salary: ' || i_bonus);
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE instructorCursor;
    
    -- Commit the changes
    COMMIT;
END;
0
0
