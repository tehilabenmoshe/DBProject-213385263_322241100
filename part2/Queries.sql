--select
--q1
SELECT 
    p.fname AS ParticipantFirstName, 
    p.lname AS ParticipantLastName, 
    COUNT(r.Course_ID) AS CourseCount,
    c.Course_name AS CourseName
FROM 
    Participant p
JOIN 
    Registration r ON p.Participant_ID = r.Participant_ID
JOIN 
    Course c ON r.Course_ID = c.Course_ID
WHERE 
    p.birth_date BETWEEN TO_DATE('1995-01-01', 'YYYY-MM-DD') AND TO_DATE('2008-12-31', 'YYYY-MM-DD')
GROUP BY 
    p.Participant_ID, 
    p.fname, 
    p.lname, 
    c.Course_name
HAVING 
    COUNT(r.Course_ID) > 1;

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
SELECT 
    sub.Course_ID,
    sub.Course_name,
    AVG(sub.age) AS avg_age
FROM 
    (
        SELECT 
            c.Course_ID,
            c.Course_name,
            (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM p.birth_date)) AS age
        FROM 
            Course c
        JOIN 
            Registration r ON c.Course_ID = r.Course_ID
        JOIN 
            Participant p ON r.Participant_ID = p.Participant_ID
        WHERE 
            r.Registration_date >= ADD_MONTHS(SYSDATE, -12)
    ) sub
GROUP BY 
    sub.Course_ID,
    sub.Course_name
ORDER BY 
    sub.Course_name;


--q4
SELECT 
    sub.Category_name,
    SUM(sub.weight) AS total_category_weight,
    AVG(sub.weight) AS avg_tool_weight_in_category,
    sub.Category_location
FROM 
    (
        SELECT 
            t.weight,
            tc.Category_name,
            tc.Category_location
        FROM 
            Tool t
        JOIN 
            TCategory tc ON t.Category_name = tc.Category_name
    ) sub
GROUP BY 
    sub.Category_name,
    sub.Category_location
ORDER BY 
    sub.Category_name;
  
  
  
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
--delete the registration that has thouse instractor id's
DELETE
FROM Registration
WHERE Course_ID IN (
    SELECT Course_ID
    FROM Course
    WHERE Instructor_ID IN (118788123 ,115786240, 113110911, 112755599, 112935118, 100055088, 100383151, 100895004, 109213900)
)
AND Registration_date BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-31', 'YYYY-MM-DD');











