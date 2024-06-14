
[General]
Version=1

[Preferences]
Username=
Password=2633
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=REGISTRATION
Count=500

[Record]
Name=REGISTRATION_DATE
Type=DATE
Size=
Data=Random(1/6//2024, 1/6/2025)
Master=

[Record]
Name=REGISTRATION_TIME
Type=VARCHAR2
Size=5
Data=List('8:00', '8:25', '8:30', '8:55', '9:00', '9:25', '9:30', '9:55', '10:00', '10:25', '10:30', '10:55', '11:00', '11:25', '11:30', '11:55', '12:00', '12:25', '12:30', '12:55', '13:00', '13:25', '13:30', '13:55', '14:00', '14:25', '14:30', '14:55', '15:00', '15:25', '15:30', '15:55', '16:00', '16:25', '16:30', '16:55', '17:00', '17:25', '17:30', '17:55', '18:00', '18:25', '18:30', '18:55', '19:00', '19:25', '19:30', '19:55', '20:00', '20:25', '20:30', '20:55', '21:00', '21:25', '21:30', '21:55', '22:00')
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=15
Data=List('registered successfully', 'waiting for confirmation', 'registration failed')
Master=

[Record]
Name=REGISTRATION_ID
Type=NUMBER
Size=5
Data=Random(20000, 30000)
Master=

[Record]
Name=PAYMENT_METHOD
Type=VARCHAR2
Size=15
Data=List('credit', 'bank transfer', 'direct debit', 'bit')
Master=

[Record]
Name=PARTICIPANT_ID
Type=NUMBER
Size=9
Data=List(select Participant_ID from Participant)
Master=

[Record]
Name=COURSE_ID
Type=NUMBER
Size=5
Data=List(select Course_id from Course)
Master=

