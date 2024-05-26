prompt PL/SQL Developer import file
prompt Created on Sunday, May 26, 2024 by user
set feedback off
set define off
prompt Creating INSTRUCTOR...
create table INSTRUCTOR
(
  instructor_id NUMBER(9) not null,
  fname         VARCHAR2(15) not null,
  lname         VARCHAR2(15) not null,
  phone         NUMBER(10) not null,
  qualification VARCHAR2(20) not null,
  email         VARCHAR2(25)
)
;
alter table INSTRUCTOR
  add primary key (INSTRUCTOR_ID)
;

prompt Creating COURSE...
create table COURSE
(
  course_id       NUMBER(5) not null,
  course_name     VARCHAR2(25) not null,
  course_date     DATE not null,
  course_location VARCHAR2(25) not null,
  price           FLOAT not null,
  hours           NUMBER(3) not null,
  instructor_id   NUMBER(9) not null
)
;
alter table COURSE
  add primary key (COURSE_ID)
;
alter table COURSE
  add foreign key (INSTRUCTOR_ID)
  references INSTRUCTOR (INSTRUCTOR_ID);

prompt Creating COURSE_TOOL...
create table COURSE_TOOL
(
  tool_name VARCHAR2(35) not null,
  course_id NUMBER(5) not null
)
;
alter table COURSE_TOOL
  add primary key (TOOL_NAME, COURSE_ID)
;
alter table COURSE_TOOL
  add foreign key (COURSE_ID)
  references COURSE (COURSE_ID);

prompt Creating PARTICIPANT...
create table PARTICIPANT
(
  participant_id NUMBER(9) not null,
  fname          VARCHAR2(50) not null,
  lname          VARCHAR2(50) not null,
  address        VARCHAR2(50),
  email          VARCHAR2(50),
  age            NUMBER(3) not null
)
;
alter table PARTICIPANT
  add primary key (PARTICIPANT_ID)
;

prompt Creating REGISTRATION...
create table REGISTRATION
(
  registration_date DATE not null,
  registration_time VARCHAR2(5) not null,
  status            VARCHAR2(15) not null,
  registration_id   NUMBER(5) not null,
  payment_method    VARCHAR2(15) not null,
  participant_id    NUMBER(9) not null,
  course_id         NUMBER(5) not null
)
;
alter table REGISTRATION
  add primary key (REGISTRATION_ID)
;
alter table REGISTRATION
  add foreign key (PARTICIPANT_ID)
  references PARTICIPANT (PARTICIPANT_ID);
alter table REGISTRATION
  add foreign key (COURSE_ID)
  references COURSE (COURSE_ID);

prompt Creating TCATEGORY...
create table TCATEGORY
(
  category_location VARCHAR2(90) not null,
  category_name     VARCHAR2(90) not null,
  supervisor        VARCHAR2(50) not null
)
;
alter table TCATEGORY
  add primary key (CATEGORY_NAME)
;

prompt Creating TOOL...
create table TOOL
(
  weight        FLOAT not null,
  tool_name     VARCHAR2(55) not null,
  made_in       VARCHAR2(50) not null,
  color         VARCHAR2(15) not null,
  category_name VARCHAR2(50) not null
)
;
alter table TOOL
  add primary key (TOOL_NAME)
;
alter table TOOL
  add foreign key (CATEGORY_NAME)
  references TCATEGORY (CATEGORY_NAME);

