-- negetive price of course constaint
ALTER TABLE Course
ADD CONSTRAINT check_negPrice CHECK (price >= 0);

insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1213, 'second Aid for Poisoning', to_date('25-10-2024', 'dd-mm-yyyy'), 'Rishon LeZion', -2127, 22, 113361987);

-- defult birthDate constaint- check
ALTER TABLE Participant
MODIFY birth_date DEFAULT SYSDATE;

insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (419243268, 'Mab', 'Indgs', '187 Kinsman Center', 'jindgs0@google.co.uk', NULL);


-- null first name constaint
  ALTER TABLE Participant
  MODIFY email VARCHAR(50) NOT NULL

insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (496294540, 'Hanna', 'Blackr', '909 Daystar Poit', NULL, to_date('25-10-2024', 'dd-mm-yyyy'));




