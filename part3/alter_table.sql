ALTER TABLE Instructor
ADD instructor_salary NUMERIC(7, 2);

BEGIN
  UPDATE Instructor
  SET instructor_salary = ROUND(2000 + (6000 - 2000) * DBMS_RANDOM.VALUE, 2);
  COMMIT;
END;