prompt Disabling triggers for INSTRUCTOR...
alter table INSTRUCTOR disable all triggers;
prompt Disabling triggers for COURSE...
alter table COURSE disable all triggers;
prompt Disabling triggers for COURSE_TOOL...
alter table COURSE_TOOL disable all triggers;
prompt Disabling triggers for PARTICIPANT...
alter table PARTICIPANT disable all triggers;
prompt Disabling triggers for REGISTRATION...
alter table REGISTRATION disable all triggers;
prompt Disabling triggers for TCATEGORY...
alter table TCATEGORY disable all triggers;
prompt Disabling triggers for TOOL...
alter table TOOL disable all triggers;
prompt Disabling foreign key constraints for COURSE...
alter table COURSE disable constraint SYS_C007066;
prompt Disabling foreign key constraints for COURSE_TOOL...
alter table COURSE_TOOL disable constraint SYS_C007088;
prompt Disabling foreign key constraints for REGISTRATION...
alter table REGISTRATION disable constraint SYS_C007212;
alter table REGISTRATION disable constraint SYS_C007213;
prompt Disabling foreign key constraints for TOOL...
alter table TOOL disable constraint SYS_C007191;
prompt Deleting TOOL...
delete from TOOL;
commit;
prompt Deleting TCATEGORY...
delete from TCATEGORY;
commit;
prompt Deleting REGISTRATION...
delete from REGISTRATION;
commit;
prompt Deleting PARTICIPANT...
delete from PARTICIPANT;
commit;
prompt Deleting COURSE_TOOL...
delete from COURSE_TOOL;
commit;
prompt Deleting COURSE...
delete from COURSE;
commit;
prompt Deleting INSTRUCTOR...
delete from INSTRUCTOR;
commit;
prompt Loading INSTRUCTOR...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108049315, 'Karen', 'Bracco', 3466187906, 'nurse', 'k.bracco@progressivedesig');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117823824, 'Nick', 'McBride', 877745085, 'paramedic', 'nick.m@businessplus.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104149875, 'Rebecca', 'Travers', 3046484389, 'paramedic', 'rebecca.travers@integrate');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114656266, 'Davy', 'Guest', 980490296, 'intern', 'davy.guest@jlphor.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100343350, 'Brad', 'May', 1997321235, 'paramedic', 'brad.may@meritagetechnolo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114933226, 'Carrie', 'Burns', 4020844917, 'nurse', 'carrie.burns@perfectorder');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104106232, 'Alec', 'Raitt', 1841270120, 'paramedic', 'alec.raitt@monarchcasino.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113036956, 'Benicio', 'Danger', 2169627776, 'nurse', 'benicio@faef.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103021732, 'Millie', 'Watson', 2854618756, 'nurse', 'millie@johnson.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102782219, 'Radney', 'Cheadle', 3289405629, 'nurse', 'radney.cheadle@infovision');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109654101, 'Alfie', 'Thornton', 1299212690, 'paramedic', 'alfie.thornton@bedfordban');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111933914, 'Jonatha', 'Studi', 1763532145, 'intern', 'jonatha.studi@philipmorri');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103882372, 'Jackie', 'Shepard', 3224101114, 'nurse', 'j.shepard@gillette.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119836497, 'Kelly', 'Mandrell', 3897127563, 'intern', 'kelly.mandrell@refinery.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107183418, 'Elijah', 'Jeter', 3185882457, 'paramedic', 'elijah.jeter@techrx.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102309075, 'Stockard', 'Marin', 1857160159, 'intern', 'stockard.marin@fflcbancor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110246483, 'Geggy', 'Sawa', 3863365982, 'paramedic', 'geggy.sawa@generalmotors.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109907670, 'Clea', 'Danes', 3690508961, 'nurse', 'clea.danes@ctg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117492438, 'Tal', 'Watley', 3941853561, 'intern', 'tal.watley@ahl.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119388319, 'Rose', 'Ammons', 2251843086, 'nurse', 'rose.ammons@safeway.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103736607, 'Julie', 'Renfro', 1574556045, 'paramedic', 'julie.renfro@als.pl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112007758, 'Janeane', 'Blaine', 1709081044, 'paramedic', 'janeane.blaine@kimberlycl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102046184, 'Rutger', 'Cassidy', 1391569928, 'intern', 'rutger.cassidy@grs.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115756998, 'Nick', 'McGill', 823820513, 'intern', 'n.mcgill@jma.mx');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113473213, 'Rebecca', 'Fishburne', 3462664267, 'nurse', 'rebecca@vfs.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115163083, 'Aaron', 'Mattea', 1397046149, 'nurse', 'aaron.mattea@signature.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103546575, 'Lisa', 'Bragg', 4236038270, 'nurse', 'lbragg@ois.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103578545, 'Parker', 'Sainte-Marie', 2291841123, 'paramedic', 'parker.saintemarie@aventi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109706774, 'Sharon', 'Spiner', 772830990, 'paramedic', 's.spiner@trusecure.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117834198, 'Katrin', 'Platt', 1004182076, 'nurse', 'k.platt@magnet.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106598100, 'Oro', 'Hawn', 2059209610, 'nurse', 'oroh@mss.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104622884, 'Kurt', 'Branagh', 3594987309, 'paramedic', 'kurt.branagh@adeasolution');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108539599, 'Millie', 'Dench', 3410209115, 'paramedic', 'millie.d@bayer.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102132243, 'Mac', 'Garza', 1034798302, 'paramedic', 'mac@inzone.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106097856, 'Delroy', 'Baker', 4117671356, 'nurse', 'dbaker@merck.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106822681, 'Jackie', 'Hurley', 2010169153, 'intern', 'jackie.hurley@americanvan');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117854594, 'Chi', 'Rippy', 2628483613, 'paramedic', 'chi.rippy@kingland.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116708420, 'Bobbi', 'Lerner', 1432963150, 'nurse', 'bobbi@refinery.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107106288, 'Vendetta', 'Lunch', 3024939012, 'intern', 'vendetta.lunch@perfectord');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105839019, 'Lea', 'McAnally', 4111099256, 'intern', 'lea.m@pearllawgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114404684, 'Shelby', 'Winger', 3459843216, 'intern', 'shelby.winger@yumbrands.i');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111411219, 'Sinead', 'Crowe', 1170407992, 'paramedic', 'sinead.crowe@alternativet');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103708497, 'Night', 'Kweller', 3336374824, 'paramedic', 'night.kweller@thinktanksy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119624859, 'Donald', 'Willard', 4209642645, 'intern', 'dwillard@hfg.cy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105632087, 'Regina', 'Parker', 1068777652, 'paramedic', 'regina.parker@abs.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106866720, 'Nina', 'Loveless', 4072572022, 'intern', 'nina.loveless@mse.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107393092, 'Holland', 'Atkinson', 1050496912, 'intern', 'hatkinson@computersource.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100038915, 'Garth', 'Dunn', 1976718387, 'nurse', 'garth@generalmotors.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119636794, 'Lily', 'Lerner', 2694190943, 'paramedic', 'l.lerner@savela.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117574258, 'Isaac', 'Soul', 3636088024, 'nurse', 'isaac.s@allegiantbancorp.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102508395, 'Leonardo', 'Armstrong', 2675727220, 'intern', 'l.armstrong@sci.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100019713, 'Wayne', 'Shaw', 2042421581, 'intern', 'wayne.shaw@hospitalsoluti');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110634057, 'Joaquin', 'Portman', 3541007542, 'paramedic', 'joaquin@magnet.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104242622, 'Joe', 'Benoit', 2197280103, 'nurse', 'joe.benoit@trekequipment.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106611302, 'Keanu', 'Luongo', 1586611686, 'nurse', 'keanu.luongo@stmaryland.u');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112452297, 'Steven', 'Farris', 4067931758, 'intern', 'steven@providentbancorp.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116796382, 'Mekhi', 'Chappelle', 2067569656, 'paramedic', 'mekhi.chappelle@fmb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119667826, 'Larry', 'Peniston', 3901134238, 'intern', 'larry.peniston@gbas.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119363040, 'Davy', 'Zevon', 588348508, 'paramedic', 'davy.zevon@ssci.id');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102796498, 'Gene', 'Kurtz', 2115188208, 'intern', 'gene.k@universalsolutions');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113629944, 'Derek', 'Hawke', 3419012972, 'paramedic', 'dhawke@ssi.mx');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103880899, 'Vince', 'Wayans', 2030112323, 'intern', 'vincew@horizonorganic.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100538033, 'Forest', 'Senior', 1017951513, 'paramedic', 'forest@glaxosmithkline.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107576507, 'First', 'Avital', 51779773, 'nurse', 'first.avital@gulfmarkoffs');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118263400, 'Jean-Claude', 'Mraz', 1700814071, 'nurse', 'jeanclaude.mraz@actechnol');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117175878, 'Gloria', 'urban', 1052047715, 'paramedic', 'gloria.urban@ogi.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100758904, 'Nastassja', 'Humphrey', 1283898960, 'nurse', 'nastassja.humphrey@dancor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115459598, 'Elvis', 'Austin', 852593258, 'intern', 'e.austin@palmbeachtan.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103520108, 'Chet', 'Gellar', 1035460459, 'paramedic', 'c.gellar@glaxosmithkline.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110138277, 'Liv', 'Napolitano', 1840515732, 'intern', 'livn@democracydata.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100014699, 'Denny', 'MacPherson', 3177769045, 'nurse', 'd.macpherson@apexsystems.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101548029, 'Temuera', 'Randal', 4255784903, 'intern', 'temuera.r@keith.cn');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101356133, 'Gwyneth', 'Davies', 1889697624, 'intern', 'gwyneth.davies@ccb.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105333461, 'Darren', 'Visnjic', 3485900681, 'intern', 'darren.visnjic@mms.ge');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113102407, 'David', 'Yankovic', 3920109402, 'nurse', 'david.yankovic@mls.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105947069, 'Tara', 'Beck', 2990658460, 'intern', 'tara.beck@gillani.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108247075, 'Gil', 'Short', 588933320, 'paramedic', 'gil.short@ataservices.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109433442, 'Kid', 'Palminteri', 3264047458, 'intern', 'kid.palminteri@jewettcame');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114978277, 'Juan', 'Cheadle', 1931883329, 'paramedic', 'juan.cheadle@investorstit');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111388843, 'Kieran', 'Broderick', 593936676, 'paramedic', 'kieran.broderick@paintedw');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112825046, 'Scarlett', 'Byrd', 2859526697, 'nurse', 's.byrd@pds.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102011045, 'Miguel', 'Elwes', 1629871605, 'nurse', 'miguel.elwes@shot.is');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113166970, 'Melba', 'Barrymore', 4181148283, 'nurse', 'm.barrymore@fam.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100371881, 'Joaquim', 'Negbaur', 740167219, 'nurse', 'joaquim.negbaur@lydiantru');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117869022, 'Arturo', 'Snow', 3203256663, 'intern', 'arturo.snow@ppr.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106996201, 'Melba', 'Boothe', 1977906028, 'intern', 'melba.boothe@operationalt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106312841, 'Kelly', 'Perez', 4134650303, 'paramedic', 'kelly.perez@accesssystems');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119772654, 'Mary-Louise', 'Sweet', 2732808746, 'intern', 'marylouise.s@gcd.hu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112876738, 'Kathy', 'Foster', 4154657374, 'nurse', 'kfoster@nbs.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105058576, 'Jason', 'Hector', 935338869, 'intern', 'jasonh@progressivemedical');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119607152, 'Henry', 'Belle', 1195894475, 'paramedic', 'henry.belle@aco.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105826355, 'Celia', 'Landau', 1628407025, 'nurse', 'celia.landau@ungertechnol');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102331353, 'David', 'McPherson', 1527944706, 'intern', 'david.mcpherson@lemproduc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104105774, 'Coley', 'Tankard', 2728678178, 'nurse', 'coley@trinityhomecare.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102570673, 'Harrison', 'Ramirez', 2752924246, 'paramedic', 'h.ramirez@americanvanguar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106319543, 'Max', 'Foley', 928940232, 'nurse', 'mfoley@faef.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117016563, 'Glen', 'Crowe', 3875462826, 'paramedic', 'glen.crowe@clorox.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113990510, 'Naomi', 'Marley', 3472621065, 'nurse', 'naomi@cardtronics.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101651930, 'Joan', 'Madonna', 2016326887, 'paramedic', 'joan.madonna@travizon.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111729881, 'Spike', 'Joli', 1121579567, 'nurse', 'spike@innovativelighting.');
commit;
prompt 100 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103323205, 'Daryle', 'Levine', 1209703291, 'paramedic', 'daryle.levine@manhattanas');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106528871, 'Ricardo', 'Jenkins', 3632185068, 'paramedic', 'ricardoj@fflcbancorp.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113051511, 'Andrew', 'Singh', 1088602383, 'nurse', 'asingh@democracydata.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103993064, 'Olympia', 'LaMond', 2314312318, 'intern', 'olympia.l@banfeproducts.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101587403, 'Thora', 'Rio', 2083044375, 'intern', 'trio@kitba.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109439766, 'Nicolas', 'Jamal', 929401453, 'intern', 'nicolasj@employerservices');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105653612, 'Franco', 'Travolta', 1435961046, 'paramedic', 'franco@circuitcitystores.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102939939, 'Sal', 'Finney', 2051111795, 'paramedic', 'sal.finney@hitechpharmaca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100081307, 'Harrison', 'Santana', 1395255463, 'nurse', 'hsantana@shar.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109145974, 'Gabriel', 'Bullock', 2420973892, 'paramedic', 'gabriel.bullock@tarragonr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116099038, 'Sona', 'Macy', 6528774, 'paramedic', 's.macy@accucode.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113465310, 'Barry', 'Elizabeth', 890477241, 'paramedic', 'barry.elizabeth@stonebrew');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110004802, 'Jon', 'Wolf', 1296409765, 'paramedic', 'jon.wolf@wav.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101968595, 'Millie', 'Biel', 3113725937, 'intern', 'millie.biel@accucode.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111395532, 'Rawlins', 'Bugnon', 939772141, 'intern', 'rawlins.bugnon@cima.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107264606, 'Terence', 'Kelly', 1721695057, 'intern', 'terence.kelly@sis.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113929226, 'Toni', 'DeLuise', 2403740889, 'paramedic', 'toni.deluise@comglobalsys');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117368473, 'Andrea', 'Devine', 3255870648, 'nurse', 'andrea.d@lloydgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112395657, 'Jerry', 'Stewart', 678728305, 'intern', 'jerry.stewart@telepoint.u');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107384134, 'Oro', 'Haggard', 2798924409, 'paramedic', 'o.haggard@tps.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101927383, 'Leonardo', 'Schiavelli', 2535872479, 'intern', 'l.schiavelli@streetglow.i');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111211601, 'Mickey', 'Levy', 3761285847, 'paramedic', 'mickey.levy@seiaarons.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105236053, 'Horace', 'Matheson', 634629875, 'nurse', 'horace.m@coldstonecreamer');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117125199, 'Lena', 'Connery', 1289026385, 'paramedic', 'lena.connery@acsis.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105230589, 'Stockard', 'Begley', 3248836540, 'nurse', 'stockard.b@spas.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104741405, 'Jodie', 'Johnson', 937890885, 'paramedic', 'jodie@elite.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114601789, 'Viggo', 'Phifer', 3397944228, 'intern', 'viggop@nrae.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118321035, 'Brooke', 'DiFranco', 2802980281, 'nurse', 'brooke@verizon.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111978819, 'Greg', 'Arquette', 2220933614, 'paramedic', 'grega@providenceservice.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102820968, 'Dom', 'Bosco', 3043699260, 'paramedic', 'dom.b@sfb.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117180207, 'Chaka', 'Russo', 3352760810, 'nurse', 'chaka.russo@fmi.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100363647, 'Antonio', 'Barry', 2601805673, 'nurse', 'antonio@cmi.th');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117196334, 'Debra', 'Cetera', 2662263859, 'paramedic', 'debra.cetera@perfectorder');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108492902, 'Xander', 'Zane', 1499230855, 'nurse', 'xander.zane@granitesystem');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117081613, 'Alec', 'Zane', 1936297112, 'intern', 'alec.z@nuinfosystems.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117573976, 'Laurie', 'LaPaglia', 4068011526, 'nurse', 'laurie.lapaglia@mds.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105694785, 'Ceili', 'Dourif', 4059187734, 'paramedic', 'ceili.dourif@kis.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115736729, 'Gilbert', 'Winger', 2253431736, 'nurse', 'gilbert.winger@iss.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103099703, 'Bruce', 'Benson', 1784448781, 'paramedic', 'b.benson@fam.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102882297, 'Jena', 'Rickles', 2944265500, 'nurse', 'jrickles@carteretmortgage');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102821054, 'Elvis', 'De Almeida', 2348753591, 'nurse', 'elvis.dealmeida@lynksyste');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103332190, 'Robbie', 'Wagner', 1038850138, 'intern', 'robbie.wagner@dearbornban');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108604769, 'Mili', 'Oakenfold', 2420572338, 'intern', 'mili.o@spinnakerexplorati');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116194652, 'William', 'Macy', 2748663890, 'nurse', 'william.macy@bps.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104912327, 'Samantha', 'Fonda', 2534535507, 'paramedic', 'samantha.fonda@gsat.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103480044, 'Seth', 'Diesel', 4243587501, 'paramedic', 'seth.diesel@americanmegac');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102497240, 'Regina', 'Newton', 1457845744, 'intern', 'regina.newton@generalmoto');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102988324, 'Don', 'Coward', 3065641611, 'paramedic', 'don.coward@comglobalsyste');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117190415, 'Jesus', 'Richardson', 1007763484, 'intern', 'jesusr@coldstonecreamery.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103691531, 'Jim', 'Leoni', 2831445231, 'nurse', 'jim.leoni@fpf.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107226644, 'Praga', 'Costner', 4121437570, 'paramedic', 'p.costner@paisley.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115314248, 'Merrilee', 'Almond', 1221210281, 'intern', 'merrileea@creditorsinterc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101551581, 'Albert', 'Holm', 3534390685, 'paramedic', 'albert.holm@bps.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100960933, 'Davey', 'Caine', 3247493958, 'paramedic', 'davey.caine@berkshirehath');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112186397, 'Donald', 'Kapanka', 2705963324, 'intern', 'donald.kapanka@diversitec');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104192894, 'Buddy', 'McKennitt', 2574906216, 'nurse', 'buddy.m@americanmegacom.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117939976, 'Mae', 'Buckingham', 3694460958, 'paramedic', 'mae.buckingham@profitline');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114776582, 'Cary', 'Pesci', 3690577385, 'nurse', 'cpesci@parksite.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110849263, 'Trace', 'Hawn', 3621970968, 'paramedic', 'trace.hawn@progressivemed');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112172553, 'Sissy', 'Hagerty', 3330677325, 'paramedic', 's.hagerty@saltgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105783029, 'Spencer', 'Field', 1328771565, 'nurse', 'spencer.field@signature.f');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100740454, 'Burt', 'Loring', 3478917100, 'nurse', 'burt.loring@medamicus.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102277951, 'Forest', 'Harry', 3383210741, 'nurse', 'forest.harry@tripwire.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106985727, 'Thin', 'Mahood', 3129442375, 'intern', 'thin.mahood@trx.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106400150, 'Bret', 'Blige', 3292066703, 'paramedic', 'bret.blige@biosite.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113090087, 'Courtney', 'Reid', 3777766250, 'nurse', 'courtney.r@usainstruments');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114697139, 'Carrie', 'Barkin', 1383098462, 'nurse', 'carrie.barkin@portosan.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112010714, 'Vonda', 'McDonnell', 1623288595, 'paramedic', 'vonda.mcdonnell@trc.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107941638, 'Glen', 'Byrne', 2891915708, 'nurse', 'glen@linacsystems.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117180581, 'Trini', 'Napolitano', 683720567, 'nurse', 't.napolitano@solutionbuil');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119745677, 'Kenny', 'Robinson', 1645865068, 'nurse', 'kenny.robinson@mercantile');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115599310, 'Mira', 'Colton', 870193089, 'intern', 'm.colton@meridiangold.in');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116145565, 'Shannyn', 'Bancroft', 1383094261, 'nurse', 'shannyn.bancroft@epamsyst');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118006851, 'Cliff', 'Caan', 2644949914, 'nurse', 'ccaan@dell.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119218271, 'Ronny', 'DiFranco', 4279957374, 'nurse', 'ronny.difranco@ptg.cy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103216703, 'Lucy', 'Romijn-Stamos', 3990176125, 'nurse', 'lucyr@pis.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101784866, 'Bret', 'Biehn', 699191075, 'nurse', 'bret@socketinternet.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109190593, 'Andre', 'Gershon', 4145759163, 'intern', 'andre.gershon@denaliventu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118834160, 'Rob', 'Rifkin', 4108663874, 'intern', 'rob.rifkin@hudsonriverban');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103122134, 'Andre', 'Shalhoub', 2418801391, 'paramedic', 'andre.shalhoub@savela.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110846222, 'Hugo', 'Deejay', 1726544317, 'intern', 'hugod@fetchlogistics.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115723313, 'Lee', 'Weiland', 981007159, 'intern', 'leew@timberlanewoodcrafte');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105255589, 'Vienna', 'Penn', 3556395867, 'nurse', 'vienna.penn@johnkeeler.hu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107891821, 'Frederic', 'Balk', 1485101810, 'nurse', 'fbalk@capitalbank.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112198282, 'Praga', 'Branagh', 3586714738, 'nurse', 'praga.branagh@kiamotors.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117164061, 'Lucinda', 'Russo', 3770590284, 'intern', 'lucinda.russo@qls.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108705272, 'Johnny', 'Leachman', 1462965650, 'intern', 'johnny.l@toyotamotor.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119642894, 'Vienna', 'Gertner', 4088856552, 'nurse', 'vienna@balchem.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110257579, 'Julie', 'Jay', 2975765182, 'intern', 'julie.jay@hersheyfoods.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112081558, 'Praga', 'McFadden', 1834562082, 'nurse', 'praga@hps.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101762693, 'Sara', 'Sorvino', 627492482, 'paramedic', 'sara.sorvino@wav.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116219172, 'Gena', 'Martinez', 1787531035, 'nurse', 'gmartinez@slt.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102386849, 'Buffy', 'Rea', 880978204, 'intern', 'brea@midwestmedia.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102551697, 'Loreena', 'Shocked', 4019978090, 'paramedic', 'loreena.s@alternativetech');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115929720, 'Dermot', 'Elliott', 779582358, 'paramedic', 'dermote@trinityhomecare.n');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110357126, 'Javon', 'Steiger', 3155438121, 'paramedic', 'javon.steiger@aoe.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112323306, 'Nick', 'Gibson', 2895299724, 'nurse', 'nick.gibson@northhighland');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114030454, 'Solomon', 'Hauer', 4292292765, 'nurse', 'solomon.hauer@capitalauto');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108912101, 'Machine', 'Rickles', 653011414, 'intern', 'machiner@prp.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106861470, 'Gordon', 'El-Saher', 4285996684, 'intern', 'gordon@heritagemicrofilm.');
commit;
prompt 200 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106431039, 'Lily', 'Kirshner', 56249319, 'intern', 'lily.kirshner@wlt.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118984917, 'Melanie', 'Zappacosta', 1271482931, 'intern', 'melanie.zappacosta@unicru');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106384931, 'Franz', 'Duke', 2483238264, 'nurse', 'franz.duke@qls.fi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116163720, 'Vondie', 'Dolenz', 748942319, 'nurse', 'v.dolenz@angieslist.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107980308, 'Juice', 'Tyler', 1203031018, 'intern', 'juice.tyler@jma.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106484702, 'Willem', 'McFerrin', 2487388300, 'nurse', 'willem.m@elitemedical.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114184369, 'Robbie', 'Moreno', 4211238351, 'intern', 'robbie.m@learningvoyage.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116847943, 'Cuba', 'Griffith', 1558040898, 'paramedic', 'cuba.griffith@unicru.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100701753, 'Joaquim', 'McCormack', 3344539766, 'nurse', 'joaquim@ams.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119317889, 'King', 'Anderson', 3024249126, 'intern', 'king@tastefullysimple.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110256188, 'Jonny Lee', 'Pearce', 1643992472, 'paramedic', 'jonnylee.p@cendant.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105068364, 'Mel', 'Curtis-Hall', 1250409086, 'nurse', 'mcurtishall@taycorfinanci');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119937425, 'Zooey', 'Hedaya', 792757490, 'nurse', 'zooey@bayer.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103292247, 'Seann', 'Owen', 4126040210, 'intern', 'seann.owen@americanpan.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106636834, 'Lari', 'Reeves', 3185325794, 'intern', 'lari@columbiabancorp.is');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101670384, 'Timothy', 'Mason', 1900955948, 'paramedic', 'timothym@mss.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112000299, 'Ned', 'Janssen', 3281917955, 'nurse', 'ned.janssen@ungertechnolo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114648273, 'Tcheky', 'Butler', 1023229693, 'nurse', 'tchekyb@bat.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117798296, 'Amanda', 'Fogerty', 3235365991, 'intern', 'amanda.f@signature.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107491891, 'Tea', 'Farris', 3324806396, 'paramedic', 'tfarris@jlphor.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115413102, 'Patrick', 'Waits', 4163408524, 'intern', 'patrick.waits@vesta.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112755599, 'Heath', 'McIntyre', 1856521126, 'paramedic', 'h.mcintyre@securitycheck.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110501863, 'Jessica', 'Spiner', 1037497319, 'intern', 'jessica.spiner@tlsservice');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110661834, 'Desmond', 'Nivola', 3769047256, 'nurse', 'desmond.nivola@perfectord');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112777400, 'Anjelica', 'Guzman', 3861875445, 'nurse', 'anjelica.guzman@sbc.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113822780, 'Bridget', 'Holly', 3821928521, 'nurse', 'b.holly@spinnakerexplorat');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109304114, 'Junior', 'Krieger', 15131930, 'nurse', 'juniork@worldcom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110290929, 'Dave', 'Nelligan', 3535011734, 'nurse', 'dave.nelligan@cardtronics');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110584375, 'Hilton', 'Jones', 3852831845, 'intern', 'hilton.jones@questarcapit');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102188854, 'Lynette', 'Vaughan', 1212619455, 'intern', 'lynette.vaughan@ccb.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106989741, 'Earl', 'Avital', 1313178937, 'paramedic', 'earl.avital@elitemedical.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119264764, 'Gary', 'Turturro', 2500066458, 'intern', 'gary.turturro@globalwirel');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107536008, 'Aida', 'Dayne', 1089566292, 'nurse', 'aida.dayne@zoneperfectnut');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101236123, 'Todd', 'Parm', 1310270698, 'nurse', 'toddp@spotfireholdings.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107674200, 'Kim', 'Nielsen', 2755219694, 'intern', 'k.nielsen@gltg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102175421, 'Robert', 'Eldard', 4245116602, 'paramedic', 'r.eldard@generalmotors.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118438567, 'Barbara', 'Hutton', 2867513623, 'paramedic', 'b.hutton@navigatorsystems');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111079043, 'Rich', 'Doucette', 1270885946, 'intern', 'rich.d@kiamotors.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110300436, 'Coley', 'Mifune', 1017197364, 'nurse', 'coley.mifune@unitedasset.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108572512, 'Frank', 'Slater', 2931251897, 'intern', 'frank.slater@ezecastlesof');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104407168, 'Herbie', 'Richards', 3069560701, 'intern', 'herbier@floorgraphics.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108535877, 'Radney', 'Martinez', 23939465, 'intern', 'radney.m@procurementcentr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104879756, 'Rosco', 'Holiday', 1300803482, 'nurse', 'r.holiday@qas.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100897766, 'Goran', 'Randal', 917360575, 'intern', 'goranr@peerlessmanufactur');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119688956, 'Martha', 'Lapointe', 4113902681, 'intern', 'm.lapointe@onesourceprint');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101310701, 'Allan', 'Meyer', 3604971727, 'paramedic', 'allan.meyer@scjohnson.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112015855, 'Reese', 'Soul', 2871126462, 'nurse', 'reese.soul@marriottintern');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119030380, 'Sheena', 'Bergen', 2553385016, 'paramedic', 'sheena@ceb.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109394961, 'Colleen', 'Morales', 1145488970, 'paramedic', 'colleen.morales@safehomes');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103307588, 'Brian', 'Jeter', 4103848433, 'paramedic', 'brian.jeter@sps.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114468659, 'Thora', 'Belushi', 734100942, 'paramedic', 'thora.belushi@unit.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108247434, 'Cyndi', 'Collins', 1907160433, 'paramedic', 'cyndic@tilia.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103088177, 'Horace', 'Carrere', 4027210256, 'paramedic', 'horacec@execuscribe.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117785463, 'Juice', 'Stuermer', 1128882030, 'intern', 'juice.stuermer@sds.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107052029, 'Luis', 'Burmester', 2452402973, 'paramedic', 'luis.burmester@ass.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106832646, 'Irene', 'Ryan', 2904237378, 'intern', 'i.ryan@americanland.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110083483, 'Benjamin', 'Moriarty', 2342644911, 'paramedic', 'benjamin.moriarty@nsd.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103459303, 'Ronnie', 'Rourke', 3707913194, 'paramedic', 'ronnie.rourke@accesssyste');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115792092, 'Danny', 'Orbit', 1693112809, 'intern', 'danny.o@scriptsave.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110165847, 'Tramaine', 'Devine', 2474017533, 'intern', 'tramaine.devine@tps.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113654254, 'Rip', 'Chinlund', 3288381954, 'intern', 'rip.chinlund@escalade.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103015829, 'Ashton', 'Wopat', 1922562227, 'intern', 'awopat@epamsystems.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117691188, 'Alex', 'Cummings', 1129327185, 'paramedic', 'alex.cummings@granitesyst');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110973533, 'Hilton', 'Kilmer', 1614772513, 'nurse', 'hkilmer@cardinalcartridge');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108460169, 'Lizzy', 'Deejay', 2150138004, 'nurse', 'lizzyd@trx.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103194408, 'Freddie', 'Manning', 956766306, 'nurse', 'f.manning@dvdt.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115302551, 'Garland', 'Blossoms', 3836807552, 'nurse', 'gblossoms@invisioncom.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110194140, 'Johnny', 'Sledge', 2785573119, 'intern', 'johnny.sledge@sht.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108931578, 'Merle', 'Bright', 1829677791, 'intern', 'merleb@componentgraphics.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102367909, 'Deborah', 'Crystal', 1940555463, 'intern', 'deborah.crystal@campbells');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104312031, 'Andie', 'Boothe', 2722980282, 'paramedic', 'andie.boothe@visionarysys');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115612905, 'Fionnula', 'Spacek', 1793953842, 'nurse', 'fionnula.spacek@aldensyst');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110380760, 'Brooke', 'Fiorentino', 997215619, 'paramedic', 'brookef@mercantilebank.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115809987, 'Burt', 'Craddock', 3779106609, 'paramedic', 'burt.craddock@usphysicalt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113205799, 'Wade', 'Lapointe', 3433902860, 'intern', 'wlapointe@enterprise.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116709864, 'Karen', 'Thurman', 807062390, 'intern', 'karen.t@nike.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102173273, 'Curtis', 'Easton', 28795814, 'paramedic', 'curtis.easton@gcd.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119644109, 'Jared', 'Vai', 2886231805, 'paramedic', 'j.vai@mattel.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108446603, 'Rita', 'McGinley', 1983110492, 'nurse', 'rita.mcginley@visionarysy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107244166, 'Ralph', 'Weaver', 2193369290, 'paramedic', 'ralph.weaver@talx.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108658601, 'Miki', 'Sedgwick', 1982449054, 'intern', 'miki.sedgwick@dbprofessio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106620348, 'Tcheky', 'Sayer', 620187855, 'intern', 'tsayer@hfg.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106119651, 'Laurie', 'Kretschmann', 3915193596, 'nurse', 'laurie.kretschmann@viacel');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111062537, 'Louise', 'Belushi', 2036907131, 'paramedic', 'lbelushi@infinity.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112733778, 'Clive', 'Wayans', 4202753949, 'paramedic', 'clive.wayans@toyotamotor.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100578052, 'Eric', 'Sweeney', 4130316382, 'nurse', 'eric.sweeney@boldtechsyst');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117407108, 'Tzi', 'Head', 818126965, 'intern', 'tzi.head@glaxosmithkline.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106769222, 'Delroy', 'Neeson', 2062988083, 'nurse', 'delroyn@saltgroup.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101242288, 'Kim', 'Brosnan', 2772370375, 'nurse', 'kim.brosnan@limitedbrands');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115143344, 'Daryl', 'Gibbons', 3597198396, 'intern', 'daryl.g@entelligence.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105148146, 'Vonda', 'Steagall', 807343727, 'intern', 'vonda.steagall@ceom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104160852, 'Rachel', 'Bright', 716849991, 'paramedic', 'rachel@marriottinternatio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119571129, 'Ramsey', 'Bugnon', 2127848864, 'nurse', 'ramsey.bugnon@pulaskifina');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113008361, 'Liam', 'Pitney', 3651700822, 'intern', 'l.pitney@sony.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101290951, 'Kieran', 'Underwood', 711422789, 'nurse', 'kieran.underwood@lms.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116745177, 'Luis', 'Mandrell', 3859906833, 'intern', 'luis.mandrell@solipsys.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101091673, 'Judy', 'Rhodes', 1461426524, 'nurse', 'jrhodes@nrae.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103558527, 'Mykelti', 'Magnuson', 3949589623, 'paramedic', 'm.magnuson@pscinfogroup.i');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113009577, 'Alicia', 'Fisher', 3059083540, 'intern', 'alicia@sm.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106245397, 'Curt', 'Watson', 1635152020, 'intern', 'cwatson@conquest.com');
commit;
prompt 300 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113699867, 'Regina', 'Wahlberg', 3136550532, 'paramedic', 'regina.w@voicelog.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106220224, 'Sammy', 'Culkin', 633899705, 'nurse', 's.culkin@idlabel.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103543404, 'Avril', 'Conlee', 3062003280, 'nurse', 'avrilc@alohanysystems.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101276739, 'Gord', 'Greene', 1678148202, 'intern', 'gord@waltdisney.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116211333, 'Chely', 'McFerrin', 2330007579, 'paramedic', 'chely.m@gbas.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113929901, 'Sinead', 'Martinez', 4038903493, 'nurse', 's.martinez@capstone.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101952352, 'Peabo', 'Irving', 3885239391, 'paramedic', 'peabo@flavorx.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115564551, 'Buddy', 'Thomson', 3662469884, 'paramedic', 'buddy.t@pharmafab.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109650439, 'Raul', 'Torino', 1904844320, 'paramedic', 'rtorino@diamondgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113279617, 'Ossie', 'Buckingham', 720729435, 'paramedic', 'ossie.buckingham@arkidata');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112337297, 'Joshua', 'Santana', 1604282954, 'nurse', 'joshua@cardtronics.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116081735, 'Chantי', 'Nash', 3417797145, 'nurse', 'chant.nash@yashtechnologi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113876987, 'Dan', 'Nugent', 4036355921, 'intern', 'dan.nugent@tlsservicebure');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115629372, 'Nils', 'Rock', 2466670895, 'paramedic', 'nils.rock@generalelectric');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106251470, 'Stephen', 'Saucedo', 2315812680, 'intern', 'stephen.saucedo@oriservic');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112790092, 'Michael', 'Morales', 2412953860, 'nurse', 'michael@thinktanksystems.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102151826, 'Daryl', 'Pantoliano', 936299165, 'nurse', 'daryl.pantoliano@mainstre');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114829938, 'Tea', 'Reubens', 723826522, 'nurse', 'tear@aoe.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114177667, 'Ann', 'Rizzo', 1315744469, 'nurse', 'ann.r@axis.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117240877, 'Liquid', 'Newman', 1805375338, 'intern', 'liquid.n@lms.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114189306, 'Merrilee', 'Herndon', 1418506455, 'nurse', 'merrilee.herndon@usenergy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100728991, 'Clint', 'Conway', 3980454393, 'intern', 'clint.conway@ads.pe');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115306231, 'Luke', 'Zeta-Jones', 1091922633, 'intern', 'luke@contract.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110773814, 'Franz', 'Haggard', 3871179895, 'intern', 'franz.haggard@providentba');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101172479, 'Russell', 'Iglesias', 950951951, 'paramedic', 'russell@volkswagen.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119425727, 'Daryl', 'Gore', 1414219453, 'intern', 'daryl@aristotle.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108380339, 'Maury', 'Finn', 1210729583, 'nurse', 'mfinn@ceom.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101488681, 'Mary-Louise', 'England', 2422454902, 'paramedic', 'marylouise@qls.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111552426, 'Jesus', 'Reilly', 2404474636, 'intern', 'jreilly@asa.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102160746, 'King', 'Overstreet', 3573763627, 'paramedic', 'king.o@jewettcameron.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111538464, 'Cyndi', 'Waits', 3421114558, 'nurse', 'cyndi.waits@kingland.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110447150, 'Isaiah', 'Streep', 1544646653, 'nurse', 'isaiahs@dataprise.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100665302, 'Mena', 'McDowell', 1018082286, 'nurse', 'mena.mcdowell@sandyspring');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108823981, 'Brittany', 'Magnuson', 1495996006, 'paramedic', 'brittany.m@vesta.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116449688, 'Marie', 'Redford', 2138671204, 'paramedic', 'mredford@tripwire.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116145057, 'Mae', 'Freeman', 3892529749, 'intern', 'mae@primussoftware.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107610435, 'Larry', 'Kier', 3248285310, 'paramedic', 'larry.kier@pragmatechsoft');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104631776, 'Betty', 'Howard', 2332350369, 'nurse', 'bhoward@dell.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109235983, 'Susan', 'Elizondo', 637026079, 'nurse', 'susan.elizondo@abatix.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117459711, 'Donna', 'King', 3007861346, 'paramedic', 'donna.king@ezecastlesoftw');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105621467, 'Wendy', 'Cruz', 756367027, 'paramedic', 'wendyc@glaxosmithkline.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106561948, 'Elias', 'Busey', 786766087, 'paramedic', 'elias@career.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114319145, 'Johnette', 'Butler', 1930112069, 'nurse', 'johnette.butler@evergreen');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101024000, 'Gord', 'Milsap', 2392141808, 'nurse', 'gord@mre.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104602507, 'Avril', 'Burrows', 2500287653, 'nurse', 'avril.b@diamondtechnologi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117990022, 'Chris', 'Kattan', 2195612170, 'paramedic', 'chris.kattan@gtp.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105516728, 'Rade', 'Beckham', 4162281373, 'nurse', 'rade.beckham@isd.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107945841, 'Roscoe', 'Serbedzija', 925446061, 'nurse', 'roscoe.serbedzija@ufs.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110500903, 'Vanessa', 'Rudd', 983435760, 'intern', 'vanessa.rudd@operationalt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102834965, 'Helen', 'Balin', 2280041195, 'intern', 'helen.balin@sbc.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102770302, 'Kurtwood', 'Danger', 2080333197, 'nurse', 'kurtwood.danger@iss.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119338222, 'Harrison', 'Rivers', 795130101, 'nurse', 'harrison.r@wyeth.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111874805, 'Tim', 'Weaving', 2382484646, 'nurse', 'tim.weaving@mqsoftware.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106639335, 'Vertical', 'Goldwyn', 2570147383, 'paramedic', 'vertical.g@cardtronics.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116147396, 'Mili', 'Huston', 2411051232, 'intern', 'm.huston@ceb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108090600, 'Collin', 'Fierstein', 3375526265, 'nurse', 'cfierstein@stonetechprofe');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117110488, 'Luke', 'Madonna', 1421102913, 'paramedic', 'luke@cima.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112174890, 'Bret', 'Carter', 2420415105, 'intern', 'bret.carter@mms.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119305558, 'Vickie', 'Palin', 3767968814, 'nurse', 'vpalin@bristolmyers.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106650899, 'Vincent', 'Guest', 3534266434, 'intern', 'vincent.g@eastmankodak.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110989087, 'Rosario', 'Wong', 3448361092, 'intern', 'rosario.w@usphysicalthera');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101574837, 'Gene', 'Matheson', 1390972454, 'paramedic', 'g.matheson@tmt.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114925407, 'Gina', 'Beckham', 4015147835, 'paramedic', 'gina@hewlettpackard.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114018525, 'Minnie', 'Dunst', 3305865342, 'nurse', 'minnie.dunst@maverick.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112701160, 'Beverley', 'Tambor', 855100751, 'paramedic', 'beverleyt@sbc.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112321719, 'Jessica', 'McElhone', 3412762918, 'nurse', 'jessica@wyeth.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100147983, 'Keanu', 'Meniketti', 1859898933, 'paramedic', 'keanu@labradanutrition.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101447618, 'Nastassja', 'Leigh', 1459969698, 'nurse', 'nastassja.leigh@gra.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118896383, 'Shannyn', 'Weiss', 4017221751, 'intern', 'shannyn.weiss@vertexsolut');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109513086, 'Kristin', 'Checker', 1259767170, 'nurse', 'kristin.checker@volkswage');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101585639, 'Maggie', 'Margolyes', 2085601999, 'nurse', 'maggie.margolyes@biorefer');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118199256, 'Marisa', 'Mortensen', 2280085995, 'intern', 'marisa@tripwire.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101048663, 'Salma', 'Nicholas', 3908638993, 'paramedic', 'snicholas@ibm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100263333, 'Clive', 'Sarandon', 4026523216, 'nurse', 'clive.sarandon@dancor.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105544051, 'Chloe', 'Johansson', 1709321237, 'intern', 'chloe.j@prp.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106917723, 'Rik', 'Reinhold', 2085806890, 'intern', 'rik.reinhold@gtp.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114153684, 'Timothy', 'Finn', 2782609696, 'paramedic', 't.finn@dbprofessionals.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109639646, 'Laurence', 'Dreyfuss', 856012415, 'intern', 'laurence.dreyfuss@lfg.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105470399, 'Charlize', 'Makowicz', 3258056158, 'paramedic', 'charlizem@bioanalytical.u');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116789039, 'King', 'Jolie', 2963437146, 'intern', 'king@randomwalk.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118309127, 'Ed', 'De Niro', 590342205, 'paramedic', 'ed.d@mms.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116258362, 'Jean', 'Johnson', 3218144997, 'paramedic', 'jjohnson@yes.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116908332, 'Darren', 'Koyana', 3389732648, 'paramedic', 'darren.koyana@linersdirec');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109891831, 'Kim', 'Hudson', 2713883632, 'intern', 'k.hudson@bps.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117993044, 'Mint', 'McCabe', 2384150301, 'nurse', 'mint.mccabe@bigdoughcom.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111081233, 'Jane', 'McDonnell', 1986634548, 'paramedic', 'jane@solipsys.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104874693, 'Richard', 'Rowlands', 597155847, 'nurse', 'richard.rowlands@ezecastl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118180993, 'Miguel', 'Gray', 2958706446, 'intern', 'miguel.gray@mag.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118579570, 'Chad', 'Hamilton', 3953817729, 'paramedic', 'chad.hamilton@csi.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102910232, 'France', 'Numan', 1320276908, 'nurse', 'france@logisticare.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110861209, 'Faye', 'Francis', 3582339302, 'nurse', 'faye.francis@timevision.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113395018, 'Rose', 'Pressly', 997709811, 'intern', 'rose.p@montpelierplastics');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117342423, 'Art', 'Purefoy', 2190957732, 'nurse', 'art.purefoy@mwp.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101243873, 'Judy', 'Presley', 2169450596, 'intern', 'judy.p@sms.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100026509, 'Ivan', 'Shearer', 2497274684, 'paramedic', 'ivan.shearer@venoco.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117261912, 'Miguel', 'Secada', 3962907425, 'paramedic', 'miguel.secada@progressive');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104949475, 'Sheryl', 'Shaye', 1748202446, 'nurse', 'sheryls@freedommedical.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102675795, 'Ceili', 'Strathairn', 1764925892, 'nurse', 'ceili.s@jcpenney.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115055445, 'Julianne', 'Snow', 37722352, 'paramedic', 'julianne.snow@ogiointerna');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101009055, 'Jarvis', 'Skerritt', 1723170813, 'nurse', 'jarvis.skerritt@granitesy');
commit;
prompt 400 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113906480, 'Steve', 'Mazzello', 1919656179, 'nurse', 'steve.mazzello@benecongro');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107489318, 'George', 'English', 1768166917, 'intern', 'george.english@bristolmye');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112663871, 'Carol', 'Nielsen', 2125012040, 'paramedic', 'carol.n@qas.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108518450, 'Micky', 'Holly', 1315701859, 'intern', 'micky@deutschetelekom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119003242, 'Cliff', 'Dalley', 3240322658, 'paramedic', 'cliff.dalley@mainstreetba');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103754566, 'Russell', 'Spiner', 3521087400, 'paramedic', 'russells@inspirationsoftw');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119655501, 'Gloria', 'Krumholtz', 3759355735, 'nurse', 'gloriak@logisticare.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106275230, 'Rolando', 'Rhames', 2458691398, 'paramedic', 'rolandor@novartis.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115220272, 'Harold', 'Hackman', 4255805461, 'nurse', 'hhackman@kwraf.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113626686, 'Anthony', 'Broderick', 610086995, 'nurse', 'anthony@nsd.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102636985, 'Marc', 'Bush', 3013099451, 'paramedic', 'marc.bush@sourcegear.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111237747, 'Roberta', 'Carlisle', 783231596, 'intern', 'roberta.carlisle@sandyspr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108209236, 'Thelma', 'Margolyes', 3388352619, 'nurse', 'thelma.margolyes@pearllaw');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118152249, 'Bryan', 'Paige', 2434854616, 'intern', 'bryan@procurementcentre.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111130233, 'Lindsey', 'Lapointe', 2777097024, 'intern', 'lindseyl@gtp.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112128858, 'Sheryl', 'Mitra', 3515857352, 'paramedic', 'sheryl.mitra@tilsonhr.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102486678, 'Halle', 'Howard', 1970182499, 'paramedic', 'halle.h@slt.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107359509, 'Meg', 'Kattan', 19490160, 'intern', 'meg.kattan@tastefullysimp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100217987, 'Dwight', 'Vega', 843699656, 'intern', 'dwight.v@fnb.nz');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114424820, 'Carlene', 'Heald', 686031000, 'nurse', 'carlene.heald@nbs.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100763880, 'Meredith', 'Isaak', 2197297201, 'nurse', 'misaak@fnb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106726585, 'Hugh', 'Jane', 3857279721, 'intern', 'hugh.jane@surmodics.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110263404, 'Cornell', 'Trevino', 2250437278, 'intern', 'cornell.t@cws.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110188917, 'Larnelle', 'Morton', 2557080238, 'intern', 'lmorton@reckittbenckiser.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113765320, 'Eddie', 'Gano', 1686316509, 'paramedic', 'eddie.gano@globalwireless');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101087941, 'Leonardo', 'Tyler', 4205212990, 'paramedic', 'leonardot@streetglow.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103017417, 'Carla', 'Dench', 2097190609, 'paramedic', 'carla.dench@gcd.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112371751, 'Nanci', 'Mills', 2443531434, 'intern', 'nanci.mills@topicsenterta');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114511803, 'Rade', 'Stewart', 4105230411, 'nurse', 'rade.stewart@nat.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119281945, 'Keith', 'Van Shelton', 3854402940, 'nurse', 'k.vanshelton@providencese');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107282355, 'Curt', 'Spacey', 4220429698, 'nurse', 'cspacey@activeservices.tr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117339909, 'Amanda', 'Peebles', 698944496, 'intern', 'amanda.p@accessus.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106809645, 'Faye', 'Pastore', 3316456314, 'nurse', 'faye.pastore@lfg.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100668245, 'Mint', 'Michaels', 2956848147, 'nurse', 'mint.michaels@viacell.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117457927, 'Melba', 'Viterelli', 3116125825, 'intern', 'melba.viterelli@ibm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101453900, 'Rhys', 'Faithfull', 3297574190, 'intern', 'rhys@merck.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114842003, 'Hikaru', 'Kershaw', 2711499299, 'intern', 'hkershaw@universalsolutio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119869270, 'Davis', 'Torn', 1008005218, 'nurse', 'd.torn@stm.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115509785, 'Gavin', 'Berkeley', 3808138104, 'paramedic', 'gavin.b@fam.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118136856, 'Marley', 'Reno', 3505049701, 'nurse', 'marleyr@dearbornbancorp.b');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119032666, 'Steve', 'Rhames', 967359789, 'nurse', 'steve@midwestmedia.gr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101791816, 'Val', 'Kadison', 1129230443, 'intern', 'val.kadison@tlsservicebur');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116966530, 'Bruce', 'Mortensen', 1340943490, 'nurse', 'b.mortensen@pinnaclestaff');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114949309, 'Jesse', 'Randal', 4077559278, 'nurse', 'jesse.randal@meritagetech');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110243262, 'Alfie', 'Michael', 3672677211, 'nurse', 'alfie.m@creditorsintercha');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117126715, 'Colleen', 'Mraz', 1639665205, 'nurse', 'cmraz@aco.gr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118704480, 'Patty', 'Brosnan', 2201551273, 'nurse', 'p.brosnan@stm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114651651, 'Jude', 'McIntosh', 4121639252, 'nurse', 'jude.mcintosh@hcoa.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102842197, 'Lionel', 'Gano', 2206755024, 'intern', 'lionel.gano@efcbancorp.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100897651, 'Percy', 'Tillis', 1059097041, 'paramedic', 'percy.t@calence.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117484325, 'Fred', 'Nicholas', 2985026130, 'nurse', 'fred.nicholas@dcgroup.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100095242, 'Rip', 'Weaver', 1252317782, 'intern', 'ripw@diamondgroup.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109036261, 'Lea', 'Fogerty', 3753630382, 'intern', 'lfogerty@wrgservices.id');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116311636, 'Allison', 'Vannelli', 3686032360, 'intern', 'allison.vannelli@wellsfin');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102961598, 'Alex', 'Klugh', 2228199357, 'paramedic', 'alex.klugh@perfectorder.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119342643, 'Ned', 'Diehl', 3506217479, 'intern', 'ned.diehl@formatech.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102855791, 'Tom', 'Morales', 1706976808, 'intern', 'tmorales@yes.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106439517, 'Norm', 'Robbins', 3075290273, 'nurse', 'norm.robbins@morganresear');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104170899, 'Andie', 'Whitmore', 2308029946, 'nurse', 'andie.whitmore@sfgo.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102088023, 'Johnnie', 'Lindo', 1262404159, 'nurse', 'johnnie.lindo@cima.tw');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102002507, 'Praga', 'Skaggs', 3726105245, 'paramedic', 'praga.skaggs@alogent.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101721853, 'Rick', 'Van Helden', 2618797988, 'intern', 'rvanhelden@digitalmotorwo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104762297, 'Mark', 'Wells', 1823753315, 'paramedic', 'm.wells@providenceservice');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106817469, 'Kirsten', 'Moffat', 3867503773, 'nurse', 'kmoffat@grs.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107935772, 'Ty', 'Coolidge', 960215237, 'nurse', 'tyc@midwestmedia.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119329093, 'Kirk', 'Neil', 3237420237, 'nurse', 'kirk.neil@sunstream.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108765746, 'Powers', 'Favreau', 1515191276, 'nurse', 'powers.f@healthscribe.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110487995, 'Cloris', 'Lachey', 1179839505, 'paramedic', 'cloris.lachey@mls.fi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110740302, 'Jake', 'Cage', 2898782081, 'paramedic', 'jake.cage@sht.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100372089, 'Pablo', 'Balaban', 976758817, 'nurse', 'pablo.balaban@usenergyser');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116569739, 'Sigourney', 'Heslov', 3177411850, 'nurse', 'sigourney.heslov@kis.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102380227, 'Tanya', 'Flack', 2389870910, 'nurse', 'tanya@drinkmorewater.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103817500, 'Brad', 'Warden', 2185103651, 'nurse', 'brad.warden@savela.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110865076, 'Taryn', 'Ward', 2546508964, 'nurse', 'taryn.ward@sps.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116611486, 'Dan', 'Nivola', 3918606693, 'intern', 'dan.nivola@codykramerimpo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117245912, 'Simon', 'Jones', 3668333362, 'paramedic', 's.jones@bigyanksports.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115385320, 'Vickie', 'Shorter', 1420564436, 'intern', 'vickie.s@kroger.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115535021, 'Ralph', 'Carter', 1130758460, 'intern', 'ralphc@tilsonhr.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105110482, 'Gabriel', 'Gilliam', 3693821024, 'paramedic', 'gabriel.gilliam@idas.ie');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116119981, 'Emily', 'Morales', 3186956738, 'paramedic', 'emily.morales@infinity.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119404881, 'Chaka', 'Borgnine', 887030312, 'intern', 'c.borgnine@formatech.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105815342, 'Patti', 'Maxwell', 2948875553, 'paramedic', 'patti.maxwell@nobrainerbl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105855650, 'Wendy', 'Winans', 2870503390, 'paramedic', 'wendy.winans@microtek.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119509159, 'Franco', 'Hutch', 3142892314, 'intern', 'franco.hutch@progressivem');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113641140, 'Cesar', 'Nivola', 3768807857, 'paramedic', 'c.nivola@ciwservices.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103149227, 'Lara', 'Bentley', 1355198788, 'nurse', 'larab@walmartstores.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105715738, 'Winona', 'Vassar', 1965819379, 'paramedic', 'winona.vassar@tripwire.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101313049, 'Chantי', 'Payton', 4127801250, 'paramedic', 'chant.p@kellogg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114767771, 'Lauren', 'Margulies', 3473975546, 'paramedic', 'laurenm@ivci.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117437079, 'Chuck', 'Sobieski', 3481179823, 'nurse', 'csobieski@spenser.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108581124, 'Marty', 'Aglukark', 2414255704, 'intern', 'm.aglukark@prometheuslabo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115127069, 'Marlon', 'Visnjic', 2160330544, 'paramedic', 'marlon.visnjic@providentb');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111007254, 'Garland', 'Pitney', 3373049425, 'nurse', 'garland.pitney@savela.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102815221, 'Vanessa', 'Heslov', 4016927176, 'intern', 'vanessa.h@keith.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105095420, 'Ian', 'Davidson', 2453130773, 'nurse', 'ian.davidson@gillani.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100568525, 'Matthew', 'Hunt', 3681871483, 'paramedic', 'matthewh@nlx.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107903485, 'Andy', 'Spine', 3008579518, 'paramedic', 'andy.spine@at.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108243568, 'Eugene', 'Tate', 50198299, 'paramedic', 'eugene@harrison.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110996218, 'George', 'Rankin', 3761369769, 'paramedic', 'george.r@mse.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103586610, 'Forest', 'McPherson', 25876538, 'paramedic', 'forest.mcpherson@apexsyst');
commit;
prompt 500 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116501792, 'Desmond', 'Zahn', 2248440499, 'nurse', 'desmond.zahn@cima.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112202703, 'Jaime', 'Mattea', 1534680547, 'intern', 'jaime.mattea@printingforl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111780867, 'Tea', 'Khan', 4099781516, 'nurse', 'tea.khan@north.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115699096, 'Yolanda', 'Thorton', 1182993946, 'paramedic', 'yolanda.thorton@aventis.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114743954, 'Mary Beth', 'Lawrence', 1806948273, 'paramedic', 'marybethl@aoe.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107627773, 'Richard', 'Perry', 4088675870, 'nurse', 'richard.p@alogent.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114075990, 'Taye', 'Rizzo', 2340272837, 'nurse', 'taye.rizzo@generalelectri');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101556692, 'Rob', 'Hawke', 1891873095, 'intern', 'rhawke@gdi.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117501276, 'Andrew', 'Tucker', 2203605179, 'paramedic', 'andrew@cynergydata.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106773981, 'Burton', 'Lucien', 1474243678, 'intern', 'b.lucien@drinkmorewater.n');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115421270, 'Julia', 'Marx', 3786624499, 'paramedic', 'julia.marx@parksite.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110388787, 'Gerald', 'Branch', 2227886095, 'paramedic', 'gbranch@pragmatechsoftwar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119601182, 'Micky', 'DeGraw', 1017244981, 'paramedic', 'mickyd@outsourcegroup.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119187587, 'Harris', 'Arkenstone', 3514746550, 'intern', 'h.arkenstone@inzone.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107319642, 'Cherry', 'Lemmon', 1998119956, 'nurse', 'cherry.lemmon@telesynthes');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114519209, 'Frank', 'Alexander', 2385118498, 'nurse', 'frank.alexander@parksite.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102326143, 'Donal', 'Leto', 2832054700, 'paramedic', 'donal@doraldentalusa.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100962710, 'Marina', 'Crouse', 2044591601, 'intern', 'marina.c@venoco.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106765645, 'Vin', 'Reid', 1146087993, 'paramedic', 'v.reid@apexsystems.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103059237, 'Amanda', 'Roberts', 2362712317, 'intern', 'amanda@timberlanewoodcraf');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101209317, 'Dabney', 'Parker', 3293522081, 'nurse', 'dparker@gbas.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119458185, 'Ricky', 'Gill', 1569108364, 'nurse', 'rickyg@linksys.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111202013, 'Wang', 'Lerner', 2099601812, 'paramedic', 'wang.l@shirtfactory.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113032444, 'Mike', 'Ronstadt', 3215334767, 'paramedic', 'mike.ronstadt@gltg.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113398817, 'Geraldine', 'Robbins', 2270947478, 'paramedic', 'g.robbins@nhhc.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119720009, 'Clarence', 'Bening', 2674468829, 'paramedic', 'clarence.bening@pioneermo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116067878, 'Nikki', 'Warren', 3027149553, 'paramedic', 'nikki.warren@multimediali');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119137021, 'Gabriel', 'Grier', 2550769568, 'paramedic', 'ggrier@kramontrealty.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119255931, 'Holland', 'Richards', 2364434853, 'nurse', 'holland.r@gillani.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117021476, 'Nancy', 'Day', 1313814837, 'intern', 'nancy.day@asa.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119980895, 'Gord', 'Ponce', 4037226381, 'paramedic', 'gord@idlabel.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110756669, 'Cledus', 'Sampson', 2352095121, 'nurse', 'c.sampson@ivci.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106076150, 'Bebe', 'Puckett', 1651812327, 'paramedic', 'bebe.p@jewettcameron.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104647962, 'Ronny', 'Womack', 4232530757, 'intern', 'ronnyw@aventis.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115279793, 'Ted', 'Neil', 845792717, 'nurse', 'ted.neil@visainternationa');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113103163, 'Annette', 'Rosas', 2035177195, 'paramedic', 'annette@veritekinternatio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111366870, 'CeCe', 'Mueller-Stahl', 3710485174, 'paramedic', 'cece@linksys.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106749017, 'Liam', 'Richardson', 855759510, 'intern', 'liam.richardson@prosum.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114979863, 'Thomas', 'Fox', 1257561513, 'intern', 'thomas.fox@maverick.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113941554, 'Collective', 'Peet', 2912647001, 'paramedic', 'collective@prosperitybanc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109499463, 'Thin', 'Burmester', 1969829797, 'intern', 'thin.b@slt.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101060681, 'Holland', 'Schreiber', 3557502413, 'nurse', 'h.schreiber@prp.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113361987, 'Beth', 'Woodard', 3027887917, 'intern', 'b.woodard@data.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110932627, 'Nancy', 'Pesci', 1394339661, 'intern', 'nancy.pesci@career.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110705610, 'Jill', 'Chestnut', 1630115461, 'paramedic', 'j.chestnut@cowlitzbancorp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100546487, 'Carol', 'Orbit', 4122850708, 'intern', 'carol.o@nha.no');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114498321, 'Rik', 'Wong', 817281916, 'intern', 'rik.wong@fns.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110434881, 'Austin', 'Cobbs', 3151904889, 'nurse', 'austin.cobbs@timevision.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119357331, 'Wayman', 'Stevens', 1471602642, 'nurse', 'wayman.stevens@vivendiuni');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109682994, 'Heather', 'Sossamon', 2890645489, 'paramedic', 'heather.sossamon@tigris.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108364837, 'Jonathan', 'Newton', 3313774975, 'intern', 'j.newton@balchem.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106323272, 'Patrick', 'Tennison', 1992504407, 'paramedic', 'patrick@trm.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110738452, 'Colleen', 'Wright', 1740961707, 'paramedic', 'colleen.wright@greenmount');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109646536, 'Adam', 'Miller', 55771856, 'paramedic', 'amiller@onesourceprinting');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105311131, 'Elle', 'Jay', 3689205277, 'paramedic', 'elle.jay@volkswagen.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101365893, 'Lari', 'Malone', 994885755, 'nurse', 'lari.malone@innovateecomm');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101759637, 'Jon', 'Roundtree', 2886873883, 'intern', 'jon.roundtree@mag.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106348834, 'Jody', 'Keener', 2556720527, 'paramedic', 'jody.keener@aoe.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106098108, 'Meredith', 'Byrne', 3978116374, 'paramedic', 'meredith@flavorx.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117134246, 'Johnette', 'Sedgwick', 1539245010, 'paramedic', 'johnettes@nike.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108482179, 'Jake', 'Hamilton', 1405574382, 'nurse', 'jake.hamilton@staffone.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102131219, 'Jake', 'LaMond', 2397561609, 'intern', 'jake@evinco.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119589901, 'Olympia', 'Hamilton', 1094779288, 'paramedic', 'olympia.hamilton@baesch.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106106359, 'Carlene', 'Branagh', 3013772061, 'paramedic', 'carlene.branagh@jcpenney.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111390367, 'Timothy', 'Levine', 3548208929, 'paramedic', 'timothyl@tigris.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109380507, 'Chubby', 'Schwimmer', 3188983973, 'nurse', 'chubby.s@lydiantrust.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108883905, 'Nicky', 'Watson', 1871769260, 'nurse', 'nwatson@nbs.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111374246, 'Emily', 'Williamson', 2767936845, 'nurse', 'emilyw@abatix.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111085390, 'Larnelle', 'Fraser', 1206470510, 'nurse', 'larnelle.f@infopros.cn');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101273451, 'Charlton', 'Curtis-Hall', 3179210373, 'nurse', 'charlton.curtishall@phili');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105831420, 'Campbell', 'Cartlidge', 3334491004, 'paramedic', 'campbellc@mms.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105753594, 'Andrae', 'Garr', 2300764692, 'intern', 'agarr@vitacostcom.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115278478, 'Willem', 'Giamatti', 746929341, 'nurse', 'willem.g@sprint.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103231721, 'Cledus', 'Dukakis', 2260120756, 'paramedic', 'c.dukakis@genextechnologi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100104664, 'Rory', 'Navarro', 935072161, 'nurse', 'rory@topicsentertainment.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100971412, 'Jon', 'King', 3611698115, 'paramedic', 'jon@woronocobancorp.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118881454, 'Rhett', 'Raye', 2161960570, 'intern', 'rhett.raye@appriss.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111278017, 'Caroline', 'Sossamon', 1908027415, 'paramedic', 'caroline.sossamon@quakerc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111540057, 'Moe', 'Donovan', 3463056289, 'paramedic', 'moe.donovan@hewlettpackar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112511973, 'Suzanne', 'Stuermer', 1385916820, 'paramedic', 'suzanne.stuermer@peerless');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111029902, 'Brooke', 'Fiorentino', 3158343878, 'paramedic', 'b.fiorentino@progressived');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102883562, 'Julie', 'Arjona', 1985619063, 'paramedic', 'julie.arjona@spenser.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102711696, 'Malcolm', 'Meyer', 3497951239, 'intern', 'malcolm.meyer@baesch.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112144067, 'Geoffrey', 'Pleasure', 3255349183, 'paramedic', 'geoffrey.pleasure@gbas.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101889670, 'Adina', 'Jenkins', 1843103, 'paramedic', 'adina.j@bigdoughcom.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114572300, 'Cate', 'Strathairn', 3605345288, 'intern', 'cate.strathairn@mms.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102828635, 'Johnette', 'Grier', 3448647284, 'nurse', 'johnette.grier@americanva');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105384995, 'Jean', 'Baez', 3168664661, 'intern', 'jean.baez@qls.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115278537, 'Lou', 'Ingram', 4265268513, 'intern', 'lou@teamstudio.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104853547, 'Jonny', 'Sarsgaard', 1392454822, 'paramedic', 'jonnys@balchem.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114044244, 'Gene', 'El-Saher', 1707708388, 'intern', 'gene.e@bmm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108284619, 'Rick', 'Cazale', 1369872106, 'intern', 'rick.cazale@stmaryland.ec');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110412846, 'Sissy', 'Hawthorne', 2415032826, 'nurse', 's.hawthorne@aoe.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103931757, 'Rupert', 'Shelton', 2725204724, 'paramedic', 'rupert.shelton@lifelinesy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104287977, 'Holly', 'Tsettos', 1454120920, 'paramedic', 'htsettos@trekequipment.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100020236, 'Rawlins', 'Eat World', 1429344104, 'paramedic', 'rawlins.eatworld@atg.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117667536, 'Tea', 'Baez', 3157686284, 'intern', 'tea.baez@innovateecommerc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106071706, 'Alicia', 'Dourif', 1811990282, 'nurse', 'alicia.dourif@hotmail.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113783564, 'Carlos', 'Ryder', 1031318802, 'nurse', 'carlosr@securitycheck.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102510244, 'Wallace', 'Young', 3334297984, 'paramedic', 'wallace.young@bestever.de');
commit;
prompt 600 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108655311, 'Vin', 'Jonze', 3747755228, 'intern', 'vin.jonze@sandyspringbanc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109378545, 'Cledus', 'Holland', 1141225326, 'paramedic', 'cholland@ungertechnologie');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107525519, 'Nickel', 'Ward', 3898533340, 'nurse', 'nickelw@cooktek.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112723831, 'Chrissie', 'Levy', 1561861315, 'intern', 'chrissie.levy@lemproducts');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118788123, 'Breckin', 'Lucien', 3370711250, 'paramedic', 'breckin.lucien@datawareho');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116763080, 'Eugene', 'Detmer', 3097693397, 'nurse', 'e.detmer@swp.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115282975, 'Jody', 'Sinise', 4030880696, 'paramedic', 'j.sinise@mosaic.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113516704, 'Jonny Lee', 'Hurley', 3315254069, 'nurse', 'jonnylee.hurley@noodles.b');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107107797, 'Dustin', 'Roberts', 632512800, 'paramedic', 'dustin.roberts@meghasyste');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114177007, 'Ralph', 'Jovovich', 2347743086, 'nurse', 'ralph.jovovich@tracertech');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113547604, 'Jane', 'Evanswood', 1522259619, 'paramedic', 'jane@timevision.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102759240, 'Kate', 'Duke', 2746402864, 'paramedic', 'kate.duke@morganresearch.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110703635, 'Chi', 'Mohr', 2812875508, 'paramedic', 'chi.mohr@banfeproducts.pl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114698389, 'Donna', 'Ingram', 3608869951, 'nurse', 'donna.ingram@quakercityba');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118632169, 'Gena', 'Mollard', 2055095095, 'intern', 'gena.mollard@teamstudio.i');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114910872, 'Selma', 'Curtis-Hall', 2282255386, 'nurse', 'selma.curtishall@iss.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108057399, 'Whoopi', 'Driver', 637044265, 'nurse', 'whoopid@cns.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109414193, 'Nancy', 'Franklin', 776735183, 'intern', 'nancy.franklin@extremepiz');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100043835, 'Hikaru', 'Curtis-Hall', 1191117779, 'nurse', 'hikaru@esteelauder.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118140140, 'Judy', 'Purefoy', 1090944894, 'intern', 'judyp@genghisgrill.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108927340, 'Pat', 'Krabbe', 1306095108, 'paramedic', 'pat.krabbe@infopros.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107782478, 'Nils', 'Paymer', 3456819086, 'intern', 'nilsp@diageo.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112764707, 'Jim', 'Fichtner', 3630323657, 'intern', 'jim.fichtner@sci.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103273699, 'Ming-Na', 'Bassett', 3035497034, 'nurse', 'mingna.bassett@conagra.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103106420, 'Kitty', 'Weller', 4185744053, 'nurse', 'kitty.weller@cocacola.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118637987, 'Stevie', 'Skarsgard', 2543601822, 'paramedic', 'stevie.skarsgard@scripnet');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101953995, 'Bruce', 'Wayans', 2694210097, 'intern', 'bruce.wayans@ccb.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102532822, 'Chely', 'Beckinsale', 3259619531, 'intern', 'chely@aldensystems.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102376583, 'Lupe', 'Squier', 3999617411, 'intern', 'lupe.squier@ppr.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113914595, 'Lance', 'Cantrell', 2633603754, 'nurse', 'lance.cantrell@spotfireho');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113251555, 'Jamie', 'Chesnutt', 3287060748, 'paramedic', 'jamie.chesnutt@techbooks.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113592106, 'Mena', 'Gershon', 1191066700, 'intern', 'mena@gapinc.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109573696, 'Ving', 'Rhames', 664810998, 'intern', 'v.rhames@bigdoughcom.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105434793, 'Selma', 'Barkin', 3457233359, 'nurse', 'selma.b@lfg.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100649603, 'Lynette', 'McConaughey', 2565752413, 'intern', 'lynette@hospitalsolutions');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103368065, 'Minnie', 'Fierstein', 2225411232, 'paramedic', 'minnie.fierstein@hitechph');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109947036, 'Ty', 'Van Damme', 1686438427, 'paramedic', 'ty.vandamme@freedommedica');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103921379, 'Ali', 'Affleck', 1571594766, 'paramedic', 'ali.affleck@fiberlink.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102342082, 'Vivica', 'Starr', 2038202029, 'paramedic', 'vivica@woronocobancorp.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111653308, 'Jeremy', 'Nivola', 3679816223, 'nurse', 'j.nivola@appriss.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106798018, 'Josh', 'Pfeiffer', 2463125964, 'nurse', 'joshp@telesynthesis.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113925064, 'Faye', 'Holbrook', 4101449337, 'intern', 'faye@kellogg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102218069, 'Garry', 'Mortensen', 1607490417, 'paramedic', 'garry.mortensen@onstaff.a');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113987791, 'Benjamin', 'Loeb', 1204846154, 'intern', 'bloeb@yashtechnologies.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111350447, 'Gates', 'Ratzenberger', 3660685413, 'nurse', 'gates.ratzenberger@techbo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105002613, 'Joanna', 'Abraham', 3173616378, 'paramedic', 'joanna.abraham@toyotamoto');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103418142, 'Rob', 'Koteas', 1964553623, 'paramedic', 'rob.koteas@greenmountain.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118832043, 'Taylor', 'Hyde', 2157120999, 'intern', 'thyde@biosite.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102628149, 'Teena', 'Sandoval', 1375781890, 'paramedic', 'teena.sandoval@visionarys');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111253286, 'Heath', 'Womack', 43376019, 'paramedic', 'hwomack@drinkmorewater.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118484165, 'Stellan', 'Tyson', 2068012867, 'paramedic', 'stellan.tyson@ptg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112245117, 'Jamie', 'Ammons', 2791663494, 'intern', 'jamie.ammons@ams.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117517744, 'Bobbi', 'Bonham', 1434791591, 'intern', 'bbonham@fetchlogistics.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109064516, 'Mary', 'Dempsey', 1693201092, 'nurse', 'mary.dempsey@aldensystems');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111522119, 'Benjamin', 'Curry', 661379014, 'nurse', 'benjamin@dancor.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109961757, 'Spencer', 'McKean', 3808294745, 'intern', 'spencer@peerlessmanufactu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103597175, 'Avril', 'Logue', 3843925772, 'paramedic', 'avril.logue@cardinalcartr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115638139, 'Alicia', 'Schiff', 2213841590, 'nurse', 'alicia.schiff@typhoon.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119585777, 'Heath', 'Burmester', 3105624908, 'intern', 'heath@irissoftware.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113752631, 'Dean', 'Church', 1215257339, 'intern', 'dean.church@speakeasy.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116776934, 'Marina', 'Numan', 3513642259, 'paramedic', 'marina.numan@lloydgroup.u');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103343583, 'Maureen', 'Koteas', 2696831827, 'nurse', 'm.koteas@aoe.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105437471, 'Halle', 'Valentin', 873637715, 'intern', 'halle@ois.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103749839, 'Jeremy', 'Shatner', 606065562, 'paramedic', 'jshatner@ptg.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102857151, 'Anna', 'Mould', 1647272191, 'paramedic', 'anna.m@visionarysystems.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118020433, 'Horace', 'Wong', 844201956, 'paramedic', 'horace.wong@kingland.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119062153, 'Hex', 'Lightfoot', 3693057901, 'intern', 'hex.lightfoot@unilever.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119263933, 'Isabella', 'Gellar', 2959247367, 'nurse', 'isabella.gellar@gra.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106353943, 'Mae', 'Berkoff', 1670951601, 'intern', 'maeb@generalmotors.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107993669, 'Lynette', 'Chesnutt', 3127657550, 'paramedic', 'lynette.chesnutt@visionar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114988615, 'Rowan', 'Bening', 40359388, 'intern', 'rowan.bening@jlphor.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113452166, 'Stevie', 'Coyote', 3661399406, 'paramedic', 'stevie.coyote@httprint.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116384858, 'Brothers', 'Bailey', 3389009858, 'paramedic', 'brothers.bailey@swp.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115676961, 'Doug', 'Van Damme', 2823234873, 'nurse', 'doug.v@saltgroup.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119642095, 'Bo', 'Harnes', 3281341691, 'intern', 'bo.harnes@spd.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114535907, 'Delbert', 'McGregor', 2175037226, 'intern', 'delbert.mcgregor@mai.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103182254, 'Stephanie', 'Holbrook', 3646240131, 'paramedic', 'sholbrook@pacificdatadesi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113111518, 'Jared', 'Diddley', 3452904336, 'intern', 'j.diddley@gdatechnologies');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119555934, 'Stellan', 'Cornell', 3549895175, 'intern', 's.cornell@philipmorris.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104219062, 'Lou', 'Washington', 1731588058, 'intern', 'louw@capitalbank.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118873056, 'Michael', 'Depp', 1908610242, 'nurse', 'michael.d@pscinfogroup.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101102384, 'Red', 'Johansen', 30175952, 'intern', 'r.johansen@fmi.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113869329, 'Chely', 'Kline', 1154265394, 'intern', 'chely.k@coadvantageresour');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116702491, 'Chaka', 'Zahn', 1035590348, 'paramedic', 'chaka.zahn@knightsbridge.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105957168, 'Carlene', 'Hawkins', 3715995000, 'nurse', 'carlene@spinnakerexplorat');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114002551, 'Rik', 'Atkins', 1620347756, 'intern', 'rik.atkins@tarragonrealty');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104686911, 'Gordie', 'Cornell', 2711612606, 'paramedic', 'gordie.c@carboceramics.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103493409, 'Laurie', 'Cruise', 3445383847, 'paramedic', 'lauriec@cns.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115329718, 'Pam', 'Caldwell', 3403416416, 'paramedic', 'pam.caldwell@hiltonhotels');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103606714, 'Marlon', 'Horton', 2028869629, 'paramedic', 'marlon.horton@biosite.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105793914, 'Etta', 'Heston', 2484942584, 'paramedic', 'etta.h@tripwire.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103416251, 'Melba', 'Witherspoon', 982728265, 'nurse', 'melba.witherspoon@kelmoor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119673543, 'Jared', 'Vai', 736952040, 'intern', 'jared.v@irissoftware.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104427642, 'Lupe', 'Cube', 4106866599, 'paramedic', 'lupe.cube@hospitalsolutio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103416990, 'Clea', 'Bachman', 765908832, 'intern', 'cleab@ivci.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112220840, 'Ving', 'Raye', 3771229288, 'intern', 'ving.r@mainstreetbanks.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102198752, 'Mark', 'Kane', 1682808076, 'intern', 'mark.kane@sony.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105143339, 'Matthew', 'Sizemore', 2682469523, 'nurse', 'matthew@gateway.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108465627, 'Jody', 'Weber', 821168007, 'nurse', 'jody.weber@mms.fi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118324607, 'Illeana', 'Gates', 2225504015, 'intern', 'illeana.gates@timevision.');
commit;
prompt 700 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109368589, 'Uma', 'Lachey', 3728414476, 'paramedic', 'uma.lachey@sm.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105156906, 'Maxine', 'Harper', 3787840941, 'nurse', 'maxine.harper@advancedneu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100857441, 'Rip', 'Haslam', 3124303953, 'paramedic', 'riph@pis.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105098265, 'Cyndi', 'Margolyes', 942167097, 'nurse', 'cyndi.margolyes@albertson');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111510786, 'Nicky', 'Sherman', 3163790182, 'nurse', 'nsherman@envisiontelephon');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116143044, 'Charlie', 'Mahood', 2371596004, 'nurse', 'cmahood@evinco.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106041834, 'Sammy', 'Biel', 2755525583, 'paramedic', 'sammy@pulaskifinancial.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103918831, 'Paula', 'Bell', 2156436330, 'paramedic', 'pbell@enterprise.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108729149, 'Randall', 'Spears', 1403387938, 'paramedic', 'randall.spears@mathis.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118902486, 'Bruce', 'Francis', 3160197690, 'paramedic', 'bruce.francis@tropicaloas');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111558326, 'Gilbert', 'Carrey', 1784807318, 'intern', 'g.carrey@nhr.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100761540, 'Hugo', 'Gaynor', 2883235885, 'paramedic', 'h.gaynor@horizonorganic.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100603007, 'Alicia', 'Reiner', 782348112, 'intern', 'areiner@swp.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112475543, 'Maggie', 'DiCaprio', 3738238200, 'intern', 'm.dicaprio@componentgraph');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116122706, 'Mindy', 'Lange', 3602215808, 'intern', 'mindy.lange@sci.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107580965, 'Victor', 'Lauper', 2864784453, 'intern', 'v.lauper@usdairyproducers');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100028492, 'Bo', 'Conlee', 846181947, 'nurse', 'bo.conlee@integramedameri');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113498927, 'Vienna', 'Miles', 3802479739, 'paramedic', 'vienna.miles@integramedam');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115093776, 'Kay', 'Sanchez', 3289400768, 'nurse', 'kay.sanchez@microtek.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107436695, 'Brendan', 'Bonneville', 1393286508, 'intern', 'brendan@bedfordbancshares');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119305017, 'Sinead', 'Travolta', 1325393314, 'paramedic', 'sinead.travolta@wrgservic');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104838728, 'Willem', 'Belle', 2332493472, 'nurse', 'willem.belle@neogen.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107134123, 'Queen', 'Hornsby', 2903811943, 'paramedic', 'queenh@kmart.ht');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119183345, 'Cathy', 'Freeman', 932880811, 'paramedic', 'cathy.f@mavericktechnolog');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112893686, 'Reese', 'Eder', 3170277034, 'nurse', 'reese@kelmooreinvestment.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108002727, 'Jane', 'Fishburne', 3740502010, 'nurse', 'j.fishburne@bluffcitystee');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112274715, 'Dustin', 'Mraz', 2389680251, 'intern', 'dustin.mraz@heartlab.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119561026, 'Ramsey', 'Stanley', 1238908754, 'intern', 'ramseys@ahl.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110666238, 'Elvis', 'Alexander', 2354015750, 'paramedic', 'elvis.alexander@max.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101947546, 'Stephanie', 'Lee', 1649979375, 'intern', 'slee@tastefullysimple.gr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108906624, 'Tracy', 'Belles', 2694323257, 'nurse', 'tracy.belles@linersdirect');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102164519, 'Terrence', 'Wood', 3693902049, 'intern', 'terrence.wood@technica.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100335845, 'Claire', 'Carnes', 3653951627, 'intern', 'claire@yashtechnologies.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116504883, 'Cornell', 'Watley', 3667080139, 'paramedic', 'cornell.watley@voicelog.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106273108, 'Neneh', 'Tambor', 34151065, 'intern', 'neneh.tambor@nmr.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114342446, 'Elisabeth', 'Blige', 2264934794, 'nurse', 'elisabeth.blige@jewettcam');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117838467, 'Martin', 'Cocker', 1784683740, 'intern', 'martin.cocker@printcafeso');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105617923, 'Jean-Luc', 'Marx', 2533043305, 'intern', 'jeanluc.m@tastefullysimpl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106625184, 'Rita', 'DiCaprio', 1513977589, 'nurse', 'rdicaprio@aci.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115282556, 'Claire', 'Coolidge', 4221679982, 'paramedic', 'claire.c@linksys.ve');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118931533, 'Whoopi', 'Checker', 1048215641, 'intern', 'w.checker@hewlettpackard.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102441566, 'Patrick', 'Broza', 619516551, 'intern', 'p.broza@evergreenresource');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110644817, 'Daniel', 'Maguire', 1956983044, 'nurse', 'daniel.m@jewettcameron.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102720421, 'Doug', 'Bratt', 730897634, 'intern', 'd.bratt@benecongroup.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109840292, 'Irene', 'Rapaport', 3845215805, 'nurse', 'i.rapaport@aci.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112935118, 'Lizzy', 'Farina', 2670247027, 'paramedic', 'lizzy.farina@safeway.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115559780, 'Emily', 'Myles', 1990536495, 'nurse', 'emily.myles@prosum.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103786768, 'Andre', 'Ticotin', 4076402821, 'nurse', 'andre.ticotin@carteretmor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113631619, 'Nick', 'Reeve', 3879767884, 'paramedic', 'nickr@anheuserbusch.pk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106082934, 'Isaac', 'Frakes', 4184634105, 'intern', 'isaac@ivci.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111048156, 'Hilton', 'Negbaur', 3472606998, 'intern', 'hilton.negbaur@questarcap');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103476264, 'Tom', 'Broderick', 2607708576, 'paramedic', 'tom@kingland.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105410546, 'Clay', 'Jackson', 1404173425, 'intern', 'clay.jackson@yes.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119811781, 'Noah', 'Rapaport', 1462552163, 'paramedic', 'noah.rapaport@sfmai.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115594662, 'Katrin', 'Minogue', 1596064227, 'paramedic', 'katrinm@swi.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118194513, 'Dorry', 'Saxon', 1796670543, 'paramedic', 'dorry.saxon@linersdirect.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118803584, 'Hazel', 'Heatherly', 1393622983, 'paramedic', 'hazel.heatherly@americanv');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110324536, 'Freddie', 'Dunst', 1410095887, 'nurse', 'freddie@perfectorder.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108482252, 'Rawlins', 'Hiatt', 2960075208, 'nurse', 'r.hiatt@ciwservices.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109637760, 'Delroy', 'Gordon', 3833894545, 'nurse', 'delroy.gordon@cmi.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118307580, 'LeVar', 'Stowe', 3722105482, 'paramedic', 'levar.stowe@viacell.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119479123, 'Brent', 'Caan', 3031222668, 'nurse', 'brent.caan@nlx.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114859481, 'Brothers', 'Ledger', 1726856772, 'intern', 'b.ledger@smg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112097060, 'Laurence', 'Sisto', 2864202777, 'intern', 'laurence.sisto@comnetinte');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104352465, 'Tim', 'Detmer', 3101067746, 'nurse', 'tim.detmer@cyberthink.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110104846, 'Vern', 'Garofalo', 1222838660, 'nurse', 'vern.garofalo@aldensystem');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115368918, 'Nora', 'Day-Lewis', 3030987778, 'paramedic', 'nora.daylewis@capellaeduc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112674791, 'Ani', 'Hyde', 879364292, 'paramedic', 'ani.h@worldcom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105580621, 'Tea', 'Gosdin', 1570950543, 'intern', 't.gosdin@sht.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104639815, 'Jackson', 'Eat World', 682202739, 'nurse', 'jeatworld@printcafesoftwa');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100952838, 'Gavin', 'Glover', 2891670445, 'nurse', 'gavin.glover@wellsfinanci');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106695594, 'Jaime', 'Remar', 1546679577, 'paramedic', 'jaime@aquascapedesigns.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109464265, 'Ray', 'Fender', 1554861912, 'intern', 'ray@ibfh.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110465320, 'Merle', 'Jolie', 805352506, 'paramedic', 'merle.jolie@savela.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108176959, 'Cledus', 'Green', 3569581861, 'intern', 'cledus.green@networkdispl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118473967, 'Caroline', 'McGill', 3259330876, 'paramedic', 'caroline.mcgill@keymark.j');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116612234, 'Carolyn', 'Minogue', 2698221616, 'intern', 'cminogue@cns.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112016915, 'Rosanna', 'McGovern', 1425698973, 'intern', 'r.mcgovern@unica.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100183862, 'Liv', 'Fishburne', 4066323394, 'paramedic', 'liv.fishburne@unitedasset');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117076452, 'Eileen', 'Mewes', 2503313217, 'intern', 'eileen.m@owm.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106735946, 'Treat', 'Goldblum', 1402505605, 'intern', 'treat.goldblum@cis.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114137687, 'Brothers', 'Close', 3030013536, 'paramedic', 'b.close@hardwoodwholesale');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108993821, 'Melanie', 'Sobieski', 3352358004, 'intern', 'melanie.sobieski@digitalm');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107550934, 'Patti', 'Phillippe', 1689393849, 'intern', 'patti.phillippe@sm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112889471, 'Kirsten', 'Kenoly', 1848331271, 'nurse', 'kirsten.kenoly@democracyd');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116804134, 'Rade', 'Dern', 3558121165, 'intern', 'rade.dern@providentbancor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116564575, 'Lesley', 'Kramer', 1625424936, 'intern', 'lesley@nuinfosystems.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110390005, 'Juice', 'Lindley', 753707746, 'nurse', 'juice.lindley@securityche');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100119498, 'Cuba', 'Steenburgen', 3332922162, 'intern', 'csteenburgen@als.hk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100219102, 'Ewan', 'Cornell', 3131382099, 'paramedic', 'ewanc@datawarehouse.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107505994, 'Janice', 'Fiennes', 1710457916, 'intern', 'janice.fiennes@sprint.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118241804, 'Ming-Na', 'Porter', 2379955460, 'paramedic', 'mingna.p@asapstaffing.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108632369, 'Blair', 'Kinney', 2925873840, 'paramedic', 'bkinney@clubone.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114027220, 'Paula', 'McLean', 3489353354, 'nurse', 'paulam@shar.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103909994, 'Sandra', 'Newman', 4030179188, 'nurse', 'sandra.newman@unitedasset');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111897751, 'Pamela', 'Ryder', 3335923385, 'nurse', 'pryder@merck.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100520680, 'Alicia', 'Platt', 4146836639, 'paramedic', 'alicia.p@mse.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105193595, 'Red', 'Alexander', 3061329887, 'intern', 'red.alexander@kellogg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104410491, 'Adrien', 'Boyle', 2235273413, 'intern', 'adrien.boyle@inspirations');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100088616, 'Carla', 'Gray', 660199142, 'intern', 'carla.gray@usdairyproduce');
commit;
prompt 800 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103183653, 'France', 'Coleman', 2829206777, 'intern', 'france.coleman@dillards.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103216161, 'Tal', 'Checker', 4009559283, 'nurse', 'tal.c@pharmacia.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108668499, 'Rosanna', 'Stowe', 3372989910, 'intern', 'rosanna.s@idlabel.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114760681, 'Mindy', 'Lillard', 3777139211, 'paramedic', 'mindy.lillard@infovision.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114136655, 'Vertical', 'Hawkins', 2213618509, 'nurse', 'vhawkins@dcgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111353820, 'Tea', 'Channing', 3709057644, 'paramedic', 'tea.channing@viacom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117769726, 'Sonny', 'Lewin', 1892274471, 'intern', 'sonny.lewin@procurementce');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112400690, 'Juice', 'Kingsley', 3209041284, 'nurse', 'juice.kingsley@saksinc.mx');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103654647, 'Delroy', 'Balin', 9712765, 'paramedic', 'delroy.b@unitedasset.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111760168, 'Lonnie', 'Cetera', 2256926322, 'intern', 'lcetera@nhhc.gr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113222350, 'Larry', 'Feuerstein', 3840086467, 'nurse', 'l.feuerstein@evinco.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107154543, 'Breckin', 'Carradine', 1856478588, 'nurse', 'breckin.c@target.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108956310, 'Bo', 'Ronstadt', 1679213583, 'nurse', 'bronstadt@procter.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109509841, 'Rosco', 'Stills', 3483779638, 'nurse', 'rosco.stills@mre.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109548094, 'Buddy', 'Nolte', 1771578928, 'intern', 'buddy.nolte@stm.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111825294, 'Clive', 'Chaykin', 3188387911, 'paramedic', 'clive@irissoftware.mo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101223690, 'Gailard', 'Vaughn', 924073057, 'nurse', 'gailard.vaughn@vfs.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110643115, 'Jena', 'Aiken', 2441344919, 'paramedic', 'j.aiken@philipmorris.lk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102388743, 'Rascal', 'MacIsaac', 1063412191, 'nurse', 'rascal.macisaac@trafficma');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116773774, 'Ralph', 'Condition', 3444321888, 'nurse', 'ralph.condition@typhoon.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117708716, 'Kevin', 'Garner', 4003101325, 'intern', 'kevin.g@signature.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110199344, 'Dick', 'de Lancie', 2820102580, 'intern', 'ddelancie@qssgroup.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105890871, 'Tara', 'Sedgwick', 631892999, 'nurse', 'tara.sedgwick@manhattanas');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100728051, 'Bernie', 'Van Helden', 3913386603, 'nurse', 'berniev@appriss.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107375679, 'Derrick', 'Ifans', 3008853605, 'intern', 'derrick.ifans@procurement');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109890828, 'Sander', 'Richardson', 2893153126, 'intern', 'srichardson@extremepizza.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118198526, 'King', 'Black', 1443367328, 'paramedic', 'king.black@staffforce.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112289873, 'Remy', 'Graham', 2459794074, 'intern', 'r.graham@y2marketing.ve');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111895896, 'Allan', 'Weir', 4115999132, 'intern', 'allan@gltg.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119222409, 'Ellen', 'Sawa', 3309176453, 'intern', 'ellen@safehomesecurity.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105022544, 'Ike', 'Gayle', 3941257773, 'intern', 'ike@componentgraphics.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106613188, 'Taylor', 'Frakes', 724463662, 'intern', 'taylor.frakes@medamicus.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108906137, 'Roger', 'Wood', 3306787272, 'paramedic', 'roger.wood@evinco.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118348535, 'Heather', 'Dalley', 3915462022, 'intern', 'heather@techrx.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103439323, 'Miko', 'Hawkins', 2874438759, 'nurse', 'miko.hawkins@sandyspringb');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109420237, 'Sissy', 'Glenn', 3019799016, 'paramedic', 'sissy.glenn@teamstudio.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115722350, 'Russell', 'Harmon', 2197588507, 'intern', 'russell.harmon@aristotle.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119632818, 'Remy', 'Redford', 2326232814, 'nurse', 'remy.redford@bestever.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106887017, 'Gary', 'Suchet', 1822714240, 'intern', 'gary.s@visainternational.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113794942, 'Mike', 'Plummer', 660927411, 'paramedic', 'mike.plummer@capstone.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100291715, 'Jane', 'Soda', 3639144993, 'paramedic', 'jane@inspirationsoftware.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119118023, 'Nelly', 'Tambor', 3970127115, 'nurse', 'nelly.tambor@faef.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115976829, 'Nicole', 'Depp', 4288099303, 'nurse', 'nicole.depp@allstar.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114412748, 'Neil', 'Walsh', 2991451909, 'nurse', 'neil@aoe.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117366378, 'Vincent', 'Kinnear', 1152036387, 'paramedic', 'vincentk@advancedneuromod');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103969560, 'Barry', 'Dushku', 3626280423, 'paramedic', 'b.dushku@atxforms.py');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103021527, 'Rick', 'Viterelli', 2068207305, 'nurse', 'rick.viterelli@nat.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118960379, 'Hazel', 'Mohr', 3319360782, 'nurse', 'hazel.mohr@tropicaloasis.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117149509, 'Geraldine', 'Reid', 2631974625, 'nurse', 'greid@ceo.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111028684, 'Cesar', 'Ferrell', 1314376049, 'intern', 'cesar@smg.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112788943, 'Lari', 'Deejay', 2848107961, 'intern', 'l.deejay@woronocobancorp.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119657596, 'Kimberly', 'Hatosy', 1381889033, 'intern', 'kimberly.hatosy@techrx.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115664565, 'Ralph', 'Guest', 17997950, 'nurse', 'ralphg@tigris.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104133595, 'Ritchie', 'Fariq', 3640304070, 'intern', 'ritchie.f@wlt.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112161068, 'Teri', 'Underwood', 4066597314, 'nurse', 'teri.u@unica.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113454142, 'Suzi', 'Eckhart', 2810341214, 'nurse', 'seckhart@saralee.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113477356, 'Kelly', 'Wainwright', 1171341361, 'nurse', 'k.wainwright@ssci.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113906807, 'Juan', 'Hawke', 3566188010, 'paramedic', 'j.hawke@streetglow.no');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104586426, 'Cathy', 'Orlando', 2964171829, 'intern', 'cathy.orlando@gulfmarkoff');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119745815, 'Ricky', 'Arthur', 2454280280, 'paramedic', 'ricky.arthur@elite.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109973538, 'Ani', 'McCoy', 4008741607, 'paramedic', 'ani.mccoy@nbs.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111659192, 'Jay', 'Tierney', 1423814, 'paramedic', 'jtierney@logisticare.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109763900, 'Busta', 'Vinton', 1908460252, 'nurse', 'bvinton@whitewave.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101820695, 'Cliff', 'Wayans', 3970977251, 'paramedic', 'cliff@abs.in');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101268544, 'Earl', 'Borgnine', 3124825169, 'paramedic', 'earl@mosaic.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115806268, 'Joe', 'Rickman', 1469161002, 'intern', 'joer@cis.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110442042, 'Miranda', 'Morse', 660655443, 'nurse', 'miranda@bluffcitysteel.hu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100510688, 'Stockard', 'Stiller', 3437711221, 'paramedic', 'sstiller@kingston.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111181819, 'Dermot', 'Dorff', 719869926, 'nurse', 'ddorff@keymark.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106831382, 'Cheech', 'Kershaw', 1051310798, 'intern', 'cheech@labradanutrition.i');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105647728, 'Vivica', 'Womack', 2003932231, 'nurse', 'v.womack@linacsystems.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114611563, 'Todd', 'Vega', 2512129238, 'nurse', 'todd@fordmotor.pl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103122750, 'Melba', 'Jackson', 1959201871, 'paramedic', 'mjackson@mathis.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107045056, 'Mandy', 'Knight', 2966887870, 'intern', 'mandy.k@gna.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104203966, 'Adrien', 'Kline', 1711544023, 'paramedic', 'a.kline@universalsolution');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105470043, 'Robert', 'Eder', 3573589462, 'intern', 'robert.eder@swi.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116862486, 'Shannyn', 'Hoffman', 4049852389, 'paramedic', 'shannyn.hoffman@serviceso');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105799088, 'Larnelle', 'Burke', 1573900054, 'paramedic', 'lburke@smartronix.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109267250, 'Susan', 'Flatts', 3279729029, 'nurse', 'susan@mwh.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103879697, 'Sally', 'Stigers', 4183926318, 'nurse', 'sally.stigers@ghrsystems.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106915355, 'Queen', 'Puckett', 1697409928, 'paramedic', 'queen@cima.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111663480, 'Leelee', 'Palmer', 1189301330, 'intern', 'lpalmer@drinkmorewater.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102575070, 'Charlie', 'Lennix', 37221459, 'intern', 'clennix@globalwireless.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110571831, 'Debby', 'Barry', 1349348847, 'intern', 'debby.barry@directdata.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113882294, 'Oro', 'Glenn', 2564100313, 'paramedic', 'oglenn@medamicus.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115224071, 'Gavin', 'Marsden', 3827144623, 'nurse', 'gmarsden@meridiangold.nz');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106774730, 'Darius', 'Steenburgen', 2462266728, 'intern', 'darius.steenburgen@pib.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111085387, 'Geoff', 'Ammons', 1406689454, 'paramedic', 'geoff.ammons@vms.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108770948, 'Chuck', 'Ruffalo', 3194755547, 'intern', 'chuck.r@viacom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101811718, 'Robby', 'Nicholson', 1272402138, 'intern', 'robby.nicholson@telwares.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101638614, 'Percy', 'Faithfull', 1674378883, 'nurse', 'percy.f@paisley.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106108441, 'Chazz', 'Zane', 2764238613, 'paramedic', 'chazz.zane@hfn.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100884612, 'Jaime', 'Reiner', 3100746257, 'paramedic', 'jreiner@ciwservices.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103294156, 'Kris', 'Coolidge', 2019621174, 'nurse', 'kris.coolidge@marketbased');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110411446, 'Daniel', 'Witherspoon', 3631754034, 'nurse', 'daniel.witherspoon@bowman');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118309749, 'Johnette', 'Sample', 718887134, 'paramedic', 'johnette.s@contract.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113358668, 'Brothers', 'McDiarmid', 2837801547, 'paramedic', 'brothers.mcdiarmid@ads.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103661275, 'Rene', 'Supernaw', 3858316375, 'intern', 'rene.supernaw@timevision.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104393065, 'Grace', 'Hayek', 4077199942, 'nurse', 'grace.h@ultimus.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100480486, 'Elisabeth', 'Furay', 605132676, 'intern', 'elisabeth.f@gsat.uk');
commit;
prompt 900 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110621174, 'Jill', 'Venora', 2571361561, 'paramedic', 'jill.venora@saltgroup.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110004193, 'Lisa', 'Crystal', 906061798, 'nurse', 'lisa@ssci.hu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113274961, 'Cornell', 'Seagal', 769794001, 'nurse', 'cornell.seagal@mwh.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112484166, 'Charles', 'Nivola', 1036539611, 'paramedic', 'charles@captechventures.p');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110301337, 'Michelle', 'Raitt', 1420492354, 'paramedic', 'michelle.raitt@providence');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106190292, 'Robby', 'Myers', 3643007285, 'intern', 'robby.m@questarcapital.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103330062, 'Carlos', 'Holden', 3876795782, 'intern', 'carlos.holden@flavorx.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115738845, 'Howie', 'Irving', 2492464816, 'intern', 'howie.irving@pfizer.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119834833, 'Ivan', 'Witherspoon', 2171962274, 'intern', 'ivan.w@zoneperfectnutriti');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108655253, 'Vonda', 'Rundgren', 1881257896, 'nurse', 'vonda@atlanticnet.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112304992, 'Adam', 'Geldof', 3287181224, 'intern', 'a.geldof@mitsubishimotors');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102168794, 'Orlando', 'Hubbard', 1116347571, 'intern', 'orlando.hubbard@bedfordba');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105316027, 'Ivan', 'Rodriguez', 2620822759, 'nurse', 'ivan@lifelinesystems.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113265325, 'Angelina', 'Wayans', 2342497800, 'nurse', 'awayans@acsis.in');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107511402, 'Deborah', 'Emmerich', 1086619944, 'paramedic', 'deborah.emmerich@nlx.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110770430, 'Sharon', 'Klein', 3677707353, 'intern', 'sharon.k@anheuserbusch.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114991042, 'Vonda', 'Jones', 2451267578, 'intern', 'vonda.jones@unitedasset.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117292242, 'Katrin', 'Pollak', 3844421756, 'paramedic', 'k.pollak@ait.mx');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106416897, 'Mary Beth', 'Warwick', 1303172250, 'paramedic', 'marybeth.warwick@mre.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106252534, 'Julie', 'Morrison', 2721769370, 'nurse', 'julie.morrison@diversitec');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114468732, 'Temuera', 'Depp', 1382372750, 'paramedic', 'temuera.d@loreal.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109081866, 'Olga', 'Rippy', 587855783, 'intern', 'olga.r@meritagetechnologi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103006727, 'Suzi', 'Lloyd', 2303201245, 'paramedic', 'suzi.l@usgovernment.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109448616, 'Judi', 'Oates', 1976418911, 'paramedic', 'judi.o@sunstream.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111345511, 'Maxine', 'McAnally', 2457173496, 'nurse', 'maxinem@greene.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111371590, 'Clive', 'Paltrow', 839247076, 'nurse', 'cpaltrow@vfs.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110129587, 'Hugh', 'Tambor', 843028840, 'intern', 'hugh.tambor@kwraf.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115767917, 'Rob', 'Ryder', 3192654104, 'nurse', 'rob.ryder@advertisingvent');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118185077, 'Gerald', 'Norton', 3157376811, 'nurse', 'gerald@columbiabancorp.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119141174, 'David', 'McElhone', 3041203697, 'paramedic', 'davidm@credopetroleum.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104545698, 'Roddy', 'Remar', 1128492159, 'intern', 'r.remar@capellaeducation.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108176025, 'Ronnie', 'Orlando', 3865707085, 'intern', 'r.orlando@horizonorganic.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109540341, 'Ted', 'Scheider', 2011525956, 'intern', 'ted.scheider@gltg.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117217686, 'Gordon', 'McGill', 3923395364, 'nurse', 'gordon@bashen.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115022267, 'Gloria', 'Shepard', 2112592750, 'paramedic', 'gloria.shepard@stiknowled');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106042499, 'Cuba', 'Soda', 1630251656, 'paramedic', 'cuba.soda@kellogg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104312697, 'Aidan', 'Jolie', 959060741, 'nurse', 'aidan.jolie@granitesystem');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109814111, 'Geoff', 'Cartlidge', 900963144, 'paramedic', 'gcartlidge@deutscheteleko');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103058094, 'Julia', 'Chestnut', 1905108640, 'intern', 'juliac@gillani.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117461179, 'Don', 'Unger', 3924050111, 'paramedic', 'don.unger@dell.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100421186, 'Lee', 'Palin', 4050273445, 'paramedic', 'lee.palin@supplycorecom.f');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105369210, 'Tim', 'Turturro', 1661331183, 'nurse', 'tim@coridiantechnologies.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116448979, 'Pam', 'Perlman', 910665786, 'intern', 'pam.perlman@connected.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100597978, 'Vin', 'Page', 1569747670, 'paramedic', 'vin.page@wellsfinancial.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108252216, 'Julio', 'Russell', 1262257455, 'paramedic', 'julio@talx.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119409739, 'Patti', 'Rizzo', 4018933237, 'nurse', 'patti.rizzo@trekequipment');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104393847, 'Isaac', 'Warburton', 3170564768, 'paramedic', 'isaacw@pearllawgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102156670, 'Lara', 'Kutcher', 701815615, 'intern', 'lara.kutcher@reckittbenck');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103293073, 'Miriam', 'Latifah', 2204554231, 'paramedic', 'mlatifah@sensortechnologi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108184050, 'Bridgette', 'James', 4093929112, 'nurse', 'bridgettej@spas.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116413345, 'Lynn', 'DeVita', 3589102041, 'intern', 'lynn.devita@base.pl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112554196, 'Joaquin', 'Strathairn', 3852827463, 'nurse', 'joaquins@ghrsystems.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117734042, 'Keith', 'Polito', 2339446709, 'paramedic', 'keith.polito@consultants.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102389058, 'Eric', 'McIntosh', 3984955473, 'nurse', 'eric.mcintosh@mqsoftware.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118804237, 'Leon', 'Tomei', 840736524, 'intern', 'ltomei@mcdonalds.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114443778, 'Tobey', 'England', 1701086286, 'nurse', 'tobey.e@ipsadvisory.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112862719, 'Kieran', 'McFadden', 2369802623, 'intern', 'kieran.mcfadden@gltg.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111622432, 'Pelvic', 'Harmon', 3357693266, 'nurse', 'pelvich@stm.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108283438, 'Will', 'Phifer', 2422381272, 'paramedic', 'w.phifer@adolph.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109321697, 'Dabney', 'Hidalgo', 2564165988, 'paramedic', 'dabney.hidalgo@qls.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107297620, 'Hazel', 'Mars', 824495028, 'nurse', 'hazelm@larkinenterprises.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115654401, 'Kevin', 'Patillo', 1882578451, 'paramedic', 'kevin.patillo@infinity.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104073610, 'Red', 'Bugnon', 3895919717, 'nurse', 'red@nha.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104870485, 'Rich', 'Gibson', 4283934123, 'paramedic', 'rich.gibson@ositissoftwar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117555765, 'Juliet', 'Daniels', 3395555401, 'intern', 'juliet.daniels@medamicus.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117067639, 'Kasey', 'Kattan', 881259326, 'nurse', 'kasey.kattan@privatebanco');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107787783, 'Mac', 'Capshaw', 2816073290, 'paramedic', 'mac.c@staffforce.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119836281, 'Kiefer', 'Franks', 739350937, 'nurse', 'kiefer@advancedneuromodul');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116920764, 'Andre', 'Wainwright', 2013500981, 'paramedic', 'andre.wainwright@codykram');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102523797, 'Will', 'McGowan', 2229053265, 'nurse', 'will.mcgowan@ceb.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111362806, 'Heather', 'Sedaka', 2499794211, 'nurse', 'heathers@captechventures.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115803495, 'Ned', 'Laws', 3771009814, 'nurse', 'ned.laws@cws.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107245533, 'Noah', 'Ali', 2589625986, 'paramedic', 'noaha@mavericktechnologie');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100757239, 'Willie', 'Blair', 875520665, 'nurse', 'willie.blair@fns.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118651141, 'King', 'Mills', 1420044183, 'paramedic', 'kingm@sm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112218902, 'Jesus', 'Coltrane', 739677949, 'nurse', 'jesus@jewettcameron.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115786240, 'Humberto', 'Lorenz', 3281428836, 'paramedic', 'h.lorenz@nbs.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106605805, 'Carl', 'Iglesias', 4290141943, 'paramedic', 'c.iglesias@fetchlogistics');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115350286, 'Emmylou', 'Garber', 1579037150, 'paramedic', 'emmyloug@smi.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115054337, 'Jann', 'Lennix', 3614108385, 'intern', 'j.lennix@anworthmortgage.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109989488, 'Vincent', 'Withers', 2100666630, 'nurse', 'vincent.withers@comglobal');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116908072, 'Michelle', 'Chaplin', 4133037587, 'nurse', 'michelle.chaplin@innovati');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113200157, 'Lenny', 'Arden', 852263281, 'intern', 'larden@timberlanewoodcraf');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116676415, 'Angelina', 'Brickell', 2781781904, 'intern', 'angelinab@morganresearch.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119410434, 'Andrae', 'Macht', 849527943, 'intern', 'andraem@servicesource.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116212800, 'Rose', 'Boone', 1872804051, 'intern', 'roseb@fiberlink.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116736126, 'Geraldine', 'Murphy', 2621873995, 'paramedic', 'geraldine.murphy@officede');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114619738, 'Tcheky', 'Cusack', 2159535884, 'nurse', 'tcheky.cusack@mse.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100870423, 'Kiefer', 'Viterelli', 3433259176, 'intern', 'k.viterelli@ubp.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114691954, 'Joaquin', 'Archer', 1057408105, 'nurse', 'joaquin.archer@midwestmed');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103692932, 'Kay', 'Lithgow', 1182967947, 'paramedic', 'kay.lithgow@wendysinterna');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100666022, 'Gordie', 'Fiennes', 1103267619, 'paramedic', 'gordie.fiennes@spinnakere');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115235936, 'Adina', 'Negbaur', 1699021339, 'nurse', 'adina.negbaur@dell.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108269297, 'Denny', 'Quinones', 4283463453, 'paramedic', 'dennyq@datawarehouse.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107284389, 'Grace', 'Finn', 3865726475, 'nurse', 'g.finn@epamsystems.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116058852, 'Hilton', 'Rickman', 2146701327, 'intern', 'hrickman@priorityexpress.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119082072, 'Jet', 'Bedelia', 1540103488, 'paramedic', 'jet.bedelia@ceo.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113158978, 'Alfred', 'Lange', 2657545679, 'paramedic', 'alfred.l@mcdonalds.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115126319, 'Linda', 'Blige', 1047592915, 'nurse', 'lindab@campbellsoup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114550409, 'Mae', 'Barkin', 2523770084, 'intern', 'mae.barkin@infopros.com');
commit;
prompt 1000 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102973032, 'Michael', 'Boone', 2329393799, 'nurse', 'michaelb@blueoceansoftwar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107132882, 'Tzi', 'Crouse', 2015028657, 'intern', 'tzi.c@networkdisplay.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111129912, 'Mika', 'Baez', 2956588502, 'paramedic', 'mika.baez@drinkmorewater.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111673238, 'Kurtwood', 'Unger', 3805411138, 'intern', 'kurtwood.unger@activeserv');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102629226, 'Rowan', 'Skarsgard', 1177428667, 'intern', 'rowan.skarsgard@stmarylan');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106623906, 'Tara', 'Nelligan', 3198428127, 'nurse', 'tara.n@hospitalsolutions.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101359428, 'Alana', 'Quinlan', 2421630792, 'paramedic', 'alana@comnetinternational');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104599604, 'Victor', 'Glenn', 4082045057, 'nurse', 'vglenn@sfb.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113421129, 'Dylan', 'Himmelman', 3061635363, 'intern', 'dylan.himmelman@dynacqint');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113428919, 'Cameron', 'Brooks', 3698685694, 'intern', 'cameron@telepoint.in');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101154645, 'Milla', 'Yankovic', 3571218621, 'nurse', 'milla.yankovic@cns.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113602540, 'Garry', 'Vega', 1878049453, 'nurse', 'gvega@greene.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101580160, 'Nastassja', 'Bugnon', 1290591514, 'nurse', 'nastassjab@aristotle.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100070429, 'Donna', 'Addy', 2839336805, 'intern', 'donna.addy@alohanysystems');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110280414, 'Maggie', 'Culkin', 966454124, 'intern', 'maggie.culkin@zaiqtechnol');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107983962, 'Stanley', 'Nicks', 602011218, 'intern', 'snicks@anworthmortgage.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105475723, 'Danni', 'Yankovic', 4292074384, 'intern', 'danniy@cima.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112082821, 'Rebeka', 'Tah', 2674456617, 'nurse', 'rebeka.tah@tropicaloasis.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111156106, 'Steve', 'Dunn', 2360103535, 'intern', 'steve.dunn@aop.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104069708, 'Red', 'Kotto', 2584571345, 'intern', 'redk@tropicaloasis.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105807844, 'Cevin', 'Sepulveda', 683566056, 'paramedic', 'cevin.s@dell.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114691107, 'Leon', 'Withers', 4140873837, 'paramedic', 'l.withers@dvdt.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106712784, 'Udo', 'Reeves', 1144720149, 'intern', 'udo.reeves@timevision.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101804540, 'Maury', 'Close', 3472982675, 'nurse', 'maury.c@datawarehouse.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113842545, 'Halle', 'Posener', 1397505183, 'nurse', 'halle.posener@hewlettpack');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110009706, 'Mel', 'Hyde', 4105571882, 'nurse', 'mel.hyde@epiqsystems.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101026958, 'Malcolm', 'Miles', 622047855, 'intern', 'malcolm.m@fpf.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113312642, 'Josh', 'Burton', 3986028615, 'paramedic', 'josh.burton@ceb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117030974, 'Debra', 'Gold', 2818114395, 'paramedic', 'debra.g@cns.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118630452, 'Cuba', 'Condition', 3729051338, 'paramedic', 'cuba.condition@gltg.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114517969, 'Lydia', 'Sisto', 1931496814, 'paramedic', 'lydia.sisto@ibm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113647941, 'Maria', 'Fender', 2842276879, 'intern', 'maria.fender@iss.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113763978, 'Geena', 'Holmes', 2885619419, 'nurse', 'geena.holmes@aldensystems');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118517536, 'Nastassja', 'Firth', 855230365, 'intern', 'nastassja.f@diageo.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111494823, 'Laura', 'Kramer', 2458227109, 'paramedic', 'laura.kramer@mindworks.lt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105033359, 'Pam', 'Green', 1537618100, 'paramedic', 'pam.g@newtoninteractive.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107490132, 'Carol', 'Hagar', 1339424650, 'paramedic', 'carol.hagar@ssi.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115972105, 'Buffy', 'Randal', 3895212274, 'nurse', 'buffy.randal@webgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114165764, 'Angelina', 'Damon', 2378047770, 'intern', 'angelina.d@monarchcasino.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107472429, 'Janice', 'Sorvino', 1754066148, 'intern', 'j.sorvino@gltg.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101066577, 'Seann', 'Bonham', 1664463508, 'intern', 'seann.bonham@interfacesof');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111202025, 'Jackie', 'Beckinsale', 2876010130, 'paramedic', 'j.beckinsale@prp.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117766590, 'Taye', 'Murphy', 1888242940, 'paramedic', 'taye.murphy@coldstonecrea');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101343270, 'France', 'O''Donnell', 2341344213, 'paramedic', 'france.odonnell@wlt.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109092054, 'Lupe', 'Horizon', 931945649, 'paramedic', 'lupe.horizon@shot.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103329032, 'Victor', 'May', 1044431554, 'paramedic', 'victor.may@gsat.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101705647, 'Ann', 'Lewin', 1712681623, 'nurse', 'ann.lewin@lloydgroup.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105799583, 'Pete', 'Gibson', 1895227740, 'nurse', 'pete@mission.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115801787, 'Ceili', 'Watley', 855775873, 'nurse', 'cwatley@bradleypharmaceut');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101310348, 'Rhona', 'Bancroft', 4162788990, 'nurse', 'rbancroft@accurateautobod');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110766080, 'Ed', 'Sanders', 3962636331, 'paramedic', 'ed.sanders@aoltimewarner.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108562467, 'Randall', 'Cochran', 869027322, 'paramedic', 'randallc@bat.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115454276, 'Madeline', 'DeLuise', 606829423, 'paramedic', 'madeline.deluise@printing');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104169685, 'Art', 'Atkins', 2904007674, 'intern', 'art@virbac.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118156897, 'Peabo', 'Paltrow', 2172841143, 'nurse', 'p.paltrow@aci.no');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102369865, 'Gary', 'Makowicz', 763527979, 'nurse', 'gary.makowicz@alternative');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101710021, 'Jeff', 'Hoskins', 1474964784, 'paramedic', 'jeff.hoskins@uem.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105912329, 'Salma', 'Evanswood', 1021015397, 'paramedic', 'salma.evanswood@safeway.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114615946, 'Anna', 'Donelly', 1766750815, 'nurse', 'anna.donelly@qas.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119086366, 'Lena', 'Hampton', 2360466689, 'nurse', 'l.hampton@navigatorsystem');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118089317, 'Praga', 'O''Hara', 4020391935, 'paramedic', 'pragao@clorox.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101339823, 'James', 'Crudup', 2897365154, 'paramedic', 'james.crudup@campbellsoup');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108961744, 'Lauren', 'Payne', 941749264, 'nurse', 'l.payne@signature.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100385370, 'Mia', 'Clark', 3442239647, 'paramedic', 'miac@staffone.hk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114403496, 'Miguel', 'Mandrell', 3499741477, 'nurse', 'm.mandrell@nrae.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101862945, 'Scarlett', 'Cheadle', 926100318, 'intern', 'scarlett@solipsys.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113245476, 'Grace', 'Chestnut', 2881879958, 'intern', 'grace.chestnut@dbprofessi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110545395, 'Elijah', 'Hynde', 4135681466, 'nurse', 'e.hynde@ipsadvisory.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107016517, 'Vonda', 'Rauhofer', 3982237480, 'intern', 'vrauhofer@esteelauder.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100448007, 'Sarah', 'Rourke', 1212591285, 'nurse', 'sarah.rourke@apexsystems.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117130066, 'Neneh', 'Van Damme', 2314941910, 'intern', 'neneh.vandamme@codykramer');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116005284, 'Taylor', 'Connery', 2993382929, 'paramedic', 'taylor.connery@adeasoluti');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100472124, 'Chi', 'Hector', 2060272221, 'nurse', 'chi.hector@tilsonlandscap');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101753774, 'Andie', 'Bates', 887238778, 'paramedic', 'andie.bates@mms.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104971993, 'Mindy', 'McCain', 2790115526, 'intern', 'mindy.mccain@egroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102839925, 'Jean-Claude', 'Underwood', 658507275, 'paramedic', 'jeanclaude@ogiointernatio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104892482, 'Richard', 'Phifer', 3997600953, 'intern', 'richard.phifer@entelligen');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106815380, 'Gin', 'Sarsgaard', 1752390951, 'intern', 'gin.sarsgaard@democracyda');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109366623, 'Guy', 'Colon', 1702636310, 'paramedic', 'guy.colon@mindworks.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114231885, 'Gord', 'Meniketti', 3919533305, 'nurse', 'gord.meniketti@pragmatech');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119075657, 'Micky', 'Hedaya', 2911077876, 'paramedic', 'micky.h@trx.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111103620, 'First', 'Pitt', 2822275750, 'nurse', 'first@asa.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118982424, 'Brothers', 'Koteas', 3170177917, 'nurse', 'brothers.koteas@y2marketi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115194150, 'Miles', 'Squier', 655426744, 'intern', 'm.squier@ass.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109604305, 'Johnette', 'Chilton', 582342868, 'intern', 'johnette.chilton@at.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105667346, 'Bob', 'Allen', 3274914220, 'nurse', 'bob@inspirationsoftware.n');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102372842, 'Merle', 'White', 1110615696, 'paramedic', 'merle@lydiantrust.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109109273, 'Gwyneth', 'Lonsdale', 1732434980, 'nurse', 'gwyneth.lonsdale@mms.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115963319, 'Merrill', 'Franklin', 4221684900, 'paramedic', 'merrill.franklin@yumbrand');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104065356, 'Jessica', 'Beckham', 3608218138, 'paramedic', 'jessica@saltgroup.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113714880, 'Breckin', 'Stuermer', 1849570477, 'intern', 'breckin.stuermer@hudsonri');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110799878, 'Meg', 'Miles', 2265565523, 'nurse', 'mmiles@viacom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118172184, 'Christmas', 'Ferrell', 3787210376, 'paramedic', 'christmas.ferrell@prometh');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109197278, 'Molly', 'Gertner', 1887438430, 'paramedic', 'molly@ach.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119126433, 'Udo', 'Oakenfold', 4043556832, 'nurse', 'udoo@nha.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116291729, 'Praga', 'Perez', 4285543987, 'paramedic', 'p.perez@lydiantrust.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108068105, 'Anthony', 'Gates', 925329561, 'paramedic', 'agates@nha.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104076691, 'Carol', 'Richards', 3892149887, 'nurse', 'carol.richards@fflcbancor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107680877, 'Petula', 'Jones', 3716073952, 'intern', 'p.jones@priorityleasing.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104227040, 'Karon', 'Janssen', 4141741523, 'intern', 'karon@banfeproducts.jp');
commit;
prompt 1100 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117345276, 'Olga', 'White', 3033983763, 'nurse', 'olga.white@hardwoodwholes');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101905166, 'Edgar', 'Hector', 2933073079, 'nurse', 'edgar@baesch.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114538526, 'Casey', 'Haysbert', 4225762343, 'intern', 'caseyh@cynergydata.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109879963, 'Frank', 'Martinez', 1385102900, 'nurse', 'f.martinez@stonetechprofe');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116192833, 'Embeth', 'Maxwell', 3414066462, 'paramedic', 'embeth@ipsadvisory.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113747514, 'Natascha', 'Rauhofer', 2569364675, 'nurse', 'natascha.rauhofer@wyeth.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113642714, 'Rod', 'Dooley', 2699812788, 'nurse', 'rod.d@teamstudio.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105273724, 'Jamie', 'Diddley', 1244105153, 'nurse', 'jamie@kingston.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112796601, 'Lisa', 'Reno', 2761685206, 'paramedic', 'lisa@team.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105759233, 'Cloris', 'Heatherly', 2238970397, 'intern', 'cloris.heatherly@carbocer');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101510503, 'Balthazar', 'LaMond', 821822418, 'nurse', 'balthazar.lamond@toyotamo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116729610, 'Fairuza', 'Williams', 928965267, 'intern', 'fwilliams@ach.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118804331, 'Terri', 'Farrell', 3498722389, 'intern', 'terri@summitenergy.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102636381, 'Marlon', 'Jordan', 931030064, 'nurse', 'marlon.jordan@its.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103008658, 'Raul', 'McAnally', 1025515023, 'intern', 'raul.mcanally@dynacqinter');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119906775, 'Coley', 'McDowell', 1825552586, 'intern', 'cmcdowell@techbooks.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101232473, 'Crispin', 'Lucien', 694298610, 'nurse', 'crispin.lucien@fmt.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109383600, 'Rade', 'Maxwell', 3508439877, 'paramedic', 'rade.maxwell@marlabs.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114162501, 'Tamala', 'Robards', 1043334087, 'paramedic', 'tamala.robards@ccb.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113357352, 'Stevie', 'Colman', 3263466477, 'nurse', 's.colman@priorityexpress.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115939669, 'Willem', 'Isaak', 2071742645, 'paramedic', 'willem.isaak@qas.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110466941, 'Rick', 'Torino', 4044549473, 'paramedic', 'rick.torino@campbellsoup.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119259634, 'Bret', 'Palminteri', 1119059926, 'paramedic', 'bret.palminteri@marriotti');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118458008, 'Peabo', 'Beckinsale', 3252562201, 'paramedic', 'peabob@fmb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104216435, 'Nik', 'Candy', 1808268815, 'paramedic', 'nik.candy@astafunding.lt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119652916, 'Meryl', 'Cazale', 3527828281, 'nurse', 'm.cazale@mcdonalds.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112042740, 'Ernie', 'Morton', 2726852122, 'nurse', 'ernie.morton@zoneperfectn');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114770171, 'Nelly', 'Wheel', 865313528, 'intern', 'nelly.wheel@monarchcasino');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107971855, 'Toshiro', 'Taha', 2950632600, 'paramedic', 'ttaha@nhr.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110898675, 'Suzanne', 'McDowall', 2581086350, 'nurse', 'suzanne.mcdowall@cns.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101650028, 'Yaphet', 'Barrymore', 1178514383, 'nurse', 'yaphet.barrymore@diamondg');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110306762, 'Frankie', 'Sossamon', 38923787, 'nurse', 'frankie.sossamon@techrx.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109972401, 'Nick', 'Reynolds', 1067365523, 'nurse', 'nick.r@columbiabancorp.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115012738, 'Red', 'Crosby', 1949764636, 'nurse', 'red.crosby@fmb.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108275444, 'Lily', 'Richardson', 3442766278, 'paramedic', 'lily.richardson@aquickdel');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102091180, 'Scarlett', 'Blossoms', 3151563662, 'paramedic', 's.blossoms@mai.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100570591, 'Sally', 'Chappelle', 1257761370, 'intern', 's.chappelle@whitewave.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106218332, 'Merrill', 'Gano', 2403028168, 'nurse', 'merrill.gano@nat.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118763409, 'Kelli', 'Malone', 3629677128, 'paramedic', 'kmalone@hfg.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115291534, 'Famke', 'Henriksen', 3891096004, 'paramedic', 'famke.henriksen@coldstone');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108587367, 'Debby', 'Weber', 1587580010, 'paramedic', 'dweber@gtp.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119606114, 'Liquid', 'Cartlidge', 1254391022, 'intern', 'liquid.cartlidge@mcdonald');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100180032, 'Shawn', 'Weber', 2268571940, 'paramedic', 'shawnw@pepsico.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108346573, 'Pierce', 'Thurman', 2907862738, 'paramedic', 'pierce.thurman@nobrainerb');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119686682, 'Judge', 'Benson', 1345603562, 'intern', 'judge.benson@kiamotors.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115702064, 'Spencer', 'Guest', 2316106279, 'nurse', 'sguest@nlx.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112710235, 'Marley', 'Dalley', 656199415, 'intern', 'marley.d@bluffcitysteel.i');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100975325, 'Alex', 'Flanagan', 4111751624, 'paramedic', 'alex.flanagan@hfn.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117396138, 'Brittany', 'Torino', 2201568434, 'paramedic', 'b.torino@saltgroup.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113457373, 'Dean', 'Aiken', 2578810340, 'paramedic', 'dean.aiken@jma.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102760975, 'Andre', 'Bentley', 3953125853, 'paramedic', 'andre.bentley@ogi.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115228453, 'Nastassja', 'Whitwam', 2339676089, 'intern', 'nastassjaw@berkshirehatha');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106670514, 'Collin', 'Harnes', 2800436604, 'nurse', 'collin@ipsadvisory.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116506275, 'Dustin', 'Coward', 1712731764, 'nurse', 'dcoward@capitolbancorp.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112095362, 'Jean-Luc', 'Root', 2666578555, 'nurse', 'jeanluc.root@hewlettpacka');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118576047, 'Lonnie', 'Isaacs', 3865539121, 'intern', 'lonnie.isaacs@comglobalsy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118485614, 'Hope', 'Ledger', 3172032479, 'intern', 'h.ledger@noodles.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118798127, 'Night', 'Hanley', 960126560, 'paramedic', 'night.hanley@voicelog.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109139231, 'Vondie', 'MacNeil', 2288266712, 'nurse', 'vondie.m@columbiabancorp.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113041354, 'Stockard', 'Baez', 805298085, 'intern', 'stockard.baez@esteelauder');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110937654, 'Maria', 'Gertner', 2922767922, 'intern', 'maria.gertner@daimlerchry');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106898756, 'Nicole', 'Liotta', 1021982562, 'paramedic', 'nicole.liotta@investments');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111796336, 'Ted', 'Colman', 1272688239, 'nurse', 'ted.colman@peerlessmanufa');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104356908, 'Randall', 'Logue', 3825762420, 'intern', 'rlogue@ssi.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117142261, 'Rip', 'Pollak', 994521993, 'intern', 'rip.pollak@isd.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109427811, 'Talvin', 'Bandy', 2632646483, 'nurse', 'talvin.bandy@perfectorder');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105228331, 'Art', 'Swayze', 1706148880, 'paramedic', 'art.swayze@sunstream.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105979970, 'Judi', 'Llewelyn', 2373979672, 'paramedic', 'judi.l@ataservices.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114009582, 'Mary', 'Preston', 3807222760, 'nurse', 'mary.preston@questarcapit');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117634982, 'Cornell', 'Wopat', 4101907736, 'nurse', 'cornell.wopat@3tsystems.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102927714, 'Jason', 'Bright', 4167077979, 'nurse', 'jason.bright@americanmega');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113528158, 'Jackie', 'Allan', 2507882760, 'intern', 'jackiea@gci.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109818831, 'Meryl', 'Mars', 3224410616, 'paramedic', 'meryl.mars@saltgroup.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113446770, 'Avril', 'Hauer', 3452628135, 'paramedic', 'avril.hauer@daimlerchrysl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105060267, 'Julio', 'Payton', 1829601956, 'paramedic', 'julio.payton@taycorfinanc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115283316, 'Mel', 'Scaggs', 2457634698, 'paramedic', 'mels@dataprise.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104026925, 'Debby', 'Alston', 1730365076, 'paramedic', 'debby.alston@pioneerdatas');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119345248, 'Angela', 'Beckinsale', 2715011202, 'intern', 'angela@granitesystems.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107528240, 'Joe', 'Mueller-Stahl', 3390029896, 'intern', 'j.muellerstahl@mwp.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101913209, 'Mark', 'McDormand', 1507324596, 'paramedic', 'mark.mcdormand@mainstreet');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106491748, 'Rip', 'Plummer', 829957917, 'intern', 'rip.plummer@hotmail.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111656494, 'Jarvis', 'Benson', 3831668022, 'paramedic', 'jarvis.b@dcgroup.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118988263, 'Rosco', 'Costello', 3049797439, 'nurse', 'rosco.costello@generalele');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111280199, 'Lisa', 'Lynne', 2207200092, 'paramedic', 'lisa.l@cardtronics.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109533211, 'Ashley', 'Kinney', 2347862725, 'intern', 'akinney@gtp.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113944571, 'Mekhi', 'Lorenz', 2124079392, 'paramedic', 'mekhi.l@sbc.cl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104871149, 'Nick', 'Waits', 3640461387, 'paramedic', 'nick.waits@efcbancorp.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107636879, 'Manu', 'Moss', 2416088917, 'intern', 'm.moss@shot.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100055088, 'Fats', 'Day-Lewis', 2262233796, 'nurse', 'fdaylewis@dell.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103261839, 'Gwyneth', 'Lynne', 3935777255, 'nurse', 'gwyneth@alohanysystems.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102221810, 'Kid', 'Meyer', 3754388620, 'paramedic', 'kid@qls.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110336198, 'Maggie', 'Lofgren', 2002575064, 'nurse', 'maggie@tps.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111449121, 'Janice', 'Evanswood', 3330259222, 'paramedic', 'janice.evanswood@lms.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107269917, 'Max', 'Singh', 1462203219, 'paramedic', 'max.s@trekequipment.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105128606, 'Deborah', 'Phillippe', 2802743443, 'nurse', 'deborah@sourcegear.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103611619, 'Ali', 'Gibson', 2347492582, 'nurse', 'alig@stonebrewing.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101911953, 'Hex', 'Gambon', 1515815305, 'paramedic', 'hex@abs.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104169503, 'Cheech', 'Marie', 3153147153, 'intern', 'c.marie@conquest.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107876105, 'Julio', 'Reubens', 1001008347, 'nurse', 'julio.reubens@sfb.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105361951, 'Ike', 'Moorer', 2001666555, 'nurse', 'ike.m@americanvanguard.co');
commit;
prompt 1200 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105691088, 'Candice', 'Gary', 2556520241, 'intern', 'candice.gary@fmb.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112665492, 'Holland', 'Gaines', 3508913747, 'nurse', 'holland.gaines@lemproduct');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102119200, 'Kirk', 'Cox', 3055650413, 'intern', 'kirk.cox@trinityhomecare.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118131474, 'Tia', 'Horton', 2655945523, 'intern', 'tia.h@spenser.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104704266, 'Charlie', 'Dolenz', 1751817468, 'paramedic', 'charlied@usdairyproducers');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109757298, 'Jet', 'Uggams', 2569481581, 'nurse', 'jet@astute.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100246578, 'Aidan', 'Singletary', 1363761132, 'paramedic', 'aidan.s@hotmail.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104093434, 'Julia', 'Salonga', 1978623206, 'paramedic', 'julia.salonga@generalelec');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100604994, 'Wade', 'Conroy', 1582025392, 'nurse', 'wade.conroy@zoneperfectnu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104622610, 'Lorraine', 'Brando', 2484749945, 'paramedic', 'lorraine.brando@nlx.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110037534, 'Alfred', 'Choice', 881168124, 'paramedic', 'alfredc@trusecure.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119294752, 'Luke', 'Bachman', 1075861103, 'nurse', 'luke.bachman@refinery.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112129391, 'Bernard', 'Edmunds', 4064809076, 'nurse', 'bernarde@doraldentalusa.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118781647, 'Chrissie', 'Martin', 1880134328, 'intern', 'c.martin@trekequipment.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105090364, 'Benjamin', 'Del Toro', 1969907060, 'nurse', 'benjamin.deltoro@signatur');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111627576, 'Salma', 'Schiavelli', 2139699947, 'paramedic', 'salma.schiavelli@refinery');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106078777, 'Clay', 'Thompson', 2171157409, 'paramedic', 'clay.t@infinity.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114303694, 'Thelma', 'Hughes', 2671437215, 'nurse', 'thelma.hughes@democracyda');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114351535, 'Harold', 'Sinise', 1404254482, 'paramedic', 'harold.sinise@generalmill');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116375151, 'Mia', 'Eastwood', 3089619998, 'nurse', 'mia@news.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107902967, 'Melanie', 'El-Saher', 788169138, 'paramedic', 'melanie.elsaher@intel.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104296772, 'Ceili', 'Buscemi', 834246323, 'intern', 'ceili.buscemi@studiobprod');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103833635, 'Tom', 'Blair', 1397406616, 'intern', 'tom.blair@universalsoluti');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114859710, 'Larry', 'Hatfield', 1354624922, 'intern', 'larry@techrx.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113763974, 'Howie', 'Keen', 3289273614, 'nurse', 'howie.keen@woronocobancor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109052097, 'Micky', 'Crosby', 1198474218, 'intern', 'micky.crosby@americanland');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109501211, 'Kiefer', 'Church', 3389094862, 'intern', 'kiefer.church@generalmoto');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107444569, 'Judy', 'McNeice', 2134930670, 'nurse', 'judy.mcneice@stonetechpro');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110100394, 'Nastassja', 'Craig', 748939441, 'paramedic', 'n.craig@genghisgrill.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116133667, 'Stevie', 'Basinger', 2209271606, 'paramedic', 'stevie.basinger@nexxtwork');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118073989, 'Joy', 'Wills', 583986607, 'nurse', 'joy.wills@fra.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104052851, 'Mekhi', 'Herrmann', 3726268140, 'paramedic', 'mekhi@supplycorecom.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101833656, 'Meg', 'Hornsby', 950118377, 'intern', 'meg@philipmorris.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114214140, 'Michael', 'Warren', 2469412681, 'nurse', 'michael@wav.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102535369, 'Cate', 'Gaynor', 3466903445, 'paramedic', 'cate@formatech.mx');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116743219, 'Rosanne', 'Calle', 809246257, 'nurse', 'rosanne.calle@als.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105403912, 'Kasey', 'Nash', 848699750, 'nurse', 'kasey.nash@americanmegaco');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109552206, 'Allan', 'LaMond', 2830400102, 'nurse', 'allan@verizon.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104021143, 'Laurence', 'Wright', 3324778044, 'paramedic', 'laurence.wright@ezecastle');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110215433, 'Gilbert', 'Rollins', 3650383945, 'nurse', 'gilbert.rollins@aop.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113630917, 'Ramsey', 'Hurt', 2129954746, 'nurse', 'ramsey.hurt@colgatepalmol');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104212117, 'Norm', 'Braugher', 847932210, 'intern', 'norm.braugher@columbiaban');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111189933, 'Lupe', 'Dench', 1690700418, 'nurse', 'lupe.dench@sfmai.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104051781, 'Wes', 'Hatosy', 1198067674, 'nurse', 'wes.hatosy@spas.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104978995, 'Wes', 'Grant', 3303310241, 'nurse', 'wes.grant@vertexsolutions');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110870156, 'Faye', 'Lynch', 729259810, 'intern', 'faye.l@capital.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110003733, 'Sissy', 'Boothe', 1611837183, 'intern', 'sissy.b@kellogg.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103421196, 'Pam', 'Price', 989933724, 'paramedic', 'pam.price@montpelierplast');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108156444, 'Quentin', 'Colon', 1894780970, 'nurse', 'quentin.c@hewlettpackard.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109008985, 'Mike', 'Lane', 1024117098, 'paramedic', 'mike.lane@gentrasystems.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101283000, 'Goran', 'Rizzo', 3196956886, 'nurse', 'goran.rizzo@anheuserbusch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110061477, 'Jena', 'Dorff', 3764623241, 'paramedic', 'jdorff@procurementcentre.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100758088, 'Dick', 'Thompson', 4224626657, 'paramedic', 'dick.thompson@boldtechsys');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110505796, 'Courtney', 'Lonsdale', 1339224828, 'intern', 'courtney.lonsdale@doctors');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113078231, 'Alannah', 'Conners', 688708143, 'nurse', 'alannah.c@nsd.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104737631, 'Ashley', 'Balin', 1353055641, 'intern', 'a.balin@sears.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108981706, 'Albert', 'Morales', 3800184604, 'nurse', 'albert@pharmafab.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113376021, 'Phil', 'Adler', 882934260, 'paramedic', 'phil.adler@paintedword.no');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103200862, 'Solomon', 'Rickles', 3866375051, 'intern', 'solomon.rickles@iss.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101440901, 'Tal', 'Finney', 1656181707, 'intern', 'tal.finney@pds.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114436592, 'Herbie', 'Bonham', 3834770108, 'intern', 'herbieb@kitba.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113621022, 'Jude', 'Crow', 653470960, 'paramedic', 'jude.crow@bat.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107129107, 'Ving', 'Navarro', 2333967616, 'intern', 'ving.navarro@gra.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102848557, 'Veruca', 'May', 2911436428, 'nurse', 'veruca@woronocobancorp.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119106394, 'Mae', 'Law', 1083403424, 'intern', 'mae.law@capitolbancorp.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102949309, 'Victoria', 'Brosnan', 2549678461, 'intern', 'victoria.brosnan@isd.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110354373, 'Willem', 'Gellar', 3210742044, 'paramedic', 'willemg@execuscribe.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119057055, 'Domingo', 'Torn', 652951438, 'paramedic', 'domingo.t@universalsoluti');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110794423, 'Janice', 'Wong', 889769970, 'paramedic', 'janice@solutionbuilders.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108539038, 'Miko', 'Bright', 1444470580, 'nurse', 'miko.b@americanexpress.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103829463, 'Rawlins', 'Todd', 2643029459, 'nurse', 'rawlins.todd@canterburypa');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111405831, 'Chely', 'Snipes', 3451139903, 'intern', 'chely@portosan.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101991984, 'Gordon', 'Doucette', 4005593694, 'nurse', 'gordon.doucette@cooktek.n');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106703979, 'Liv', 'Biel', 2022709625, 'paramedic', 'lbiel@arkidata.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106640775, 'Cevin', 'Patrick', 3482437867, 'intern', 'cevin@mercantilebank.lk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100917985, 'Andy', 'Everett', 2387154584, 'nurse', 'andy.everett@mqsoftware.j');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113428535, 'Alicia', 'Gough', 2815113385, 'nurse', 'a.gough@circuitcitystores');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118835002, 'Lance', 'Hatosy', 758084565, 'intern', 'lanceh@3tsystems.sg');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113754823, 'Geoff', 'Polley', 2276790640, 'paramedic', 'geoff.polley@hewlettpacka');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113110911, 'Dave', 'Mraz', 2373759429, 'intern', 'dave.m@vspan.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105203049, 'Greg', 'Sutherland', 1623620920, 'intern', 'greg.sutherland@shufflema');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102999813, 'Howie', 'Garfunkel', 4152282505, 'nurse', 'howie.garfunkel@safehomes');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101585866, 'Chloe', 'Brock', 3286920313, 'paramedic', 'chloe.brock@acsis.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105502781, 'Donna', 'Bacharach', 2344221615, 'paramedic', 'dbacharach@nhr.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108597450, 'Spike', 'Shatner', 1754632064, 'intern', 'spike.shatner@angieslist.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101776276, 'Jaime', 'Hoffman', 2023557715, 'nurse', 'jaime.h@eagleone.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108022965, 'Trini', 'Kilmer', 2692652197, 'intern', 'trini.kilmer@elitemedical');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119564870, 'Mary', 'Ripley', 1251141930, 'paramedic', 'mary.ripley@shar.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117460866, 'Alfie', 'Kier', 1965536283, 'nurse', 'alfie@ibm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100383151, 'Micky', 'Spears', 1020860240, 'paramedic', 'micky.s@air.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116634735, 'Rascal', 'Checker', 1947269641, 'paramedic', 'rascal@spinnakerexplorati');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108632434, 'Kazem', 'Willard', 3931585289, 'paramedic', 'kazem.willard@wendysinter');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101838032, 'Bebe', 'Sisto', 2417521102, 'intern', 'b.sisto@ris.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105168412, 'Molly', 'Armstrong', 1279795697, 'nurse', 'molly@hencie.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105072721, 'Clea', 'Zappacosta', 1856622356, 'nurse', 'clea@virbac.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108744799, 'Tony', 'Rankin', 3714760687, 'intern', 'tony.rankin@deutschetelek');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106966670, 'Bebe', 'Sledge', 1936866268, 'nurse', 'bebe.s@evergreenresources');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109402237, 'Candice', 'Getty', 1930729936, 'paramedic', 'candice@powerlight.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106757502, 'Neve', 'Coburn', 3849823238, 'paramedic', 'neve.c@bashen.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109527209, 'Caroline', 'Rucker', 1302342234, 'nurse', 'caroline.rucker@sis.com');
commit;
prompt 1300 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106483967, 'Donald', 'Broderick', 2064994341, 'intern', 'dbroderick@tarragonrealty');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119668718, 'Brenda', 'Garner', 1390452620, 'nurse', 'brenda.g@priorityexpress.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110126890, 'Stellan', 'Peet', 3542870229, 'intern', 'stellan.peet@ibm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102428049, 'Colin', 'Porter', 3219117230, 'nurse', 'cporter@gha.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117907158, 'Jason', 'Austin', 2960086923, 'nurse', 'jason.austin@acsis.is');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116895563, 'Mira', 'Martin', 1700435144, 'intern', 'mira.martin@abs.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119655734, 'Mickey', 'Butler', 675011816, 'nurse', 'mickey.butler@exinomtechn');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102994312, 'Nancy', 'Osborne', 3920003624, 'intern', 'nancyo@bioreliance.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102383277, 'Arturo', 'Rawls', 716428991, 'intern', 'arawls@nuinfosystems.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116471018, 'Halle', 'Gallant', 1582845113, 'paramedic', 'halle.gallant@pragmatechs');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102804525, 'Amanda', 'Nash', 1183641932, 'nurse', 'amanda.nash@oss.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102186665, 'Lynette', 'Craig', 3629506435, 'intern', 'lynette.craig@ceo.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113143422, 'Chloe', 'Hynde', 3664236701, 'intern', 'chloe@palmbeachtan.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104952696, 'Amanda', 'Hopkins', 2773781744, 'paramedic', 'amanda.hopkins@microtek.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108586203, 'Rich', 'Ojeda', 2209936484, 'intern', 'rich.o@travizon.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111625506, 'Kieran', 'Scheider', 3979081594, 'paramedic', 'kierans@noodles.in');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112742554, 'Hank', 'Brody', 2072139622, 'nurse', 'hank.brody@parksite.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107364322, 'Gina', 'Braugher', 2431470445, 'paramedic', 'gina.braugher@spas.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104401150, 'Colm', 'Channing', 598877488, 'intern', 'colm.channing@lydiantrust');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113813152, 'Danny', 'Mellencamp', 3277924024, 'nurse', 'danny.mellencamp@grs.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115228848, 'Tia', 'Osborne', 3646571748, 'paramedic', 'tia.osborne@verizon.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110928960, 'Naomi', 'Murphy', 3124388498, 'paramedic', 'naomi.murphy@fmb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110161722, 'Wang', 'Tempest', 3635862114, 'paramedic', 'wang.tempest@tropicaloasi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105296130, 'Richie', 'Renfro', 1014351327, 'paramedic', 'richie.renfro@formatech.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112279146, 'Brittany', 'Wood', 903889980, 'intern', 'bwood@fetchlogistics.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109936757, 'Vondie', 'Cumming', 1863033516, 'nurse', 'vondie.cumming@businesspl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114386486, 'Olympia', 'Sandoval', 4102373896, 'nurse', 'olympia.sandoval@topicsen');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104783107, 'Davey', 'Hatfield', 2269460042, 'intern', 'davey.hatfield@meridiango');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103027510, 'Breckin', 'Farina', 4211130723, 'intern', 'breckin.f@oneidafinancial');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107648087, 'Kyle', 'Lyonne', 2418426267, 'paramedic', 'kyle.lyonne@prosperityban');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108234082, 'Joanna', 'Cervine', 1537126036, 'nurse', 'joannac@progressivedesign');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103654332, 'Cliff', 'Swinton', 2114459077, 'intern', 'cliff.swinton@paintedword');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110205221, 'Cherry', 'Stowe', 2845310858, 'nurse', 'cherry.s@tps.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115323234, 'Ryan', 'Ripley', 3237360001, 'intern', 'ryan.ripley@flavorx.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110604510, 'Teri', 'Page', 1550219912, 'intern', 'teri.p@pearllawgroup.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114255697, 'Javon', 'Lopez', 2504552074, 'paramedic', 'jlopez@sprint.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116751178, 'Rosario', 'Gooding', 3770866426, 'paramedic', 'rosario.gooding@msdw.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118112002, 'Bobby', 'Holeman', 1889175712, 'paramedic', 'b.holeman@calence.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106541526, 'Tcheky', 'Brickell', 2829826270, 'intern', 't.brickell@nsd.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117879659, 'Sharon', 'Benoit', 2446892122, 'intern', 's.benoit@intraspheretechn');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104322620, 'Chalee', 'Quaid', 3192237638, 'intern', 'chalee.q@ecopy.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112434043, 'Chantי', 'Clark', 2486998379, 'nurse', 'chant.clark@ibm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110896824, 'Milla', 'Jay', 813352261, 'intern', 'milla.jay@meridiangold.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104275938, 'Cesar', 'Birch', 3680778213, 'nurse', 'cesar.birch@johnkeeler.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119588050, 'Radney', 'Mohr', 750592594, 'paramedic', 'radney.mohr@walmartstores');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110011225, 'Val', 'Cruise', 1291063011, 'paramedic', 'valc@officedepot.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118793930, 'Deborah', 'Fraser', 2547573037, 'paramedic', 'dfraser@lindin.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104605041, 'Roger', 'Ammons', 4207539717, 'intern', 'roger.ammons@biosite.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107168030, 'Mae', 'Van Der Beek', 1743565858, 'paramedic', 'mae.vanderbeek@pharmafab.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103619936, 'Darren', 'Snider', 3009580668, 'intern', 'dsnider@hewlettpackard.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110279969, 'Kevin', 'Olyphant', 1302862891, 'paramedic', 'k.olyphant@unit.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118007874, 'Drew', 'Savage', 1382331061, 'paramedic', 'drew.savage@capitalbank.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112763165, 'Brad', 'Paul', 4246070058, 'intern', 'brad.p@nhr.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104367336, 'Garth', 'Berkeley', 4046052365, 'paramedic', 'garth.berkeley@sprint.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115299900, 'Ronnie', 'Eder', 2228506298, 'intern', 'ronnie.eder@actechnologie');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116947096, 'Juliette', 'Wells', 2350182317, 'nurse', 'j.wells@gcd.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106223251, 'Carlene', 'Barnett', 2666515347, 'nurse', 'carlene.barnett@teamstudi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116064682, 'Elias', 'Sinatra', 618040414, 'intern', 'esinatra@aoe.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102665075, 'Natalie', 'Pitney', 3736805878, 'nurse', 'natalie.pitney@sms.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110689134, 'Leelee', 'Shepard', 1868240771, 'paramedic', 'leelee.s@linksys.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103414126, 'Donna', 'Chilton', 4248501769, 'nurse', 'donna@comnetinternational');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115658446, 'Jude', 'Jackman', 1179531076, 'nurse', 'jude.jackman@monitronicsi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117417687, 'Lois', 'Benoit', 1245888551, 'nurse', 'l.benoit@intraspheretechn');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107577672, 'Jean-Luc', 'Deejay', 1087632939, 'paramedic', 'jeanluc@morganresearch.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118799362, 'Lance', 'McNeice', 1425009860, 'intern', 'lance.mcneice@mse.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112945794, 'Meredith', 'DiBiasio', 1549030246, 'intern', 'meredith.dibiasio@capital');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109037796, 'France', 'Forster', 2742560607, 'paramedic', 'france.forster@mss.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104495694, 'Shawn', 'Hatfield', 2030195487, 'nurse', 'shawn.h@pinnaclestaffing.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104399516, 'Isaac', 'Blaine', 704251439, 'nurse', 'isaac@bowman.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100063592, 'Claude', 'Bridges', 2838777297, 'intern', 'c.bridges@marketbased.at');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108940347, 'Parker', 'Tillis', 1055756072, 'paramedic', 'parker.tillis@canterburyp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107639758, 'Eugene', 'May', 1425776096, 'paramedic', 'eugene.may@fiberlink.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104434265, 'Cledus', 'Minogue', 3578998265, 'paramedic', 'cledus.m@fiberlink.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115559484, 'Claire', 'Merchant', 1756847801, 'intern', 'claire@nobrainerblindscom');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103639155, 'Illeana', 'Spader', 2367628798, 'nurse', 'illeana.spader@glacierban');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110609447, 'Meryl', 'Garfunkel', 3848824122, 'paramedic', 'meryl.garfunkel@nha.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100439071, 'Junior', 'DeVito', 2737163620, 'intern', 'junior.devito@capitalauto');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110678255, 'Liev', 'Stewart', 3205439064, 'nurse', 'l.stewart@mainstreetbanks');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108795881, 'Omar', 'Horizon', 1793837548, 'nurse', 'omar.horizon@safeway.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107005651, 'Donald', 'Brando', 801112210, 'intern', 'donald.brando@tlsserviceb');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100154087, 'Emerson', 'Macy', 1759107576, 'intern', 'emerson.macy@dcgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112941295, 'Davis', 'Neil', 1569241725, 'nurse', 'davis.neil@sony.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104525256, 'Jose', 'Paltrow', 4233438201, 'nurse', 'jose.p@datawarehouse.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116195869, 'Andrae', 'Estevez', 1642232689, 'paramedic', 'andrae.estevez@cowlitzban');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109336883, 'Lois', 'Cook', 3390957673, 'paramedic', 'lois.cook@allegiantbancor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109563376, 'Pablo', 'Cohn', 4292762405, 'nurse', 'pablo@trinityhomecare.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116092354, 'Buffy', 'Gleeson', 1482518584, 'intern', 'buffy.gleeson@marketfirst');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105528669, 'Ruth', 'Dern', 1864822821, 'nurse', 'ruth.dern@bestbuy.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112031179, 'Taryn', 'Rydell', 2076484806, 'intern', 'taryn.r@lms.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102680577, 'Phoebe', 'Frost', 1808713034, 'intern', 'phoebe.frost@codykramerim');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113073379, 'Lucinda', 'Mars', 1402273375, 'nurse', 'lucinda@telecheminternati');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111593509, 'Jody', 'Benson', 2397698414, 'paramedic', 'j.benson@newmedia.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119780425, 'Jean', 'Sandoval', 3611044667, 'paramedic', 'jsandoval@zaiqtechnologie');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100712201, 'Gene', 'Flemyng', 2195852195, 'nurse', 'gene.flemyng@generalelect');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112490015, 'Ian', 'Thomson', 4068912864, 'intern', 'ian.thomson@infinity.si');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116729549, 'Liquid', 'Breslin', 2694832419, 'intern', 'liquid@unit.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117459585, 'Wesley', 'Galecki', 2119646591, 'nurse', 'wesley.galecki@abs.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100604268, 'Luke', 'Robards', 2639300053, 'paramedic', 'luke.robards@signalperfec');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104249482, 'Rosanne', 'Saucedo', 4189691446, 'nurse', 'rosanne.saucedo@diageo.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109282548, 'Eileen', 'Gordon', 1628334071, 'nurse', 'egordon@credopetroleum.co');
commit;
prompt 1400 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113956151, 'Kelly', 'Robards', 1709088301, 'nurse', 'krobards@slt.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101804478, 'Joaquim', 'Thorton', 3019888706, 'nurse', 'joaquim.thorton@newhorizo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106862010, 'Lou', 'Willis', 2315170402, 'intern', 'lou.willis@bristolmyers.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103237810, 'Kieran', 'Cohn', 3056570153, 'paramedic', 'kieran@marketfirst.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102944595, 'Kay', 'James', 2505344234, 'intern', 'kay@nissanmotor.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109518193, 'Solomon', 'DiFranco', 2843257693, 'nurse', 'solomon@teamstudio.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102078371, 'Cevin', 'Dillon', 2112777451, 'intern', 'cdillon@callhenry.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109583108, 'Alicia', 'Valentin', 987465499, 'nurse', 'avalentin@teoco.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115378090, 'Kiefer', 'Baker', 3188351420, 'paramedic', 'k.baker@avr.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107516777, 'Brad', 'Curtis-Hall', 676940878, 'nurse', 'brad.curtishall@cis.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105897642, 'Scott', 'Gallant', 2263396988, 'paramedic', 'sgallant@grs.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116209784, 'Richard', 'Patton', 4127548678, 'paramedic', 'richard.p@streetglow.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105368232, 'Rick', 'Herndon', 3239879988, 'paramedic', 'rick.herndon@conquest.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105878205, 'William', 'Streep', 2987536568, 'paramedic', 'william.streep@infovision');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101151531, 'Debby', 'Bandy', 1655689556, 'paramedic', 'debby.bandy@kingland.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117859939, 'Morris', 'Tennison', 1993946294, 'paramedic', 'morris.tennison@healthscr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101020329, 'Kelly', 'Lorenz', 1114988176, 'paramedic', 'kelly.lorenz@actechnologi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104366376, 'Wang', 'Kudrow', 3692346869, 'intern', 'wang@philipmorris.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103208287, 'Rory', 'Hackman', 1330607518, 'paramedic', 'rhackman@verizon.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119821446, 'Jane', 'Allen', 2658681470, 'nurse', 'jallen@daimlerchrysler.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103900588, 'Nicky', 'Polley', 2090699821, 'intern', 'nickyp@pis.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108111977, 'Luis', 'Levy', 841266536, 'intern', 'luis.levy@lynksystems.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119791355, 'Hank', 'Crystal', 798073759, 'paramedic', 'hank@avs.pl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102801775, 'Rich', 'Steiger', 1306432552, 'nurse', 'rich.steiger@naturescure.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112321535, 'Jet', 'Belles', 2616754179, 'nurse', 'j.belles@horizonorganic.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116319731, 'Joaquim', 'Swinton', 2165195214, 'nurse', 'joaquim.swinton@axis.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100895004, 'Bradley', 'Dalley', 1922888076, 'paramedic', 'bradley.dalley@americanva');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109925403, 'Belinda', 'Grant', 3383177989, 'intern', 'b.grant@venoco.dk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119914420, 'Victoria', 'Tambor', 1341106410, 'nurse', 'victoria@carteretmortgage');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106708451, 'Humberto', 'Ellis', 846087756, 'intern', 'humbertoe@investorstitle.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111009032, 'Vendetta', 'Dickinson', 2840865818, 'nurse', 'vendetta@nobrainerblindsc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108797501, 'Andy', 'Yorn', 2710531357, 'paramedic', 'ayorn@airmethods.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119527983, 'Shirley', 'Mellencamp', 2503359291, 'intern', 's.mellencamp@afs.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107502406, 'Azucar', 'Kattan', 3749093597, 'paramedic', 'a.kattan@generalelectric.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112563559, 'Veruca', 'Stewart', 1255387025, 'nurse', 'vstewart@oneidafinancial.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100447074, 'Tal', 'Stoltz', 3167785075, 'paramedic', 't.stoltz@denaliventures.b');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105707362, 'Maxine', 'Holiday', 1610191259, 'intern', 'maxine.holiday@mms.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104863851, 'Julianne', 'Waits', 595872981, 'nurse', 'julianne.waits@loreal.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112843045, 'Ivan', 'Kirshner', 3955895318, 'intern', 'ivan.kirshner@marketfirst');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102679772, 'Isabella', 'Postlethwaite', 1183955848, 'paramedic', 'i.postlethwaite@mitsubish');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103496222, 'Richard', 'Aiken', 2252112506, 'intern', 'richard.a@yumbrands.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107899929, 'Donald', 'Folds', 3391481989, 'paramedic', 'dfolds@greene.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114366208, 'Raymond', 'Morse', 2771563643, 'nurse', 'raymond@drinkmorewater.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105194611, 'Nikka', 'Thorton', 3280061498, 'nurse', 'nikka@pearllawgroup.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117331874, 'Freddie', 'Beckinsale', 3882760366, 'paramedic', 'freddie@calence.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107969695, 'Powers', 'Harary', 1674966654, 'nurse', 'powers.h@aventis.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101715234, 'Lucinda', 'Nash', 1651167255, 'intern', 'lucinda.nash@gra.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114127394, 'Bonnie', 'King', 778447656, 'paramedic', 'bonnie.king@newhorizons.a');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114897255, 'Wade', 'Winger', 922316653, 'paramedic', 'wade.winger@newhorizons.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105571222, 'Isaiah', 'Lee', 4283153966, 'nurse', 'i.lee@biosite.tr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118632412, 'Michael', 'Garza', 2052197034, 'nurse', 'michael.garza@jewettcamer');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113910889, 'Cherry', 'Adler', 3347729926, 'intern', 'cherrya@aci.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109213900, 'Maggie', 'Chung', 3238043769, 'nurse', 'maggie@newmedia.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103965252, 'Angelina', 'Cronin', 2293769524, 'intern', 'angelina@ccb.hu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104805122, 'Janice', 'Buckingham', 4068279140, 'nurse', 'janice.buckingham@neogen.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110335486, 'Sander', 'Northam', 860557760, 'intern', 'sander.northam@harrison.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112541998, 'Jason', 'D''Onofrio', 1880504823, 'intern', 'jason@carteretmortgage.mx');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104364278, 'Gaby', 'Guilfoyle', 1952843760, 'intern', 'gaby.guilfoyle@refinery.i');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109321696, 'Kay', 'Merchant', 894463239, 'nurse', 'kay.m@cocacola.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110048905, 'Brent', 'Whitman', 3586994197, 'intern', 'brent.whitman@its.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113024966, 'Gena', 'Molina', 2792296431, 'paramedic', 'gena.molina@lemproducts.j');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115434587, 'Juliet', 'LaPaglia', 3336423368, 'nurse', 'julietl@gdi.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102497002, 'Maura', 'Tate', 1460276840, 'nurse', 'maura.tate@tracertechnolo');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103946676, 'Kim', 'Brooks', 592759867, 'nurse', 'kimb@loreal.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112778221, 'Harrison', 'Waite', 4145875413, 'intern', 'harrison.waite@sfb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110447903, 'Albert', 'Colon', 1540399671, 'paramedic', 'albert.colon@eastmankodak');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117020239, 'Marina', 'Hudson', 3874708730, 'intern', 'marina.hudson@perfectorde');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111710703, 'Andre', 'Ceasar', 2369072092, 'nurse', 'andre@generalmotors.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105839849, 'Javon', 'DeGraw', 2899095041, 'intern', 'javon.degraw@heartlab.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118468688, 'Connie', 'Oakenfold', 3529508600, 'nurse', 'connie.oakenfold@pib.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114044473, 'Collective', 'Balk', 2459294225, 'paramedic', 'collective.balk@spenser.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117238481, 'Yolanda', 'Stowe', 2226560116, 'paramedic', 'yolanda@safehomesecurity.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103091338, 'Meredith', 'Suchet', 3471821140, 'intern', 'meredith@wlt.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102016362, 'Morris', 'McDowall', 2557725729, 'paramedic', 'mmcdowall@printingforless');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104753863, 'Ming-Na', 'Karyo', 1795917982, 'intern', 'mingna@marketbased.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113019947, 'Roger', 'Blaine', 2351206820, 'intern', 'rblaine@ams.ar');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110824817, 'Vanessa', 'Woods', 3318601789, 'paramedic', 'vanessa.woods@sears.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114046633, 'Rosario', 'Griffith', 1840381164, 'intern', 'rosario@fpf.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106400836, 'Harvey', 'Thomas', 1497186281, 'intern', 'harvey.t@waltdisney.fi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108711528, 'Halle', 'Charles', 909558040, 'intern', 'halle.charles@at.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107223874, 'Anita', 'Bryson', 4164330321, 'paramedic', 'anita.bryson@eastmankodak');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113645004, 'Gino', 'Ammons', 3357568099, 'paramedic', 'gino.ammons@kroger.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119989649, 'Arturo', 'Steiger', 1409656175, 'nurse', 'arturo.steiger@lloydgroup');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112110732, 'Vickie', 'Perrineau', 4064463714, 'intern', 'vickiep@ungertechnologies');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108553358, 'Johnnie', 'Alexander', 2195794295, 'paramedic', 'johnnie.a@usgovernment.il');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117474466, 'Alice', 'Everett', 2003796817, 'intern', 'alicee@ctg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119125830, 'Toshiro', 'Sinatra', 4251864629, 'paramedic', 'toshiro.sinatra@clubone.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115097204, 'Nastassja', 'McKellen', 2057604768, 'intern', 'nastassja@lynksystems.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106397485, 'Harriet', 'Hoskins', 2306144819, 'paramedic', 'harriet.hoskins@horizonor');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110286685, 'Bernard', 'Hedaya', 3597215753, 'intern', 'bernard.h@irissoftware.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116401782, 'Gina', 'Patrick', 3099521944, 'paramedic', 'gina.patrick@hps.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115143337, 'Mitchell', 'Walken', 1739116655, 'nurse', 'mitchell.walken@north.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100416468, 'Rachel', 'Shocked', 2482969885, 'nurse', 'rachel.shocked@hudsonrive');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101995321, 'Carla', 'Carrey', 1385829765, 'nurse', 'ccarrey@socketinternet.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106905650, 'Laurie', 'Mueller-Stahl', 1608315652, 'nurse', 'laurie.muellerstahl@eagle');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117343752, 'Nora', 'Rowlands', 2006491706, 'paramedic', 'nora.rowlands@sprint.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104658740, 'Julia', 'Cole', 951811244, 'nurse', 'jcole@keith.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105460170, 'Morris', 'Maguire', 2708194609, 'paramedic', 'morrism@dvdt.pl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107401772, 'Cyndi', 'Kapanka', 4190061958, 'paramedic', 'cyndi.kapanka@timevision.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117067757, 'Anjelica', 'Osmond', 3154695532, 'nurse', 'anjelica.osmond@prp.nl');
commit;
prompt 1500 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117410046, 'Cate', 'Singh', 3178533513, 'intern', 'c.singh@novartis.tw');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119511623, 'Jessica', 'Peterson', 1754167242, 'intern', 'jessica.peterson@avs.hu');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107587117, 'Lizzy', 'Clooney', 4207057016, 'intern', 'lizzy.c@cws.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106513690, 'Rade', 'Biehn', 3257902931, 'intern', 'rade.biehn@gateway.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100888307, 'Gran', 'Glenn', 2220219827, 'intern', 'gran.glenn@dcgroup.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105567386, 'Marina', 'May', 2504031516, 'paramedic', 'mmay@nuinfosystems.cy');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115287541, 'Marley', 'Perry', 3688992149, 'paramedic', 'marley@spectrum.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117397493, 'April', 'Laws', 1874829318, 'intern', 'april.laws@randomwalk.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108327988, 'Burt', 'Meyer', 3826660720, 'intern', 'burt@scripnet.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103569817, 'Sheryl', 'Tyson', 2632921763, 'nurse', 'sheryl.t@yashtechnologies');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104788363, 'Giovanni', 'Archer', 3097218994, 'paramedic', 'g.archer@intel.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115141191, 'Azucar', 'Weber', 2427734108, 'paramedic', 'azucarw@tps.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113455051, 'Stockard', 'Plummer', 2445593513, 'nurse', 'stockardp@scooterstore.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111378726, 'Ryan', 'O''Donnell', 3099661075, 'nurse', 'ryan@bashen.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115426457, 'Heath', 'Wolf', 2767004014, 'nurse', 'hwolf@trm.au');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117692012, 'Pamela', 'Huston', 2811635611, 'paramedic', 'pamela.huston@drinkmorewa');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116822129, 'Regina', 'Santana', 587575553, 'intern', 'regina.santana@columbiaba');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103157782, 'Marie', 'Aykroyd', 3827489799, 'intern', 'marie@dps.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107083833, 'Frances', 'Robards', 880572255, 'intern', 'frances.robards@jcpenney.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119683152, 'Garth', 'Black', 594574625, 'paramedic', 'garth@kmart.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111466802, 'Ashley', 'Davidtz', 2054917223, 'intern', 'ashley.davidtz@lydiantrus');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100147611, 'Ashley', 'McCabe', 867861041, 'paramedic', 'amccabe@fmi.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114066525, 'Chad', 'Mahood', 2334282050, 'paramedic', 'c.mahood@zaiqtechnologies');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119265345, 'Glen', 'Arquette', 3546585905, 'nurse', 'glen.arquette@vfs.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111118449, 'Sander', 'Aaron', 1067669351, 'intern', 'sander.aaron@allstar.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113523849, 'Ray', 'Llewelyn', 3904802243, 'nurse', 'ray.llewelyn@capitalautom');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115022774, 'Matt', 'Quinlan', 1694073383, 'paramedic', 'mattq@nrae.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117308326, 'Candice', 'Jordan', 3376610046, 'nurse', 'candice.jordan@vivendiuni');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100281198, 'Jesus', 'Willard', 2983202598, 'nurse', 'jesus.w@lindin.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113126628, 'Ozzy', 'Estevez', 1098824394, 'intern', 'ozzy@gentrasystems.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116807607, 'Rachid', 'Tankard', 1261501706, 'intern', 'rachid.tankard@deutschete');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104202582, 'Kelli', 'McDonnell', 3115452292, 'nurse', 'kelli.mcdonnell@sourcegea');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119032313, 'Katrin', 'Payne', 1824963732, 'paramedic', 'katrin@pacificdatadesigns');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103532277, 'Omar', 'Ledger', 1209440136, 'paramedic', 'oledger@ceb.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103124377, 'Gabriel', 'Murphy', 3477996966, 'intern', 'gabriel.m@usainstruments.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117020657, 'Juan', 'Brothers', 3095307459, 'intern', 'j.brothers@kellogg.pl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117957366, 'Alessandro', 'LaSalle', 1906491493, 'intern', 'alessandro@pscinfogroup.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116731144, 'Humberto', 'Navarro', 1894611340, 'paramedic', 'humberton@mindiq.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116614074, 'Adam', 'Blair', 1423952841, 'nurse', 'adam@portageenvironmental');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110395850, 'Nancy', 'Lang', 2809099748, 'paramedic', 'nancy.lang@knightsbridge.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115099479, 'Jackson', 'Dzundza', 3776781572, 'nurse', 'jackson.dzundza@palmbeach');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106005066, 'Charlize', 'McDonald', 3191381064, 'paramedic', 'charlize.mcdonald@intrasp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115415628, 'John', 'Diddley', 4276769427, 'intern', 'john.diddley@kwraf.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101418069, 'Helen', 'Tankard', 2691201352, 'intern', 'helent@trusecure.pt');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110311208, 'Gilbert', 'Downie', 2157709128, 'paramedic', 'gilbertd@doraldentalusa.n');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104505799, 'Zooey', 'Bates', 3764621337, 'intern', 'zooey.bates@dataprise.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114137866, 'Brittany', 'Loggins', 1921268663, 'nurse', 'brittany.l@greene.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111110674, 'Bobbi', 'Spall', 2808673501, 'intern', 'bobbi@kramontrealty.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117056811, 'Gilberto', 'Cook', 2865512565, 'intern', 'gilbertoc@tropicaloasis.a');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111565321, 'Gabrielle', 'Arthur', 3519128829, 'paramedic', 'gabrielle.arthur@campbell');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106186519, 'Hope', 'Ceasar', 1432092192, 'intern', 'hope@sbc.nl');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108397384, 'Balthazar', 'Morton', 1902880289, 'intern', 'balthazar.m@inspirationso');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114644697, 'Alex', 'Newman', 1355088396, 'nurse', 'alex@coldstonecreamery.co');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101799973, 'Goldie', 'Levine', 1556484584, 'nurse', 'goldie.l@typhoon.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115202803, 'Vonda', 'Begley', 2538424660, 'paramedic', 'vonda.begley@spd.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115147338, 'Bernie', 'Meniketti', 1165956640, 'intern', 'bernie.meniketti@trekequi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119947679, 'Hector', 'Weir', 3380612876, 'nurse', 'hector.weir@vertexsolutio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100855377, 'Kylie', 'Pacino', 2779552965, 'intern', 'kylie.pacino@pscinfogroup');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111851732, 'Lou', 'Cassidy', 2621016413, 'nurse', 'l.cassidy@hencie.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117405583, 'Judy', 'Soda', 1952914789, 'paramedic', 'judys@captechventures.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102562330, 'Carrie-Anne', 'Close', 3513746424, 'paramedic', 'carrieanne.close@operatio');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112358361, 'Kiefer', 'Pollack', 4150777873, 'paramedic', 'kpollack@palmbeachtan.id');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110903319, 'Desmond', 'Starr', 671284909, 'nurse', 'desmond.starr@usainstrume');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118148957, 'Bridgette', 'Horizon', 1071496983, 'nurse', 'bridgette.horizon@scooter');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116519576, 'Jackie', 'Brody', 1571239342, 'paramedic', 'jackie.brody@faef.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119603350, 'Madeline', 'McGoohan', 1050556472, 'nurse', 'madeline.mcgoohan@knights');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109121853, 'Darius', 'Herndon', 3090095905, 'intern', 'darius.herndon@pinnaclest');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112171351, 'Nickel', 'Shearer', 1838060835, 'intern', 'nickel.shearer@mission.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114125242, 'Geggy', 'Penders', 2948437654, 'paramedic', 'geggyp@studiobproductions');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114423288, 'Barry', 'Tankard', 622803230, 'intern', 'barry@doraldentalusa.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119743812, 'Tori', 'Tripplehorn', 3158568285, 'intern', 'tori@fmi.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105463080, 'Burt', 'Lowe', 3869366151, 'paramedic', 'b.lowe@gdi.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115532717, 'Mena', 'Nolte', 3350378195, 'intern', 'mnolte@pepsico.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102223288, 'Casey', 'Tempest', 1444184460, 'paramedic', 'casey@abs.es');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119574206, 'Patty', 'Coyote', 3351932230, 'intern', 'patty.coyote@horizon.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107876292, 'Buddy', 'Harmon', 3255858371, 'nurse', 'bharmon@thinktanksystems.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101645584, 'Rebeka', 'Sampson', 3853919473, 'paramedic', 'rebeka.sampson@ogiointern');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114913908, 'Stephen', 'Faithfull', 1323930919, 'nurse', 'stephen.faithfull@infovis');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109266640, 'Keith', 'Franklin', 3153537825, 'intern', 'keith.franklin@tama.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109331181, 'Warren', 'Kramer', 2186189602, 'paramedic', 'warrenk@ubp.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118795543, 'Ed', 'Rossellini', 3564901941, 'intern', 'ed.rossellini@fflcbancorp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100197162, 'Viggo', 'Broza', 4253076333, 'nurse', 'viggo.broza@fds.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103463656, 'Morris', 'Glenn', 3172753369, 'nurse', 'morris.g@teamstudio.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103645079, 'Hex', 'Matarazzo', 1270683418, 'nurse', 'hex.m@north.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114946727, 'Geoffrey', 'Reed', 3481714485, 'paramedic', 'greed@visionarysystems.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107945393, 'Gary', 'Giannini', 2079373002, 'nurse', 'garyg@generalmills.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102125505, 'Lucy', 'Whitmore', 2425133965, 'paramedic', 'lucy@ahl.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119217592, 'Hookah', 'Parsons', 2299051362, 'nurse', 'hookah.parsons@ris.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108668434, 'Deborah', 'McIntosh', 1111296708, 'nurse', 'deborah.mcintosh@myricom.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104859574, 'Mary Beth', 'Seagal', 3148638234, 'intern', 'marybeth.s@formatech.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114542739, 'Garry', 'Lineback', 2361710512, 'intern', 'garry.lineback@gtp.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116519996, 'Natascha', 'Osmond', 2525629860, 'nurse', 'natascha.osmond@parker.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118798829, 'Fionnula', 'Cage', 3359204771, 'nurse', 'fionnula.cage@studiobprod');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110548007, 'Daryle', 'Firth', 4007337182, 'paramedic', 'daryle@vitacostcom.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102389953, 'Isabella', 'Fierstein', 2715652006, 'paramedic', 'isabella@investmentscorec');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110525325, 'Micky', 'Rydell', 2723812741, 'nurse', 'mickyr@airmethods.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111559663, 'Lili', 'Jackson', 2195154905, 'nurse', 'lili@whitewave.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116168520, 'Denise', 'Cattrall', 2931343141, 'paramedic', 'denise.cattrall@mcdonalds');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105360344, 'Marc', 'Zellweger', 3099291382, 'paramedic', 'marc.z@infinity.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117761700, 'Aidan', 'Belushi', 2445537910, 'paramedic', 'aidan.belushi@profitline.');
commit;
prompt 1600 records committed...
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114431654, 'Bette', 'Hauer', 1514802885, 'intern', 'bette@sht.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113442330, 'Mike', 'Fishburne', 3466064178, 'intern', 'm.fishburne@gapinc.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (102292025, 'Angelina', 'Brickell', 2442990010, 'paramedic', 'angelina.brickell@america');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111671448, 'Davey', 'Curry', 799705255, 'nurse', 'daveyc@yashtechnologies.c');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105068122, 'Dermot', 'Oszajca', 967822799, 'paramedic', 'dermot.oszajca@fmi.br');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100942850, 'Kyra', 'Dorn', 3437978638, 'paramedic', 'kyra.d@cyberthink.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112066736, 'Lupe', 'Broderick', 2510930197, 'nurse', 'lbroderick@vivendiunivers');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117069034, 'Toni', 'Pigott-Smith', 1127933849, 'intern', 'toni@summitenergy.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (119274910, 'Cole', 'Schwimmer', 2392185567, 'paramedic', 'cole.schwimmer@hudsonrive');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115260015, 'Cornell', 'McNarland', 3564283923, 'intern', 'cornell.mcnarland@bioanal');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114450427, 'Pete', 'Cummings', 813479418, 'paramedic', 'pete.cummings@grayhawksys');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105222449, 'Desmond', 'Zane', 3297800438, 'nurse', 'desmond.zane@hfn.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113192227, 'Ivan', 'Haynes', 2760876351, 'intern', 'ivan@younginnovations.it');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111490128, 'Lily', 'McGoohan', 2761316445, 'paramedic', 'lily.mcgoohan@fab.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110015064, 'Christopher', 'Child', 1107580499, 'intern', 'christopher.child@mitsubi');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112957924, 'Val', 'Overstreet', 2087803366, 'intern', 'val.overstreet@bayer.jp');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104134011, 'Rene', 'McLachlan', 3824496873, 'paramedic', 'rene.mclachlan@usgovernme');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114487845, 'Doug', 'Cusack', 2004837264, 'intern', 'doug.cusack@carteretmortg');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (110764726, 'Teena', 'Lizzy', 2705124751, 'paramedic', 'teena@boldtechsystems.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (105329904, 'Jon', 'Faithfull', 3401599225, 'paramedic', 'jon.f@saksinc.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112000725, 'Buffy', 'Popper', 3290108429, 'nurse', 'buffyp@smi.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109436701, 'Gaby', 'LaPaglia', 3418133518, 'nurse', 'gaby.lapaglia@netnumina.d');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (106495810, 'Johnnie', 'Alda', 727882588, 'paramedic', 'johnniea@balchem.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (112392593, 'Debbie', 'Mollard', 1797417719, 'paramedic', 'd.mollard@nha.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103196386, 'Debi', 'Costner', 1233040512, 'intern', 'debi.costner@berkshirehat');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (118631586, 'Humberto', 'Imperioli', 759006466, 'nurse', 'humbertoi@heartlab.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (109851989, 'Rowan', 'Pollack', 1054854280, 'nurse', 'rowan.p@csi.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101593886, 'Ellen', 'Tripplehorn', 3515706960, 'intern', 'ellen.tripplehorn@gtp.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100113199, 'Wes', 'Rio', 3006554355, 'paramedic', 'wes.rio@epiqsystems.be');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103407131, 'Samantha', 'Rebhorn', 2803192881, 'intern', 'samantha.rebhorn@linksys.');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117194824, 'Davis', 'Kapanka', 4187668096, 'paramedic', 'davis@softworld.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115316077, 'Harris', 'Lennix', 3294863781, 'intern', 'harris.lennix@bmm.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101593787, 'Parker', 'Vai', 1661092569, 'intern', 'parker.v@efcbancorp.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103531013, 'Teri', 'Tyson', 2378293572, 'nurse', 'teri.tyson@shar.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (115814939, 'Carol', 'Sevigny', 1366497083, 'intern', 'carol.s@inzone.uk');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108249032, 'Vern', 'Burmester', 4132120462, 'intern', 'vern.b@als.de');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (104455633, 'Sal', 'Diddley', 3232821410, 'paramedic', 'sal.diddley@nbs.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100720820, 'Dianne', 'Wine', 2609303733, 'intern', 'dianne.w@younginnovations');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111432130, 'Chrissie', 'Sandler', 3588260331, 'nurse', 'chrissie.s@hfg.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (108639758, 'Whoopi', 'Reynolds', 3790795403, 'nurse', 'whoopir@novartis.za');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101140489, 'Shawn', 'Valentin', 2319465422, 'paramedic', 'shawn.valentin@generalmot');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (117564987, 'Claude', 'Collette', 4075186968, 'intern', 'claude@sony.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (113393752, 'Omar', 'Iglesias', 1738827428, 'intern', 'omar@multimedialive.ch');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100890800, 'Elle', 'Guest', 4196209455, 'paramedic', 'elle@allstar.se');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (116541425, 'Matt', 'Keeslar', 1772960290, 'intern', 'matt.keeslar@fpf.ca');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (103057166, 'Freda', 'Minogue', 1130307429, 'intern', 'freda.m@isd.fr');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (101365021, 'Merrill', 'Carlyle', 1144947878, 'nurse', 'mcarlyle@signalperfection');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (114518606, 'Amy', 'Gugino', 1512351139, 'paramedic', 'amy.gugino@prosperitybanc');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (107913060, 'Nils', 'Hackman', 2727237472, 'nurse', 'nilsh@intel.com');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (100996026, 'Vickie', 'Cochran', 3299849254, 'paramedic', 'vickie.cochran@jlphor.no');
insert into INSTRUCTOR (instructor_id, fname, lname, phone, qualification, email)
values (111548878, 'Emily', 'Alda', 2112215749, 'nurse', 'emily.alda@hps.de');
commit;
prompt 1651 records loaded
prompt Loading COURSE...
