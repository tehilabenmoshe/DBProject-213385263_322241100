
[General]
Version=1

[Preferences]
Username=
Password=2513
Database=
DateFormat=
CommitCount=100
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=INSTRUCTOR
Count=420

[Record]
Name=INSTRUCTOR_ID
Type=NUMBER
Size=9
Data=Random(100000000, 120000000)
Master=

[Record]
Name=FNAME
Type=VARCHAR2
Size=15
Data=FirstName
Master=

[Record]
Name=LNAME
Type=VARCHAR2
Size=15
Data=LastName
Master=

[Record]
Name=PHONE
Type=NUMBER
Size=10
Data=Random(0582111111, 0583111111)
Master=

[Record]
Name=QUALIFICATION
Type=VARCHAR2
Size=20
Data=List('paramedic','nurse', 'intern')
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=25
Data=Email
Master=

