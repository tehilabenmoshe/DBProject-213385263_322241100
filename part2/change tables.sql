-- Ensure the NOT NULL constraint is dropped if it exists
ALTER TABLE PARTICIPANT
MODIFY birth_date NULL;

-- Set the column values to NULL
UPDATE PARTICIPANT
SET birth_date = NULL;

-- Change the data type of the column (if needed)
ALTER TABLE PARTICIPANT
MODIFY birth_date DATE;

-- Update the column with random dates within the range 1954-2008
DECLARE
    min_date DATE := TO_DATE('1954-01-01', 'YYYY-MM-DD');
    max_date DATE := TO_DATE('2008-12-31', 'YYYY-MM-DD');
    date_range NUMBER := max_date - min_date;
    i NUMBER := 0;
    random_date DATE;
BEGIN
    FOR r IN (SELECT ROWID row_id FROM PARTICIPANT WHERE birth_date IS NULL) LOOP
        i := i + 1;
        -- Generate a random date within the range and truncate the time part
        random_date := TRUNC(min_date + ROUND(DBMS_RANDOM.VALUE(0, date_range)));
        UPDATE PARTICIPANT
        SET birth_date = random_date
        WHERE ROWID = r.row_id;
        IF i = 450 THEN
            EXIT;
        END IF;
    END LOOP;
    -- Commit the changes
    COMMIT;
END;
/

-- Verify the updates
SELECT birth_date, COUNT(*)
FROM PARTICIPANT
GROUP BY birth_date
ORDER BY birth_date;

-- Add the NOT NULL constraint back if needed
ALTER TABLE PARTICIPANT
MODIFY birth_date DATE NOT NULL;
