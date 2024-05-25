
[General]
Version=1

[Preferences]
Username=
Password=2156
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=COURSE_TOOL
Count=600

[Record]
Name=TOOL_NAME
Type=VARCHAR2
Size=35
Data=List(Tool_name field from Tool)
Master=

[Record]
Name=COURSE_ID
Type=NUMBER
Size=5
Data=List(select Course_ID from Course)
Master=

