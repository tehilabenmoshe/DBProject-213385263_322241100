--##change participant table:


--remove unnessery colums
ALTER TABLE participant DROP COLUMN fname;
ALTER TABLE participant DROP COLUMN lname;
ALTER TABLE participant DROP COLUMN email;



-- Identify primary key constraint on the PARTICIPANT table --SYS_C007871
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'PARTICIPANT' AND constraint_type = 'P';

-- Identify foreign key constraints referencing the PARTICIPANT_ID column --SYS_C007880
SELECT constraint_name
FROM user_constraints
WHERE r_constraint_name = (
  SELECT constraint_name
  FROM user_constraints
  WHERE table_name = 'PARTICIPANT' AND constraint_type = 'P'
);

ALTER TABLE PARTICIPANT DROP CONSTRAINT SYS_C007871;
ALTER TABLE REGISTRATION DROP CONSTRAINT SYS_C007880;


--delete and create new primeryKey
ALTER TABLE participant DROP COLUMN participant_id;

ALTER TABLE PARTICIPANT
ADD PARTICIPANT_ID VARCHAR2(9);


---add valuse from PID:
MERGE INTO PARTICIPANT ins
USING (
  SELECT PID, ROW_NUMBER() OVER (ORDER BY NULL) AS RN
  FROM PERSON
  WHERE PID NOT IN (SELECT PARTICIPANT_ID FROM PARTICIPANT)
  AND ROWNUM <= (SELECT COUNT(*) FROM PARTICIPANT)
) per
ON (ins.ROWID = (
  SELECT rid
  FROM (
    SELECT ROWID AS rid, ROW_NUMBER() OVER (ORDER BY NULL) AS rn
    FROM PARTICIPANT
  )
  WHERE rn = per.RN
))
WHEN MATCHED THEN
  UPDATE SET ins.PARTICIPANT_ID = per.PID;
  
-- Check for duplicate INSTRUCTOR_ID values
SELECT PARTICIPANT_ID, COUNT(*)
FROM PARTICIPANT
GROUP BY PARTICIPANT_ID
HAVING COUNT(*) > 1;

DELETE FROM PARTICIPANT
WHERE ROWID NOT IN (
  SELECT MIN(ROWID)
  FROM PARTICIPANT
  GROUP BY PARTICIPANT_ID
);



-- Add primary key constraint
ALTER TABLE PARTICIPANT ADD CONSTRAINT PARTICIPANT_PK PRIMARY KEY (participant_id);
ALTER TABLE PARTICIPANT ADD CONSTRAINT PARTICIPANT_FK FOREIGN KEY (participant_id) REFERENCES PERSON (PID);


-- Re-add foreign key constraint to REGISTRATION table
ALTER TABLE REGISTRATION ADD CONSTRAINT REGISTRATION_PARTICIPANT_FK FOREIGN KEY (participant_id) REFERENCES PARTICIPANT (participant_id);




