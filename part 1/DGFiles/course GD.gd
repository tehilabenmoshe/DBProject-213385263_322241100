
[General]
Version=1

[Preferences]
Username=
Password=2939
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=COURSE
Count=520

[Record]
Name=COURSE_ID
Type=NUMBER
Size=5
Data=Random(1000, 1500)
Master=

[Record]
Name=COURSE_NAME
Type=VARCHAR2
Size=25
Data=List('Basic First Aid', 'CPR', 'Advanced Cardiac Life Support', 'Pediatric Advanced Life Support', 'First Aid for Trauma Injuries', 'Wilderness First Aid', 'First Aid for Burns', 'First Aid for Choking', 'First Aid for Fractures and Sprains', 'First Aid for Heat Stroke and Heat Exhaustion', 'First Aid for Hypothermia', 'First Aid for Allergic Reactions', 'First Aid for Stroke', 'First Aid for Poisoning', 'First Aid for Animal Bites and Stings', 'Mental Health First Aid', 'Emergency Medical Technician Training', 'Disaster Response and Management', 'Tactical First Aid', 'Workplace First Aid and Safety'
=)
Master=

[Record]
Name=COURSE_DATE
Type=DATE
Size=
Data=Random(1/5/2024,1/5/2025)
Master=

[Record]
Name=COURSE_LOCATION
Type=VARCHAR2
Size=25
Data=List('Jerusalem', 'Tel Aviv', 'Haifa', 'Beersheva', 'Eilat', 'Netanya', 'Rishon LeZion', 'Petah-Tikva', 'Ashdod', 'Ashkelon', 'Tiberias', 'Herzliya', 'Modi'in', 'Nazareth', 'Rehovot', 'Holon', 'Bat Yam', 'Ramat Gan', 'Hadera', 'Lod'
=)
Master=

[Record]
Name=PRICE
Type=FLOAT
Size=22
Data=Random(350,5000)
Master=

[Record]
Name=HOURS
Type=NUMBER
Size=3
Data=Random(1, 30)
Master=

[Record]
Name=INSTRUCTOR_ID
Type=NUMBER
Size=9
Data=List(select Instructor_ID from Instructor)
Master=

