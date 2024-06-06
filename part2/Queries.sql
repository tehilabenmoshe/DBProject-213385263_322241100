--select
--q1
SELECT p.fname, p.lname, COUNT(r.Course_ID) AS CourseCount
FROM Participant p
JOIN Registration r ON p.Participant_ID = r.Participant_ID
GROUP BY p.Participant_ID, p.fname, p.lname
HAVING COUNT(r.Course_ID) > 1;


--q2
SELECT i.fname, i.lname, COUNT(c.Course_ID) AS course_count
FROM Instructor i
JOIN Course c ON i.Instructor_ID = c.Instructor_ID
GROUP BY i.fname, i.lname
HAVING COUNT(c.Course_ID) = (
    SELECT MAX(course_count)
    FROM (
        SELECT COUNT(*) AS course_count
        FROM Course
        GROUP BY Instructor_ID
    ) temp
);


--q3
SELECT c.Course_name,
       AVG(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM p.birth_date)) AS avg_age
FROM Course c
JOIN Registration r ON c.Course_ID = r.Course_ID
JOIN Participant p ON r.Participant_ID = p.Participant_ID
WHERE r.Registration_date >= ADD_MONTHS(SYSDATE, -12)
GROUP BY c.Course_name
ORDER BY c.Course_name;


--q4
SELECT
  tc.Category_name,
  SUM(t.weight) AS total_category_weight,
  AVG(t.weight) AS avg_tool_weight_in_category,
  tc.Category_location
FROM
  Tool t
JOIN
  TCategory tc ON t.Category_name = tc.Category_name
GROUP BY
  tc.Category_name,
  tc.Category_location 
ORDER BY
  tc.Category_name;
  
  
  
 --update
 --q5
 --Update Registration Payment Method Based on Participant Age and Course Price
UPDATE Registration
SET Payment_method = 'bank transfer'
WHERE Participant_ID IN (
    SELECT Participant_ID
    FROM Participant
    WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM birth_date) > 60
) AND Course_ID IN (
    SELECT Course_ID
    FROM Course
    WHERE price > 2000
);

--q6
--increases by 10% if the course has more than 40 registrations generally (in all places)
UPDATE Course
SET price = price * 1.10
WHERE Course_name IN (
    SELECT Course_name
    FROM (
        SELECT c.Course_name, COUNT(r.Registration_ID) AS RegistrationCount
        FROM Course c
        INNER JOIN Registration r ON c.Course_ID = r.Course_ID
        GROUP BY c.Course_name
        HAVING COUNT(r.Registration_ID) > 40
    ) 
);




--delete
--q7
--Delete Courses with No Registrations,their location in 'EILAT', and Below Average Price

DELETE FROM Course_tool
WHERE Course_ID IN (
    SELECT c.Course_ID
    FROM Course c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Registration r
        WHERE r.Course_ID = c.Course_ID
    )
    AND c.Course_location = 'Eilat'
    AND c.price < (
        SELECT AVG(price)
        FROM Course
    )
);

-- Delete Courses with No Registrations, Located in 'Eilat', and Below Average Price
DELETE FROM Course
WHERE Course_ID NOT IN (
    SELECT DISTINCT Course_ID
    FROM Registration
)
AND Course_location = 'Eilat'
AND price < (
    SELECT AVG(price)
    FROM Course
);




--q8

BEGIN
    -- Delete registrations for the course 'First Aid for Heat Stroke' taught by instructors with qualifications of 'paramedic'
    DELETE FROM Registration
    WHERE Course_ID IN (
        SELECT Course_ID
        FROM Course
        WHERE Course_name = 'First Aid for Heat Stroke'
        AND Instructor_ID IN (
            SELECT Instructor_ID
            FROM Instructor
            WHERE qualification = 'paramedic'
        )
    );

    -- Delete course tools associated with the course 'First Aid for Heat Stroke' taught by instructors with qualifications of 'paramedic'
    DELETE FROM Course_tool
    WHERE Course_ID IN (
        SELECT Course_ID
        FROM Course
        WHERE Course_name = 'First Aid for Heat Stroke'
        AND Instructor_ID IN (
            SELECT Instructor_ID
            FROM Instructor
            WHERE qualification = 'paramedic'
        )
    );

    -- Delete courses 'First Aid for Heat Stroke' taught by instructors with qualifications of 'paramedic'
    DELETE FROM Course
    WHERE Course_name = 'First Aid for Heat Stroke'
    AND Instructor_ID IN (
        SELECT Instructor_ID
        FROM Instructor
        WHERE qualification = 'paramedic'
    );

    -- Delete instructors with qualifications of 'paramedic' who teach the course 'First Aid for Heat Stroke'
    DELETE FROM Instructor
    WHERE qualification = 'paramedic'
    AND Instructor_ID IN (
        SELECT Instructor_ID
        FROM Course
        WHERE Course_name = 'First Aid for Heat Stroke'
    );
    
    -- Delete participants who registered for the course 'First Aid for Heat Stroke' taught by instructors with qualifications of 'paramedic'
    DELETE FROM Participant
    WHERE Participant_ID IN (
        SELECT DISTINCT Participant_ID
        FROM Registration
        WHERE Course_ID IN (
            SELECT Course_ID
            FROM Course
            WHERE Course_name = 'First Aid for Heat Stroke'
            AND Instructor_ID IN (
                SELECT Instructor_ID
                FROM Instructor
                WHERE qualification = 'paramedic'
            )
        )
    );

    -- Commit the transaction
    COMMIT;
END;






