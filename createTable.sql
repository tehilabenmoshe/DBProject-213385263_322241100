CREATE TABLE Instructor
(
  Instructor_ID NUMERIC(9) NOT NULL,
  fname VARCHAR(15) NOT NULL,
  lname VARCHAR(15) NOT NULL,
  phone NUMERIC(10) NOT NULL,
  qualification VARCHAR(20) NOT NULL,
  email VARCHAR(25),
  PRIMARY KEY (Instructor_ID)
);

CREATE TABLE Participant
(
  Participant_ID NUMERIC(9) NOT NULL,
  fname VARCHAR(50) NOT NULL,
  lname VARCHAR(50) NOT NULL,
  address VARCHAR(50),
  email VARCHAR(50),
  age NUMERIC(3) NOT NULL,
  PRIMARY KEY (Participant_ID)
);

CREATE TABLE TCategory
(
  Category_location VARCHAR(90) NOT NULL,
  Category_name VARCHAR(90) NOT NULL,
  supervisor VARCHAR(50) NOT NULL,
  PRIMARY KEY (Category_name)
);

CREATE TABLE Course
(
  Course_ID NUMERIC(5) NOT NULL,
  Course_name VARCHAR(25) NOT NULL,
  Course_date DATE NOT NULL,
  Course_location VARCHAR(25) NOT NULL,
  price FLOAT NOT NULL,
  hours NUMERIC(3) NOT NULL,
  Instructor_ID NUMERIC(9) NOT NULL,
  PRIMARY KEY (Course_ID),
  FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE Tool
(
  weight FLOAT NOT NULL,
  Tool_name VARCHAR(55) NOT NULL,
  made_in VARCHAR(50) NOT NULL,
  color VARCHAR(15) NOT NULL,
  Category_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (Tool_name),
  FOREIGN KEY (Category_name) REFERENCES TCategory(Category_name)
);

CREATE TABLE Registration
(
  Registration_date DATE NOT NULL,
  Registration_time VARCHAR(5) NOT NULL,
  status VARCHAR(15) NOT NULL,
  Registration_ID NUMERIC(5) NOT NULL,
  Payment_method VARCHAR(15) NOT NULL,
  Participant_ID NUMERIC(9) NOT NULL,
  Course_ID NUMERIC(5) NOT NULL,
  PRIMARY KEY (Registration_ID),
  FOREIGN KEY (Participant_ID) REFERENCES Participant(Participant_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Course_tool
(
  Tool_name VARCHAR(35) NOT NULL,
  Course_ID NUMERIC(5) NOT NULL,
  PRIMARY KEY (Tool_name, Course_ID),
  FOREIGN KEY (Tool_name) REFERENCES Tool(Tool_name),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);
