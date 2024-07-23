-- view- provide summary of course information, instructor and category associated with each course.
CREATE VIEW CourseDetails AS
SELECT 
    c.Course_ID,
    c.Course_name,
    c.Course_date,
    c.Course_location,
    c.price,
    c.hours,
    i.fname AS Instructor_fname,
    i.lname AS Instructor_lname,
    t.Category_name,
    t.Category_location,
    t.supervisor
FROM 
    Course c
JOIN 
    Instructor i ON c.Instructor_ID = i.Instructor_ID
LEFT JOIN 
    Course_tool ct ON c.Course_ID = ct.Course_ID
LEFT JOIN 
    Tool tl ON ct.Tool_name = tl.Tool_name
LEFT JOIN 
    TCategory t ON tl.Category_name = t.Category_name;



-- query 2 that select all courses with price>100 taking place in lod
SELECT 
    Course_ID,
    Course_name,
    Course_date,
    Course_location,
    price,
    hours,
    Instructor_fname,
    Instructor_lname,
    Category_name,
    Category_location,
    supervisor
FROM 
    CourseDetails
WHERE 
    price > 100
    AND Course_location = 'Lod';

    
-- query 2- Find courses scheduled between '2024-01-01' and '2024-12-31'. 
SELECT 
    Course_ID,
    Course_name,
    Course_date,
    Course_location,
    price,
    hours,
    Instructor_fname,
    Instructor_lname,
    Category_name,
    Category_location,
    supervisor
FROM 
    CourseDetails
WHERE 
    Course_date BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-31', 'YYYY-MM-DD');

