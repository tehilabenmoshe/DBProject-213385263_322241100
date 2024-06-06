--1
--This query returns details about courses that have registrations within a 
--specified date range and are taught by instructors with qualification of 'nurse'
SELECT c.Course_ID, c.Course_name,i.fname, i.lname
FROM Course c
JOIN Instructor i ON c.Instructor_ID = i.Instructor_ID
WHERE c.Course_ID IN (
    SELECT Course_ID
    FROM Registration
    WHERE Registration_date BETWEEN &<name="start_date" type="date"> AND &<name="end_date" type="date">
)
AND i.qualification = 'nurse';



--2
--Participants Registered for Courses with a Price Above a Specific Amount
SELECT DISTINCT p.Participant_ID, p.fname, p.lname
FROM Participant p
JOIN Registration r ON p.Participant_ID = r.Participant_ID
JOIN Course c ON r.Course_ID = c.Course_ID
WHERE c.price > &<name="price" type="integer" hint="number from 100-6000">;

--3
--return detail on courses based on their location and the number of registrations
SELECT c.Course_name, c.Course_ID, COUNT(r.Registration_ID) AS RegistrationCount
FROM Course c
JOIN Registration r ON c.Course_ID = r.Course_ID
WHERE c.Course_location IN &<name="city" list="'Eilat', 'Petah-Tikva', 'Tel-Aviv', 'Lod', 'Jerusalem'" hint="pick a city from the list">
GROUP BY c.Course_name, c.Course_ID
HAVING COUNT(r.Registration_ID) = &<name="num_registrations" type="integer" hint="pick a number of registrations" required="true">;



--4
--returns tool details according made in country and color
SELECT t.Category_name, t.Tool_name, t.weight
FROM Tool t
WHERE t.color LIKE &<name="color" list="'%Grey%', '%Blue%', '%White%', '%Black%'" hint="pick a color from the list">
AND t.made_in LIKE &<name="city" list="'%USA%', '%China%', '%France%', '%Germany%'" hint="pick a country from the list">;






