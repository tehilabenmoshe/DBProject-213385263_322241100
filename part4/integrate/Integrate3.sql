--##change tool table:

ALTER TABLE TOOL
ADD donation_id NUMBER(10);


--insert into donation_id values from donation_id in donation tabels
BEGIN
  FOR rec IN (SELECT tool_name, ROW_NUMBER() OVER (ORDER BY tool_name) AS rn FROM TOOL) LOOP
    UPDATE TOOL
    SET donation_id = (
      SELECT donation_id 
      FROM (
        SELECT donation_id, ROW_NUMBER() OVER (ORDER BY donation_id) AS dn_rn 
        FROM DONATION
      ) d
      WHERE d.dn_rn = rec.rn
    )
    WHERE tool_name = rec.tool_name;
  END LOOP;
END;

--add foreign key
ALTER TABLE TOOL
ADD CONSTRAINT FK_TOOL_DONATION FOREIGN KEY (donation_id)
REFERENCES DONATION (donation_id);



