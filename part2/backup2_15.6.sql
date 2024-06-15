prompt PL/SQL Developer import file
prompt Created on Saturday, June 15, 2024 by user
set feedback off
set define off
prompt Dropping INSTRUCTOR...
drop table INSTRUCTOR cascade constraints;
prompt Dropping COURSE...
drop table COURSE cascade constraints;
prompt Dropping COURSE_TOOL...
drop table COURSE_TOOL cascade constraints;
prompt Dropping PARTICIPANT...
drop table PARTICIPANT cascade constraints;
prompt Dropping REGISTRATION...
drop table REGISTRATION cascade constraints;
prompt Dropping TCATEGORY...
drop table TCATEGORY cascade constraints;
prompt Dropping TOOL...
drop table TOOL cascade constraints;
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
alter table COURSE
  add constraint CHECK_NEGPRICE
  check (price >= 0);

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
  email          VARCHAR2(50) not null,
  birth_date     DATE default SYSDATE not null
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
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1347, 'First Aid for Allergic Re', to_date('10-01-2024', 'dd-mm-yyyy'), 'Tiberias', 3763, 26, 104622884);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1007, 'First Aid for Heat Stroke', to_date('26-08-2024', 'dd-mm-yyyy'), 'Ashkelon', 1117, 22, 110194140);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1389, 'First Aid for Burns', to_date('04-05-2024', 'dd-mm-yyyy'), 'Tiberias', 3860, 22, 117125199);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1097, 'First Aid for Fractures a', to_date('28-12-2024', 'dd-mm-yyyy'), 'Nazareth', 4180, 7, 108912101);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1491, 'First Aid for Animal Bite', to_date('23-08-2024', 'dd-mm-yyyy'), 'Netanya', 1194, 12, 107980308);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1383, 'Advanced Cardiac Life Sup', to_date('19-03-2024', 'dd-mm-yyyy'), 'Jerusalem', 2894, 17, 109145974);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1299, 'First Aid for Animal Bite', to_date('26-06-2024', 'dd-mm-yyyy'), 'Rehovot', 1095, 14, 106431039);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1162, 'Pediatric Advanced Life S', to_date('30-12-2024', 'dd-mm-yyyy'), 'Tiberias', 1238, 23, 107891821);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1095, 'Pediatric Advanced Life S', to_date('08-08-2024', 'dd-mm-yyyy'), 'Eilat', 2141, 7, 101585639);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1107, 'Tactical First Aid', to_date('02-02-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 736, 22, 119772654);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1354, 'Wilderness First Aid', to_date('05-03-2024', 'dd-mm-yyyy'), 'Lod', 2455, 25, 112876738);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1259, 'First Aid for Stroke', to_date('16-06-2024', 'dd-mm-yyyy'), 'Tel Aviv', 3014, 5, 104879756);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1064, 'First Aid for Choking', to_date('15-07-2024', 'dd-mm-yyyy'), 'Herzliya', 571, 23, 118834160);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1400, 'First Aid for Poisoning', to_date('03-04-2024', 'dd-mm-yyyy'), 'Nazareth', 1878, 24, 106528871);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1469, 'First Aid for Trauma Inju', to_date('15-04-2024', 'dd-mm-yyyy'), 'Ashdod', 3211, 23, 110165847);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1398, 'First Aid for Heat Stroke', to_date('14-12-2024', 'dd-mm-yyyy'), 'Ramat Gan', 1376, 28, 106220224);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1171, 'Basic First Aid', to_date('15-04-2024', 'dd-mm-yyyy'), 'Jerusalem', 3716, 3, 106220224);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1403, 'First Aid for Poisoning', to_date('03-01-2024', 'dd-mm-yyyy'), 'Ashdod', 1978, 17, 115459598);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1080, 'Advanced Cardiac Life Sup', to_date('15-03-2024', 'dd-mm-yyyy'), 'Nazareth', 1533, 1, 113008361);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1221, 'Pediatric Advanced Life S', to_date('24-07-2024', 'dd-mm-yyyy'), 'Ramat Gan', 710, 3, 107941638);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1256, 'First Aid for Choking', to_date('06-08-2024', 'dd-mm-yyyy'), 'Modi''in', 2958, 10, 111411219);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1440, 'First Aid for Stroke', to_date('25-04-2024', 'dd-mm-yyyy'), 'Hadera', 2122, 19, 108572512);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1065, 'Emergency Medical Technic', to_date('09-08-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 959, 21, 102367909);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1167, 'Disaster Response and Man', to_date('07-01-2024', 'dd-mm-yyyy'), 'Haifa', 2984, 1, 104631776);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1111, 'First Aid for Burns', to_date('08-09-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 4362, 18, 105694785);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1153, 'Mental Health First Aid', to_date('17-12-2024', 'dd-mm-yyyy'), 'Modi''in', 4259, 14, 113008361);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1188, 'First Aid for Poisoning', to_date('07-02-2024', 'dd-mm-yyyy'), 'Haifa', 1078, 29, 107980308);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1238, 'Emergency Medical Technic', to_date('20-06-2024', 'dd-mm-yyyy'), 'Beersheva', 3101, 22, 100263333);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1109, 'Basic First Aid', to_date('27-12-2024', 'dd-mm-yyyy'), 'Tiberias', 2418, 11, 105544051);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1281, 'Workplace First Aid and S', to_date('22-09-2024', 'dd-mm-yyyy'), 'Ashdod', 4893, 18, 106832646);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1172, 'Advanced Cardiac Life Sup', to_date('14-03-2024', 'dd-mm-yyyy'), 'Ashdod', 4117, 2, 119607152);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1465, 'First Aid for Hypothermia', to_date('03-07-2024', 'dd-mm-yyyy'), 'Tel Aviv', 3328, 4, 110661834);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1241, 'First Aid for Allergic Re', to_date('25-04-2024', 'dd-mm-yyyy'), 'Beersheva', 4303, 18, 102309075);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1441, 'First Aid for Hypothermia', to_date('14-07-2024', 'dd-mm-yyyy'), 'Ashkelon', 3384, 25, 112755599);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1118, 'First Aid for Poisoning', to_date('22-03-2024', 'dd-mm-yyyy'), 'Hadera', 1163, 6, 102796498);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1239, 'First Aid for Poisoning', to_date('17-11-2024', 'dd-mm-yyyy'), 'Bat Yam', 958, 6, 114925407);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1193, 'CPR', to_date('12-08-2024', 'dd-mm-yyyy'), 'Ramat Gan', 936, 14, 110661834);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1317, 'Emergency Medical Technic', to_date('04-09-2024', 'dd-mm-yyyy'), 'Hadera', 2750, 9, 102198752);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1146, 'First Aid for Animal Bite', to_date('10-09-2024', 'dd-mm-yyyy'), 'Lod', 3345, 14, 105156906);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1025, 'First Aid for Fractures a', to_date('29-05-2024', 'dd-mm-yyyy'), 'Nazareth', 916, 16, 113869329);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1388, 'First Aid for Choking', to_date('30-01-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 4631, 3, 101721853);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1199, 'Advanced Cardiac Life Sup', to_date('11-06-2024', 'dd-mm-yyyy'), 'Tel Aviv', 4711, 1, 103786768);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1405, 'Disaster Response and Man', to_date('09-08-2024', 'dd-mm-yyyy'), 'Eilat', 2664, 6, 103231721);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1113, 'First Aid for Allergic Re', to_date('16-07-2024', 'dd-mm-yyyy'), 'Holon', 1674, 25, 100372089);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1436, 'First Aid for Trauma Inju', to_date('01-09-2024', 'dd-mm-yyyy'), 'Herzliya', 3081, 8, 117501276);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1163, 'First Aid for Poisoning', to_date('07-12-2024', 'dd-mm-yyyy'), 'Hadera', 873, 19, 102497240);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1464, 'Wilderness First Aid', to_date('07-10-2024', 'dd-mm-yyyy'), 'Herzliya', 4952, 9, 101048663);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1242, 'CPR', to_date('08-12-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 423, 25, 101585639);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1395, 'Wilderness First Aid', to_date('17-04-2024', 'dd-mm-yyyy'), 'Rehovot', 3292, 5, 102834965);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1032, 'Basic First Aid', to_date('12-03-2024', 'dd-mm-yyyy'), 'Nazareth', 2767, 10, 113869329);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1023, 'First Aid for Trauma Inju', to_date('08-08-2024', 'dd-mm-yyyy'), 'Nazareth', 2391, 26, 102046184);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1288, 'First Aid for Poisoning', to_date('04-10-2024', 'dd-mm-yyyy'), 'Nazareth', 4482, 7, 102367909);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1324, 'Tactical First Aid', to_date('27-04-2024', 'dd-mm-yyyy'), 'Ashdod', 654, 22, 102160746);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1457, 'First Aid for Fractures a', to_date('18-06-2024', 'dd-mm-yyyy'), 'Jerusalem', 3594, 24, 107134123);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1019, 'First Aid for Trauma Inju', to_date('01-08-2024', 'dd-mm-yyyy'), 'Nazareth', 4941, 28, 101556692);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1151, 'Workplace First Aid and S', to_date('10-06-2024', 'dd-mm-yyyy'), 'Ramat Gan', 3530, 28, 109879963);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1412, 'Advanced Cardiac Life Sup', to_date('25-05-2024', 'dd-mm-yyyy'), 'Ashdod', 3272, 10, 102575070);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1046, 'First Aid for Animal Bite', to_date('05-12-2024', 'dd-mm-yyyy'), 'Beersheva', 3785, 8, 111007254);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1377, 'Disaster Response and Man', to_date('03-03-2024', 'dd-mm-yyyy'), 'Ramat Gan', 4671, 8, 106561948);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1219, 'First Aid for Stroke', to_date('17-09-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2053, 26, 114760681);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1472, 'Emergency Medical Technic', to_date('30-12-2024', 'dd-mm-yyyy'), 'Haifa', 773, 16, 115143337);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1131, 'First Aid for Allergic Re', to_date('08-04-2024', 'dd-mm-yyyy'), 'Haifa', 2784, 18, 115638139);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1322, 'First Aid for Allergic Re', to_date('20-10-2024', 'dd-mm-yyyy'), 'Nazareth', 886, 15, 106774730);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1058, 'CPR', to_date('23-10-2024', 'dd-mm-yyyy'), 'Netanya', 2998, 1, 113158978);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1431, 'First Aid for Poisoning', to_date('23-01-2024', 'dd-mm-yyyy'), 'Ramat Gan', 2018, 3, 114651651);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1027, 'First Aid for Allergic Re', to_date('19-05-2024', 'dd-mm-yyyy'), 'Ashkelon', 362, 10, 117761700);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1473, 'Mental Health First Aid', to_date('12-08-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2084, 18, 104312697);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1496, 'Mental Health First Aid', to_date('21-07-2024', 'dd-mm-yyyy'), 'Bat Yam', 2666, 4, 119187587);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1499, 'Basic First Aid', to_date('14-10-2024', 'dd-mm-yyyy'), 'Holon', 2290, 13, 115786240);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1169, 'Workplace First Aid and S', to_date('11-09-2024', 'dd-mm-yyyy'), 'Ashdod', 1709, 10, 116966530);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1495, 'First Aid for Animal Bite', to_date('06-08-2024', 'dd-mm-yyyy'), 'Hadera', 3129, 16, 115278537);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1350, 'Mental Health First Aid', to_date('14-12-2024', 'dd-mm-yyyy'), 'Jerusalem', 405, 18, 105947069);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1142, 'First Aid for Fractures a', to_date('30-11-2024', 'dd-mm-yyyy'), 'Modi''in', 4376, 5, 113925064);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1133, 'First Aid for Animal Bite', to_date('14-04-2024', 'dd-mm-yyyy'), 'Nazareth', 2181, 10, 111353820);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1194, 'First Aid for Poisoning', to_date('03-03-2024', 'dd-mm-yyyy'), 'Jerusalem', 3456, 12, 113019947);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1164, 'Tactical First Aid', to_date('06-08-2024', 'dd-mm-yyyy'), 'Eilat', 560, 19, 100917985);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1061, 'First Aid for Poisoning', to_date('19-06-2024', 'dd-mm-yyyy'), 'Eilat', 2810, 15, 110061477);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1385, 'First Aid for Hypothermia', to_date('21-06-2024', 'dd-mm-yyyy'), 'Nazareth', 706, 26, 109499463);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1227, 'First Aid for Animal Bite', to_date('26-07-2024', 'dd-mm-yyyy'), 'Hadera', 373, 12, 113110911);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1335, 'First Aid for Burns', to_date('19-11-2024', 'dd-mm-yyyy'), 'Haifa', 4249, 27, 108492902);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1419, 'First Aid for Trauma Inju', to_date('03-08-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 1278, 24, 100763880);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1364, 'Mental Health First Aid', to_date('26-11-2024', 'dd-mm-yyyy'), 'Nazareth', 4481, 4, 109936757);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1057, 'First Aid for Stroke', to_date('09-02-2024', 'dd-mm-yyyy'), 'Netanya', 4032, 17, 113222350);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1455, 'Pediatric Advanced Life S', to_date('26-10-2024', 'dd-mm-yyyy'), 'Netanya', 3609, 17, 119263933);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1177, 'Emergency Medical Technic', to_date('17-05-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 2030, 4, 101548029);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1092, 'First Aid for Trauma Inju', to_date('01-11-2024', 'dd-mm-yyyy'), 'Hadera', 762, 7, 112755599);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1135, 'Basic First Aid', to_date('12-03-2024', 'dd-mm-yyyy'), 'Eilat', 3540, 14, 109321696);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1384, 'First Aid for Animal Bite', to_date('30-01-2024', 'dd-mm-yyyy'), 'Ashdod', 2047, 3, 102372842);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1296, 'First Aid for Heat Stroke', to_date('01-02-2025', 'dd-mm-yyyy'), 'Rishon LeZion', 1067, 9, 106985727);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1309, 'First Aid for Poisoning', to_date('11-08-2024', 'dd-mm-yyyy'), 'Herzliya', 4658, 28, 113869329);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1307, 'First Aid for Trauma Inju', to_date('15-04-2024', 'dd-mm-yyyy'), 'Jerusalem', 1647, 19, 117190415);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1294, 'Wilderness First Aid', to_date('07-03-2024', 'dd-mm-yyyy'), 'Tel Aviv', 1805, 14, 115202803);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1399, 'First Aid for Animal Bite', to_date('03-05-2024', 'dd-mm-yyyy'), 'Nazareth', 4511, 26, 108795881);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1320, 'Pediatric Advanced Life S', to_date('14-08-2024', 'dd-mm-yyyy'), 'Eilat', 3982, 23, 105095420);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1402, 'CPR', to_date('07-12-2024', 'dd-mm-yyyy'), 'Holon', 3372, 25, 114859710);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1498, 'Basic First Aid', to_date('19-03-2024', 'dd-mm-yyyy'), 'Herzliya', 1572, 19, 107550934);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1222, 'Mental Health First Aid', to_date('17-08-2024', 'dd-mm-yyyy'), 'Eilat', 1809, 20, 113041354);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1278, 'First Aid for Poisoning', to_date('31-10-2024', 'dd-mm-yyyy'), 'Modi''in', 2180, 13, 107587117);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1363, 'Emergency Medical Technic', to_date('10-12-2024', 'dd-mm-yyyy'), 'Ashkelon', 3476, 9, 108553358);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1154, 'Mental Health First Aid', to_date('15-08-2024', 'dd-mm-yyyy'), 'Tiberias', 1072, 27, 115564551);
commit;
prompt 100 records committed...
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1202, 'First Aid for Heat Stroke', to_date('29-09-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 3775, 26, 112778221);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1000, 'First Aid for Stroke', to_date('07-03-2024', 'dd-mm-yyyy'), 'Tel Aviv', 558, 23, 113358668);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1373, 'Emergency Medical Technic', to_date('03-08-2024', 'dd-mm-yyyy'), 'Haifa', 2072, 17, 103196386);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1013, 'First Aid for Animal Bite', to_date('02-01-2024', 'dd-mm-yyyy'), 'Bat Yam', 1862, 14, 110324536);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1467, 'Workplace First Aid and S', to_date('23-09-2024', 'dd-mm-yyyy'), 'Ramat Gan', 4396, 28, 108823981);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1192, 'First Aid for Allergic Re', to_date('04-01-2024', 'dd-mm-yyyy'), 'Modi''in', 375, 12, 101356133);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1285, 'Emergency Medical Technic', to_date('24-12-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 1052, 24, 103058094);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1459, 'Advanced Cardiac Life Sup', to_date('05-11-2024', 'dd-mm-yyyy'), 'Hadera', 3300, 9, 111110674);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1287, 'First Aid for Choking', to_date('06-08-2024', 'dd-mm-yyyy'), 'Ashkelon', 2288, 25, 100070429);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1155, 'Wilderness First Aid', to_date('30-04-2024', 'dd-mm-yyyy'), 'Jerusalem', 4486, 4, 100014699);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1231, 'First Aid for Choking', to_date('06-10-2024', 'dd-mm-yyyy'), 'Eilat', 4237, 20, 115022267);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1365, 'Emergency Medical Technic', to_date('10-07-2024', 'dd-mm-yyyy'), 'Eilat', 889, 20, 111825294);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1381, 'Disaster Response and Man', to_date('29-07-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 2509, 23, 107134123);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1223, 'First Aid for Stroke', to_date('18-02-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 653, 5, 101172479);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1207, 'Mental Health First Aid', to_date('15-11-2024', 'dd-mm-yyyy'), 'Modi''in', 2959, 14, 100895004);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1346, 'Emergency Medical Technic', to_date('28-03-2024', 'dd-mm-yyyy'), 'Lod', 1572, 27, 119388319);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1226, 'First Aid for Burns', to_date('28-08-2024', 'dd-mm-yyyy'), 'Netanya', 3610, 29, 101223690);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1217, 'Mental Health First Aid', to_date('05-02-2024', 'dd-mm-yyyy'), 'Netanya', 1720, 20, 112665492);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1303, 'First Aid for Burns', to_date('25-06-2024', 'dd-mm-yyyy'), 'Ashkelon', 1301, 14, 119410434);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1056, 'Basic First Aid', to_date('15-08-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 4851, 29, 100019713);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1280, 'First Aid for Poisoning', to_date('09-12-2024', 'dd-mm-yyyy'), 'Tiberias', 4734, 9, 109282548);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1031, 'First Aid for Animal Bite', to_date('10-12-2024', 'dd-mm-yyyy'), 'Ashdod', 1816, 16, 104639815);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1103, 'Disaster Response and Man', to_date('28-03-2024', 'dd-mm-yyyy'), 'Bat Yam', 2627, 26, 112862719);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1024, 'First Aid for Stroke', to_date('27-11-2024', 'dd-mm-yyyy'), 'Ashdod', 965, 12, 105826355);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1344, 'First Aid for Trauma Inju', to_date('14-06-2024', 'dd-mm-yyyy'), 'Hadera', 1314, 18, 116743219);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1071, 'Workplace First Aid and S', to_date('05-12-2024', 'dd-mm-yyyy'), 'Modi''in', 3705, 14, 117190415);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1001, 'Emergency Medical Technic', to_date('10-12-2024', 'dd-mm-yyyy'), 'Jerusalem', 4452, 19, 103993064);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1376, 'First Aid for Poisoning', to_date('17-04-2024', 'dd-mm-yyyy'), 'Haifa', 893, 19, 119603350);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1044, 'Wilderness First Aid', to_date('24-02-2024', 'dd-mm-yyyy'), 'Tel Aviv', 1294, 15, 108587367);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1244, 'Workplace First Aid and S', to_date('07-10-2024', 'dd-mm-yyyy'), 'Rehovot', 1778, 3, 114487845);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1028, 'CPR', to_date('18-07-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 3827, 8, 113398817);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1182, 'First Aid for Poisoning', to_date('27-02-2024', 'dd-mm-yyyy'), 'Modi''in', 486, 12, 119869270);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1262, 'Tactical First Aid', to_date('24-06-2024', 'dd-mm-yyyy'), 'Nazareth', 3335, 24, 111395532);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1445, 'Pediatric Advanced Life S', to_date('27-06-2024', 'dd-mm-yyyy'), 'Hadera', 2011, 22, 108156444);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1329, 'First Aid for Animal Bite', to_date('03-10-2024', 'dd-mm-yyyy'), 'Holon', 2611, 10, 115413102);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1160, 'Workplace First Aid and S', to_date('31-07-2024', 'dd-mm-yyyy'), 'Hadera', 3499, 24, 114423288);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1134, 'First Aid for Allergic Re', to_date('09-09-2024', 'dd-mm-yyyy'), 'Hadera', 3002, 4, 102939939);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1295, 'Tactical First Aid', to_date('05-04-2024', 'dd-mm-yyyy'), 'Hadera', 3065, 7, 110290929);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1189, 'First Aid for Stroke', to_date('03-09-2024', 'dd-mm-yyyy'), 'Hadera', 1719, 29, 113747514);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1022, 'Workplace First Aid and S', to_date('21-03-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 2526, 22, 101638614);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1215, 'CPR', to_date('20-05-2024', 'dd-mm-yyyy'), 'Beersheva', 4709, 29, 106384931);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1002, 'First Aid for Poisoning', to_date('18-06-2024', 'dd-mm-yyyy'), 'Jerusalem', 900, 9, 101776276);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1396, 'First Aid for Allergic Re', to_date('14-01-2024', 'dd-mm-yyyy'), 'Netanya', 878, 30, 107297620);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1050, 'Workplace First Aid and S', to_date('02-01-2024', 'dd-mm-yyyy'), 'Ashdod', 2732, 17, 103645079);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1266, 'Disaster Response and Man', to_date('20-05-2024', 'dd-mm-yyyy'), 'Ashdod', 4024, 15, 116448979);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1413, 'Pediatric Advanced Life S', to_date('19-11-2024', 'dd-mm-yyyy'), 'Holon', 4261, 24, 119906775);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1470, 'Basic First Aid', to_date('14-02-2024', 'dd-mm-yyyy'), 'Tel Aviv', 3488, 16, 101889670);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1421, 'Wilderness First Aid', to_date('10-01-2024', 'dd-mm-yyyy'), 'Nazareth', 2920, 10, 114697139);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1355, 'First Aid for Animal Bite', to_date('27-06-2024', 'dd-mm-yyyy'), 'Rehovot', 4986, 12, 118793930);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1126, 'First Aid for Stroke', to_date('27-12-2024', 'dd-mm-yyyy'), 'Modi''in', 3003, 1, 110188917);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1331, 'Workplace First Aid and S', to_date('23-06-2024', 'dd-mm-yyyy'), 'Holon', 606, 11, 119607152);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1327, 'Disaster Response and Man', to_date('07-07-2024', 'dd-mm-yyyy'), 'Modi''in', 2329, 27, 115786240);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1428, 'First Aid for Allergic Re', to_date('27-01-2024', 'dd-mm-yyyy'), 'Netanya', 542, 11, 116611486);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1075, 'Workplace First Aid and S', to_date('12-01-2024', 'dd-mm-yyyy'), 'Jerusalem', 2170, 13, 111405831);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1279, 'Workplace First Aid and S', to_date('11-09-2024', 'dd-mm-yyyy'), 'Lod', 3406, 8, 106416897);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1059, 'First Aid for Choking', to_date('06-03-2024', 'dd-mm-yyyy'), 'Lod', 3811, 27, 114842003);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1117, 'First Aid for Heat Stroke', to_date('16-07-2024', 'dd-mm-yyyy'), 'Holon', 4185, 7, 100857441);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1362, 'Tactical First Aid', to_date('19-08-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 1022, 1, 106397485);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1371, 'First Aid for Burns', to_date('13-05-2024', 'dd-mm-yyyy'), 'Holon', 3500, 6, 101283000);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1145, 'First Aid for Choking', to_date('05-05-2024', 'dd-mm-yyyy'), 'Jerusalem', 4709, 13, 113929226);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1460, 'First Aid for Burns', to_date('21-01-2024', 'dd-mm-yyyy'), 'Lod', 1851, 5, 117130066);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1035, 'CPR', to_date('08-10-2024', 'dd-mm-yyyy'), 'Holon', 4948, 29, 115279793);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1356, 'CPR', to_date('24-01-2024', 'dd-mm-yyyy'), 'Hadera', 2493, 10, 103882372);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1415, 'Tactical First Aid', to_date('13-09-2024', 'dd-mm-yyyy'), 'Tiberias', 1172, 11, 116147396);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1041, 'Basic First Aid', to_date('20-04-2024', 'dd-mm-yyyy'), 'Rehovot', 391, 21, 104065356);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1341, 'First Aid for Stroke', to_date('08-08-2024', 'dd-mm-yyyy'), 'Haifa', 1566, 25, 115143337);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1005, 'First Aid for Poisoning', to_date('18-12-2024', 'dd-mm-yyyy'), 'Netanya', 4372, 1, 114189306);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1186, 'First Aid for Choking', to_date('21-05-2024', 'dd-mm-yyyy'), 'Bat Yam', 2671, 10, 100447074);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1305, 'First Aid for Allergic Re', to_date('16-01-2024', 'dd-mm-yyyy'), 'Eilat', 1068, 23, 106097856);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1004, 'First Aid for Allergic Re', to_date('29-11-2024', 'dd-mm-yyyy'), 'Eilat', 1456, 11, 119642894);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1406, 'Wilderness First Aid', to_date('27-11-2024', 'dd-mm-yyyy'), 'Haifa', 3634, 23, 112563559);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1273, 'First Aid for Burns', to_date('11-06-2024', 'dd-mm-yyyy'), 'Ashdod', 4233, 12, 118263400);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1203, 'First Aid for Trauma Inju', to_date('02-06-2024', 'dd-mm-yyyy'), 'Jerusalem', 2502, 2, 106561948);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1249, 'Tactical First Aid', to_date('04-01-2024', 'dd-mm-yyyy'), 'Modi''in', 2157, 2, 119294752);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1286, 'First Aid for Hypothermia', to_date('02-09-2024', 'dd-mm-yyyy'), 'Ashkelon', 1282, 30, 100604994);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1302, 'First Aid for Hypothermia', to_date('15-04-2024', 'dd-mm-yyyy'), 'Bat Yam', 4334, 29, 105110482);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1392, 'Emergency Medical Technic', to_date('15-07-2024', 'dd-mm-yyyy'), 'Jerusalem', 1944, 21, 101365021);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1198, 'Advanced Cardiac Life Sup', to_date('24-01-2024', 'dd-mm-yyyy'), 'Hadera', 645, 8, 118194513);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1246, 'First Aid for Fractures a', to_date('15-07-2024', 'dd-mm-yyyy'), 'Netanya', 787, 27, 109818831);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1479, 'First Aid for Poisoning', to_date('09-10-2024', 'dd-mm-yyyy'), 'Rehovot', 773, 11, 100020236);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1463, 'Disaster Response and Man', to_date('23-01-2024', 'dd-mm-yyyy'), 'Tel Aviv', 2846, 23, 109121853);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1173, 'Basic First Aid', to_date('03-11-2024', 'dd-mm-yyyy'), 'Netanya', 2819, 2, 105694785);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1414, 'First Aid for Burns', to_date('14-03-2024', 'dd-mm-yyyy'), 'Eilat', 1509, 15, 115972105);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1054, 'First Aid for Allergic Re', to_date('03-09-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 4438, 14, 119571129);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1267, 'Pediatric Advanced Life S', to_date('08-06-2024', 'dd-mm-yyyy'), 'Tel Aviv', 3457, 29, 111710703);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1067, 'First Aid for Stroke', to_date('27-09-2024', 'dd-mm-yyyy'), 'Herzliya', 987, 9, 114137687);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1076, 'Pediatric Advanced Life S', to_date('29-05-2024', 'dd-mm-yyyy'), 'Herzliya', 1667, 18, 119259634);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1195, 'First Aid for Animal Bite', to_date('09-08-2024', 'dd-mm-yyyy'), 'Haifa', 4850, 4, 113906480);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1178, 'First Aid for Trauma Inju', to_date('15-01-2024', 'dd-mm-yyyy'), 'Tiberias', 3331, 13, 101009055);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1486, 'Emergency Medical Technic', to_date('17-08-2024', 'dd-mm-yyyy'), 'Haifa', 4024, 4, 111522119);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1141, 'First Aid for Stroke', to_date('13-07-2024', 'dd-mm-yyyy'), 'Tel Aviv', 2550, 10, 113455051);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1439, 'First Aid for Animal Bite', to_date('23-02-2024', 'dd-mm-yyyy'), 'Rehovot', 1918, 18, 114535907);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1245, 'Wilderness First Aid', to_date('08-06-2024', 'dd-mm-yyyy'), 'Jerusalem', 4866, 20, 112245117);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1104, 'First Aid for Burns', to_date('24-12-2024', 'dd-mm-yyyy'), 'Jerusalem', 1330, 5, 117056811);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1073, 'Mental Health First Aid', to_date('16-02-2024', 'dd-mm-yyyy'), 'Ashdod', 892, 17, 104949475);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1101, 'CPR', to_date('21-08-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 3346, 3, 102628149);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1060, 'First Aid for Poisoning', to_date('14-01-2024', 'dd-mm-yyyy'), 'Rehovot', 4618, 10, 113477356);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1340, 'Wilderness First Aid', to_date('30-12-2024', 'dd-mm-yyyy'), 'Lod', 4974, 27, 104602507);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1078, 'Mental Health First Aid', to_date('06-05-2024', 'dd-mm-yyyy'), 'Ashkelon', 1200, 5, 107610435);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1482, 'First Aid for Allergic Re', to_date('01-07-2024', 'dd-mm-yyyy'), 'Beersheva', 4462, 1, 117142261);
commit;
prompt 200 records committed...
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1434, 'First Aid for Choking', to_date('29-03-2024', 'dd-mm-yyyy'), 'Herzliya', 3158, 26, 117339909);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1144, 'Basic First Aid', to_date('29-04-2024', 'dd-mm-yyyy'), 'Hadera', 2392, 20, 117484325);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1156, 'First Aid for Poisoning', to_date('01-11-2024', 'dd-mm-yyyy'), 'Tiberias', 1156, 17, 105897642);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1386, 'First Aid for Choking', to_date('24-02-2024', 'dd-mm-yyyy'), 'Eilat', 4109, 25, 113626686);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1020, 'First Aid for Burns', to_date('24-02-2024', 'dd-mm-yyyy'), 'Jerusalem', 674, 14, 105098265);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1149, 'Disaster Response and Man', to_date('23-03-2024', 'dd-mm-yyyy'), 'Jerusalem', 4025, 17, 101952352);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1026, 'Basic First Aid', to_date('12-05-2024', 'dd-mm-yyyy'), 'Tiberias', 688, 18, 112452297);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1448, 'Disaster Response and Man', to_date('19-11-2024', 'dd-mm-yyyy'), 'Bat Yam', 904, 29, 100055088);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1336, 'First Aid for Choking', to_date('25-11-2024', 'dd-mm-yyyy'), 'Rehovot', 3522, 20, 116519576);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1029, 'First Aid for Trauma Inju', to_date('16-06-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 4172, 17, 106323272);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1218, 'Workplace First Aid and S', to_date('11-01-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 4146, 20, 102168794);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1099, 'First Aid for Allergic Re', to_date('28-10-2024', 'dd-mm-yyyy'), 'Herzliya', 3157, 5, 103493409);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1478, 'First Aid for Trauma Inju', to_date('13-11-2024', 'dd-mm-yyyy'), 'Herzliya', 802, 8, 112674791);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1497, 'First Aid for Burns', to_date('12-03-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 1373, 10, 107244166);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1269, 'First Aid for Choking', to_date('26-01-2024', 'dd-mm-yyyy'), 'Holon', 3703, 6, 101488681);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1328, 'Mental Health First Aid', to_date('04-04-2024', 'dd-mm-yyyy'), 'Netanya', 1389, 23, 116504883);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1275, 'First Aid for Burns', to_date('16-06-2024', 'dd-mm-yyyy'), 'Tiberias', 2369, 25, 113103163);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1011, 'Pediatric Advanced Life S', to_date('22-08-2024', 'dd-mm-yyyy'), 'Jerusalem', 3346, 23, 113073379);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1233, 'Tactical First Aid', to_date('15-01-2024', 'dd-mm-yyyy'), 'Nazareth', 3602, 23, 103329032);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1357, 'Advanced Cardiac Life Sup', to_date('15-04-2024', 'dd-mm-yyyy'), 'Netanya', 3630, 22, 113842545);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1358, 'Advanced Cardiac Life Sup', to_date('15-10-2024', 'dd-mm-yyyy'), 'Jerusalem', 3688, 20, 112218902);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1123, 'CPR', to_date('03-05-2024', 'dd-mm-yyyy'), 'Rehovot', 3310, 10, 103293073);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1139, 'Basic First Aid', to_date('11-02-2024', 'dd-mm-yyyy'), 'Hadera', 859, 9, 110487995);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1313, 'First Aid for Heat Stroke', to_date('24-06-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 3626, 14, 104249482);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1452, 'First Aid for Hypothermia', to_date('18-04-2024', 'dd-mm-yyyy'), 'Rehovot', 4267, 16, 112110732);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1250, 'First Aid for Animal Bite', to_date('25-07-2024', 'dd-mm-yyyy'), 'Netanya', 523, 13, 114498321);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1100, 'First Aid for Stroke', to_date('16-07-2024', 'dd-mm-yyyy'), 'Holon', 1177, 7, 104202582);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1234, 'Disaster Response and Man', to_date('25-01-2024', 'dd-mm-yyyy'), 'Jerusalem', 4693, 9, 110194140);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1314, 'Wilderness First Aid', to_date('03-03-2024', 'dd-mm-yyyy'), 'Haifa', 4568, 6, 112763165);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1212, 'First Aid for Trauma Inju', to_date('14-06-2024', 'dd-mm-yyyy'), 'Tiberias', 4982, 18, 110764726);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1166, 'First Aid for Animal Bite', to_date('22-02-2024', 'dd-mm-yyyy'), 'Jerusalem', 2381, 1, 111395532);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1211, 'Pediatric Advanced Life S', to_date('25-07-2024', 'dd-mm-yyyy'), 'Ashkelon', 2904, 30, 100975325);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1213, 'First Aid for Fractures a', to_date('31-07-2024', 'dd-mm-yyyy'), 'Haifa', 1084, 29, 119305017);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1247, 'CPR', to_date('09-06-2024', 'dd-mm-yyyy'), 'Tel Aviv', 1906, 19, 119836281);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1034, 'Pediatric Advanced Life S', to_date('22-09-2024', 'dd-mm-yyyy'), 'Jerusalem', 4445, 28, 107107797);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1310, 'Mental Health First Aid', to_date('03-11-2024', 'dd-mm-yyyy'), 'Ashkelon', 4629, 5, 117030974);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1429, 'Emergency Medical Technic', to_date('06-09-2024', 'dd-mm-yyyy'), 'Netanya', 609, 2, 109961757);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1447, 'Pediatric Advanced Life S', to_date('30-11-2024', 'dd-mm-yyyy'), 'Ashkelon', 2487, 17, 102160746);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1337, 'Disaster Response and Man', to_date('10-10-2024', 'dd-mm-yyyy'), 'Ashdod', 4927, 9, 114231885);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1308, 'Emergency Medical Technic', to_date('09-08-2024', 'dd-mm-yyyy'), 'Eilat', 4632, 21, 115260015);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1063, 'First Aid for Trauma Inju', to_date('24-02-2024', 'dd-mm-yyyy'), 'Holon', 752, 10, 101905166);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1150, 'Mental Health First Aid', to_date('03-07-2024', 'dd-mm-yyyy'), 'Haifa', 614, 23, 101833656);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1018, 'CPR', to_date('21-05-2024', 'dd-mm-yyyy'), 'Ashkelon', 2478, 1, 110061477);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1038, 'First Aid for Burns', to_date('19-05-2024', 'dd-mm-yyyy'), 'Tiberias', 810, 10, 100758088);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1353, 'Tactical First Aid', to_date('04-02-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 3973, 14, 114842003);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1152, 'First Aid for Hypothermia', to_date('16-06-2024', 'dd-mm-yyyy'), 'Hadera', 3594, 13, 115220272);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1174, 'First Aid for Heat Stroke', to_date('19-10-2024', 'dd-mm-yyyy'), 'Ramat Gan', 732, 13, 100081307);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1333, 'CPR', to_date('06-07-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2310, 9, 116501792);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1446, 'First Aid for Trauma Inju', to_date('14-11-2024', 'dd-mm-yyyy'), 'Lod', 4611, 25, 119836497);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1475, 'Mental Health First Aid', to_date('11-09-2024', 'dd-mm-yyyy'), 'Herzliya', 609, 19, 109961757);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1426, 'First Aid for Stroke', to_date('12-08-2024', 'dd-mm-yyyy'), 'Modi''in', 2700, 25, 103882372);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1225, 'Advanced Cardiac Life Sup', to_date('03-08-2024', 'dd-mm-yyyy'), 'Modi''in', 4159, 12, 111202025);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1237, 'Advanced Cardiac Life Sup', to_date('17-11-2024', 'dd-mm-yyyy'), 'Beersheva', 910, 14, 103817500);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1255, 'Pediatric Advanced Life S', to_date('04-10-2024', 'dd-mm-yyyy'), 'Ashkelon', 1685, 16, 106809645);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1084, 'CPR', to_date('21-02-2024', 'dd-mm-yyyy'), 'Jerusalem', 405, 27, 103606714);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1181, 'First Aid for Choking', to_date('17-03-2024', 'dd-mm-yyyy'), 'Nazareth', 4338, 24, 100383151);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1394, 'Pediatric Advanced Life S', to_date('21-02-2024', 'dd-mm-yyyy'), 'Modi''in', 2630, 20, 119030380);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1087, 'First Aid for Burns', to_date('13-01-2024', 'dd-mm-yyyy'), 'Tiberias', 3689, 4, 106491748);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1311, 'Emergency Medical Technic', to_date('03-04-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 949, 10, 118788123);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1466, 'Basic First Aid', to_date('09-06-2024', 'dd-mm-yyyy'), 'Modi''in', 380, 27, 117142261);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1276, 'Emergency Medical Technic', to_date('15-07-2024', 'dd-mm-yyyy'), 'Ashdod', 952, 29, 117368473);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1366, 'First Aid for Trauma Inju', to_date('24-11-2024', 'dd-mm-yyyy'), 'Lod', 1343, 12, 114351535);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1077, 'Mental Health First Aid', to_date('05-07-2024', 'dd-mm-yyyy'), 'Bat Yam', 3391, 13, 105544051);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1016, 'First Aid for Heat Stroke', to_date('21-06-2024', 'dd-mm-yyyy'), 'Herzliya', 4249, 16, 117461179);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1196, 'First Aid for Poisoning', to_date('03-12-2024', 'dd-mm-yyyy'), 'Ramat Gan', 2921, 24, 105228331);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1008, 'First Aid for Stroke', to_date('02-10-2024', 'dd-mm-yyyy'), 'Tiberias', 3863, 18, 106613188);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1375, 'Advanced Cardiac Life Sup', to_date('14-08-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 1525, 22, 104545698);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1283, 'First Aid for Poisoning', to_date('25-10-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2127, 22, 113361987);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1039, 'Emergency Medical Technic', to_date('14-11-2024', 'dd-mm-yyyy'), 'Tel Aviv', 1302, 27, 119745677);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1033, 'First Aid for Burns', to_date('27-05-2024', 'dd-mm-yyyy'), 'Jerusalem', 4730, 30, 119906775);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1306, 'First Aid for Burns', to_date('26-02-2024', 'dd-mm-yyyy'), 'Rehovot', 3754, 5, 109650439);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1432, 'Emergency Medical Technic', to_date('11-10-2024', 'dd-mm-yyyy'), 'Hadera', 1428, 12, 114450427);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1391, 'Pediatric Advanced Life S', to_date('26-07-2024', 'dd-mm-yyyy'), 'Nazareth', 3106, 11, 113395018);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1277, 'Basic First Aid', to_date('21-11-2024', 'dd-mm-yyyy'), 'Tel Aviv', 1282, 24, 102857151);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1119, 'Basic First Aid', to_date('01-03-2025', 'dd-mm-yyyy'), 'Modi''in', 753, 11, 113754823);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1074, 'First Aid for Poisoning', to_date('30-05-2024', 'dd-mm-yyyy'), 'Haifa', 826, 14, 105807844);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1042, 'First Aid for Choking', to_date('16-03-2024', 'dd-mm-yyyy'), 'Modi''in', 1434, 21, 110932627);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1089, 'First Aid for Fractures a', to_date('11-01-2024', 'dd-mm-yyyy'), 'Tel Aviv', 585, 9, 101913209);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1176, 'First Aid for Allergic Re', to_date('06-02-2024', 'dd-mm-yyyy'), 'Ashkelon', 3970, 13, 103421196);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1201, 'Wilderness First Aid', to_date('20-03-2024', 'dd-mm-yyyy'), 'Tel Aviv', 3742, 8, 118180993);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1170, 'Advanced Cardiac Life Sup', to_date('23-03-2024', 'dd-mm-yyyy'), 'Nazareth', 3797, 21, 117020239);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1430, 'Disaster Response and Man', to_date('16-07-2024', 'dd-mm-yyyy'), 'Ashdod', 2218, 26, 113357352);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1055, 'Pediatric Advanced Life S', to_date('17-10-2024', 'dd-mm-yyyy'), 'Eilat', 2539, 24, 111378726);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1493, 'First Aid for Stroke', to_date('07-06-2024', 'dd-mm-yyyy'), 'Herzliya', 744, 2, 102380227);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1487, 'Mental Health First Aid', to_date('20-08-2024', 'dd-mm-yyyy'), 'Herzliya', 4520, 3, 104105774);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1270, 'Workplace First Aid and S', to_date('19-07-2024', 'dd-mm-yyyy'), 'Tel Aviv', 1979, 8, 117125199);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1121, 'First Aid for Heat Stroke', to_date('09-01-2024', 'dd-mm-yyyy'), 'Ramat Gan', 1578, 20, 103546575);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1390, 'First Aid for Poisoning', to_date('24-04-2024', 'dd-mm-yyyy'), 'Ashdod', 4886, 27, 111656494);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1453, 'First Aid for Allergic Re', to_date('21-08-2024', 'dd-mm-yyyy'), 'Bat Yam', 842, 26, 103692932);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1091, 'Emergency Medical Technic', to_date('19-11-2024', 'dd-mm-yyyy'), 'Hadera', 4964, 2, 104356908);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1069, 'First Aid for Fractures a', to_date('20-03-2024', 'dd-mm-yyyy'), 'Modi''in', 858, 1, 100055088);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1338, 'First Aid for Hypothermia', to_date('14-08-2024', 'dd-mm-yyyy'), 'Ashdod', 2631, 1, 116702491);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1380, 'First Aid for Choking', to_date('04-02-2024', 'dd-mm-yyyy'), 'Nazareth', 373, 25, 112321719);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1427, 'First Aid for Hypothermia', to_date('30-03-2024', 'dd-mm-yyyy'), 'Holon', 4893, 28, 101453900);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1407, 'First Aid for Stroke', to_date('18-06-2024', 'dd-mm-yyyy'), 'Holon', 3622, 22, 113592106);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1423, 'First Aid for Heat Stroke', to_date('26-08-2024', 'dd-mm-yyyy'), 'Modi''in', 3830, 26, 109499463);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1157, 'First Aid for Burns', to_date('13-02-2024', 'dd-mm-yyyy'), 'Lod', 1634, 28, 103017417);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1382, 'First Aid for Stroke', to_date('08-12-2024', 'dd-mm-yyyy'), 'Herzliya', 2332, 18, 102988324);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1010, 'First Aid for Hypothermia', to_date('12-12-2024', 'dd-mm-yyyy'), 'Jerusalem', 3420, 14, 103124377);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1129, 'Pediatric Advanced Life S', to_date('17-10-2024', 'dd-mm-yyyy'), 'Lod', 3010, 15, 112220840);
commit;
prompt 300 records committed...
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1037, 'Advanced Cardiac Life Sup', to_date('29-01-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 4195, 16, 115350286);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1318, 'First Aid for Heat Stroke', to_date('08-12-2024', 'dd-mm-yyyy'), 'Beersheva', 4201, 23, 116209784);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1228, 'Wilderness First Aid', to_date('04-12-2024', 'dd-mm-yyyy'), 'Holon', 1663, 5, 117067639);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1339, 'First Aid for Poisoning', to_date('27-02-2024', 'dd-mm-yyyy'), 'Tiberias', 3614, 14, 104622610);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1006, 'First Aid for Animal Bite', to_date('16-05-2024', 'dd-mm-yyyy'), 'Herzliya', 1194, 28, 110465320);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1265, 'First Aid for Trauma Inju', to_date('26-07-2024', 'dd-mm-yyyy'), 'Tiberias', 4281, 19, 112000725);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1161, 'First Aid for Allergic Re', to_date('22-09-2024', 'dd-mm-yyyy'), 'Rehovot', 2741, 3, 114498321);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1251, 'Basic First Aid', to_date('04-08-2024', 'dd-mm-yyyy'), 'Ramat Gan', 4855, 5, 115314248);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1444, 'Workplace First Aid and S', to_date('15-03-2024', 'dd-mm-yyyy'), 'Haifa', 1010, 8, 108795881);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1437, 'First Aid for Choking', to_date('16-06-2024', 'dd-mm-yyyy'), 'Haifa', 2408, 3, 115055445);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1458, 'First Aid for Animal Bite', to_date('25-02-2024', 'dd-mm-yyyy'), 'Modi''in', 2783, 11, 118473967);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1450, 'First Aid for Allergic Re', to_date('17-11-2024', 'dd-mm-yyyy'), 'Ramat Gan', 4891, 5, 106097856);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1179, 'Advanced Cardiac Life Sup', to_date('18-05-2024', 'dd-mm-yyyy'), 'Ashkelon', 3696, 19, 113126628);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1323, 'Wilderness First Aid', to_date('13-05-2024', 'dd-mm-yyyy'), 'Beersheva', 1715, 2, 100942850);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1090, 'Advanced Cardiac Life Sup', to_date('29-05-2024', 'dd-mm-yyyy'), 'Haifa', 575, 19, 105912329);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1360, 'Disaster Response and Man', to_date('27-06-2024', 'dd-mm-yyyy'), 'Tiberias', 1882, 13, 103578545);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1433, 'Pediatric Advanced Life S', to_date('09-09-2024', 'dd-mm-yyyy'), 'Tiberias', 1971, 26, 100385370);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1094, 'First Aid for Stroke', to_date('03-09-2024', 'dd-mm-yyyy'), 'Lod', 3913, 25, 112935118);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1130, 'Workplace First Aid and S', to_date('14-11-2024', 'dd-mm-yyyy'), 'Haifa', 4317, 29, 111081233);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1009, 'First Aid for Poisoning', to_date('18-05-2024', 'dd-mm-yyyy'), 'Tel Aviv', 2545, 4, 119086366);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1110, 'First Aid for Allergic Re', to_date('18-07-2024', 'dd-mm-yyyy'), 'Beersheva', 578, 30, 117667536);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1070, 'Pediatric Advanced Life S', to_date('15-02-2024', 'dd-mm-yyyy'), 'Tiberias', 3817, 23, 104737631);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1114, 'Tactical First Aid', to_date('16-02-2024', 'dd-mm-yyyy'), 'Ashdod', 4668, 24, 113395018);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1410, 'First Aid for Hypothermia', to_date('03-09-2024', 'dd-mm-yyyy'), 'Holon', 2533, 27, 116751178);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1343, 'First Aid for Hypothermia', to_date('26-09-2024', 'dd-mm-yyyy'), 'Lod', 3047, 6, 108269297);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1210, 'First Aid for Choking', to_date('09-12-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2146, 10, 114424820);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1137, 'First Aid for Burns', to_date('23-02-2024', 'dd-mm-yyyy'), 'Eilat', 4400, 11, 101820695);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1500, 'First Aid for Poisoning', to_date('24-08-2024', 'dd-mm-yyyy'), 'Jerusalem', 1845, 15, 109081866);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1438, 'First Aid for Burns', to_date('20-01-2024', 'dd-mm-yyyy'), 'Rehovot', 1434, 1, 117343752);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1043, 'Disaster Response and Man', to_date('22-08-2024', 'dd-mm-yyyy'), 'Netanya', 3997, 9, 107129107);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1417, 'First Aid for Hypothermia', to_date('25-10-2024', 'dd-mm-yyyy'), 'Haifa', 1988, 27, 100014699);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1159, 'First Aid for Trauma Inju', to_date('07-12-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 1473, 19, 113645004);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1205, 'First Aid for Burns', to_date('19-09-2024', 'dd-mm-yyyy'), 'Rehovot', 490, 9, 103965252);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1252, 'CPR', to_date('17-03-2024', 'dd-mm-yyyy'), 'Ramat Gan', 382, 24, 119357331);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1290, 'Tactical First Aid', to_date('13-06-2024', 'dd-mm-yyyy'), 'Ramat Gan', 1239, 24, 100510688);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1484, 'First Aid for Fractures a', to_date('02-11-2024', 'dd-mm-yyyy'), 'Ashdod', 2127, 8, 104863851);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1066, 'First Aid for Trauma Inju', to_date('07-07-2024', 'dd-mm-yyyy'), 'Lod', 566, 15, 102988324);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1235, 'First Aid for Animal Bite', to_date('06-08-2024', 'dd-mm-yyyy'), 'Bat Yam', 1130, 11, 109321696);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1315, 'Basic First Aid', to_date('15-12-2024', 'dd-mm-yyyy'), 'Tel Aviv', 865, 11, 106561948);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1062, 'First Aid for Stroke', to_date('15-10-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 2201, 6, 116122706);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1368, 'First Aid for Animal Bite', to_date('01-11-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 1817, 29, 106384931);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1374, 'First Aid for Animal Bite', to_date('17-03-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 1663, 16, 104602507);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1284, 'First Aid for Heat Stroke', to_date('20-01-2024', 'dd-mm-yyyy'), 'Nazareth', 4328, 4, 104871149);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1248, 'First Aid for Burns', to_date('05-10-2024', 'dd-mm-yyyy'), 'Rehovot', 4325, 2, 111671448);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1184, 'Mental Health First Aid', to_date('07-11-2024', 'dd-mm-yyyy'), 'Hadera', 627, 13, 117405583);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1461, 'Advanced Cardiac Life Sup', to_date('31-03-2024', 'dd-mm-yyyy'), 'Bat Yam', 4649, 10, 103586610);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1300, 'First Aid for Trauma Inju', to_date('17-04-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 4968, 16, 111129912);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1079, 'Pediatric Advanced Life S', to_date('19-03-2024', 'dd-mm-yyyy'), 'Nazareth', 3067, 1, 109213900);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1021, 'CPR', to_date('31-08-2024', 'dd-mm-yyyy'), 'Eilat', 4779, 10, 103543404);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1140, 'First Aid for Stroke', to_date('01-10-2024', 'dd-mm-yyyy'), 'Ramat Gan', 1108, 9, 118152249);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1345, 'Workplace First Aid and S', to_date('25-04-2024', 'dd-mm-yyyy'), 'Beersheva', 2616, 28, 100026509);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1014, 'First Aid for Animal Bite', to_date('01-08-2024', 'dd-mm-yyyy'), 'Tiberias', 3295, 22, 105839849);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1240, 'Emergency Medical Technic', to_date('21-07-2024', 'dd-mm-yyyy'), 'Nazareth', 1828, 6, 113956151);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1214, 'First Aid for Burns', to_date('27-06-2024', 'dd-mm-yyyy'), 'Nazareth', 4496, 6, 116569739);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1349, 'First Aid for Fractures a', to_date('02-11-2024', 'dd-mm-yyyy'), 'Ashkelon', 2153, 4, 103879697);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1477, 'Wilderness First Aid', to_date('08-08-2024', 'dd-mm-yyyy'), 'Tiberias', 1366, 19, 108658601);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1352, 'First Aid for Heat Stroke', to_date('18-02-2024', 'dd-mm-yyyy'), 'Ashkelon', 3837, 19, 110870156);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1271, 'First Aid for Hypothermia', to_date('11-04-2024', 'dd-mm-yyyy'), 'Modi''in', 655, 30, 117405583);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1316, 'First Aid for Hypothermia', to_date('13-04-2024', 'dd-mm-yyyy'), 'Petah-Tikva', 2828, 13, 108668499);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1012, 'First Aid for Heat Stroke', to_date('13-07-2024', 'dd-mm-yyyy'), 'Ramat Gan', 2838, 10, 104134011);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1106, 'First Aid for Animal Bite', to_date('12-04-2024', 'dd-mm-yyyy'), 'Rehovot', 1187, 3, 116612234);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1301, 'First Aid for Heat Stroke', to_date('08-10-2024', 'dd-mm-yyyy'), 'Hadera', 3306, 17, 104495694);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1289, 'CPR', to_date('17-04-2024', 'dd-mm-yyyy'), 'Jerusalem', 4131, 20, 104505799);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1127, 'First Aid for Fractures a', to_date('20-06-2024', 'dd-mm-yyyy'), 'Tel Aviv', 3314, 11, 108482179);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1367, 'First Aid for Burns', to_date('14-11-2024', 'dd-mm-yyyy'), 'Modi''in', 2335, 10, 112172553);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1052, 'First Aid for Heat Stroke', to_date('10-08-2024', 'dd-mm-yyyy'), 'Bat Yam', 2107, 19, 105463080);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1304, 'Tactical First Aid', to_date('11-06-2024', 'dd-mm-yyyy'), 'Hadera', 959, 10, 111211601);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1483, 'Mental Health First Aid', to_date('25-05-2024', 'dd-mm-yyyy'), 'Eilat', 3765, 13, 103194408);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1230, 'CPR', to_date('28-11-2024', 'dd-mm-yyyy'), 'Jerusalem', 3339, 17, 115054337);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1098, 'CPR', to_date('14-09-2024', 'dd-mm-yyyy'), 'Herzliya', 4486, 22, 101913209);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1462, 'First Aid for Animal Bite', to_date('27-03-2024', 'dd-mm-yyyy'), 'Jerusalem', 4659, 14, 103421196);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1229, 'Mental Health First Aid', to_date('22-03-2024', 'dd-mm-yyyy'), 'Rehovot', 381, 18, 101060681);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1017, 'First Aid for Fractures a', to_date('18-07-2024', 'dd-mm-yyyy'), 'Holon', 2401, 10, 103532277);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1330, 'Tactical First Aid', to_date('29-06-2024', 'dd-mm-yyyy'), 'Holon', 4989, 14, 111466802);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1258, 'First Aid for Fractures a', to_date('20-02-2024', 'dd-mm-yyyy'), 'Beersheva', 671, 13, 110395850);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1293, 'First Aid for Animal Bite', to_date('26-02-2024', 'dd-mm-yyyy'), 'Tel Aviv', 2144, 25, 110609447);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1312, 'First Aid for Stroke', to_date('20-06-2024', 'dd-mm-yyyy'), 'Holon', 3333, 25, 109706774);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1420, 'Disaster Response and Man', to_date('25-09-2024', 'dd-mm-yyyy'), 'Rehovot', 3970, 7, 109936757);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1348, 'Advanced Cardiac Life Sup', to_date('04-02-2024', 'dd-mm-yyyy'), 'Ashkelon', 2641, 17, 110336198);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1257, 'First Aid for Heat Stroke', to_date('01-01-2025', 'dd-mm-yyyy'), 'Modi''in', 2543, 19, 117331874);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1132, 'Basic First Aid', to_date('11-06-2024', 'dd-mm-yyyy'), 'Hadera', 1240, 9, 101715234);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1480, 'Mental Health First Aid', to_date('03-03-2024', 'dd-mm-yyyy'), 'Netanya', 3067, 17, 105463080);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1138, 'Workplace First Aid and S', to_date('24-10-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2660, 28, 112843045);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1424, 'Emergency Medical Technic', to_date('03-10-2024', 'dd-mm-yyyy'), 'Ramat Gan', 3856, 2, 110799878);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1051, 'Pediatric Advanced Life S', to_date('29-08-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 384, 5, 112889471);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1264, 'Tactical First Aid', to_date('31-08-2024', 'dd-mm-yyyy'), 'Hadera', 2163, 27, 119668718);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1236, 'First Aid for Stroke', to_date('08-11-2024', 'dd-mm-yyyy'), 'Tiberias', 1408, 11, 112742554);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1036, 'First Aid for Allergic Re', to_date('13-01-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 4304, 17, 117217686);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1291, 'Workplace First Aid and S', to_date('24-06-2024', 'dd-mm-yyyy'), 'Holon', 4744, 18, 103708497);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1053, 'First Aid for Choking', to_date('02-02-2024', 'dd-mm-yyyy'), 'Netanya', 3369, 3, 110447150);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1332, 'Tactical First Aid', to_date('28-06-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2942, 14, 104065356);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1494, 'First Aid for Allergic Re', to_date('24-10-2024', 'dd-mm-yyyy'), 'Tel Aviv', 3435, 7, 110740302);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1224, 'Mental Health First Aid', to_date('03-08-2024', 'dd-mm-yyyy'), 'Beersheva', 1869, 2, 108209236);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1393, 'Tactical First Aid', to_date('29-05-2024', 'dd-mm-yyyy'), 'Nazareth', 2259, 4, 115299900);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1369, 'Wilderness First Aid', to_date('15-02-2024', 'dd-mm-yyyy'), 'Rehovot', 1131, 21, 107489318);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1325, 'First Aid for Animal Bite', to_date('05-02-2024', 'dd-mm-yyyy'), 'Eilat', 4219, 29, 114450427);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1243, 'Disaster Response and Man', to_date('20-03-2024', 'dd-mm-yyyy'), 'Eilat', 1516, 26, 114946727);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1143, 'Workplace First Aid and S', to_date('29-12-2024', 'dd-mm-yyyy'), 'Ashdod', 3569, 26, 100568525);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1209, 'Workplace First Aid and S', to_date('15-09-2024', 'dd-mm-yyyy'), 'Ashkelon', 3121, 23, 119342643);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1404, 'First Aid for Burns', to_date('08-05-2024', 'dd-mm-yyyy'), 'Jerusalem', 461, 24, 109573696);
commit;
prompt 400 records committed...
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1085, 'Advanced Cardiac Life Sup', to_date('14-02-2024', 'dd-mm-yyyy'), 'Holon', 3025, 20, 109840292);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1319, 'Workplace First Aid and S', to_date('07-07-2024', 'dd-mm-yyyy'), 'Nazareth', 1918, 6, 110870156);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1220, 'First Aid for Animal Bite', to_date('12-07-2024', 'dd-mm-yyyy'), 'Herzliya', 1435, 12, 100884612);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1183, 'First Aid for Heat Stroke', to_date('21-04-2024', 'dd-mm-yyyy'), 'Ashkelon', 1287, 8, 104605041);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1128, 'First Aid for Trauma Inju', to_date('02-11-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 1165, 16, 101799973);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1326, 'Disaster Response and Man', to_date('18-08-2024', 'dd-mm-yyyy'), 'Tiberias', 1746, 20, 116319731);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1471, 'First Aid for Stroke', to_date('08-12-2024', 'dd-mm-yyyy'), 'Nazareth', 3698, 2, 109947036);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1187, 'First Aid for Poisoning', to_date('27-09-2024', 'dd-mm-yyyy'), 'Tiberias', 1789, 21, 103293073);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1379, 'First Aid for Allergic Re', to_date('10-03-2024', 'dd-mm-yyyy'), 'Ashkelon', 3475, 26, 103493409);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1492, 'Workplace First Aid and S', to_date('18-04-2024', 'dd-mm-yyyy'), 'Tiberias', 3986, 24, 116192833);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1040, 'First Aid for Hypothermia', to_date('15-08-2024', 'dd-mm-yyyy'), 'Ashkelon', 3108, 20, 114137866);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1175, 'First Aid for Poisoning', to_date('13-08-2024', 'dd-mm-yyyy'), 'Beersheva', 2627, 14, 115220272);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1408, 'First Aid for Poisoning', to_date('05-06-2024', 'dd-mm-yyyy'), 'Beersheva', 2739, 9, 112490015);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1282, 'First Aid for Hypothermia', to_date('19-08-2024', 'dd-mm-yyyy'), 'Nazareth', 2179, 16, 114468732);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1488, 'First Aid for Choking', to_date('14-07-2024', 'dd-mm-yyyy'), 'Tiberias', 1154, 28, 117993044);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1200, 'Advanced Cardiac Life Sup', to_date('31-08-2024', 'dd-mm-yyyy'), 'Tel Aviv', 1533, 14, 101223690);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1442, 'First Aid for Poisoning', to_date('22-09-2024', 'dd-mm-yyyy'), 'Nazareth', 2907, 11, 115699096);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1208, 'First Aid for Trauma Inju', to_date('05-11-2024', 'dd-mm-yyyy'), 'Bat Yam', 2443, 21, 113041354);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1485, 'First Aid for Burns', to_date('18-01-2024', 'dd-mm-yyyy'), 'Beersheva', 3098, 22, 106223251);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1120, 'CPR', to_date('17-07-2024', 'dd-mm-yyyy'), 'Eilat', 4281, 18, 107576507);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1093, 'First Aid for Heat Stroke', to_date('21-03-2024', 'dd-mm-yyyy'), 'Tiberias', 4287, 28, 104105774);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1272, 'Mental Health First Aid', to_date('26-05-2024', 'dd-mm-yyyy'), 'Hadera', 3269, 8, 101172479);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1268, 'First Aid for Burns', to_date('29-09-2024', 'dd-mm-yyyy'), 'Ramat Gan', 3826, 25, 110290929);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1263, 'Tactical First Aid', to_date('27-10-2024', 'dd-mm-yyyy'), 'Hadera', 1598, 2, 114859710);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1030, 'Emergency Medical Technic', to_date('07-03-2024', 'dd-mm-yyyy'), 'Ashkelon', 4305, 18, 108446603);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1083, 'First Aid for Choking', to_date('24-04-2024', 'dd-mm-yyyy'), 'Rehovot', 3595, 6, 114153684);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1105, 'Disaster Response and Man', to_date('27-02-2024', 'dd-mm-yyyy'), 'Haifa', 4345, 27, 102386849);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1232, 'Disaster Response and Man', to_date('16-11-2024', 'dd-mm-yyyy'), 'Ramat Gan', 1913, 21, 114153684);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1072, 'First Aid for Fractures a', to_date('23-12-2024', 'dd-mm-yyyy'), 'Haifa', 1718, 16, 117069034);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1191, 'First Aid for Trauma Inju', to_date('13-12-2024', 'dd-mm-yyyy'), 'Tiberias', 4486, 11, 106620348);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1425, 'First Aid for Burns', to_date('09-10-2024', 'dd-mm-yyyy'), 'Haifa', 2496, 7, 114162501);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1378, 'First Aid for Choking', to_date('19-02-2024', 'dd-mm-yyyy'), 'Haifa', 2084, 18, 102428049);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1124, 'First Aid for Hypothermia', to_date('11-04-2024', 'dd-mm-yyyy'), 'Ashkelon', 1239, 28, 117067639);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1115, 'First Aid for Heat Stroke', to_date('07-07-2024', 'dd-mm-yyyy'), 'Haifa', 4041, 9, 100371881);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1158, 'Emergency Medical Technic', to_date('06-06-2024', 'dd-mm-yyyy'), 'Ashkelon', 3051, 26, 109366623);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1082, 'CPR', to_date('15-12-2024', 'dd-mm-yyyy'), 'Modi''in', 641, 5, 100217987);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1411, 'First Aid for Allergic Re', to_date('26-12-2024', 'dd-mm-yyyy'), 'Rehovot', 1957, 15, 108380339);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1454, 'First Aid for Choking', to_date('29-02-2024', 'dd-mm-yyyy'), 'Lod', 2278, 23, 110215433);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1088, 'Tactical First Aid', to_date('30-05-2024', 'dd-mm-yyyy'), 'Holon', 1422, 4, 104076691);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1351, 'First Aid for Burns', to_date('09-04-2024', 'dd-mm-yyyy'), 'Netanya', 3722, 7, 101753774);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1451, 'Tactical First Aid', to_date('15-02-2024', 'dd-mm-yyyy'), 'Tel Aviv', 4557, 22, 100761540);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1136, 'CPR', to_date('16-07-2024', 'dd-mm-yyyy'), 'Rishon LeZion', 2649, 29, 107516777);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1122, 'Basic First Aid', to_date('27-01-2024', 'dd-mm-yyyy'), 'Nazareth', 3824, 17, 110205221);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1468, 'First Aid for Animal Bite', to_date('24-10-2024', 'dd-mm-yyyy'), 'Ashkelon', 2611, 30, 115055445);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1416, 'First Aid for Burns', to_date('08-08-2024', 'dd-mm-yyyy'), 'Holon', 3282, 22, 116506275);
insert into COURSE (course_id, course_name, course_date, course_location, price, hours, instructor_id)
values (1102, 'First Aid for Burns', to_date('11-02-2024', 'dd-mm-yyyy'), 'Ramat Gan', 4680, 28, 115163083);
commit;
prompt 446 records loaded
prompt Loading COURSE_TOOL...
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1000);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1001);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1002);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1004);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1005);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1006);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1007);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1008);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1009);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1010);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1011);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1013);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1016);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1018);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1019);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1020);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1021);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1024);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1025);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1026);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1027);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1028);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1029);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1031);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1032);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1033);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1034);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1035);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1037);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1038);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1039);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1041);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1042);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1043);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1044);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1046);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1050);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1054);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1055);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1056);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1057);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1058);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1059);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1060);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1061);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1062);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1063);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1064);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1065);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1066);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1067);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1069);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1071);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1074);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1075);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1076);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1077);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1078);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1079);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1080);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1084);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1087);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1089);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1090);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1091);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1092);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1094);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1095);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1097);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1099);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1100);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1101);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1103);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1104);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1107);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1109);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1110);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1111);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1113);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1114);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1117);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1118);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1119);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1121);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1123);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1126);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1129);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1130);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1131);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1133);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1134);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1135);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1137);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1139);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1140);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1141);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1144);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1145);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1146);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1149);
commit;
prompt 100 records committed...
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1150);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1151);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1152);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1153);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1154);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1155);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1156);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1157);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1159);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1160);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1161);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1162);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1163);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1164);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1166);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1167);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1169);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1170);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1171);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1172);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1173);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1174);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1176);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1177);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1178);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1179);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1181);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1182);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1184);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1186);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1188);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1189);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1192);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1193);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1194);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1195);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1196);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1198);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1199);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1201);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1202);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1203);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1205);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1207);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1210);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1211);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1212);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1213);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1215);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1217);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1218);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1219);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1223);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1225);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1226);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1227);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1228);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1231);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1233);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1234);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1235);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1237);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1238);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1239);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1241);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1242);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1244);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1245);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1246);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1247);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1248);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1249);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1250);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1251);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1252);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1255);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1256);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1259);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1265);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1266);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1267);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1269);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1270);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1273);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1275);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1276);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1277);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1278);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1279);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1281);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1284);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1285);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1286);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1287);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1288);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1290);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1294);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1295);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1296);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1299);
commit;
prompt 200 records committed...
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1300);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1302);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1305);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1307);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1308);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1309);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1310);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1311);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1313);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1314);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1315);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1317);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1318);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1320);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1322);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1323);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1324);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1327);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1328);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1329);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1331);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1333);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1335);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1336);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1337);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1338);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1339);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1340);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1341);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1343);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1344);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1345);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1347);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1350);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1354);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1355);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1356);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1357);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1360);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1362);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1364);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1366);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1371);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1374);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1375);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1376);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1377);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1380);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1381);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1383);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1384);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1386);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1388);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1389);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1390);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1391);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1392);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1394);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1398);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1399);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1400);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1402);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1403);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1405);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1406);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1407);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1410);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1412);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1413);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1414);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1417);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1421);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1423);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1426);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1427);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1428);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1429);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1430);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1431);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1432);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1433);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1434);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1436);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1437);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1438);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1439);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1440);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1441);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1445);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1446);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1447);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1448);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1450);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1452);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1453);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1455);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1457);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1458);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1459);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1460);
commit;
prompt 300 records committed...
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1461);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1463);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1464);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1465);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1466);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1467);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1469);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1470);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1472);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1473);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1475);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1478);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1479);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1482);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1484);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1486);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1487);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1491);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1493);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1495);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1496);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1497);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1498);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1499);
insert into COURSE_TOOL (tool_name, course_id)
values ('Tool_name field from Tool', 1500);
commit;
prompt 325 records loaded
prompt Loading PARTICIPANT...
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (419243268, 'Mab', 'Indgs', '187 Kinsman Center', 'jindgs0@google.co.uk', to_date('30-09-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (504018726, 'Tabor', 'Dumbrill', '031 Jay Street', 'gdumbrill1@google.cn', to_date('01-04-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (774239595, 'Boycie', 'Daine', '32 Garrison Alley', 'adaine2@nytimes.com', to_date('16-01-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (435781343, 'Georgeanne', 'Rosingdall', '93 Eggendart Parkway', 'crosingdall3@newsvine.com', to_date('14-12-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (586890466, 'Heidie', 'Oxbrough', '10 Monterey Crossing', 'boxbrough4@youku.com', to_date('31-05-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (151316118, 'Fiona', 'Aarons', '4135 David Street', 'eaarons5@baidu.com', to_date('23-05-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (449206569, 'Eula', 'Maddams', '270 Fulton Road', 'mmaddams6@cbsnews.com', to_date('04-01-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (372228207, 'Olia', 'Napthine', '25 Truax Parkway', 'gnapthine7@addthis.com', to_date('04-12-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (310109165, 'Noah', 'Woolbrook', '59 Schurz Park', 'cwoolbrook8@bloglines.com', to_date('02-03-1984', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (974570282, 'Andromache', 'Torrese', '352 Longview Circle', 'gtorrese9@feedburner.com', to_date('24-02-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (859138464, 'Hillier', 'Giral', '288 Kings Pass', 'ggirala@nydailynews.com', to_date('15-05-1995', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (950194541, 'Alys', 'Aynsley', '9 Schlimgen Street', 'jaynsleyb@scientificamerican.com', to_date('03-07-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (858454932, 'Bettine', 'Heelis', '94 Stoughton Street', 'bheelisc@apache.org', to_date('13-09-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (974779780, 'Virginie', 'Gallier', '7472 Washington Hill', 'dgallierd@list-manage.com', to_date('29-01-1963', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (247345555, 'Rudd', 'Staterfield', '6926 Buena Vista Plaza', 'astaterfielde@oracle.com', to_date('17-10-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (446951736, 'Leonid', 'Matuskiewicz', '5564 Almo Junction', 'lmatuskiewiczf@about.me', to_date('08-09-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (564201474, 'Andy', 'Mower', '3295 Caliangt Road', 'kmowerg@webeden.co.uk', to_date('01-07-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (659629898, 'Alma', 'Peirone', '6874 Fuller Point', 'jpeironeh@wikispaces.com', to_date('08-12-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (537962975, 'Wes', 'Wormleighton', '4351 Tomscot Place', 'lwormleightoni@chron.com', to_date('31-08-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (570977330, 'Michel', 'Lashmar', '955 Eliot Plaza', 'dlashmarj@wikimedia.org', to_date('23-01-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (145834293, 'Miquela', 'Greatreax', '52585 Carpenter Trail', 'ggreatreaxk@digg.com', to_date('25-10-1977', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (220068195, 'Carl', 'Duncanson', '3 Tomscot Parkway', 'aduncansonl@prweb.com', to_date('17-06-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (291284931, 'Sukey', 'Whorall', '186 Southridge Road', 'bwhorallm@nhs.uk', to_date('12-11-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (944849489, 'Rona', 'Pebworth', '2884 Charing Cross Way', 'kpebworthn@umn.edu', to_date('03-09-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (248522719, 'Valene', 'Spendley', '8963 Tennyson Parkway', 'rspendleyo@addthis.com', to_date('08-06-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (480979178, 'Jenine', 'Dudin', '16338 Mockingbird Junction', 'cdudinp@cbslocal.com', to_date('03-08-1991', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (445415422, 'Nydia', 'Hune', '69813 Transport Avenue', 'khuneq@cnbc.com', to_date('27-05-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (856032291, 'Raimund', 'Shilito', '7466 Canary Plaza', 'lshilitor@pagesperso-orange.fr', to_date('21-08-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (364170530, 'Josefina', 'Abercromby', '19770 Dakota Circle', 'rabercrombys@discuz.net', to_date('21-09-1981', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (437024138, 'Trenton', 'Pacquet', '33 Sauthoff Center', 'spacquett@si.edu', to_date('30-03-1990', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (713982859, 'Kaylyn', 'Kondratyuk', '39652 Utah Point', 'akondratyuku@com.com', to_date('07-03-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (736400664, 'Gabbie', 'Ratcliff', '718 Clove Parkway', 'aratcliffv@mit.edu', to_date('14-07-1959', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (594848985, 'Sadella', 'Croutear', '12 Tennyson Pass', 'jcroutearw@ifeng.com', to_date('14-09-1987', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (919239938, 'Quill', 'James', '926 Forster Lane', 'bjamesx@apache.org', to_date('28-05-1994', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (111753641, 'Noam', 'Crux', '9 Rusk Lane', 'mcruxy@icq.com', to_date('27-08-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (875565271, 'Greg', 'Patershall', '0500 Dennis Terrace', 'cpatershallz@printfriendly.com', to_date('30-01-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (587422443, 'Tab', 'Sutcliff', '57242 Claremont Court', 'fsutcliff10@hibu.com', to_date('28-06-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (789324671, 'Niven', 'Wilmot', '43091 Kennedy Trail', 'pwilmot11@opensource.org', to_date('29-04-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (477338704, 'Diann', 'Lum', '66 Jackson Plaza', 'glum12@shop-pro.jp', to_date('10-05-1996', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (887844594, 'Bernita', 'Senton', '32632 Beilfuss Hill', 'asenton13@ocn.ne.jp', to_date('09-04-1996', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (350432353, 'Wainwright', 'Cowton', '40 Hanson Road', 'acowton14@nbcnews.com', to_date('28-05-1981', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (372927150, 'Godwin', 'Simmill', '11668 Acker Trail', 'ksimmill15@theatlantic.com', to_date('26-12-1998', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (487460199, 'Cassandry', 'Pawden', '163 Annamark Way', 'kpawden16@flavors.me', to_date('14-08-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (274837613, 'Edeline', 'MacKaig', '416 Chinook Place', 'jmackaig17@home.pl', to_date('09-03-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (611078316, 'Konstance', 'Ventam', '9152 Kipling Avenue', 'jventam18@fc2.com', to_date('09-03-1976', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (294368552, 'Gigi', 'Ohrt', '252 Shoshone Point', 'rohrt19@themeforest.net', to_date('09-04-1959', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (562291542, 'Cathy', 'Philipsen', '78 Shoshone Center', 'mphilipsen1a@shinystat.com', to_date('27-11-1981', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (625659195, 'Etan', 'Ishchenko', '7 Melby Road', 'mishchenko1b@guardian.co.uk', to_date('19-05-1990', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (857617113, 'Pippa', 'Klimowicz', '6 Blue Bill Park Center', 'cklimowicz1c@usatoday.com', to_date('03-08-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (505783536, 'Tate', 'Brandes', '347 Kropf Street', 'sbrandes1d@dmoz.org', to_date('06-11-2005', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (764351720, 'Randie', 'Rudham', '0 Merrick Parkway', 'mrudham1e@skype.com', to_date('03-03-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (611600761, 'Patty', 'Crossthwaite', '53 Grayhawk Court', 'ccrossthwaite1f@engadget.com', to_date('26-04-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (928532356, 'Emmanuel', 'Foxten', '5 Jay Lane', 'efoxten1g@walmart.com', to_date('27-06-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (335261189, 'Kristo', 'Headford', '22 Sugar Junction', 'bheadford1h@census.gov', to_date('18-01-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (571691372, 'Orly', 'Worsnop', '3 Cody Road', 'cworsnop1i@1und1.de', to_date('26-02-1998', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (566478883, 'Randie', 'Tattershall', '4 Upham Parkway', 'stattershall1j@mayoclinic.com', to_date('07-03-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (226458321, 'Silvia', 'Naish', '66 Reinke Hill', 'wnaish1k@google.co.uk', to_date('31-10-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (400866598, 'Arlena', 'Gurden', '36 Pine View Circle', 'sgurden1l@elegantthemes.com', to_date('11-06-1977', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (415639229, 'Constanta', 'Grayston', '3820 Blue Bill Park Plaza', 'wgrayston1m@technorati.com', to_date('04-08-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (510501404, 'Adriena', 'Measey', '70189 Moland Point', 'cmeasey1n@census.gov', to_date('17-02-1990', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (980919722, 'Vincents', 'Thebeaud', '70 Lakeland Parkway', 'gthebeaud1o@about.me', to_date('20-08-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (399478463, 'Brendon', 'Kendell', '721 Barby Avenue', 'mkendell1p@yelp.com', to_date('10-03-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (987377918, 'Maxie', 'Cowan', '18 Lerdahl Way', 'jcowan1q@msn.com', to_date('16-06-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (542609215, 'Rey', 'Jahnisch', '68534 Reinke Street', 'njahnisch1r@51.la', to_date('14-11-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (183600425, 'Bird', 'Horder', '4 International Park', 'ahorder1s@live.com', to_date('20-07-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (282278311, 'Agace', 'MacDunlevy', '34199 Village Place', 'hmacdunlevy1t@wp.com', to_date('08-01-1996', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (797244562, 'Nell', 'Jurgen', '4 Loftsgordon Avenue', 'ejurgen1u@feedburner.com', to_date('02-08-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (469084369, 'Renate', 'Ferrieres', '4374 Ridgeview Pass', 'tferrieres1v@biblegateway.com', to_date('10-03-1984', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (971090608, 'Chrisy', 'Powder', '01 Gina Court', 'ypowder1w@over-blog.com', to_date('27-05-1974', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (951290609, 'Drusilla', 'Moubray', '74803 Birchwood Parkway', 'cmoubray1x@cornell.edu', to_date('24-02-1958', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (958825994, 'Grazia', 'Rude', '877 Old Shore Court', 'krude1y@naver.com', to_date('16-12-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (554970627, 'Luce', 'Vaskov', '743 Graceland Crossing', 'kvaskov1z@scientificamerican.com', to_date('25-11-1996', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (747528568, 'Sayre', 'Renehan', '96475 Sutherland Park', 'brenehan20@mozilla.com', to_date('02-12-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (385109467, 'Dun', 'Tonna', '78823 Warrior Hill', 'otonna21@dell.com', to_date('13-04-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (460843391, 'Klarrisa', 'Sneath', '45156 Hudson Alley', 'nsneath22@dagondesign.com', to_date('30-03-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (194568136, 'Konrad', 'Arney', '5 8th Drive', 'carney23@sciencedirect.com', to_date('01-01-2000', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (334884645, 'Kellina', 'Riping', '92569 Westerfield Point', 'sriping24@mapquest.com', to_date('22-09-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (532364762, 'Abba', 'Bownas', '97050 Dwight Circle', 'rbownas25@stumbleupon.com', to_date('08-10-1990', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (168061387, 'Temp', 'Blunn', '19923 Havey Alley', 'cblunn26@pbs.org', to_date('19-01-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (117374915, 'Bary', 'Lyst', '2469 Cascade Road', 'mlyst27@facebook.com', to_date('09-01-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (548431889, 'Levey', 'Esposi', '880 Grayhawk Road', 'yesposi28@oakley.com', to_date('07-06-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (569618267, 'Pamella', 'Jurewicz', '6 Caliangt Point', 'vjurewicz29@technorati.com', to_date('27-07-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (732887643, 'Shelby', 'Feldberger', '810 Tennessee Lane', 'efeldberger2a@shutterfly.com', to_date('15-12-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (880651558, 'Lynnette', 'Gillet', '070 Cherokee Road', 'cgillet2b@1und1.de', to_date('17-03-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (257157291, 'Jacinthe', 'Brotheridge', '5195 6th Lane', 'mbrotheridge2c@4shared.com', to_date('18-04-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (921373541, 'Rosalie', 'Cheavin', '074 Esch Point', 'rcheavin2d@myspace.com', to_date('03-05-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (277583651, 'Opalina', 'Weigh', '87 Mosinee Alley', 'nweigh2e@istockphoto.com', to_date('16-09-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (249281012, 'Roscoe', 'Stein', '410 Carpenter Lane', 'estein2f@ocn.ne.jp', to_date('14-07-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (863207629, 'Benson', 'Dyshart', '777 Drewry Junction', 'mdyshart2g@yale.edu', to_date('06-11-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (817295135, 'Fernando', 'McIlmorie', '34220 Corry Road', 'wmcilmorie2h@wisc.edu', to_date('30-03-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (476409125, 'Nathalia', 'Vergo', '937 Washington Point', 'avergo2i@telegraph.co.uk', to_date('19-03-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (691618360, 'Pet', 'Vanichkin', '76 Tony Hill', 'mvanichkin2j@bloomberg.com', to_date('14-02-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (351426232, 'Andriette', 'Kenan', '8 Graedel Court', 'fkenan2k@elpais.com', to_date('07-07-1991', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (768534967, 'Luz', 'Dimitresco', '0943 Merrick Place', 'sdimitresco2l@icq.com', to_date('25-10-1958', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (282628997, 'Teddie', 'Fedorski', '275 Merrick Hill', 'gfedorski2m@unblog.fr', to_date('20-02-2005', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (225379159, 'Tab', 'Seywood', '64 Grayhawk Parkway', 'aseywood2n@newsvine.com', to_date('15-12-1987', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (527938119, 'Lodovico', 'MacPeake', '5212 Hauk Trail', 'cmacpeake2o@cbslocal.com', to_date('01-01-1986', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (887320303, 'Karole', 'Balston', '92 Charing Cross Junction', 'ebalston2p@prweb.com', to_date('15-03-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (674182788, 'Monro', 'MacGiany', '56004 Arapahoe Crossing', 'dmacgiany2q@goodreads.com', to_date('17-05-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (752559176, 'Miran', 'Groocock', '3 Donald Street', 'vgroocock2r@alibaba.com', to_date('03-08-1996', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (491821294, 'Feliza', 'Gorrie', '90484 Lotheville Parkway', 'mgorrie2s@google.com.hk', to_date('02-06-1963', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (958595504, 'Hestia', 'Embery', '4900 American Drive', 'aembery2t@paginegialle.it', to_date('10-11-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (732996155, 'Nobe', 'Spat', '1 Corry Pass', 'fspat2u@xing.com', to_date('13-04-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (486780251, 'Dionne', 'Biasetti', '60648 Hollow Ridge Place', 'fbiasetti2v@sbwire.com', to_date('04-07-2000', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (548101695, 'Hal', 'Rowly', '42 Spaight Alley', 'crowly2w@engadget.com', to_date('17-02-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (638857476, 'Bonita', 'Exroll', '33485 Loomis Lane', 'jexroll2x@t-online.de', to_date('30-05-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (538139607, 'Mara', 'Bottomer', '18234 Southridge Park', 'nbottomer2y@dropbox.com', to_date('26-04-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (729745366, 'Drucy', 'Acreman', '299 Farmco Street', 'aacreman2z@wordpress.com', to_date('18-03-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (386688496, 'Vivianne', 'Blaik', '21 Monterey Hill', 'pblaik30@ft.com', to_date('26-10-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (226227869, 'Maryanna', 'Berresford', '5 Heffernan Pass', 'lberresford31@bloglines.com', to_date('16-03-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (738207711, 'Wilona', 'Barbera', '5131 Farwell Trail', 'vbarbera32@last.fm', to_date('14-03-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (520146188, 'Filberte', 'Josifovic', '66 Cambridge Crossing', 'ljosifovic33@yolasite.com', to_date('08-04-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (956204781, 'Letta', 'Feedome', '06 Moulton Street', 'ffeedome34@themeforest.net', to_date('04-01-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (678365789, 'Dory', 'McGrirl', '54 Packers Street', 'dmcgrirl35@theguardian.com', to_date('19-07-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (424644934, 'Lorilyn', 'Swaine', '35 Holy Cross Parkway', 'cswaine36@cocolog-nifty.com', to_date('03-05-2008', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (903710430, 'Casie', 'Marlon', '24335 Warbler Pass', 'gmarlon37@ucla.edu', to_date('05-12-1967', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (880459846, 'Kerry', 'Alibone', '62 Schmedeman Avenue', 'jalibone38@naver.com', to_date('10-07-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (807508610, 'Marena', 'Mebs', '59 Emmet Avenue', 'nmebs39@nps.gov', to_date('01-03-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (952867111, 'Kordula', 'Pearne', '5233 Lighthouse Bay Circle', 'gpearne3a@blog.com', to_date('27-05-1977', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (246618523, 'Stanislaus', 'Sleeford', '902 Mesta Terrace', 'ssleeford3b@cpanel.net', to_date('25-05-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (996948031, 'Judy', 'Dulton', '0043 Lawn Circle', 'fdulton3c@prweb.com', to_date('06-04-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (803135381, 'Nerta', 'Apted', '72 Brentwood Street', 'dapted3d@homestead.com', to_date('19-10-1977', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (599462410, 'Kelby', 'Juanico', '15959 Dovetail Parkway', 'fjuanico3e@weibo.com', to_date('24-04-1976', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (675822865, 'Winny', 'Shuxsmith', '9 Corscot Avenue', 'mshuxsmith3f@webmd.com', to_date('01-12-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (574237389, 'Damaris', 'Whitesel', '75737 Starling Street', 'gwhitesel3g@qq.com', to_date('18-12-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (684500089, 'Baird', 'Manley', '7 Laurel Crossing', 'mmanley3h@ucsd.edu', to_date('05-02-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (295520185, 'Tresa', 'Vyvyan', '28 Hansons Drive', 'svyvyan3i@blinklist.com', to_date('09-11-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (492378041, 'Latisha', 'Fandrich', '5465 Corben Pass', 'mfandrich3j@comsenz.com', to_date('03-12-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (307962704, 'Datha', 'Lautie', '5 Sutherland Place', 'alautie3k@blogspot.com', to_date('26-06-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (262709621, 'Glyn', 'Croucher', '0 Mandrake Terrace', 'ccroucher3l@facebook.com', to_date('14-08-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (391505670, 'Olivia', 'Wieprecht', '26155 Crest Line Drive', 'dwieprecht3m@microsoft.com', to_date('04-08-1987', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (905056958, 'Winonah', 'McCahill', '07554 Grayhawk Pass', 'amccahill3n@mashable.com', to_date('20-02-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (732156936, 'Jacqueline', 'Rosenfeld', '1193 Cordelia Circle', 'erosenfeld3o@infoseek.co.jp', to_date('18-08-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (581503277, 'Cynthia', 'Maciejewski', '2 Rusk Point', 'cmaciejewski3p@soup.io', to_date('01-05-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (717853304, 'Yovonnda', 'Osborne', '13258 Center Parkway', 'hosborne3q@virginia.edu', to_date('13-07-1963', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (540934925, 'Karlens', 'Betje', '9 Ridgeview Drive', 'sbetje3r@ihg.com', to_date('25-07-1995', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (785370977, 'Mildrid', 'Lorrain', '888 Hudson Circle', 'dlorrain3s@flavors.me', to_date('23-12-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (414615584, 'Hillary', 'Grimmert', '3689 Bartelt Court', 'dgrimmert3t@amazon.co.jp', to_date('09-04-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (470366387, 'Melisenda', 'Andrin', '61 Moland Plaza', 'randrin3u@cam.ac.uk', to_date('01-06-1984', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (846807278, 'Hall', 'Lyon', '0 Leroy Parkway', 'blyon3v@blog.com', to_date('10-02-1987', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (784600907, 'Rurik', 'Whittington', '56499 Ilene Road', 'jwhittington3w@marriott.com', to_date('16-07-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (331030591, 'Kipp', 'Gwinnel', '57 Memorial Hill', 'kgwinnel3x@wordpress.com', to_date('28-11-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (355590514, 'Gillian', 'Tabbernor', '29 Mariners Cove Street', 'atabbernor3y@telegraph.co.uk', to_date('20-10-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (755734032, 'Jinny', 'Surcombe', '4 Cottonwood Hill', 'ksurcombe3z@gmpg.org', to_date('09-11-1993', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (629786105, 'Hannie', 'Edinborough', '53 Eastwood Lane', 'wedinborough40@mapquest.com', to_date('15-10-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (371378890, 'Willie', 'Trevallion', '5 Becker Terrace', 'rtrevallion41@xing.com', to_date('21-07-1979', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (854022589, 'Gradey', 'Tunna', '85 Heffernan Terrace', 'rtunna42@networksolutions.com', to_date('19-01-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (520075240, 'Jocelyn', 'Slimming', '7997 Oak Valley Plaza', 'mslimming43@geocities.com', to_date('14-01-1963', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (158138175, 'Heath', 'Peacham', '198 Clarendon Hill', 'dpeacham44@miibeian.gov.cn', to_date('23-12-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (136403656, 'Kelwin', 'Ingrey', '81821 Union Court', 'cingrey45@studiopress.com', to_date('18-07-1973', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (644014753, 'Dolorita', 'Hazeldine', '39 Larry Way', 'rhazeldine46@scribd.com', to_date('08-05-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (504472943, 'Mela', 'Maggorini', '31 Erie Circle', 'gmaggorini47@sourceforge.net', to_date('06-04-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (639712638, 'Harlen', 'Normavell', '286 Clyde Gallagher Hill', 'jnormavell48@blinklist.com', to_date('31-12-1991', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (707367726, 'Corly', 'Kepe', '816 Emmet Lane', 'bkepe49@sciencedirect.com', to_date('08-09-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (670391541, 'Shandy', 'Bennion', '7535 Florence Avenue', 'tbennion4a@adobe.com', to_date('03-07-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (594853572, 'Rebecka', 'Kanzler', '1473 Truax Junction', 'gkanzler4b@etsy.com', to_date('18-05-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (589617206, 'Gav', 'Endicott', '574 Tennyson Drive', 'dendicott4c@tuttocitta.it', to_date('16-12-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (291158910, 'Currey', 'Thewles', '7039 Continental Point', 'cthewles4d@t-online.de', to_date('19-02-2000', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (340666716, 'Meggie', 'Daw', '304 Schurz Parkway', 'kdaw4e@wufoo.com', to_date('06-06-1958', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (199504657, 'Junina', 'Doick', '697 Southridge Lane', 'sdoick4f@mozilla.com', to_date('11-08-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (901001422, 'Nil', 'Giggs', '2 Garrison Drive', 'tgiggs4g@cnn.com', to_date('10-01-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (274685257, 'Shell', 'Vasyukhin', '284 Butterfield Trail', 'rvasyukhin4h@squarespace.com', to_date('27-11-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (224862437, 'Sergeant', 'Entwisle', '36 Anhalt Hill', 'rentwisle4i@skyrock.com', to_date('08-05-1997', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (519393755, 'Dennis', 'Rigbye', '99740 Warrior Trail', 'rrigbye4j@angelfire.com', to_date('12-06-1979', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (834033608, 'Alic', 'Lehrmann', '14 Spaight Trail', 'glehrmann4k@symantec.com', to_date('15-07-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (453116218, 'Owen', 'Connors', '2 Emmet Junction', 'rconnors4l@slate.com', to_date('24-09-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (925923696, 'Violet', 'Crowden', '0348 Butterfield Center', 'pcrowden4m@cbslocal.com', to_date('30-10-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (631311297, 'Ozzy', 'Roj', '983 Oakridge Avenue', 'troj4n@jigsy.com', to_date('27-12-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (167640477, 'Neilla', 'Thunderchief', '1545 Corben Crossing', 'pthunderchief4o@google.de', to_date('25-10-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (676243308, 'Tabbatha', 'Keningham', '0 Sachtjen Alley', 'bkeningham4p@cdbaby.com', to_date('03-10-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (946563676, 'Bendick', 'Trounce', '175 Holy Cross Way', 'ttrounce4q@booking.com', to_date('13-01-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (412571737, 'Kristyn', 'Stacey', '069 Old Shore Point', 'kstacey4r@virginia.edu', to_date('23-01-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (628426844, 'Ronnica', 'Reichert', '69694 Bunker Hill Junction', 'sreichert4s@myspace.com', to_date('27-01-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (205975580, 'Cacilie', 'Waterstone', '40957 Bartelt Plaza', 'lwaterstone4t@harvard.edu', to_date('15-03-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (752326610, 'Jennie', 'Feria', '344 Utah Hill', 'jferia4u@arstechnica.com', to_date('03-04-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (939839851, 'Hastie', 'Warham', '32 Gale Plaza', 'mwarham4v@yahoo.co.jp', to_date('19-01-1984', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (834475192, 'Anneliese', 'Ebrall', '74172 Del Sol Parkway', 'hebrall4w@netscape.com', to_date('07-05-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (384346562, 'Ethe', 'Paprotny', '715 Eggendart Court', 'mpaprotny4x@t-online.de', to_date('12-05-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (923449846, 'Veronika', 'Purle', '9 8th Court', 'apurle4y@ox.ac.uk', to_date('14-12-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (694943475, 'Luce', 'Hellwig', '1887 Brentwood Lane', 'nhellwig4z@narod.ru', to_date('08-12-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (428320038, 'Eliot', 'Doddemeede', '524 Declaration Place', 'mdoddemeede50@ted.com', to_date('21-08-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (671322471, 'Zahara', 'Rayburn', '708 Fuller Alley', 'arayburn51@go.com', to_date('16-03-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (515218335, 'Danella', 'Benedit', '31411 Browning Junction', 'dbenedit52@ebay.com', to_date('08-03-1993', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (765688162, 'Artus', 'Ouver', '58 Morrow Alley', 'mouver53@yellowbook.com', to_date('25-06-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (792601950, 'Jacquie', 'Inchbald', '54910 Hooker Avenue', 'ainchbald54@csmonitor.com', to_date('21-04-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (283605246, 'Piggy', 'Mangin', '789 Straubel Alley', 'mmangin55@mozilla.org', to_date('03-02-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (926919156, 'Caro', 'Baptiste', '5818 Manley Junction', 'mbaptiste56@yelp.com', to_date('09-07-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (996683594, 'Allis', 'Wakeley', '7454 Mosinee Plaza', 'gwakeley57@goo.ne.jp', to_date('01-08-1984', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (298024051, 'Elwira', 'Rodwell', '7098 Browning Park', 'hrodwell58@spiegel.de', to_date('20-06-1959', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (440048019, 'Florencia', 'Rowlstone', '418 Kropf Hill', 'wrowlstone59@dell.com', to_date('16-12-1967', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (624215523, 'Ronica', 'Halhead', '5488 1st Place', 'ihalhead5a@deliciousdays.com', to_date('04-03-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (797814119, 'Nevsa', 'Joburn', '35680 School Street', 'ljoburn5b@ucoz.com', to_date('01-01-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (558528371, 'Cairistiona', 'Killick', '22 Schlimgen Point', 'nkillick5c@businessinsider.com', to_date('06-03-1959', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (451702828, 'Jammie', 'Ankers', '75472 Old Gate Center', 'mankers5d@reference.com', to_date('07-10-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (802936580, 'Fidel', 'Waddams', '645 Northport Park', 'kwaddams5e@google.com', to_date('22-07-1957', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (672932992, 'Elspeth', 'Van T''Hoog', '71 Shasta Plaza', 'rvanthoog5f@weibo.com', to_date('28-01-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (146534920, 'Judith', 'Carnduff', '69 Merchant Trail', 'dcarnduff5g@example.com', to_date('21-08-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (896615410, 'Wilmer', 'Abbets', '34674 Vernon Lane', 'wabbets5h@acquirethisname.com', to_date('17-08-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (248694647, 'Blake', 'Edeler', '4314 Swallow Lane', 'aedeler5i@ed.gov', to_date('04-11-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (594821272, 'Gui', 'Dilliston', '0 Birchwood Way', 'ndilliston5j@github.com', to_date('09-08-1987', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (342364399, 'Andras', 'Forster', '90257 Daystar Terrace', 'sforster5k@reverbnation.com', to_date('22-04-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (246283530, 'Arty', 'Cappineer', '1 Goodland Lane', 'jcappineer5l@vinaora.com', to_date('31-01-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (600397018, 'Carmela', 'Dannell', '6000 Northview Avenue', 'bdannell5m@utexas.edu', to_date('04-02-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (545558015, 'Shantee', 'Deverille', '42 Monterey Circle', 'tdeverille5n@auda.org.au', to_date('18-01-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (971725080, 'Norbie', 'Hallowell', '782 Hoard Place', 'nhallowell5o@dropbox.com', to_date('29-09-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (208092458, 'Marcille', 'Edgeler', '538 Village Pass', 'vedgeler5p@elpais.com', to_date('08-08-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (846964207, 'Zacharia', 'Giuroni', '87671 Vernon Lane', 'kgiuroni5q@php.net', to_date('25-04-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (302857753, 'Eleanore', 'Ivatts', '9633 Village Court', 'vivatts5r@usgs.gov', to_date('07-05-1986', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (505586182, 'Debi', 'Anderson', '47 Twin Pines Hill', 'ganderson5s@hibu.com', to_date('17-01-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (774366329, 'Carrie', 'Falla', '8958 Jay Way', 'hfalla5t@dmoz.org', to_date('15-06-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (492086736, 'Terrell', 'Ferrarin', '0 Myrtle Pass', 'vferrarin5u@nasa.gov', to_date('26-04-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (237048771, 'Hilliard', 'Boulton', '21015 Eastlawn Plaza', 'jboulton5v@cocolog-nifty.com', to_date('06-08-1990', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (850084307, 'Hinze', 'Rysom', '6 Dovetail Lane', 'rrysom5w@example.com', to_date('03-05-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (794810693, 'Faina', 'Dawltrey', '80138 Bultman Street', 'gdawltrey5x@abc.net.au', to_date('11-08-1997', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (273476568, 'Jefferey', 'Caudrelier', '03124 High Crossing Place', 'mcaudrelier5y@discuz.net', to_date('02-02-1993', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (834134976, 'Evyn', 'Jaray', '6 Northport Avenue', 'wjaray5z@phpbb.com', to_date('30-04-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (220431119, 'Bayard', 'McIlmurray', '4 Forest Run Terrace', 'amcilmurray60@theguardian.com', to_date('31-12-1958', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (128352368, 'Hanan', 'Bedboro', '995 Melody Way', 'fbedboro61@hatena.ne.jp', to_date('14-11-1991', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (182063569, 'Cora', 'Bailess', '647 4th Point', 'cbailess62@huffingtonpost.com', to_date('11-01-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (660131391, 'Doyle', 'Taggett', '1718 Blackbird Street', 'ftaggett63@reverbnation.com', to_date('01-01-2008', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (850333783, 'Cherish', 'Yemm', '98438 Kensington Alley', 'cyemm64@nps.gov', to_date('08-09-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (233232194, 'Ethelbert', 'McNamara', '824 Valley Edge Drive', 'smcnamara65@rakuten.co.jp', to_date('31-12-1973', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (822345352, 'Tamar', 'Lancashire', '917 Beilfuss Alley', 'glancashire66@devhub.com', to_date('28-12-1995', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (720172357, 'Falkner', 'Natwick', '4868 Manitowish Circle', 'gnatwick67@ucoz.ru', to_date('28-12-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (371298943, 'Britteny', 'McQuillin', '83113 Sutherland Park', 'gmcquillin68@studiopress.com', to_date('10-07-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (522206993, 'Jedidiah', 'Tranmer', '69221 Rockefeller Drive', 'rtranmer69@friendfeed.com', to_date('03-08-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (575875839, 'Sibyl', 'Laye', '235 Delaware Crossing', 'alaye6a@imageshack.us', to_date('19-02-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (890262685, 'Perice', 'Onions', '3432 Acker Hill', 'ronions6b@sphinn.com', to_date('16-09-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (367557767, 'Philis', 'Godfroy', '08 Riverside Hill', 'egodfroy6c@1und1.de', to_date('30-10-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (344351148, 'Celia', 'Siggers', '4 Mayer Park', 'tsiggers6d@eepurl.com', to_date('04-02-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (560279603, 'Dannye', 'Perrelli', '0420 Michigan Junction', 'mperrelli6e@flavors.me', to_date('26-08-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (733382712, 'Rosanne', 'O''Clery', '5291 Messerschmidt Parkway', 'soclery6f@jimdo.com', to_date('27-08-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (486478773, 'Audra', 'Barraclough', '70 Melody Pass', 'jbarraclough6g@illinois.edu', to_date('10-06-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (750542115, 'Annabela', 'Kleimt', '672 Union Junction', 'gkleimt6h@surveymonkey.com', to_date('17-01-1981', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (657913441, 'Lira', 'Strange', '883 Lakewood Terrace', 'astrange6i@illinois.edu', to_date('25-12-1990', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (464097515, 'Evangeline', 'Reinhardt', '8762 Basil Plaza', 'jreinhardt6j@homestead.com', to_date('20-05-1986', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (639610500, 'Torrie', 'Capnor', '91 Oxford Crossing', 'ocapnor6k@zdnet.com', to_date('21-10-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (356332541, 'Brandy', 'Isenor', '809 Jackson Circle', 'bisenor6l@phpbb.com', to_date('30-06-1994', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (188178969, 'Killian', 'Skingle', '475 Hanover Plaza', 'askingle6m@mozilla.org', to_date('29-10-1993', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (433913457, 'Gifford', 'Kinzett', '09395 Morningstar Place', 'mkinzett6n@elegantthemes.com', to_date('06-05-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (888619164, 'Enrico', 'Summerill', '537 David Avenue', 'ksummerill6o@google.de', to_date('18-07-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (223146636, 'Zena', 'Neicho', '7 Oxford Park', 'sneicho6p@meetup.com', to_date('31-10-1977', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (857763687, 'Calla', 'Avrahamian', '51 Oakridge Parkway', 'yavrahamian6q@boston.com', to_date('07-03-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (875915357, 'Tobin', 'Canellas', '489 Lakeland Parkway', 'acanellas6r@clickbank.net', to_date('20-10-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (482724033, 'Nye', 'Haggard', '3396 Loftsgordon Trail', 'ghaggard6s@mozilla.com', to_date('26-07-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (283520715, 'Chauncey', 'Phillott', '8384 Grim Circle', 'ephillott6t@ucsd.edu', to_date('07-04-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (727172059, 'Galina', 'Foottit', '1 Dawn Hill', 'jfoottit6u@xinhuanet.com', to_date('02-05-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (806660959, 'Dill', 'Curr', '4203 Lawn Alley', 'lcurr6v@dmoz.org', to_date('04-03-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (194269339, 'Valentijn', 'Stripling', '7063 Novick Plaza', 'mstripling6w@marriott.com', to_date('21-08-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (990760635, 'Federico', 'Van den Oord', '54 Browning Park', 'svandenoord6x@sfgate.com', to_date('01-08-1958', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (810941841, 'Chery', 'Tamsett', '49546 Nova Street', 'stamsett6y@webs.com', to_date('28-01-1981', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (244157739, 'Moyna', 'Todaro', '4 Hanson Way', 'ktodaro6z@unesco.org', to_date('28-04-1998', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (370647200, 'Kristen', 'Oppery', '57 International Circle', 'doppery70@nydailynews.com', to_date('17-08-2005', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (661387813, 'Rogers', 'Considine', '6 Coleman Junction', 'jconsidine71@who.int', to_date('01-11-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (121866851, 'Alexandre', 'Dimmne', '30114 Truax Junction', 'fdimmne72@github.com', to_date('04-08-1990', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (549632242, 'Kerrill', 'Cordon', '67 Chive Plaza', 'dcordon73@yahoo.co.jp', to_date('29-10-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (408012546, 'Moina', 'Pitkaithly', '98 Clemons Alley', 'hpitkaithly74@dailymail.co.uk', to_date('03-09-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (451119536, 'Merell', 'Heffy', '509 Debra Point', 'kheffy75@state.gov', to_date('25-03-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (612907527, 'Hamnet', 'Djurkovic', '496 Monterey Lane', 'ydjurkovic76@nasa.gov', to_date('03-10-1977', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (432831803, 'Malorie', 'Pryell', '1116 Morrow Trail', 'apryell77@fastcompany.com', to_date('27-07-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (253540766, 'Kin', 'Falconbridge', '97 Leroy Street', 'mfalconbridge78@themeforest.net', to_date('12-09-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (567230157, 'Laverne', 'Peartree', '86914 Fordem Alley', 'cpeartree79@purevolume.com', to_date('18-12-1963', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (712054172, 'Sax', 'Wickson', '14973 Dixon Terrace', 'ewickson7a@goodreads.com', to_date('30-12-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (328619616, 'Camella', 'Burree', '36 Haas Terrace', 'tburree7b@csmonitor.com', to_date('27-06-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (429520185, 'Wendi', 'Guerreru', '0831 Sutteridge Court', 'pguerreru7c@sogou.com', to_date('02-07-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (340554538, 'Matti', 'Mattiello', '490 1st Road', 'lmattiello7d@mapquest.com', to_date('19-04-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (796545907, 'Carmencita', 'Shmyr', '6 Havey Terrace', 'eshmyr7e@uiuc.edu', to_date('24-12-1967', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (894707368, 'Naoma', 'Doumer', '792 Atwood Circle', 'ldoumer7f@home.pl', to_date('22-02-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (406269634, 'Tammi', 'Cassella', '1 Hayes Park', 'jcassella7g@thetimes.co.uk', to_date('08-02-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (279682657, 'Welsh', 'Livesey', '5043 Boyd Road', 'llivesey7h@github.com', to_date('02-12-1977', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (509691005, 'Tallulah', 'Pinnegar', '24 Merrick Trail', 'ypinnegar7i@prweb.com', to_date('04-09-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (994771666, 'Lewiss', 'Oland', '4112 High Crossing Plaza', 'aoland7j@goodreads.com', to_date('17-07-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (655465365, 'Rich', 'Fettis', '0923 Shopko Crossing', 'gfettis7k@ucoz.com', to_date('13-09-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (368944057, 'Berget', 'Astman', '15 Independence Terrace', 'dastman7l@businessinsider.com', to_date('17-03-1967', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (231090820, 'Laurianne', 'Blakeden', '6 Anhalt Way', 'tblakeden7m@amazon.com', to_date('20-10-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (120518448, 'Clywd', 'Manhood', '6775 Mcbride Parkway', 'cmanhood7n@github.com', to_date('02-04-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (428146034, 'Rhianon', 'Winterbotham', '2877 Petterle Crossing', 'swinterbotham7o@apple.com', to_date('06-04-1976', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (498615918, 'Celisse', 'Guinery', '0674 Scofield Park', 'oguinery7p@salon.com', to_date('28-04-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (238987534, 'Dorelle', 'Arrigucci', '2 Old Shore Plaza', 'karrigucci7q@desdev.cn', to_date('01-03-1967', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (807720778, 'Josey', 'Turfin', '00 Mendota Place', 'sturfin7r@t-online.de', to_date('26-02-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (510426007, 'Trish', 'Munby', '401 Farwell Point', 'fmunby7s@icio.us', to_date('04-03-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (780372938, 'Park', 'Surphliss', '16 Sloan Lane', 'bsurphliss7t@amazon.com', to_date('18-03-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (323117332, 'Doria', 'Grose', '47688 Sycamore Alley', 'sgrose7u@seesaa.net', to_date('11-01-1996', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (329833388, 'Elana', 'Caller', '7 Riverside Alley', 'pcaller7v@sciencedaily.com', to_date('14-06-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (860717592, 'Sissy', 'Bampforth', '389 Monterey Street', 'tbampforth7w@xinhuanet.com', to_date('05-12-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (178733630, 'Dannye', 'Hammerson', '363 Lakeland Road', 'jhammerson7x@ameblo.jp', to_date('30-03-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (637095605, 'Molli', 'Kersaw', '19 Waubesa Park', 'hkersaw7y@blinklist.com', to_date('23-06-1997', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (955024358, 'Lorena', 'Harragin', '575 Dryden Pass', 'aharragin7z@youtube.com', to_date('11-02-1974', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (584810724, 'Edward', 'Thaim', '35349 Myrtle Parkway', 'cthaim80@prlog.org', to_date('11-04-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (462465686, 'Vanya', 'Taree', '5421 New Castle Park', 'gtaree81@abc.net.au', to_date('27-09-1959', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (953727056, 'Wolfy', 'Blanshard', '03411 Forest Court', 'hblanshard82@blog.com', to_date('14-12-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (501981904, 'Gustaf', 'Glossop', '1 Nancy Road', 'wglossop83@illinois.edu', to_date('03-07-1994', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (155656070, 'Hercules', 'Skillicorn', '64 Crest Line Junction', 'eskillicorn84@xing.com', to_date('15-06-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (960073457, 'Codi', 'Sahnow', '0 Tony Trail', 'gsahnow85@blogspot.com', to_date('29-10-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (339941592, 'Hortense', 'Iacovini', '7 Karstens Terrace', 'hiacovini86@nasa.gov', to_date('31-10-1974', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (531136933, 'Tamera', 'Phillippo', '33 Myrtle Lane', 'vphillippo87@twitpic.com', to_date('16-01-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (705512501, 'Calv', 'Philipet', '635 Heffernan Road', 'ephilipet88@rediff.com', to_date('16-02-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (235087781, 'Retha', 'Cubbin', '10 Farwell Lane', 'lcubbin89@vkontakte.ru', to_date('26-02-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (359126922, 'Lynette', 'Ivanovic', '1553 Maywood Lane', 'eivanovic8a@cisco.com', to_date('10-12-1984', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (159170040, 'Roxana', 'Smaridge', '84212 Maryland Crossing', 'csmaridge8b@ucoz.ru', to_date('02-09-1985', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (167346753, 'Tabatha', 'Robken', '777 Loeprich Avenue', 'mrobken8c@icq.com', to_date('07-03-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (425028957, 'Avery', 'Kniveton', '903 Autumn Leaf Circle', 'mkniveton8d@de.vu', to_date('03-01-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (526132828, 'Zechariah', 'Tonge', '7395 Glendale Circle', 'htonge8e@elpais.com', to_date('17-09-1995', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (368706011, 'Tamar', 'Strang', '98 Knutson Terrace', 'wstrang8f@spiegel.de', to_date('03-05-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (194625528, 'Bobby', 'Rodrig', '132 Twin Pines Street', 'vrodrig8g@tinypic.com', to_date('16-10-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (694418094, 'Conrade', 'Mower', '0 Clove Parkway', 'smower8h@goo.ne.jp', to_date('17-11-1992', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (199604566, 'Danit', 'Gullan', '03 Almo Drive', 'jgullan8i@exblog.jp', to_date('29-07-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (723194082, 'Denny', 'Willmont', '81819 Hauk Hill', 'bwillmont8j@vistaprint.com', to_date('21-11-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (329422655, 'Cyril', 'Ferrige', '80 Heath Place', 'eferrige8k@mediafire.com', to_date('25-02-1973', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (942240902, 'Elwin', 'Vasyunkin', '97 Morningstar Court', 'cvasyunkin8l@cnet.com', to_date('02-10-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (790730644, 'Sherrie', 'Trenbey', '1 Morningstar Street', 'mtrenbey8m@deviantart.com', to_date('24-12-1997', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (181421847, 'Reade', 'Brennans', '72459 Clove Alley', 'lbrennans8n@friendfeed.com', to_date('04-11-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (910245918, 'Honor', 'Champneys', '5 Commercial Drive', 'cchampneys8o@csmonitor.com', to_date('11-06-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (216639343, 'Gerrilee', 'Kemsley', '5 Miller Way', 'mkemsley8p@examiner.com', to_date('13-10-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (165100082, 'Erica', 'Tourner', '26580 Coleman Junction', 'mtourner8q@pinterest.com', to_date('09-01-1973', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (307355201, 'Emery', 'Elvey', '459 Arkansas Circle', 'lelvey8r@wp.com', to_date('16-08-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (827150795, 'Stoddard', 'Milbourn', '713 Stone Corner Pass', 'dmilbourn8s@howstuffworks.com', to_date('16-03-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (536265727, 'Dallon', 'Rilston', '60 Comanche Pass', 'xrilston8t@hc360.com', to_date('23-06-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (316172017, 'Tana', 'Perigo', '556 Talisman Court', 'dperigo8u@nytimes.com', to_date('07-08-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (493583649, 'Flossi', 'Stivey', '933 Evergreen Plaza', 'gstivey8v@newyorker.com', to_date('09-10-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (727898410, 'Dagny', 'Dunsire', '98683 Division Way', 'tdunsire8w@un.org', to_date('13-01-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (568115643, 'Merola', 'Brandom', '2 Oakridge Place', 'lbrandom8x@amazon.co.jp', to_date('05-12-1992', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (378471735, 'Haven', 'Riccetti', '2215 Havey Center', 'lriccetti8y@linkedin.com', to_date('23-08-1957', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (933226501, 'Budd', 'McMackin', '2 Victoria Plaza', 'tmcmackin8z@youtube.com', to_date('24-07-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (384121194, 'Torrie', 'Menico', '80 Rockefeller Junction', 'smenico90@umich.edu', to_date('28-09-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (755480812, 'Rey', 'Donaghie', '362 Brentwood Alley', 'hdonaghie91@tuttocitta.it', to_date('03-07-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (740809320, 'Berk', 'Willishire', '3622 Ohio Avenue', 'fwillishire92@nbcnews.com', to_date('01-08-1986', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (930355648, 'Branden', 'Ames', '2 Miller Court', 'mames93@angelfire.com', to_date('30-10-1995', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (583092531, 'Quintana', 'Giacomoni', '2126 Northport Center', 'ogiacomoni94@1688.com', to_date('12-05-1993', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (124490282, 'Theda', 'Lincey', '66 Myrtle Trail', 'jlincey95@google.ca', to_date('28-09-1996', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (177617288, 'Minda', 'Sushams', '9 Ridge Oak Trail', 'asushams96@trellian.com', to_date('03-12-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (523824178, 'Madlen', 'Coggill', '184 Donald Street', 'tcoggill97@youku.com', to_date('11-06-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (982624497, 'Karisa', 'Alexandre', '91519 Westerfield Terrace', 'dalexandre98@economist.com', to_date('30-04-1972', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (413548318, 'Marsh', 'McCullum', '87385 Oakridge Court', 'mmccullum99@nyu.edu', to_date('14-11-2008', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (546530044, 'Coralie', 'Casini', '027 Golden Leaf Point', 'acasini9a@chronoengine.com', to_date('28-06-1957', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (468232869, 'Killy', 'Lockwood', '119 Schurz Point', 'elockwood9b@fema.gov', to_date('17-12-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (761829408, 'Verne', 'Scruby', '546 Waubesa Crossing', 'ascruby9c@altervista.org', to_date('02-02-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (164014017, 'Chrissie', 'Halesworth', '512 Lake View Hill', 'rhalesworth9d@whitehouse.gov', to_date('08-08-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (244926474, 'Carly', 'Aronovich', '66105 Sommers Street', 'jaronovich9e@pbs.org', to_date('05-05-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (154736692, 'Tabbitha', 'Dutson', '1 Memorial Street', 'rdutson9f@cisco.com', to_date('30-01-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (272542559, 'Salomo', 'Jekel', '85 Toban Parkway', 'ejekel9g@alexa.com', to_date('29-12-1993', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (698505766, 'Ruthi', 'Carwithan', '80090 Cherokee Street', 'hcarwithan9h@taobao.com', to_date('16-06-1986', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (157192790, 'Ileana', 'Lagde', '95 Union Road', 'jlagde9i@jalbum.net', to_date('16-12-1967', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (945949905, 'Abel', 'Peet', '0901 Corscot Point', 'kpeet9j@yellowpages.com', to_date('19-09-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (284559782, 'Alejoa', 'Denness', '98 Carberry Circle', 'mdenness9k@miibeian.gov.cn', to_date('09-07-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (135853376, 'Whitby', 'Budgeon', '544 Glacier Hill Place', 'lbudgeon9l@devhub.com', to_date('22-12-1997', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (909785269, 'Willow', 'Sambiedge', '2 Old Gate Crossing', 'zsambiedge9m@taobao.com', to_date('15-02-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (359521761, 'Nikkie', 'Truitt', '71728 Vidon Point', 'itruitt9n@ameblo.jp', to_date('28-08-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (820663546, 'Ermanno', 'Izsak', '37440 Russell Lane', 'rizsak9o@geocities.jp', to_date('19-04-1981', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (530635564, 'Hank', 'Maffeo', '32 Rockefeller Pass', 'cmaffeo9p@stanford.edu', to_date('06-06-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (720916352, 'Hurlee', 'Champkins', '5 Basil Alley', 'dchampkins9q@npr.org', to_date('24-10-2005', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (243421012, 'Bendick', 'Bricket', '6919 Mallory Point', 'kbricket9r@jugem.jp', to_date('28-02-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (799018566, 'Stanwood', 'Dartnall', '18 North Point', 'cdartnall9s@nifty.com', to_date('31-01-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (984185551, 'Immanuel', 'Hazeup', '26916 Trailsway Hill', 'bhazeup9t@elpais.com', to_date('01-08-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (846096460, 'Sallyanne', 'Adshed', '1461 Shoshone Way', 'aadshed9u@nature.com', to_date('27-03-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (244518177, 'Georgy', 'Audsley', '93 Ronald Regan Crossing', 'faudsley9v@phpbb.com', to_date('03-12-1960', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (615900644, 'Marlow', 'McGeown', '326 Eastwood Street', 'hmcgeown9w@sitemeter.com', to_date('06-07-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (580999799, 'Cletis', 'Duesberry', '508 Reindahl Street', 'kduesberry9x@ucoz.ru', to_date('17-04-1973', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (145998135, 'Minnie', 'Heppner', '84 Melvin Circle', 'vheppner9y@is.gd', to_date('29-02-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (961583332, 'Jed', 'Jaeggi', '47 Northwestern Point', 'gjaeggi9z@edublogs.org', to_date('24-02-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (181956988, 'Jeanna', 'Romeuf', '1 Ridgeway Plaza', 'bromeufa0@fotki.com', to_date('15-08-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (646870683, 'Reade', 'Wilacot', '76 Southridge Alley', 'bwilacota1@sina.com.cn', to_date('30-06-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (463444623, 'Sarette', 'Hennemann', '447 Talmadge Drive', 'jhennemanna2@bbc.co.uk', to_date('02-05-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (364487020, 'Gregoire', 'Arnholtz', '86632 Lawn Terrace', 'darnholtza3@plala.or.jp', to_date('25-06-1991', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (331644143, 'Daune', 'Cawt', '9 Merry Plaza', 'ncawta4@blog.com', to_date('16-08-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (146487603, 'Evita', 'Surmon', '8 Hazelcrest Circle', 'hsurmona5@about.me', to_date('20-06-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (828895011, 'Cindie', 'McGrill', '96278 Ronald Regan Hill', 'vmcgrilla6@csmonitor.com', to_date('20-10-1965', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (434786604, 'Kinna', 'De Michele', '78128 Melby Street', 'bdemichelea7@spiegel.de', to_date('13-07-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (967108904, 'Ron', 'Leglise', '58452 Briar Crest Way', 'bleglisea8@squarespace.com', to_date('21-05-1959', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (967655547, 'Ingaborg', 'Bedberry', '3 Grayhawk Terrace', 'lbedberrya9@google.co.jp', to_date('14-05-1963', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (381845916, 'Aime', 'Du Plantier', '1 Chive Center', 'kduplantieraa@shutterfly.com', to_date('13-09-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (730793098, 'Terese', 'Adami', '4189 Utah Alley', 'hadamiab@wordpress.org', to_date('12-03-1994', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (135671430, 'Kasey', 'McDyer', '69203 Arapahoe Crossing', 'mmcdyerac@people.com.cn', to_date('06-12-2001', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (913544934, 'Melisent', 'Robeson', '16 David Avenue', 'drobesonad@oaic.gov.au', to_date('22-07-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (361162494, 'Hildegarde', 'McCaskell', '26 Oak Valley Hill', 'zmccaskellae@blogs.com', to_date('28-06-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (418016946, 'Barry', 'Matthew', '06 Golf Course Place', 'dmatthewaf@noaa.gov', to_date('21-07-1987', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (742759332, 'Roxanne', 'Moakes', '74960 Fairview Trail', 'pmoakesag@wikispaces.com', to_date('26-11-1981', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (194300384, 'Charmaine', 'Locard', '596 Meadow Valley Plaza', 'plocardah@yandex.ru', to_date('08-10-1974', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (436432611, 'Loleta', 'Lipgens', '712 Acker Road', 'mlipgensai@twitpic.com', to_date('21-03-1974', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (976411578, 'Sasha', 'Twells', '131 Gale Street', 'mtwellsaj@jigsy.com', to_date('15-01-1962', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (843536638, 'Tynan', 'Berzons', '09160 Walton Road', 'nberzonsak@sakura.ne.jp', to_date('07-12-1999', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (584802291, 'Babara', 'Philott', '4 Calypso Alley', 'jphilottal@smh.com.au', to_date('25-05-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (241259925, 'Aubrette', 'Booy', '16560 Annamark Alley', 'gbooyam@odnoklassniki.ru', to_date('27-12-1992', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (285641281, 'Rhianon', 'McIlwain', '66053 Gateway Avenue', 'dmcilwainan@usa.gov', to_date('11-06-2003', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (333247779, 'Anstice', 'Hurtic', '429 Ramsey Street', 'whurticao@si.edu', to_date('29-04-1976', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (993392943, 'Efren', 'Mirams', '437 Forest Run Hill', 'gmiramsap@goodreads.com', to_date('25-02-2005', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (944217001, 'Meade', 'Westwick', '5612 Red Cloud Point', 'jwestwickaq@ca.gov', to_date('14-05-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (286192839, 'Diego', 'Di Angelo', '68275 Everett Terrace', 'tdiangeloar@huffingtonpost.com', to_date('02-11-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (591110761, 'Drud', 'Torrance', '39 Coolidge Pass', 'jtorranceas@weibo.com', to_date('01-03-1973', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (200911756, 'Starr', 'Tendahl', '901 Merrick Court', 'jtendahlat@biglobe.ne.jp', to_date('26-08-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (193983217, 'Claire', 'Rama', '7 Darwin Center', 'aramaau@cisco.com', to_date('09-02-1974', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (163117745, 'Nadine', 'Merry', '9 Butternut Hill', 'cmerryav@nps.gov', to_date('17-09-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (162016078, 'Kinny', 'Moon', '56 Morningstar Alley', 'bmoonaw@whitehouse.gov', to_date('04-02-2006', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (726772003, 'Joby', 'Avrahamian', '83926 Thackeray Hill', 'cavrahamianax@google.nl', to_date('03-09-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (346800085, 'Donn', 'Slowgrove', '917 Lindbergh Parkway', 'rslowgroveay@xinhuanet.com', to_date('24-07-1957', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (844553753, 'Elianora', 'Drinkwater', '0826 Katie Alley', 'mdrinkwateraz@umn.edu', to_date('12-08-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (702926004, 'Krystyna', 'Petroff', '37 Talmadge Pass', 'dpetroffb0@jimdo.com', to_date('04-12-1978', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (487754210, 'Alvin', 'Hackworthy', '1532 Mosinee Terrace', 'shackworthyb1@harvard.edu', to_date('05-10-1979', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (883547761, 'Gannon', 'Matevushev', '545 Transport Trail', 'rmatevushevb2@bandcamp.com', to_date('31-03-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (520720318, 'Dexter', 'Meiklem', '1406 Moulton Pass', 'rmeiklemb3@jugem.jp', to_date('26-11-1975', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (408288953, 'Meta', 'Trude', '4144 1st Place', 'etrudeb4@google.ca', to_date('04-05-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (345102182, 'Maryellen', 'Filip', '36 Manufacturers Center', 'gfilipb5@comsenz.com', to_date('29-10-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (740865355, 'Chloe', 'Alliband', '70204 Kenwood Street', 'dallibandb6@fotki.com', to_date('07-11-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (736770265, 'Anatollo', 'Billie', '770 Schlimgen Alley', 'mbillieb7@myspace.com', to_date('25-03-1974', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (184631967, 'Arlette', 'Matton', '91 Sloan Circle', 'pmattonb8@goodreads.com', to_date('26-12-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (863230482, 'Bryn', 'Shearstone', '26167 Kennedy Parkway', 'rshearstoneb9@google.fr', to_date('20-04-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (850908051, 'Mic', 'McAvaddy', '623 Trailsway Circle', 'tmcavaddyba@aol.com', to_date('17-09-1984', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (142490108, 'Mitzi', 'Bartol', '8 Meadow Valley Point', 'ebartolbb@cnet.com', to_date('26-12-1991', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (986517134, 'Port', 'Crocroft', '80 Summit Circle', 'gcrocroftbc@discuz.net', to_date('09-05-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (917304512, 'Fiorenze', 'Whightman', '88054 Coolidge Drive', 'fwhightmanbd@omniture.com', to_date('14-06-1975', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (250894147, 'Algernon', 'Isakov', '71689 Kinsman Point', 'misakovbe@google.nl', to_date('17-12-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (328241971, 'Haley', 'Budibent', '78888 Kinsman Road', 'pbudibentbf@amazon.co.uk', to_date('11-06-1997', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (454954723, 'Aurel', 'Rentoll', '45258 Northland Court', 'mrentollbg@yale.edu', to_date('09-09-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (133915374, 'Clywd', 'Chastagnier', '4027 Tomscot Center', 'achastagnierbh@wordpress.org', to_date('25-02-1988', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (594545661, 'Guenna', 'Humberstone', '178 5th Center', 'thumberstonebi@devhub.com', to_date('03-08-2005', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (780704866, 'Kevina', 'Van Der Walt', '26026 Kinsman Alley', 'fvanderwaltbj@archive.org', to_date('12-12-2002', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (120073352, 'Ernest', 'Tolworthy', '72148 Thompson Parkway', 'btolworthybk@bbb.org', to_date('25-08-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (720854484, 'Dun', 'Raven', '139 Melby Way', 'yravenbl@about.me', to_date('12-09-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (196598958, 'Mariel', 'Yankov', '427 Linden Point', 'dyankovbm@ftc.gov', to_date('26-04-2007', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (581911470, 'Abner', 'Waddup', '2616 Donald Avenue', 'zwaddupbn@themeforest.net', to_date('15-10-1967', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (219721995, 'Heriberto', 'Scade', '72686 7th Circle', 'sscadebo@123-reg.co.uk', to_date('13-02-2000', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (935880625, 'Debi', 'Nosworthy', '21 Pierstorff Circle', 'inosworthybp@cnet.com', to_date('28-11-1985', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (186184274, 'Fernande', 'Starmer', '35980 Bartillon Parkway', 'dstarmerbq@businesswire.com', to_date('29-03-1961', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (722922864, 'Brose', 'Gonzalez', '4 Commercial Alley', 'egonzalezbr@webnode.com', to_date('24-06-1956', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (435498926, 'Sydney', 'Hune', '768 Cody Court', 'dhunebs@github.io', to_date('13-01-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (481629089, 'Kerry', 'Lethabridge', '38643 Golden Leaf Court', 'llethabridgebt@thetimes.co.uk', to_date('06-04-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (512212347, 'Rickard', 'Barlie', '84 Manufacturers Crossing', 'bbarliebu@noaa.gov', to_date('23-10-1973', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (617607123, 'Hubert', 'Bunyan', '6 Elmside Street', 'dbunyanbv@flickr.com', to_date('09-11-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (408873721, 'Jacques', 'Durden', '2 Donald Point', 'ldurdenbw@edublogs.org', to_date('25-04-1987', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (890577931, 'Bathsheba', 'Gulley', '2 Monument Avenue', 'pgulleybx@wufoo.com', to_date('25-09-1983', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (582048880, 'Sher', 'Randales', '82333 South Junction', 'rrandalesby@stumbleupon.com', to_date('15-06-1954', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (257164474, 'Celestina', 'Yushkov', '884 Melvin Trail', 'tyushkovbz@miibeian.gov.cn', to_date('29-03-1980', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (140609883, 'Amalea', 'Thirlaway', '85089 Sullivan Crossing', 'athirlawayc0@twitter.com', to_date('05-08-1989', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (372130995, 'Aurelie', 'Scougal', '568 Crescent Oaks Park', 'pscougalc1@1688.com', to_date('26-01-1955', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (859876705, 'Selia', 'Wellbank', '8761 Manitowish Alley', 'iwellbankc2@1und1.de', to_date('08-04-1982', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (569201301, 'Aylmer', 'Backwell', '17 Division Pass', 'jbackwellc3@usnews.com', to_date('01-12-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (877384109, 'Loralee', 'Burchett', '8 Bunker Hill Alley', 'dburchettc4@ibm.com', to_date('12-09-1997', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (731802243, 'Marleen', 'Suche', '3 Lunder Drive', 'wsuchec5@xing.com', to_date('14-09-1968', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (360079988, 'Gillan', 'Kegan', '1933 Knutson Trail', 'nkeganc6@dmoz.org', to_date('05-06-1986', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (387410907, 'Veronike', 'Winsor', '60 8th Lane', 'dwinsorc7@reference.com', to_date('04-09-1976', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (268744838, 'Val', 'Gyngell', '09773 Vahlen Lane', 'mgyngellc8@npr.org', to_date('09-08-1971', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (357069889, 'Godfrey', 'Ragsdall', '2 Sutteridge Trail', 'iragsdallc9@apple.com', to_date('30-04-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (496293540, 'Hanna', 'Blacker', '909 Daystar Point', 'kblackerca@shareasale.com', to_date('13-04-1958', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (488570337, 'Chloe', 'Clemes', '1129 Fair Oaks Lane', 'mclemescb@chron.com', to_date('08-11-1966', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (375567514, 'Nester', 'Blagden', '9132 Center Circle', 'bblagdencc@example.com', to_date('20-10-1986', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (812297334, 'Silva', 'Chowne', '89 Loeprich Trail', 'schownecd@usgs.gov', to_date('12-09-1970', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (942892125, 'Maurine', 'Leel', '23552 Maple Wood Alley', 'lleelce@xing.com', to_date('28-08-1964', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (938579126, 'Eustacia', 'Margarson', '21 Vernon Trail', 'bmargarsoncf@bbb.org', to_date('27-09-2004', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (313417613, 'Devland', 'Locker', '25 Fair Oaks Avenue', 'blockercg@nyu.edu', to_date('15-05-1969', 'dd-mm-yyyy'));
insert into PARTICIPANT (participant_id, fname, lname, address, email, birth_date)
values (565641150, 'Josh', 'Escala', '6217 Acker Circle', 'jescalach@chronoengine.com', to_date('17-11-1955', 'dd-mm-yyyy'));
commit;
prompt 450 records loaded
prompt Loading REGISTRATION...
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-01-1955', 'dd-mm-yyyy'), '14:00', 'waiting for con', 25807, 'bit', 440048019, 1495);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-06-1963', 'dd-mm-yyyy'), '19:25', 'registration fa', 25102, 'bit', 794810693, 1151);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-06-1968', 'dd-mm-yyyy'), '18:00', 'registered succ', 21436, 'bank transfer', 515218335, 1131);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-01-1960', 'dd-mm-yyyy'), '13:25', 'registered succ', 28297, 'direct debit', 307355201, 1067);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-03-1998', 'dd-mm-yyyy'), '11:30', 'waiting for con', 29545, 'direct debit', 903710430, 1031);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-03-1925', 'dd-mm-yyyy'), '21:30', 'registered succ', 22030, 'bit', 128352368, 1078);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-12-2024', 'dd-mm-yyyy'), '10:55', 'registration fa', 28996, 'direct debit', 486780251, 1207);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-02-1984', 'dd-mm-yyyy'), '21:25', 'waiting for con', 23683, 'bit', 418016946, 1446);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-03-1938', 'dd-mm-yyyy'), '12:55', 'registered succ', 20937, 'bit', 755734032, 1196);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-08-1932', 'dd-mm-yyyy'), '21:00', 'waiting for con', 24728, 'direct debit', 723194082, 1413);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-03-1905', 'dd-mm-yyyy'), '20:55', 'waiting for con', 29592, 'direct debit', 498615918, 1247);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-09-2012', 'dd-mm-yyyy'), '14:00', 'waiting for con', 26122, 'bit', 827150795, 1331);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-12-1936', 'dd-mm-yyyy'), '13:25', 'registered succ', 26183, 'bank transfer', 834033608, 1079);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-10-1983', 'dd-mm-yyyy'), '22:00', 'registration fa', 25880, 'bank transfer', 594821272, 1080);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-01-1933', 'dd-mm-yyyy'), '14:55', 'waiting for con', 24558, 'direct debit', 440048019, 1472);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-07-1951', 'dd-mm-yyyy'), '21:25', 'registered succ', 27240, 'direct debit', 691618360, 1174);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-03-1984', 'dd-mm-yyyy'), '15:00', 'registration fa', 24042, 'bank transfer', 364170530, 1222);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-06-1964', 'dd-mm-yyyy'), '15:30', 'waiting for con', 29958, 'bit', 548101695, 1412);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-11-1993', 'dd-mm-yyyy'), '16:55', 'waiting for con', 24396, 'bank transfer', 183600425, 1421);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-01-1917', 'dd-mm-yyyy'), '21:00', 'waiting for con', 26824, 'bank transfer', 589617206, 1042);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-11-1981', 'dd-mm-yyyy'), '13:55', 'registration fa', 29558, 'direct debit', 501981904, 1088);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-08-1968', 'dd-mm-yyyy'), '18:25', 'registration fa', 23041, 'bit', 587422443, 1158);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-11-1982', 'dd-mm-yyyy'), '17:30', 'registration fa', 29400, 'bank transfer', 155656070, 1050);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-12-1972', 'dd-mm-yyyy'), '20:30', 'waiting for con', 23301, 'bit', 617607123, 1470);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-05-2011', 'dd-mm-yyyy'), '15:30', 'waiting for con', 25143, 'credit', 554970627, 1386);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-06-1985', 'dd-mm-yyyy'), '18:55', 'registered succ', 20868, 'credit', 854022589, 1357);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-07-1924', 'dd-mm-yyyy'), '18:00', 'registration fa', 22345, 'bank transfer', 391505670, 1311);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-09-1992', 'dd-mm-yyyy'), '11:55', 'registration fa', 20322, 'bank transfer', 344351148, 1429);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-03-1921', 'dd-mm-yyyy'), '11:30', 'registered succ', 28837, 'direct debit', 460843391, 1083);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-07-2009', 'dd-mm-yyyy'), '9:30', 'registered succ', 21491, 'bank transfer', 657913441, 1072);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-05-1918', 'dd-mm-yyyy'), '10:55', 'registration fa', 21560, 'bit', 378471735, 1000);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-06-1968', 'dd-mm-yyyy'), '9:30', 'registered succ', 22102, 'bank transfer', 548431889, 1073);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-06-1972', 'dd-mm-yyyy'), '19:00', 'registered succ', 29236, 'bank transfer', 249281012, 1249);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-05-1912', 'dd-mm-yyyy'), '10:55', 'registered succ', 21467, 'bank transfer', 717853304, 1130);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-12-2009', 'dd-mm-yyyy'), '12:25', 'registered succ', 25120, 'direct debit', 371298943, 1231);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-01-2001', 'dd-mm-yyyy'), '20:25', 'registration fa', 22680, 'bank transfer', 584810724, 1447);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-05-1944', 'dd-mm-yyyy'), '19:25', 'waiting for con', 29164, 'bank transfer', 371378890, 1407);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-06-1945', 'dd-mm-yyyy'), '12:00', 'registered succ', 26977, 'bank transfer', 504018726, 1234);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-08-1961', 'dd-mm-yyyy'), '11:25', 'registered succ', 29476, 'bit', 329422655, 1071);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-04-1966', 'dd-mm-yyyy'), '16:25', 'registration fa', 26750, 'bank transfer', 565641150, 1017);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-12-1912', 'dd-mm-yyyy'), '11:25', 'registered succ', 22574, 'bank transfer', 273476568, 1196);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-06-2020', 'dd-mm-yyyy'), '16:30', 'waiting for con', 23778, 'credit', 780372938, 1275);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-04-1945', 'dd-mm-yyyy'), '16:00', 'waiting for con', 28284, 'direct debit', 921373541, 1459);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-12-1922', 'dd-mm-yyyy'), '10:55', 'waiting for con', 22218, 'bit', 519393755, 1008);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-12-2021', 'dd-mm-yyyy'), '14:25', 'registration fa', 21753, 'bit', 199604566, 1317);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-10-1960', 'dd-mm-yyyy'), '8:25', 'waiting for con', 22409, 'bank transfer', 360079988, 1425);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-02-1957', 'dd-mm-yyyy'), '12:55', 'registered succ', 29727, 'bank transfer', 391505670, 1149);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-08-1928', 'dd-mm-yyyy'), '20:30', 'registration fa', 27150, 'bank transfer', 453116218, 1157);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-09-2014', 'dd-mm-yyyy'), '14:25', 'waiting for con', 24328, 'bit', 984185551, 1316);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-02-1915', 'dd-mm-yyyy'), '17:30', 'waiting for con', 27541, 'direct debit', 720916352, 1189);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-12-2024', 'dd-mm-yyyy'), '8:55', 'registration fa', 23095, 'bank transfer', 460843391, 1094);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-05-2023', 'dd-mm-yyyy'), '13:30', 'waiting for con', 26251, 'bank transfer', 181956988, 1079);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-12-1929', 'dd-mm-yyyy'), '19:25', 'registered succ', 22118, 'credit', 617607123, 1390);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-05-1953', 'dd-mm-yyyy'), '13:55', 'registration fa', 22882, 'bit', 481629089, 1160);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-03-1962', 'dd-mm-yyyy'), '11:00', 'registered succ', 27923, 'direct debit', 827150795, 1251);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-07-1991', 'dd-mm-yyyy'), '22:00', 'registration fa', 24554, 'bank transfer', 880459846, 1129);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-04-2024', 'dd-mm-yyyy'), '16:30', 'registration fa', 26373, 'bit', 858454932, 1069);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-02-1975', 'dd-mm-yyyy'), '21:55', 'registration fa', 25551, 'bank transfer', 413548318, 1444);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-09-1917', 'dd-mm-yyyy'), '22:00', 'registration fa', 21450, 'bit', 827150795, 1447);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-10-1956', 'dd-mm-yyyy'), '15:00', 'registered succ', 28451, 'credit', 961583332, 1215);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-04-2022', 'dd-mm-yyyy'), '16:00', 'registered succ', 26411, 'direct debit', 425028957, 1183);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-10-1996', 'dd-mm-yyyy'), '13:30', 'registration fa', 26316, 'bank transfer', 913544934, 1231);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-03-1907', 'dd-mm-yyyy'), '22:00', 'registered succ', 22701, 'bit', 586890466, 1063);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-03-1999', 'dd-mm-yyyy'), '14:00', 'waiting for con', 26740, 'direct debit', 612907527, 1179);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-09-1938', 'dd-mm-yyyy'), '21:30', 'waiting for con', 21196, 'bit', 736400664, 1214);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-11-1903', 'dd-mm-yyyy'), '19:00', 'registration fa', 24610, 'bit', 356332541, 1257);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-10-2024', 'dd-mm-yyyy'), '12:55', 'waiting for con', 23950, 'credit', 986517134, 1441);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-02-1909', 'dd-mm-yyyy'), '10:55', 'registered succ', 26837, 'credit', 329422655, 1469);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-12-2014', 'dd-mm-yyyy'), '9:00', 'registered succ', 25899, 'bank transfer', 850908051, 1196);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-06-1910', 'dd-mm-yyyy'), '16:25', 'waiting for con', 29730, 'bit', 181956988, 1367);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-07-1951', 'dd-mm-yyyy'), '15:55', 'waiting for con', 22862, 'bank transfer', 183600425, 1475);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-03-1946', 'dd-mm-yyyy'), '8:30', 'waiting for con', 23808, 'bank transfer', 752326610, 1433);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-04-1948', 'dd-mm-yyyy'), '16:55', 'registration fa', 27936, 'direct debit', 359521761, 1028);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-12-2002', 'dd-mm-yyyy'), '10:00', 'registration fa', 22115, 'direct debit', 196598958, 1142);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-12-2022', 'dd-mm-yyyy'), '18:30', 'registered succ', 21091, 'direct debit', 720916352, 1067);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-10-1909', 'dd-mm-yyyy'), '9:00', 'registered succ', 22386, 'bank transfer', 145998135, 1245);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-01-1900', 'dd-mm-yyyy'), '19:30', 'registered succ', 29566, 'bit', 887844594, 1100);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-10-1926', 'dd-mm-yyyy'), '21:25', 'registered succ', 21135, 'bank transfer', 487754210, 1105);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-02-1908', 'dd-mm-yyyy'), '15:00', 'registration fa', 27615, 'credit', 921373541, 1181);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-05-1961', 'dd-mm-yyyy'), '13:55', 'waiting for con', 24613, 'bank transfer', 894707368, 1050);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-06-2014', 'dd-mm-yyyy'), '15:25', 'registration fa', 26535, 'credit', 435781343, 1322);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-02-1922', 'dd-mm-yyyy'), '20:25', 'registered succ', 28260, 'credit', 168061387, 1195);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-04-1983', 'dd-mm-yyyy'), '9:55', 'registration fa', 27583, 'bit', 375567514, 1365);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-01-1924', 'dd-mm-yyyy'), '16:30', 'registration fa', 28278, 'bank transfer', 587422443, 1025);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-02-2000', 'dd-mm-yyyy'), '13:30', 'registration fa', 24827, 'direct debit', 582048880, 1265);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-11-1964', 'dd-mm-yyyy'), '16:30', 'waiting for con', 27053, 'credit', 435781343, 1264);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-12-1994', 'dd-mm-yyyy'), '9:30', 'waiting for con', 29965, 'bit', 340666716, 1299);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-12-1954', 'dd-mm-yyyy'), '17:30', 'registered succ', 23807, 'bit', 806660959, 1286);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-11-1952', 'dd-mm-yyyy'), '20:55', 'registration fa', 20033, 'credit', 732156936, 1205);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-08-2016', 'dd-mm-yyyy'), '17:30', 'waiting for con', 23867, 'bit', 655465365, 1040);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-05-1934', 'dd-mm-yyyy'), '12:25', 'waiting for con', 29786, 'credit', 554970627, 1424);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-08-1991', 'dd-mm-yyyy'), '14:30', 'waiting for con', 29749, 'direct debit', 919239938, 1013);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-04-2019', 'dd-mm-yyyy'), '20:30', 'waiting for con', 26385, 'bit', 385109467, 1040);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-12-1998', 'dd-mm-yyyy'), '20:30', 'waiting for con', 25661, 'direct debit', 163117745, 1101);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-09-2017', 'dd-mm-yyyy'), '20:30', 'registration fa', 23210, 'direct debit', 286192839, 1007);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-11-1932', 'dd-mm-yyyy'), '8:55', 'waiting for con', 29522, 'bit', 549632242, 1485);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-02-1901', 'dd-mm-yyyy'), '20:30', 'registered succ', 24974, 'bit', 857763687, 1152);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-11-1918', 'dd-mm-yyyy'), '13:00', 'waiting for con', 23848, 'direct debit', 200911756, 1457);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-06-1994', 'dd-mm-yyyy'), '10:55', 'waiting for con', 26282, 'bank transfer', 676243308, 1424);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-10-1900', 'dd-mm-yyyy'), '16:55', 'registered succ', 24584, 'bit', 135671430, 1195);
commit;
prompt 100 records committed...
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-04-1986', 'dd-mm-yyyy'), '13:00', 'registration fa', 23195, 'credit', 384346562, 1355);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-05-1911', 'dd-mm-yyyy'), '9:25', 'registered succ', 25564, 'bank transfer', 364170530, 1136);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-01-2015', 'dd-mm-yyyy'), '9:00', 'registered succ', 20575, 'bank transfer', 765688162, 1241);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-06-1969', 'dd-mm-yyyy'), '20:30', 'registration fa', 21665, 'bit', 307355201, 1434);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-12-1918', 'dd-mm-yyyy'), '15:55', 'waiting for con', 29940, 'direct debit', 594821272, 1357);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-10-1974', 'dd-mm-yyyy'), '8:00', 'registered succ', 26285, 'direct debit', 381845916, 1109);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-02-1950', 'dd-mm-yyyy'), '9:25', 'waiting for con', 21564, 'credit', 945949905, 1212);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-12-1902', 'dd-mm-yyyy'), '20:55', 'registration fa', 24235, 'credit', 742759332, 1288);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-11-1951', 'dd-mm-yyyy'), '19:25', 'registration fa', 23569, 'credit', 335261189, 1062);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-04-1939', 'dd-mm-yyyy'), '17:25', 'waiting for con', 20183, 'bank transfer', 628426844, 1102);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-11-1962', 'dd-mm-yyyy'), '8:25', 'registration fa', 27965, 'bank transfer', 732887643, 1396);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-11-1973', 'dd-mm-yyyy'), '10:25', 'waiting for con', 20851, 'bank transfer', 453116218, 1173);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-02-1967', 'dd-mm-yyyy'), '10:55', 'registered succ', 22211, 'credit', 631311297, 1356);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-09-1902', 'dd-mm-yyyy'), '12:30', 'registered succ', 27135, 'credit', 492378041, 1500);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-06-1905', 'dd-mm-yyyy'), '14:30', 'registered succ', 22854, 'direct debit', 569618267, 1396);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-07-1965', 'dd-mm-yyyy'), '8:25', 'registered succ', 25553, 'bit', 967108904, 1118);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-04-1939', 'dd-mm-yyyy'), '12:00', 'registered succ', 28393, 'bank transfer', 419243268, 1079);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-08-1980', 'dd-mm-yyyy'), '9:25', 'waiting for con', 27783, 'credit', 340554538, 1074);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-11-1923', 'dd-mm-yyyy'), '10:25', 'registered succ', 29839, 'credit', 486780251, 1073);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-01-1994', 'dd-mm-yyyy'), '19:25', 'waiting for con', 27947, 'credit', 858454932, 1169);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-11-1905', 'dd-mm-yyyy'), '21:25', 'registered succ', 22555, 'direct debit', 492378041, 1429);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-09-1921', 'dd-mm-yyyy'), '21:55', 'registration fa', 20563, 'credit', 817295135, 1018);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-01-2000', 'dd-mm-yyyy'), '19:30', 'waiting for con', 20041, 'direct debit', 512212347, 1000);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-05-1939', 'dd-mm-yyyy'), '13:55', 'registered succ', 23151, 'credit', 713982859, 1368);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-11-1918', 'dd-mm-yyyy'), '16:25', 'waiting for con', 22477, 'bank transfer', 850333783, 1328);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-10-1992', 'dd-mm-yyyy'), '12:00', 'registered succ', 27108, 'direct debit', 367557767, 1242);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-01-1901', 'dd-mm-yyyy'), '8:55', 'registration fa', 28220, 'bit', 367557767, 1346);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-06-1934', 'dd-mm-yyyy'), '11:00', 'registered succ', 24248, 'bank transfer', 146534920, 1426);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-02-1985', 'dd-mm-yyyy'), '18:25', 'waiting for con', 28133, 'bank transfer', 730793098, 1285);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-06-1992', 'dd-mm-yyyy'), '8:25', 'registered succ', 24904, 'direct debit', 738207711, 1188);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-11-1949', 'dd-mm-yyyy'), '11:25', 'registration fa', 28752, 'bit', 247345555, 1094);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-10-2014', 'dd-mm-yyyy'), '12:55', 'waiting for con', 22399, 'bank transfer', 413548318, 1284);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-12-2014', 'dd-mm-yyyy'), '21:55', 'registration fa', 24028, 'direct debit', 510501404, 1423);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-12-2001', 'dd-mm-yyyy'), '16:30', 'waiting for con', 28660, 'direct debit', 834134976, 1355);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-05-2003', 'dd-mm-yyyy'), '8:00', 'registered succ', 24820, 'direct debit', 135671430, 1080);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-04-1938', 'dd-mm-yyyy'), '18:55', 'registered succ', 22285, 'direct debit', 246618523, 1484);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-09-1979', 'dd-mm-yyyy'), '14:55', 'waiting for con', 23533, 'direct debit', 732156936, 1044);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-10-1901', 'dd-mm-yyyy'), '13:55', 'registered succ', 24236, 'bit', 575875839, 1052);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-05-1903', 'dd-mm-yyyy'), '18:55', 'registration fa', 26536, 'bit', 976411578, 1023);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-03-1967', 'dd-mm-yyyy'), '20:00', 'registration fa', 23029, 'bank transfer', 990760635, 1230);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-06-1994', 'dd-mm-yyyy'), '12:00', 'waiting for con', 22248, 'bank transfer', 726772003, 1156);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-12-1957', 'dd-mm-yyyy'), '10:00', 'waiting for con', 21586, 'bank transfer', 237048771, 1306);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-08-1932', 'dd-mm-yyyy'), '17:30', 'waiting for con', 26300, 'credit', 828895011, 1259);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-05-1933', 'dd-mm-yyyy'), '14:00', 'registration fa', 27243, 'credit', 678365789, 1330);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-06-1952', 'dd-mm-yyyy'), '18:55', 'registered succ', 29939, 'bank transfer', 436432611, 1491);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-12-1949', 'dd-mm-yyyy'), '15:00', 'registration fa', 25593, 'direct debit', 691618360, 1208);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-03-2002', 'dd-mm-yyyy'), '16:30', 'registration fa', 22189, 'credit', 570977330, 1113);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-07-1941', 'dd-mm-yyyy'), '8:25', 'waiting for con', 23379, 'direct debit', 750542115, 1193);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-12-1998', 'dd-mm-yyyy'), '15:55', 'waiting for con', 23056, 'bit', 850908051, 1280);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-03-1942', 'dd-mm-yyyy'), '10:00', 'waiting for con', 26204, 'bank transfer', 237048771, 1369);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-03-1919', 'dd-mm-yyyy'), '13:30', 'registration fa', 22638, 'direct debit', 378471735, 1355);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-02-1968', 'dd-mm-yyyy'), '13:00', 'waiting for con', 29015, 'direct debit', 440048019, 1228);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-11-1900', 'dd-mm-yyyy'), '15:30', 'waiting for con', 22402, 'bank transfer', 510426007, 1075);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-03-1996', 'dd-mm-yyyy'), '18:00', 'registered succ', 21795, 'credit', 520146188, 1014);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-09-2002', 'dd-mm-yyyy'), '9:55', 'registration fa', 28194, 'credit', 854022589, 1445);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-11-1900', 'dd-mm-yyyy'), '8:00', 'waiting for con', 25254, 'direct debit', 142490108, 1176);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-07-1916', 'dd-mm-yyyy'), '16:30', 'waiting for con', 22934, 'bit', 774239595, 1033);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-07-1980', 'dd-mm-yyyy'), '12:30', 'registered succ', 22140, 'direct debit', 599462410, 1129);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-12-1975', 'dd-mm-yyyy'), '13:30', 'registered succ', 28644, 'bank transfer', 434786604, 1237);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-06-1959', 'dd-mm-yyyy'), '18:55', 'registration fa', 24876, 'credit', 356332541, 1417);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-08-1911', 'dd-mm-yyyy'), '13:55', 'registration fa', 25268, 'bank transfer', 155656070, 1275);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-08-1969', 'dd-mm-yyyy'), '9:55', 'registration fa', 29910, 'direct debit', 730793098, 1454);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-04-1968', 'dd-mm-yyyy'), '18:00', 'registration fa', 26278, 'credit', 151316118, 1133);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-06-1987', 'dd-mm-yyyy'), '14:00', 'registration fa', 29414, 'bit', 378471735, 1001);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-07-2007', 'dd-mm-yyyy'), '12:00', 'registration fa', 20902, 'direct debit', 806660959, 1494);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-07-1948', 'dd-mm-yyyy'), '13:00', 'waiting for con', 22105, 'bit', 624215523, 1011);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-10-1972', 'dd-mm-yyyy'), '17:30', 'registered succ', 28581, 'credit', 594853572, 1083);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-05-1982', 'dd-mm-yyyy'), '15:00', 'waiting for con', 22789, 'bank transfer', 594848985, 1268);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-03-1948', 'dd-mm-yyyy'), '9:55', 'registered succ', 25695, 'direct debit', 408873721, 1143);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-06-1991', 'dd-mm-yyyy'), '12:55', 'waiting for con', 25326, 'direct debit', 492086736, 1133);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-09-1918', 'dd-mm-yyyy'), '12:55', 'registration fa', 26118, 'credit', 408288953, 1153);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-12-1926', 'dd-mm-yyyy'), '16:00', 'registered succ', 21689, 'credit', 419243268, 1011);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-09-1913', 'dd-mm-yyyy'), '19:25', 'registration fa', 28617, 'direct debit', 990760635, 1158);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-02-1965', 'dd-mm-yyyy'), '13:25', 'registered succ', 21283, 'direct debit', 208092458, 1018);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-06-1904', 'dd-mm-yyyy'), '21:00', 'registered succ', 23924, 'bank transfer', 732996155, 1357);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-03-1972', 'dd-mm-yyyy'), '9:25', 'waiting for con', 25323, 'direct debit', 752559176, 1302);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-05-2020', 'dd-mm-yyyy'), '13:00', 'registration fa', 25327, 'direct debit', 971090608, 1224);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-02-1968', 'dd-mm-yyyy'), '10:25', 'registered succ', 21466, 'direct debit', 562291542, 1462);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-01-1909', 'dd-mm-yyyy'), '8:55', 'registration fa', 27146, 'direct debit', 505783536, 1193);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-11-1967', 'dd-mm-yyyy'), '20:30', 'registered succ', 29717, 'bit', 157192790, 1189);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-12-1928', 'dd-mm-yyyy'), '13:30', 'registered succ', 28589, 'bit', 702926004, 1371);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-03-2005', 'dd-mm-yyyy'), '15:30', 'registration fa', 22358, 'credit', 433913457, 1090);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-01-1985', 'dd-mm-yyyy'), '8:00', 'waiting for con', 24238, 'bit', 858454932, 1307);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-07-1965', 'dd-mm-yyyy'), '14:55', 'waiting for con', 24210, 'direct debit', 694943475, 1139);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-10-1988', 'dd-mm-yyyy'), '19:55', 'registration fa', 20069, 'credit', 344351148, 1172);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-12-1914', 'dd-mm-yyyy'), '15:00', 'registration fa', 25122, 'credit', 854022589, 1468);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-08-1939', 'dd-mm-yyyy'), '12:30', 'waiting for con', 23493, 'bit', 993392943, 1033);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-05-1985', 'dd-mm-yyyy'), '12:00', 'registered succ', 20303, 'direct debit', 834134976, 1178);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-03-2022', 'dd-mm-yyyy'), '14:25', 'registration fa', 20537, 'direct debit', 364170530, 1466);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-06-1989', 'dd-mm-yyyy'), '18:25', 'registration fa', 26151, 'credit', 705512501, 1143);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-10-1928', 'dd-mm-yyyy'), '14:25', 'waiting for con', 21177, 'credit', 487754210, 1463);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-05-2004', 'dd-mm-yyyy'), '10:25', 'registered succ', 25518, 'credit', 799018566, 1350);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-08-1997', 'dd-mm-yyyy'), '18:30', 'registration fa', 28008, 'direct debit', 257164474, 1227);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-09-1999', 'dd-mm-yyyy'), '12:25', 'waiting for con', 27401, 'bank transfer', 671322471, 1291);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-06-1929', 'dd-mm-yyyy'), '20:30', 'waiting for con', 22061, 'direct debit', 569201301, 1471);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-03-2001', 'dd-mm-yyyy'), '19:30', 'registered succ', 27416, 'direct debit', 659629898, 1212);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-08-1997', 'dd-mm-yyyy'), '19:25', 'registration fa', 25857, 'bit', 631311297, 1236);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-02-1980', 'dd-mm-yyyy'), '10:30', 'registration fa', 27893, 'direct debit', 928532356, 1244);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-04-1932', 'dd-mm-yyyy'), '17:25', 'registered succ', 25622, 'bank transfer', 237048771, 1224);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-05-1960', 'dd-mm-yyyy'), '8:55', 'registered succ', 25452, 'bank transfer', 504472943, 1208);
commit;
prompt 200 records committed...
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-03-1922', 'dd-mm-yyyy'), '15:55', 'registration fa', 25436, 'credit', 356332541, 1404);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-07-1948', 'dd-mm-yyyy'), '15:55', 'waiting for con', 20317, 'bit', 243421012, 1313);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-07-2019', 'dd-mm-yyyy'), '20:25', 'waiting for con', 23707, 'bit', 797244562, 1256);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-05-1991', 'dd-mm-yyyy'), '8:00', 'registration fa', 20792, 'credit', 565641150, 1431);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-09-1907', 'dd-mm-yyyy'), '13:00', 'registration fa', 20219, 'bank transfer', 331644143, 1162);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-06-1970', 'dd-mm-yyyy'), '12:55', 'registration fa', 29120, 'credit', 440048019, 1459);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-06-1978', 'dd-mm-yyyy'), '21:30', 'registered succ', 27926, 'direct debit', 440048019, 1424);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-03-2013', 'dd-mm-yyyy'), '18:30', 'registration fa', 26781, 'bit', 220431119, 1337);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-05-1942', 'dd-mm-yyyy'), '21:30', 'registration fa', 21019, 'bank transfer', 295520185, 1017);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-04-1917', 'dd-mm-yyyy'), '12:25', 'registered succ', 28997, 'credit', 930355648, 1451);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-11-1933', 'dd-mm-yyyy'), '12:55', 'registered succ', 27563, 'bit', 244518177, 1072);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-10-1982', 'dd-mm-yyyy'), '18:30', 'registered succ', 25182, 'direct debit', 720172357, 1149);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-02-1983', 'dd-mm-yyyy'), '8:55', 'waiting for con', 24294, 'bank transfer', 435498926, 1438);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-10-1909', 'dd-mm-yyyy'), '16:25', 'waiting for con', 25192, 'credit', 594821272, 1337);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-12-1952', 'dd-mm-yyyy'), '13:55', 'registration fa', 21295, 'bit', 923449846, 1461);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-03-1926', 'dd-mm-yyyy'), '14:30', 'registered succ', 25887, 'direct debit', 834134976, 1311);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-11-2002', 'dd-mm-yyyy'), '12:30', 'registered succ', 28082, 'bit', 440048019, 1441);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-04-1971', 'dd-mm-yyyy'), '18:25', 'waiting for con', 29509, 'bank transfer', 548101695, 1106);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-09-1920', 'dd-mm-yyyy'), '20:55', 'registration fa', 28478, 'bit', 560279603, 1052);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-06-1939', 'dd-mm-yyyy'), '18:00', 'registered succ', 20207, 'bit', 167346753, 1475);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-06-1935', 'dd-mm-yyyy'), '11:25', 'waiting for con', 22596, 'bit', 971725080, 1256);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-12-1948', 'dd-mm-yyyy'), '11:25', 'registered succ', 28438, 'bit', 145998135, 1089);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-01-1963', 'dd-mm-yyyy'), '15:25', 'registered succ', 28300, 'credit', 939839851, 1440);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-04-1981', 'dd-mm-yyyy'), '16:00', 'registered succ', 20441, 'bit', 510426007, 1094);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-06-1905', 'dd-mm-yyyy'), '13:25', 'waiting for con', 25010, 'bit', 994771666, 1195);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-11-1914', 'dd-mm-yyyy'), '14:25', 'registration fa', 22319, 'bit', 244926474, 1284);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-02-2009', 'dd-mm-yyyy'), '21:25', 'registered succ', 27582, 'bit', 655465365, 1303);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-01-2020', 'dd-mm-yyyy'), '9:00', 'registration fa', 20458, 'bit', 233232194, 1395);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-04-1914', 'dd-mm-yyyy'), '13:30', 'waiting for con', 26923, 'credit', 307355201, 1368);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-03-1976', 'dd-mm-yyyy'), '18:25', 'waiting for con', 20492, 'bank transfer', 350432353, 1355);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-07-1958', 'dd-mm-yyyy'), '15:30', 'registration fa', 27708, 'direct debit', 625659195, 1440);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-08-1908', 'dd-mm-yyyy'), '10:00', 'registration fa', 23796, 'bit', 414615584, 1271);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-02-1969', 'dd-mm-yyyy'), '16:25', 'waiting for con', 21379, 'bank transfer', 386688496, 1335);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-10-1964', 'dd-mm-yyyy'), '19:55', 'waiting for con', 25979, 'bit', 295520185, 1496);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-05-2004', 'dd-mm-yyyy'), '16:00', 'registered succ', 28574, 'direct debit', 415639229, 1136);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-08-1989', 'dd-mm-yyyy'), '16:55', 'waiting for con', 29133, 'bank transfer', 921373541, 1084);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-09-2008', 'dd-mm-yyyy'), '8:30', 'registration fa', 28846, 'bit', 624215523, 1258);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-11-2024', 'dd-mm-yyyy'), '17:25', 'waiting for con', 21170, 'credit', 335261189, 1311);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-08-2020', 'dd-mm-yyyy'), '15:55', 'registered succ', 23464, 'direct debit', 694418094, 1171);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-05-1959', 'dd-mm-yyyy'), '12:30', 'waiting for con', 26691, 'bank transfer', 584802291, 1269);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-11-1937', 'dd-mm-yyyy'), '10:30', 'waiting for con', 28829, 'direct debit', 698505766, 1394);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-04-1934', 'dd-mm-yyyy'), '19:55', 'waiting for con', 21563, 'direct debit', 244518177, 1452);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-11-1996', 'dd-mm-yyyy'), '17:00', 'registered succ', 23049, 'bank transfer', 193983217, 1214);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-05-1918', 'dd-mm-yyyy'), '21:25', 'registration fa', 29006, 'direct debit', 364487020, 1131);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-07-1986', 'dd-mm-yyyy'), '9:30', 'waiting for con', 22557, 'bit', 675822865, 1380);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-06-1985', 'dd-mm-yyyy'), '11:00', 'registered succ', 21248, 'bit', 412571737, 1243);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-01-2021', 'dd-mm-yyyy'), '18:25', 'registration fa', 21556, 'direct debit', 875915357, 1373);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-11-1935', 'dd-mm-yyyy'), '19:30', 'registered succ', 20995, 'bank transfer', 523824178, 1301);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-05-1918', 'dd-mm-yyyy'), '20:00', 'waiting for con', 28963, 'direct debit', 331644143, 1287);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-10-2017', 'dd-mm-yyyy'), '9:00', 'registered succ', 24526, 'bit', 930355648, 1013);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-12-1919', 'dd-mm-yyyy'), '17:00', 'waiting for con', 20952, 'credit', 670391541, 1351);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-02-1936', 'dd-mm-yyyy'), '16:30', 'registration fa', 22205, 'bit', 942892125, 1179);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-10-1925', 'dd-mm-yyyy'), '16:25', 'waiting for con', 28267, 'credit', 742759332, 1221);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-05-1970', 'dd-mm-yyyy'), '18:25', 'waiting for con', 24073, 'bit', 678365789, 1493);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-04-2018', 'dd-mm-yyyy'), '18:30', 'registered succ', 21964, 'direct debit', 982624497, 1177);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-11-1977', 'dd-mm-yyyy'), '17:55', 'registration fa', 26014, 'direct debit', 858454932, 1043);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-03-1934', 'dd-mm-yyyy'), '8:30', 'waiting for con', 22600, 'bit', 958595504, 1075);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-12-1998', 'dd-mm-yyyy'), '19:30', 'waiting for con', 26819, 'bank transfer', 481629089, 1070);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-09-1989', 'dd-mm-yyyy'), '18:25', 'waiting for con', 25809, 'direct debit', 387410907, 1285);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-01-1906', 'dd-mm-yyyy'), '19:25', 'registration fa', 29001, 'bit', 370647200, 1357);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-10-2023', 'dd-mm-yyyy'), '20:00', 'waiting for con', 28520, 'bank transfer', 582048880, 1227);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-03-1918', 'dd-mm-yyyy'), '10:30', 'registration fa', 22145, 'bank transfer', 774239595, 1338);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-01-1997', 'dd-mm-yyyy'), '17:30', 'waiting for con', 22087, 'bank transfer', 274685257, 1235);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-10-2000', 'dd-mm-yyyy'), '10:55', 'waiting for con', 22889, 'credit', 820663546, 1037);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-09-1944', 'dd-mm-yyyy'), '8:25', 'registration fa', 20922, 'direct debit', 807508610, 1128);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-06-1985', 'dd-mm-yyyy'), '19:25', 'registered succ', 21963, 'bank transfer', 752559176, 1158);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-09-2013', 'dd-mm-yyyy'), '15:25', 'waiting for con', 28120, 'bit', 248522719, 1468);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-10-1928', 'dd-mm-yyyy'), '16:30', 'registration fa', 22307, 'credit', 268744838, 1013);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-10-2000', 'dd-mm-yyyy'), '13:25', 'waiting for con', 27376, 'bank transfer', 657913441, 1009);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-07-1909', 'dd-mm-yyyy'), '9:25', 'waiting for con', 29047, 'direct debit', 155656070, 1326);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-06-1977', 'dd-mm-yyyy'), '13:25', 'waiting for con', 28014, 'credit', 707367726, 1060);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-08-1941', 'dd-mm-yyyy'), '21:00', 'waiting for con', 25550, 'bank transfer', 738207711, 1281);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-04-1967', 'dd-mm-yyyy'), '15:25', 'registered succ', 29246, 'direct debit', 384121194, 1124);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-03-1990', 'dd-mm-yyyy'), '13:55', 'waiting for con', 21088, 'bank transfer', 586890466, 1170);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-03-1903', 'dd-mm-yyyy'), '14:30', 'registration fa', 21214, 'direct debit', 738207711, 1150);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-11-1949', 'dd-mm-yyyy'), '12:00', 'waiting for con', 22315, 'bit', 974570282, 1463);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-06-2023', 'dd-mm-yyyy'), '19:30', 'waiting for con', 23886, 'bit', 738207711, 1181);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-10-1937', 'dd-mm-yyyy'), '14:00', 'waiting for con', 25399, 'direct debit', 361162494, 1362);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-02-2021', 'dd-mm-yyyy'), '21:00', 'registration fa', 24358, 'bit', 226227869, 1282);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-08-2014', 'dd-mm-yyyy'), '16:25', 'waiting for con', 24047, 'credit', 233232194, 1041);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-03-1985', 'dd-mm-yyyy'), '17:00', 'registration fa', 20478, 'bank transfer', 707367726, 1091);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-12-1927', 'dd-mm-yyyy'), '20:30', 'registered succ', 21981, 'bit', 531136933, 1027);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-06-1930', 'dd-mm-yyyy'), '17:00', 'waiting for con', 24563, 'bit', 446951736, 1043);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-08-1930', 'dd-mm-yyyy'), '12:55', 'registration fa', 25119, 'bit', 283605246, 1486);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-06-1964', 'dd-mm-yyyy'), '8:55', 'registered succ', 20992, 'credit', 157192790, 1360);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-04-1940', 'dd-mm-yyyy'), '9:30', 'waiting for con', 21592, 'credit', 273476568, 1119);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-05-2007', 'dd-mm-yyyy'), '14:55', 'waiting for con', 26241, 'credit', 418016946, 1235);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-11-1977', 'dd-mm-yyyy'), '12:00', 'waiting for con', 25162, 'bit', 880459846, 1500);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-07-1960', 'dd-mm-yyyy'), '19:25', 'registration fa', 25078, 'credit', 568115643, 1459);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-08-1943', 'dd-mm-yyyy'), '15:00', 'registered succ', 22537, 'bank transfer', 154736692, 1284);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-05-1948', 'dd-mm-yyyy'), '18:55', 'waiting for con', 22839, 'direct debit', 273476568, 1352);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-07-1950', 'dd-mm-yyyy'), '10:55', 'registration fa', 25814, 'credit', 568115643, 1452);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-03-2007', 'dd-mm-yyyy'), '13:00', 'waiting for con', 26511, 'direct debit', 536265727, 1001);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-03-1985', 'dd-mm-yyyy'), '9:30', 'registration fa', 20696, 'credit', 755734032, 1082);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-06-1965', 'dd-mm-yyyy'), '21:00', 'registered succ', 27424, 'credit', 468232869, 1332);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-01-1983', 'dd-mm-yyyy'), '13:25', 'registered succ', 27679, 'direct debit', 894707368, 1066);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-12-1925', 'dd-mm-yyyy'), '15:55', 'registered succ', 21384, 'credit', 958825994, 1255);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-11-1912', 'dd-mm-yyyy'), '17:55', 'registration fa', 29853, 'direct debit', 856032291, 1442);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-11-1946', 'dd-mm-yyyy'), '18:55', 'registered succ', 28505, 'credit', 284559782, 1044);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-10-1969', 'dd-mm-yyyy'), '9:25', 'registered succ', 25767, 'credit', 522206993, 1155);
commit;
prompt 300 records committed...
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-09-1998', 'dd-mm-yyyy'), '17:55', 'registration fa', 20676, 'credit', 713982859, 1032);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-03-1974', 'dd-mm-yyyy'), '18:00', 'registration fa', 21822, 'direct debit', 307962704, 1483);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-02-1916', 'dd-mm-yyyy'), '17:25', 'registered succ', 20010, 'credit', 850333783, 1244);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-12-1910', 'dd-mm-yyyy'), '21:25', 'waiting for con', 24205, 'credit', 850333783, 1273);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-10-1924', 'dd-mm-yyyy'), '10:55', 'registration fa', 22357, 'bit', 205975580, 1229);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-11-1958', 'dd-mm-yyyy'), '22:00', 'registration fa', 28441, 'credit', 302857753, 1348);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-07-1915', 'dd-mm-yyyy'), '14:30', 'waiting for con', 26827, 'direct debit', 291158910, 1240);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-07-1918', 'dd-mm-yyyy'), '16:55', 'registration fa', 23496, 'direct debit', 548101695, 1306);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-10-1935', 'dd-mm-yyyy'), '14:25', 'registered succ', 20699, 'direct debit', 291158910, 1322);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-02-1942', 'dd-mm-yyyy'), '17:25', 'waiting for con', 29913, 'direct debit', 589617206, 1437);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-04-1947', 'dd-mm-yyyy'), '14:30', 'registration fa', 29785, 'credit', 958825994, 1218);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-10-1903', 'dd-mm-yyyy'), '8:00', 'registration fa', 26109, 'bank transfer', 440048019, 1126);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-05-1991', 'dd-mm-yyyy'), '21:55', 'registration fa', 22937, 'credit', 797244562, 1363);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-05-1978', 'dd-mm-yyyy'), '20:00', 'registered succ', 26585, 'bit', 159170040, 1371);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-07-1935', 'dd-mm-yyyy'), '9:30', 'waiting for con', 26530, 'credit', 294368552, 1228);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-04-1984', 'dd-mm-yyyy'), '10:25', 'waiting for con', 28676, 'bank transfer', 237048771, 1053);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-11-1999', 'dd-mm-yyyy'), '16:30', 'registered succ', 25939, 'bank transfer', 740865355, 1005);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-10-1995', 'dd-mm-yyyy'), '16:55', 'registered succ', 23646, 'bank transfer', 313417613, 1405);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-10-2007', 'dd-mm-yyyy'), '14:55', 'waiting for con', 27162, 'bit', 413548318, 1046);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-09-1963', 'dd-mm-yyyy'), '18:30', 'registration fa', 21589, 'bank transfer', 482724033, 1035);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-09-1919', 'dd-mm-yyyy'), '19:30', 'registered succ', 28040, 'credit', 371298943, 1312);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-01-1925', 'dd-mm-yyyy'), '10:00', 'registered succ', 20807, 'bank transfer', 930355648, 1344);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-01-1997', 'dd-mm-yyyy'), '9:55', 'registration fa', 26057, 'credit', 248522719, 1153);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-03-1964', 'dd-mm-yyyy'), '10:25', 'registered succ', 29265, 'direct debit', 720172357, 1038);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-03-1999', 'dd-mm-yyyy'), '16:55', 'registered succ', 23704, 'bit', 428320038, 1245);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-10-2005', 'dd-mm-yyyy'), '20:30', 'registration fa', 21475, 'bit', 244926474, 1393);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-12-1929', 'dd-mm-yyyy'), '9:30', 'waiting for con', 23776, 'direct debit', 331030591, 1242);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-03-2006', 'dd-mm-yyyy'), '11:00', 'registered succ', 26866, 'bank transfer', 120518448, 1266);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-01-1946', 'dd-mm-yyyy'), '17:30', 'waiting for con', 21162, 'direct debit', 208092458, 1222);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-03-1978', 'dd-mm-yyyy'), '17:30', 'registration fa', 28469, 'bit', 657913441, 1310);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-11-1918', 'dd-mm-yyyy'), '20:30', 'waiting for con', 25470, 'credit', 684500089, 1366);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-06-1944', 'dd-mm-yyyy'), '9:30', 'registration fa', 21759, 'credit', 967108904, 1496);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-10-1977', 'dd-mm-yyyy'), '16:55', 'registered succ', 25680, 'bank transfer', 856032291, 1407);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-08-1933', 'dd-mm-yyyy'), '14:00', 'waiting for con', 25787, 'credit', 360079988, 1468);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-12-1940', 'dd-mm-yyyy'), '9:25', 'registered succ', 24684, 'bit', 159170040, 1291);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-03-1971', 'dd-mm-yyyy'), '10:00', 'waiting for con', 20494, 'bank transfer', 237048771, 1395);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-11-1971', 'dd-mm-yyyy'), '13:30', 'registered succ', 23625, 'bit', 807508610, 1471);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-12-1960', 'dd-mm-yyyy'), '11:30', 'registration fa', 28490, 'credit', 157192790, 1031);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-06-1992', 'dd-mm-yyyy'), '15:25', 'waiting for con', 23967, 'bit', 806660959, 1412);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-11-1919', 'dd-mm-yyyy'), '14:25', 'registration fa', 24573, 'bit', 727898410, 1344);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-07-1987', 'dd-mm-yyyy'), '14:25', 'registered succ', 24976, 'bank transfer', 135853376, 1105);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-08-1915', 'dd-mm-yyyy'), '11:55', 'waiting for con', 25187, 'credit', 331030591, 1027);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-02-2005', 'dd-mm-yyyy'), '17:30', 'registration fa', 26198, 'credit', 945949905, 1124);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-05-2014', 'dd-mm-yyyy'), '14:00', 'registration fa', 20808, 'direct debit', 464097515, 1347);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-07-1945', 'dd-mm-yyyy'), '9:25', 'registration fa', 24435, 'bank transfer', 812297334, 1332);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-04-1903', 'dd-mm-yyyy'), '21:25', 'registration fa', 20200, 'bit', 226227869, 1296);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-02-1981', 'dd-mm-yyyy'), '19:55', 'registration fa', 23027, 'bank transfer', 955024358, 1181);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-04-1985', 'dd-mm-yyyy'), '10:00', 'registration fa', 24540, 'direct debit', 817295135, 1368);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-02-1903', 'dd-mm-yyyy'), '8:55', 'registered succ', 23805, 'bit', 274837613, 1191);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-02-1980', 'dd-mm-yyyy'), '10:55', 'registration fa', 24909, 'direct debit', 391505670, 1371);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-02-1909', 'dd-mm-yyyy'), '17:30', 'registration fa', 29344, 'bit', 523824178, 1222);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-11-2013', 'dd-mm-yyyy'), '13:30', 'waiting for con', 26490, 'bank transfer', 464097515, 1413);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-01-1921', 'dd-mm-yyyy'), '12:25', 'registration fa', 20775, 'direct debit', 646870683, 1006);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-07-1978', 'dd-mm-yyyy'), '15:55', 'registration fa', 20311, 'direct debit', 491821294, 1493);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-01-1971', 'dd-mm-yyyy'), '12:00', 'registered succ', 25178, 'bit', 812297334, 1227);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-01-1975', 'dd-mm-yyyy'), '12:25', 'waiting for con', 26546, 'credit', 468232869, 1377);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-09-2018', 'dd-mm-yyyy'), '16:25', 'registration fa', 21785, 'direct debit', 755734032, 1124);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-04-2022', 'dd-mm-yyyy'), '18:00', 'registration fa', 25352, 'bit', 917304512, 1046);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-07-1939', 'dd-mm-yyyy'), '19:55', 'registration fa', 28939, 'credit', 454954723, 1365);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-04-2024', 'dd-mm-yyyy'), '8:00', 'registration fa', 20251, 'bit', 942240902, 1327);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-04-2013', 'dd-mm-yyyy'), '13:25', 'waiting for con', 29115, 'bit', 661387813, 1077);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-09-1951', 'dd-mm-yyyy'), '17:55', 'waiting for con', 28013, 'bank transfer', 894707368, 1459);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-07-1939', 'dd-mm-yyyy'), '20:55', 'waiting for con', 28394, 'credit', 307962704, 1222);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-12-1939', 'dd-mm-yyyy'), '20:55', 'registered succ', 24859, 'credit', 565641150, 1267);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-09-1911', 'dd-mm-yyyy'), '13:25', 'waiting for con', 28739, 'credit', 974779780, 1470);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-11-1917', 'dd-mm-yyyy'), '8:30', 'waiting for con', 28305, 'direct debit', 334884645, 1078);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-02-1925', 'dd-mm-yyyy'), '19:30', 'registration fa', 25664, 'bit', 120518448, 1379);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-10-1905', 'dd-mm-yyyy'), '18:00', 'registration fa', 26947, 'bit', 429520185, 1403);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-04-1939', 'dd-mm-yyyy'), '14:55', 'registration fa', 26114, 'bit', 462465686, 1090);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-09-1935', 'dd-mm-yyyy'), '10:30', 'registration fa', 26108, 'bank transfer', 257157291, 1034);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-12-2013', 'dd-mm-yyyy'), '19:30', 'registration fa', 24851, 'credit', 761829408, 1069);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-02-1983', 'dd-mm-yyyy'), '13:30', 'registration fa', 23902, 'bank transfer', 323117332, 1332);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-04-1958', 'dd-mm-yyyy'), '18:25', 'waiting for con', 29597, 'credit', 372130995, 1179);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-08-2014', 'dd-mm-yyyy'), '17:00', 'registration fa', 27089, 'credit', 834134976, 1034);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-01-2017', 'dd-mm-yyyy'), '13:55', 'waiting for con', 25158, 'bank transfer', 493583649, 1352);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-01-1974', 'dd-mm-yyyy'), '9:30', 'registered succ', 22795, 'direct debit', 921373541, 1032);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-07-1998', 'dd-mm-yyyy'), '17:00', 'registration fa', 22884, 'credit', 939839851, 1281);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-04-1977', 'dd-mm-yyyy'), '9:00', 'registered succ', 24094, 'bit', 909785269, 1020);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-11-1916', 'dd-mm-yyyy'), '18:55', 'registration fa', 29643, 'bit', 368944057, 1173);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-05-1909', 'dd-mm-yyyy'), '16:25', 'registration fa', 29195, 'bank transfer', 357069889, 1301);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-06-1953', 'dd-mm-yyyy'), '11:30', 'waiting for con', 29760, 'bank transfer', 504018726, 1024);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-08-1924', 'dd-mm-yyyy'), '11:00', 'waiting for con', 22749, 'bit', 357069889, 1107);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-06-1956', 'dd-mm-yyyy'), '15:55', 'registered succ', 21010, 'credit', 194300384, 1010);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-05-2022', 'dd-mm-yyyy'), '17:25', 'registration fa', 20276, 'bit', 946563676, 1313);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-10-2001', 'dd-mm-yyyy'), '9:30', 'registered succ', 25633, 'bit', 935880625, 1202);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-09-1921', 'dd-mm-yyyy'), '9:25', 'registration fa', 23966, 'credit', 925923696, 1411);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-08-1957', 'dd-mm-yyyy'), '16:30', 'waiting for con', 23523, 'credit', 316172017, 1465);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-09-1912', 'dd-mm-yyyy'), '14:00', 'waiting for con', 22111, 'bit', 244518177, 1391);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-06-1978', 'dd-mm-yyyy'), '15:30', 'registration fa', 20919, 'credit', 611600761, 1458);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-05-2020', 'dd-mm-yyyy'), '21:30', 'registered succ', 21755, 'credit', 199504657, 1235);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-08-1918', 'dd-mm-yyyy'), '11:55', 'registration fa', 23219, 'bank transfer', 678365789, 1404);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-07-1921', 'dd-mm-yyyy'), '21:00', 'registered succ', 20557, 'direct debit', 413548318, 1309);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-06-1969', 'dd-mm-yyyy'), '11:00', 'registration fa', 21096, 'bit', 797814119, 1458);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-02-1931', 'dd-mm-yyyy'), '21:30', 'waiting for con', 20841, 'credit', 611600761, 1226);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-08-2003', 'dd-mm-yyyy'), '14:30', 'waiting for con', 25508, 'credit', 629786105, 1114);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-12-2021', 'dd-mm-yyyy'), '9:25', 'registration fa', 23549, 'direct debit', 435781343, 1026);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-04-1999', 'dd-mm-yyyy'), '9:30', 'waiting for con', 29243, 'bank transfer', 538139607, 1209);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-11-1975', 'dd-mm-yyyy'), '17:00', 'waiting for con', 28877, 'bank transfer', 519393755, 1172);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-02-1995', 'dd-mm-yyyy'), '16:25', 'registered succ', 24045, 'bit', 678365789, 1203);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-02-1901', 'dd-mm-yyyy'), '18:55', 'registered succ', 25649, 'credit', 356332541, 1358);
commit;
prompt 400 records committed...
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-01-1904', 'dd-mm-yyyy'), '15:00', 'registered succ', 29447, 'direct debit', 566478883, 1214);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-04-1949', 'dd-mm-yyyy'), '17:25', 'registered succ', 23618, 'bit', 877384109, 1478);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-07-1927', 'dd-mm-yyyy'), '14:55', 'registered succ', 20773, 'credit', 589617206, 1248);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-06-1940', 'dd-mm-yyyy'), '16:55', 'waiting for con', 27383, 'bit', 850908051, 1341);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-10-1931', 'dd-mm-yyyy'), '20:30', 'waiting for con', 27172, 'bit', 445415422, 1018);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('14-08-2009', 'dd-mm-yyyy'), '17:30', 'registered succ', 22949, 'bank transfer', 611078316, 1132);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-07-1901', 'dd-mm-yyyy'), '21:30', 'registration fa', 28867, 'credit', 890262685, 1132);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-06-1941', 'dd-mm-yyyy'), '13:25', 'registration fa', 28839, 'credit', 310109165, 1310);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-10-2017', 'dd-mm-yyyy'), '14:55', 'registration fa', 24503, 'bit', 586890466, 1218);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-10-1949', 'dd-mm-yyyy'), '17:25', 'waiting for con', 28655, 'direct debit', 391505670, 1176);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-03-2020', 'dd-mm-yyyy'), '13:55', 'waiting for con', 27351, 'bit', 486780251, 1411);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-10-1936', 'dd-mm-yyyy'), '18:00', 'waiting for con', 21790, 'bank transfer', 967108904, 1276);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-08-1914', 'dd-mm-yyyy'), '9:30', 'registration fa', 21535, 'credit', 284559782, 1362);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-06-1965', 'dd-mm-yyyy'), '18:30', 'registered succ', 29126, 'bank transfer', 903710430, 1400);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-03-1981', 'dd-mm-yyyy'), '15:00', 'waiting for con', 29457, 'bank transfer', 562291542, 1477);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-11-1912', 'dd-mm-yyyy'), '14:55', 'waiting for con', 27191, 'bit', 237048771, 1273);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-12-1913', 'dd-mm-yyyy'), '9:00', 'registration fa', 28619, 'credit', 155656070, 1109);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-12-2017', 'dd-mm-yyyy'), '21:00', 'registration fa', 29218, 'bit', 509691005, 1263);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-05-2010', 'dd-mm-yyyy'), '8:25', 'registered succ', 23901, 'bit', 329422655, 1300);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-04-1920', 'dd-mm-yyyy'), '8:00', 'waiting for con', 25231, 'credit', 273476568, 1358);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('16-11-1994', 'dd-mm-yyyy'), '10:25', 'waiting for con', 23257, 'direct debit', 246283530, 1447);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-03-1903', 'dd-mm-yyyy'), '15:25', 'registration fa', 23350, 'credit', 433913457, 1486);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-01-1926', 'dd-mm-yyyy'), '8:30', 'registered succ', 29149, 'bank transfer', 342364399, 1248);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-11-1950', 'dd-mm-yyyy'), '19:25', 'registration fa', 23769, 'direct debit', 952867111, 1258);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-02-1911', 'dd-mm-yyyy'), '19:55', 'registration fa', 26413, 'direct debit', 328241971, 1373);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-05-1900', 'dd-mm-yyyy'), '14:25', 'waiting for con', 27957, 'bit', 216639343, 1470);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-04-1984', 'dd-mm-yyyy'), '9:25', 'registration fa', 29501, 'direct debit', 453116218, 1091);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-03-1969', 'dd-mm-yyyy'), '10:30', 'registration fa', 29038, 'credit', 464097515, 1122);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-12-2000', 'dd-mm-yyyy'), '16:25', 'waiting for con', 28626, 'direct debit', 449206569, 1028);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-09-1934', 'dd-mm-yyyy'), '10:55', 'waiting for con', 22064, 'bit', 310109165, 1268);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('03-08-1986', 'dd-mm-yyyy'), '11:55', 'waiting for con', 23865, 'credit', 887320303, 1475);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-10-1967', 'dd-mm-yyyy'), '11:00', 'registered succ', 26712, 'credit', 429520185, 1099);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('25-06-1963', 'dd-mm-yyyy'), '11:30', 'waiting for con', 29726, 'credit', 765688162, 1319);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-10-1940', 'dd-mm-yyyy'), '12:25', 'waiting for con', 22544, 'bank transfer', 451119536, 1365);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-11-1954', 'dd-mm-yyyy'), '9:25', 'registered succ', 28368, 'credit', 799018566, 1357);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('02-04-1905', 'dd-mm-yyyy'), '20:00', 'waiting for con', 26562, 'direct debit', 248694647, 1132);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-05-1987', 'dd-mm-yyyy'), '9:00', 'waiting for con', 23306, 'bit', 323117332, 1227);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('20-02-1962', 'dd-mm-yyyy'), '16:55', 'registered succ', 27444, 'direct debit', 880651558, 1467);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-12-1916', 'dd-mm-yyyy'), '20:25', 'registered succ', 27530, 'direct debit', 732996155, 1467);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-04-1934', 'dd-mm-yyyy'), '15:30', 'registered succ', 28712, 'bank transfer', 504472943, 1306);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-01-1951', 'dd-mm-yyyy'), '13:25', 'registration fa', 26207, 'credit', 951290609, 1406);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-01-2020', 'dd-mm-yyyy'), '8:55', 'registered succ', 27253, 'bank transfer', 752559176, 1377);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-11-1961', 'dd-mm-yyyy'), '19:00', 'registered succ', 25223, 'bit', 732887643, 1325);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-07-2003', 'dd-mm-yyyy'), '21:30', 'waiting for con', 22299, 'bank transfer', 162016078, 1171);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('15-07-1958', 'dd-mm-yyyy'), '21:55', 'registration fa', 28161, 'direct debit', 883547761, 1356);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-09-1902', 'dd-mm-yyyy'), '10:30', 'registered succ', 26140, 'bit', 284559782, 1215);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-03-1950', 'dd-mm-yyyy'), '21:55', 'registration fa', 26801, 'bank transfer', 342364399, 1209);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-11-1936', 'dd-mm-yyyy'), '18:00', 'registered succ', 29806, 'bit', 774366329, 1021);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-12-1933', 'dd-mm-yyyy'), '16:30', 'waiting for con', 29270, 'bank transfer', 294368552, 1448);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('27-03-1942', 'dd-mm-yyyy'), '13:00', 'waiting for con', 27696, 'direct debit', 121866851, 1251);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('28-07-2014', 'dd-mm-yyyy'), '15:00', 'registration fa', 26321, 'bit', 967655547, 1356);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-01-2015', 'dd-mm-yyyy'), '9:25', 'registration fa', 22832, 'bank transfer', 151316118, 1257);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-10-1974', 'dd-mm-yyyy'), '9:30', 'registered succ', 25448, 'direct debit', 639610500, 1322);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('23-04-1995', 'dd-mm-yyyy'), '9:55', 'waiting for con', 22202, 'credit', 792601950, 1355);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('17-04-1916', 'dd-mm-yyyy'), '13:00', 'registered succ', 25265, 'credit', 953727056, 1073);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-06-1978', 'dd-mm-yyyy'), '20:55', 'registration fa', 27633, 'bit', 930355648, 1115);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('13-06-2006', 'dd-mm-yyyy'), '10:30', 'registered succ', 24513, 'direct debit', 159170040, 1277);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-09-2012', 'dd-mm-yyyy'), '21:25', 'registered succ', 24978, 'direct debit', 953727056, 1059);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-07-1967', 'dd-mm-yyyy'), '11:00', 'waiting for con', 21649, 'bit', 359126922, 1271);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-09-1908', 'dd-mm-yyyy'), '9:30', 'registered succ', 21140, 'credit', 283520715, 1123);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-09-1995', 'dd-mm-yyyy'), '19:30', 'registered succ', 28059, 'credit', 146487603, 1326);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('07-09-1972', 'dd-mm-yyyy'), '16:25', 'waiting for con', 27804, 'credit', 565641150, 1488);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('21-03-2013', 'dd-mm-yyyy'), '14:25', 'registration fa', 20957, 'bank transfer', 944217001, 1348);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-10-1974', 'dd-mm-yyyy'), '13:25', 'registered succ', 20812, 'credit', 273476568, 1299);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-11-1948', 'dd-mm-yyyy'), '8:00', 'registration fa', 26778, 'bank transfer', 691618360, 1314);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-10-1996', 'dd-mm-yyyy'), '21:55', 'waiting for con', 27990, 'credit', 887844594, 1467);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('10-01-1998', 'dd-mm-yyyy'), '17:30', 'registration fa', 22765, 'bit', 955024358, 1271);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-10-1935', 'dd-mm-yyyy'), '17:30', 'registration fa', 24044, 'bit', 400866598, 1227);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('09-01-2022', 'dd-mm-yyyy'), '10:25', 'registered succ', 29387, 'bit', 530635564, 1043);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('29-11-1994', 'dd-mm-yyyy'), '19:55', 'registered succ', 22089, 'credit', 142490108, 1231);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('22-01-1930', 'dd-mm-yyyy'), '8:25', 'registered succ', 29508, 'bit', 111753641, 1365);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('05-08-1946', 'dd-mm-yyyy'), '10:25', 'registered succ', 25447, 'bit', 638857476, 1269);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-08-1912', 'dd-mm-yyyy'), '10:25', 'registration fa', 27817, 'credit', 262709621, 1040);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-02-1962', 'dd-mm-yyyy'), '19:30', 'registration fa', 23811, 'credit', 732996155, 1313);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-11-1938', 'dd-mm-yyyy'), '15:00', 'registration fa', 26250, 'credit', 487754210, 1065);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('19-05-2008', 'dd-mm-yyyy'), '16:25', 'registered succ', 22771, 'bank transfer', 462465686, 1289);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('04-12-2020', 'dd-mm-yyyy'), '10:55', 'registration fa', 23810, 'bit', 548101695, 1158);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('26-06-1964', 'dd-mm-yyyy'), '20:30', 'waiting for con', 28146, 'credit', 755480812, 1328);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('18-08-1945', 'dd-mm-yyyy'), '12:55', 'registered succ', 22906, 'credit', 505586182, 1317);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-12-1905', 'dd-mm-yyyy'), '14:30', 'registered succ', 24750, 'bit', 298024051, 1400);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-01-2021', 'dd-mm-yyyy'), '21:00', 'registered succ', 24600, 'credit', 433913457, 1381);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('24-11-2002', 'dd-mm-yyyy'), '21:30', 'registered succ', 26248, 'bank transfer', 387410907, 1444);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-01-1951', 'dd-mm-yyyy'), '14:30', 'waiting for con', 22790, 'bit', 223146636, 1126);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-12-1910', 'dd-mm-yyyy'), '21:00', 'registered succ', 26650, 'bit', 747528568, 1371);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('12-12-2004', 'dd-mm-yyyy'), '12:30', 'registered succ', 27809, 'direct debit', 510426007, 1320);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('30-06-1972', 'dd-mm-yyyy'), '13:00', 'waiting for con', 28102, 'bank transfer', 926919156, 1500);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('11-04-2003', 'dd-mm-yyyy'), '8:25', 'registered succ', 23905, 'bank transfer', 246283530, 1227);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-07-1936', 'dd-mm-yyyy'), '8:30', 'registered succ', 21804, 'bank transfer', 752559176, 1448);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-01-2009', 'dd-mm-yyyy'), '12:55', 'registered succ', 28239, 'bank transfer', 145834293, 1482);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('08-01-1973', 'dd-mm-yyyy'), '12:30', 'registered succ', 22495, 'bit', 272542559, 1341);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('01-10-1941', 'dd-mm-yyyy'), '19:55', 'waiting for con', 21891, 'bit', 128352368, 1100);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('31-05-1941', 'dd-mm-yyyy'), '21:30', 'waiting for con', 29922, 'bit', 154736692, 1469);
insert into REGISTRATION (registration_date, registration_time, status, registration_id, payment_method, participant_id, course_id)
values (to_date('06-12-1924', 'dd-mm-yyyy'), '14:55', 'registration fa', 21699, 'credit', 955024358, 1021);
commit;
prompt 493 records loaded
prompt Loading TCATEGORY...
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Bandaging Supplies''', ' ''John Smith''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Wound Care Products''', ' ''Emily Johnson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Diagnostic Instruments''', ' ''Michael Brown''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Emergency Resuscitation Equipment''', ' ''Sarah Wilson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Personal Protective Equipment (PPE)''', ' ''David Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Medications and Pharmaceuticals''', ' ''Jessica Lee''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Orthopedic Aids''', ' ''Alex Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Respiratory Equipment''', ' ''Jennifer Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Surgical Instruments''', ' ''Daniel Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Patient Monitoring Devices''', ' ''Olivia Davis''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Fluid Administration Equipment''', ' ''William Rodriguez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Emergency Transportation Aids''', ' ''Sophia Hernandez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Rehabilitation and Mobility Aids''', ' ''Ethan Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Hygiene and Sanitation Supplies''', ' ''Ava Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Health Education Materials''', ' ''James White''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Medical Waste Disposal Supplies''', ' ''Mia Thomas''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Home Healthcare Equipment''', ' ''Logan Parker''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Occupational Health Tools''', ' ''Isabella Wood''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Mental Health Assessment Tools''', ' ''Noah Morris''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Disaster Preparedness Kits''', ' ''Grace Bennett''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Emergency Communication Devices''', ' ''Elijah Nelson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Eye and Ear Protection Gear''', ' ''Charlotte Carter''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Skin Care Products''', ' ''Liam Murphy''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Immunization Supplies''', ' ''Samantha Reed''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Medical Records Management Systems''', ' ''Lucas Cooper''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Temperature Regulation Devices''', ' ''Madison Rivera''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Mobility Assistance Equipment''', ' ''Aiden Brooks''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Dental Care Products''', ' ''Zoe Evans''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Ostomy Supplies''', ' ''Gabriel Ward''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Pregnancy and Obstetric Care Tools''', ' ''Natalie Diaz''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Pediatric Healthcare Equipment''', ' ''Jackson Stewart''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Nutrition and Dietary Supplements''', ' ''Lily Price''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Infection Control Supplies''', ' ''Christopher Rogers''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Vital Signs Monitoring Equipment''', ' ''Chloe Hayes''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Continence Management Products''', ' ''Andrew Bell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Medical Imaging Devices''', ' ''Evelyn Howard''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Assistive Technology Devices''', ' ''Benjamin Long''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Hospice and Palliative Care Supplies''', ' ''Harper Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Laboratory Testing Equipment''', ' ''Mason Morgan''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Anatomical Models and Charts''', ' ''Victoria Cooper''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Biohazard Disposal Containers''', ' ''Samuel Richardson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Radiation Protection Gear''', ' ''Abigail Gray''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Neonatal Intensive Care Equipment''', ' ''Dylan Kelly''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Sleep Disorder Diagnosis Tools''', ' ''Sophie Carter''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Wheelchairs and Mobility Scooters''', ' ''Nathan Rivera''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Personal Emergency Response Systems (PERS)''', ' ''Alyssa Henderson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Rehabilitation Exercise Equipment''', ' ''Isaac Barnes''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Wound Debridement Tools''', ' ''Madeline Ward''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Pain Management Devices''', ' ''Henry Bennett''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Emergency Lighting Equipment''', ' ''Brooklyn Simmons''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Veterinary Medical Supplies''', ' ''Carter Bryant''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Blood Banking Equipment''', ' ''Aubrey Powell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Health Monitoring Apps and Software''', ' ''Grayson Russell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Medical Simulation Equipment''', ' ''Aria Diaz''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Ergonomic Furniture and Accessories''', ' ''Landon Hughes''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Behavioral Health Assessment Tools''', ' ''Addison Foster''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Environmental Monitoring Devices''', ' ''Parker Long''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Community Health Outreach Kits''', ' ''Charlie Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Cultural Competency Training Materials''', ' ''Charlotte Carter''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Adaptive Clothing and Footwear''', ' ''Ellie Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Disaster Recovery Equipment''', ' ''Jordan Parker''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Fitness and Exercise Equipment''', ' ''Riley Green''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Industrial Hygiene Tools''', ' ''Mackenzie Russell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Medical Coding and Billing Software''', ' ''Kayla Nelson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Patient Education Software''', ' ''Cameron Perez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Mobile Health (mHealth) Devices''', ' ''Taylor Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Patient Transportation Aids''', ' ''Sydney Martin''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Intraoperative Navigation Systems''', ' ''Tyler Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Sports Medicine Supplies''', ' ''Hailey Hughes''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Home Safety Equipment''', ' ''Jordan Wood''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Disaster Relief Supplies''', ' ''Peyton Bell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Ergonomic Assessment Tools''', ' ''Alexis Carter''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Patient Lifts and Transfer Aids''', ' ''Dakota Richardson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Medical Gas Delivery Systems''', ' ''Blake Howard''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Assisted Living Devices''', ' ''Kylie Ward''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Medical Marijuana Products''', ' ''Cody Gray''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Child Safety Products''', ' ''Eva Diaz''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Agricultural Health and Safety Equipment''', ' ''Cooper Powell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Genetics Testing Kits''', ' ''Peyton Green''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Emergency Shelter Supplies''', ' ''Quinn Brooks''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Poison Control Resources''', ' ''Reagan Foster''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Mental Health Crisis Intervention Tools''', ' ''Finley Murphy''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Remote Monitoring Devices''', ' ''Hayden Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Medical Tourism Services''', ' ''Elijah Nelson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Domestic Violence Intervention Resources''', ' ''Liam Murphy''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Medical Translation Services''', ' ''Samantha Reed''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Water Purification Systems''', ' ''Lucas Cooper''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Occupational Therapy Tools''', ' ''Madison Rivera''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Assistive Communication Devices''', ' ''Aiden Brooks''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Adaptive Seating Solutions''', ' ''Zoe Evans''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Post-surgical Rehabilitation Equipment''', ' ''Gabriel Ward''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Industrial First Aid Kits''', ' ''Natalie Diaz''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Hazmat Cleanup Tools''', ' ''Jackson Stewart''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Mobile Medical Units''', ' ''Lily Price''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telemedicine Platforms''', ' ''Christopher Rogers''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''DNA Sequencing Technology''', ' ''Chloe Hayes''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Surgical Navigation Systems''', ' ''Andrew Bell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Health Policy and Advocacy Resources''', ' ''Evelyn Howard''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Healthcare Robotics Systems''', ' ''Oliver Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Tele-rehabilitation Systems''', ' ''Emma Martinez''');
commit;
prompt 100 records committed...
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Medical Exoskeletons''', ' ''William Robinson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Biomedical Implants''', ' ''Sofia Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Point-of-Care Testing Devices''', ' ''Daniel Wilson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Virtual Reality Surgical Training Systems''', ' ''Mia Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Smart Inhalers''', ' ''Sophie Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Cardioverter Defibrillators (ICDs)''', ' ''Hannah Hernandez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Bionic Eyes''', ' ''Ethan Moore''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Neurostimulation Devices''', ' ''Olivia Cooper''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Nanotechnology-based Drug Delivery Systems''', ' ''Sophia Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Gene Editing Technologies''', ' ''Ava Brooks''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telehealth Platforms''', ' ''Elijah Wood''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''3D Bioprinting Systems''', ' ''Amelia Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Implantable Drug Pumps''', ' ''Ethan Howard''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Bioelectronic Medicine Devices''', ' ''Aria Green''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Wearable Health Monitoring Devices''', ' ''Liam Rivera''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Nanorobotics Systems for Surgery''', ' ''Avery Ward''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Smart Pill Technology''', ' ''Mason Kelly''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Medical Sensors''', ' ''Grace Rodriguez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Personalized Medicine Technologies''', ' ''Evan Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Artificial Organs''', ' ''Isabella Brooks''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Regenerative Medicine Therapies''', ' ''Lucas Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Health Information Exchange Systems''', ' ''Luna Richardson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Blockchain Technology in Healthcare''', ' ''Nolan Murphy''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Neural Interfaces''', ' ''Lily Simmons''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Digital Health Platforms''', ' ''Carter Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Robotic Surgery Systems''', ' ''Maya Nelson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Medical Nanorobots''', ' ''Elijah Powell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Smart Bandages''', ' ''Sophie Carter''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telemedicine Robots''', ' ''Benjamin Ward''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Precision Medicine Tools''', ' ''Violet Henderson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Nanomedicine Devices''', ' ''Logan Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Advanced Prosthetics''', ' ''Aria Taylor''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Home Diagnostic Kits''', ' ''Mateo Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Healthcare Chatbots''', ' ''Eva Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Continuous Glucose Monitoring Systems''', ' ''James Bell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Personal Genome Sequencing Kits''', ' ''Sophia Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Smart Contact Lenses''', ' ''Sophia Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Medical Wearable Devices''', ' ''Ella Rogers''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Implantable Heart Assist Devices''', ' ''Caleb Murphy''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Healthcare Drones''', ' ''Isabella Wilson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Robotic Rehabilitation Systems''', ' ''David Hernandez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Implantable Insulin Pumps''', ' ''David Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Telepathology Systems''', ' ''Dylan Cooper''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Healthcare Data Analytics Platforms''', ' ''Ethan Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Smart Syringes''', ' ''Avery Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Nanotechnology-based Vaccines''', ' ''Ethan Rodriguez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telemonitoring Systems''', ' ''Ella Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Glucose Sensors''', ' ''Nolan Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Virtual Healthcare Assistants''', ' ''Maya Diaz''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''AI-powered Medical Imaging Systems''', ' ''Oliver Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Implantable RFID Chips''', ' ''Hannah Evans''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Smart Health Cards''', ' ''Mateo Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telepathic Healthcare Interfaces''', ' ''Charlotte Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Brain-Computer Interfaces''', ' ''Ella Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Wearable Injectors''', ' ''Sophia Hernandez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Healthcare Augmented Reality Systems''', ' ''James Rodriguez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Nanotechnology-based Wound Dressings''', ' ''Aria Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Telepresence Robots''', ' ''Sophie Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Continuous Glucose Monitoring Systems''', ' ''Liam Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Digital Therapeutics''', ' ''Ethan Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Smart Healthcare Furniture''', ' ''Isabella Diaz''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Implantable Drug Delivery Systems''', ' ''Caleb Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Healthcare Robots''', ' ''Ella Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Smart Health Watches''', ' ''Mason Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Teletherapy Platforms''', ' ''Luna Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Implantable Drug Delivery Devices''', ' ''Ella Rodriguez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Healthcare Mobile Apps''', ' ''James Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Telecare Services''', ' ''Sophia Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Nanotechnology-based Cancer Therapies''', ' ''David Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Robotic Nurse Assistants''', ' ''Ethan Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Memory Chips''', ' ''Isabella Diaz''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Healthcare IoT Devices''', ' ''Caleb Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Telemedicine Carts''', ' ''Ella Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Robotic Pharmacy Automation Systems''', ' ''David Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Hearing Devices''', ' ''Oliver Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Telehealth Software''', ' ''Ella Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Wearable Fitness Trackers''', ' ''Megan Wilson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Implantable Glucose Monitors''', ' ''Lucas Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Telemedicine Software''', ' ''Noah Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Implantable Cardioverter Defibrillators''', ' ''Luna Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telehealth Systems''', ' ''Oliver Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Pacemakers''', ' ''Ella Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Healthcare Wearables''', ' ''James Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Telestroke Systems''', ' ''Megan Wilson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Smart Medical Devices''', ' ''Sophie Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Implantable Neural Stimulators''', ' ''Lucas Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telepsychiatry Platforms''', ' ''Eva Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Orthopedic Devices''', ' ''Noah Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Healthcare Robotics''', ' ''James Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Teleoncology Systems''', ' ''Ethan Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Smart Pills''', ' ''Sophia Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Implantable Neurostimulators''', ' ''David Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telecardiology Systems''', ' ''Oliver Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Medical Devices''', ' ''Ella Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Healthcare Artificial Intelligence''', ' ''James Campbell''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Teleaudiology Platforms''', ' ''Megan Wilson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Implantable Biosensors''', ' ''Lucas Flores''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Teleobstetrics Systems''', ' ''Eva Adams''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Bionic Devices''', ' ''Noah Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 1''', ' ''Healthcare Nanotechnology''', ' ''Luna Martinez''');
commit;
prompt 200 records committed...
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Teleophthalmology Platforms''', ' ''Ethan Hill''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 3''', ' ''Smart Stethoscopes''', ' ''Sophia Garcia''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Implantable Wearable Devices''', ' ''David Turner''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''A supply warehouse''', ' ''Telepharmacy Systems''', ' ''Oliver Martinez''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Training Room''', ' ''Implantable Sensors''', ' ''Ella Thompson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 2''', ' ''Telepsychology Platforms''', ' ''Megan Wilson''');
insert into TCATEGORY (category_location, category_name, supervisor)
values ('''Storage Room 4''', ' ''Implantable Medical Monitors''', ' ''Lucas Flores'';');
commit;
prompt 207 records loaded
prompt Loading TOOL...
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Elastic Bandage''', ' ''USA''', ' ''Beige''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Gauze Roll''', ' ''China''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Adhesive Tape''', ' ''Germany''', ' ''Clear''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Butterfly Closures''', ' ''Japan''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.1, ' ''Triangular Bandage''', ' ''India''', ' ''Beige''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Sterile Gauze Pads''', ' ''USA''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Hydrocolloid Dressing''', ' ''France''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Antiseptic Wipes''', ' ''Italy''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Silver Nitrate Sticks''', ' ''Spain''', ' ''Gray''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Hydrogel Dressing''', ' ''Canada''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Alcohol Swabs''', ' ''Mexico''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Burn Relief Gel''', ' ''USA''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sterile Cotton Balls''', ' ''China''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Diagnostic Penlight''', ' ''Germany''', ' ''Silver''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Stethoscope''', ' ''Japan''', ' ''Black''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Blood Pressure Cuff''', ' ''India''', ' ''Blue''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Thermometer''', ' ''USA''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Pulse Oximeter''', ' ''Mexico''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''CPR Mask''', ' ''Italy''', ' ''Clear''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Bag Valve Mask''', ' ''Spain''', ' ''Green''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Defibrillator Pads''', ' ''Canada''', ' ''White''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Rescue Breathing Barrier''', ' ''Mexico''', ' ''Clear''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''N95 Respirator''', ' ''USA''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Surgical Gown''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Face Shield''', ' ''Germany''', ' ''Clear''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Disposable Gloves''', ' ''Japan''', ' ''Purple''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Safety Goggles''', ' ''India''', ' ''Black''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Sterile Scalpels''', ' ''USA''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Surgical Scissors''', ' ''France''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Hemostats''', ' ''Italy''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Retractors''', ' ''Spain''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Suture Kit''', ' ''Canada''', ' ''Black''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''ECG Machine''', ' ''Mexico''', ' ''White''', ' ''Patient Monitoring Devices''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Fetal Doppler''', ' ''USA''', ' ''Pink''', ' ''Patient Monitoring Devices''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Heart Rate Monitor''', ' ''China''', ' ''Black''', ' ''Patient Monitoring Devices''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Blood Glucose Meter''', ' ''Germany''', ' ''Blue''', ' ''Patient Monitoring Devices''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''IV Drip Set''', ' ''Japan''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Infusion Pump''', ' ''India''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Syringe Pump''', ' ''USA''', ' ''Blue''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Fluid Warmer''', ' ''France''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Ambulance Stretcher''', ' ''Italy''', ' ''Yellow''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Spine Board''', ' ''Spain''', ' ''Red''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Wheelchair''', ' ''Canada''', ' ''Black''', ' ''Rehabilitation and Mobility Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Crutches''', ' ''Mexico''', ' ''Gray''', ' ''Rehabilitation and Mobility Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Walkers''', ' ''USA''', ' ''Silver''', ' ''Rehabilitation and Mobility Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Shower Chair''', ' ''China''', ' ''White''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Bedpan''', ' ''Germany''', ' ''Blue''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Urinal''', ' ''Japan''', ' ''White''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Toilet Safety Frame''', ' ''India''', ' ''Gray''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Sterilization Pouch''', ' ''USA''', ' ''Clear''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Sharps Container''', ' ''France''', ' ''Red''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Waste Bag''', ' ''Italy''', ' ''Yellow''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Home Health Monitor''', ' ''Spain''', ' ''Black''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Electric Bed''', ' ''Canada''', ' ''White''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Medical Alert System''', ' ''Mexico''', ' ''Gray''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Pulse Lavage''', ' ''USA''', ' ''Blue''', ' ''Occupational Health Tools''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Nebulizer''', ' ''China''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Oxygen Concentrator''', ' ''Germany''', ' ''Gray''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''CPAP Machine''', ' ''Japan''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Inhaler Spacer''', ' ''India''', ' ''Blue''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Forehead Thermometer''', ' ''USA''', ' ''Silver''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Exam Gloves''', ' ''France''', ' ''Purple''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Surgical Mask''', ' ''Italy''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Disinfectant Spray''', ' ''Spain''', ' ''Clear''', ' ''Infection Control Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Hand Sanitizer''', ' ''Canada''', ' ''Clear''', ' ''Infection Control Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Antimicrobial Wipes''', ' ''Mexico''', ' ''White''', ' ''Infection Control Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Sterile Field''', ' ''USA''', ' ''Blue''', ' ''Infection Control Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Barrier Cream''', ' ''China''', ' ''White''', ' ''Skin Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Medical Tape''', ' ''Germany''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Trauma Shears''', ' ''Japan''', ' ''Black''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Tweezers''', ' ''India''', ' ''Silver''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Saline Solution''', ' ''USA''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Wound Irrigation Kit''', ' ''France''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''First Aid Ointment''', ' ''Italy''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Stapler''', ' ''Spain''', ' ''Silver''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sterile Water''', ' ''Canada''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Wound Closure Strips''', ' ''Mexico''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Glucometer''', ' ''USA''', ' ''Black''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Reflex Hammer''', ' ''China''', ' ''Silver''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Snellen Eye Chart''', ' ''Germany''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Otoscope''', ' ''Japan''', ' ''Black''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Ophthalmoscope''', ' ''India''', ' ''Silver''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Ultrasound Gel''', ' ''USA''', ' ''Clear''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Rescue Blanket''', ' ''France''', ' ''Gold''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''AED Defibrillator''', ' ''Italy''', ' ''Red''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Laryngoscope''', ' ''Spain''', ' ''Silver''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Nasal Cannula''', ' ''Canada''', ' ''Clear''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Non-Rebreather Mask''', ' ''Mexico''', ' ''Clear''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Pocket Mask''', ' ''USA''', ' ''Clear''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Compression Garments''', ' ''China''', ' ''Beige''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Ankle Brace''', ' ''Germany''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Knee Support''', ' ''Japan''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Back Brace''', ' ''India''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Wrist Splint''', ' ''USA''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Elbow Support''', ' ''France''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Thumb Spica Splint''', ' ''Italy''', ' ''Beige''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Cervical Collar''', ' ''Spain''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Hip Abduction Pillow''', ' ''Canada''', ' ''Blue''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Finger Splint''', ' ''USA''', ' ''Blue''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Asthma Inhaler''', ' ''USA''', ' ''Blue''', ' ''Respiratory Equipment''');
commit;
prompt 100 records committed...
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Spacer Device''', ' ''China''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Peak Flow Meter''', ' ''Germany''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Spirometer''', ' ''Japan''', ' ''Gray''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Nebulizer Mask''', ' ''India''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Nasal Aspirator''', ' ''USA''', ' ''Blue''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Vaporizer''', ' ''France''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Portable Suction Machine''', ' ''Italy''', ' ''Blue''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Scalpel''', ' ''Spain''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Bone Saw''', ' ''Canada''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Forceps''', ' ''Mexico''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Clamp''', ' ''USA''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Needle Holder''', ' ''China''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Operating Scissors''', ' ''Germany''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Catheter''', ' ''Japan''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''IV Cannula''', ' ''India''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Dialysis Tubing''', ' ''USA''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Central Line Kit''', ' ''France''', ' ''Blue''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Portable Ventilator''', ' ''Italy''', ' ''White''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Surgical Drape''', ' ''USA''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sterile Field Kit''', ' ''Canada''', ' ''White''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Patient Transfer Sheet''', ' ''Mexico''', ' ''White''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Body Bag''', ' ''USA''', ' ''Black''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Surgical Bouffant Cap''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''IV Start Kit''', ' ''Germany''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Wound Drainage System''', ' ''Japan''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Medical Refrigerator''', ' ''India''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''IV Catheter''', ' ''USA''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Phlebotomy Chair''', ' ''France''', ' ''Gray''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Hospital Bed''', ' ''Italy''', ' ''White''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Patient Lift''', ' ''Spain''', ' ''Blue''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Bedside Commode''', ' ''Canada''', ' ''White''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Recliner''', ' ''Mexico''', ' ''Gray''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Shower Transfer Bench''', ' ''USA''', ' ''White''', ' ''Home Healthcare Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Oxygen Tank''', ' ''China''', ' ''Green''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Medical Tape Dispenser''', ' ''Germany''', ' ''Blue''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Elastic Wrap''', ' ''Japan''', ' ''Beige''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Non-Adherent Pads''', ' ''India''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Paper Tape''', ' ''USA''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Absorbent Pad''', ' ''France''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Burn Dressing''', ' ''Italy''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Silicone Gel Sheets''', ' ''Spain''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Cohesive Bandage''', ' ''Canada''', ' ''Blue''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Compression Bandage''', ' ''Mexico''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Wound Measuring Guide''', ' ''USA''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''IV Administration Set''', ' ''China''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Scalp Vein Set''', ' ''Germany''', ' ''Blue''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Blood Administration Set''', ' ''Japan''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Syringe''', ' ''India''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Medical Vacuum Pump''', ' ''USA''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Wound Drain''', ' ''France''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Surgical Blade''', ' ''Italy''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Staple Remover''', ' ''Spain''', ' ''Silver''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Skin Stapler''', ' ''Canada''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sterile Towel''', ' ''Mexico''', ' ''Blue''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Cap''', ' ''India''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Protective Eyewear''', ' ''Japan''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Fluid Shield Mask''', ' ''USA''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Isolation Gown''', ' ''Mexico''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Scrub Brush''', ' ''Italy''', ' ''White''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Disinfectant Wipes''', ' ''Canada''', ' ''White''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sharp Container''', ' ''USA''', ' ''Red''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Biohazard Bag''', ' ''China''', ' ''Red''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Lab Coat''', ' ''China''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Safety Glasses''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sterile Gloves''', ' ''Canada''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Head Cap''', ' ''USA''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Antimicrobial Soap''', ' ''France''', ' ''Clear''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Nail Brush''', ' ''Italy''', ' ''White''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Urinary Catheter''', ' ''Spain''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Condom Catheter''', ' ''Canada''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Urine Drainage Bag''', ' ''Mexico''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Diaper''', ' ''USA''', ' ''White''', ' ''Continence Management Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Underpad''', ' ''China''', ' ''White''', ' ''Continence Management Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Incontinence Brief''', ' ''Germany''', ' ''White''', ' ''Continence Management Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Absorbent Underwear''', ' ''Japan''', ' ''White''', ' ''Continence Management Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Bed Protector''', ' ''India''', ' ''White''', ' ''Continence Management Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Specimen Cup''', ' ''USA''', ' ''Clear''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Pregnancy Test''', ' ''France''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Ovulation Test''', ' ''Italy''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Blood Test Kit''', ' ''Spain''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Urine Test Strips''', ' ''Canada''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Stool Collection Kit''', ' ''Mexico''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Gloves''', ' ''Mexico''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Hair Cap''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Antiseptic Solution''', ' ''Germany''', ' ''Clear''', ' ''Infection Control Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Hand Hygiene Wipes''', ' ''Japan''', ' ''White''', ' ''Infection Control Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Sterile Drapes''', ' ''India''', ' ''Blue''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Surgical Adhesive Tape''', ' ''USA''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Wound Sealant''', ' ''France''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Burn Gel''', ' ''Italy''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Antimicrobial Dressing''', ' ''Spain''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Sterile Bandage Roll''', ' ''Canada''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Cotton Swabs''', ' ''Mexico''', ' ''White''', ' ''Bandaging Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Alcohol Pads''', ' ''USA''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Hydrogel Burn Dressing''', ' ''China''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Chest Seal''', ' ''Germany''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Surgical Needle''', ' ''India''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Wound Retractor''', ' ''USA''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Surgical Knife''', ' ''France''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Diagnostic Tuning Fork''', ' ''Italy''', ' ''Silver''', ' ''Diagnostic Instruments''');
commit;
prompt 200 records committed...
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Elevator''', ' ''Spain''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Surgical Curette''', ' ''Canada''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Tongue Depressor''', ' ''Mexico''', ' ''Wood''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Syringe Needle''', ' ''USA''', ' ''Silver''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''IV Tubing''', ' ''China''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''IV Pole''', ' ''Germany''', ' ''Silver''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Stapler Remover''', ' ''Japan''', ' ''Silver''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Surgical Suction Tip''', ' ''India''', ' ''Clear''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Suction Canister''', ' ''USA''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Aspirator''', ' ''France''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Vacuum Regulator''', ' ''Italy''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Medical Air Compressor''', ' ''Spain''', ' ''Blue''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Anesthesia Mask''', ' ''Canada''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Anesthesia Circuit''', ' ''Mexico''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Oxygen Regulator''', ' ''USA''', ' ''Green''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Oxygen Mask''', ' ''China''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Nebulizer Tubing''', ' ''Germany''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Portable Oxygen Concentrator''', ' ''Japan''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Air Hose''', ' ''India''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Ventilator Circuit''', ' ''USA''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Pulse Oximeter Sensor''', ' ''France''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Oxygen Tank''', ' ''Italy''', ' ''Green''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Blood Gas Analyzer''', ' ''Spain''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''CPR Training Manikin''', ' ''Canada''', ' ''Skin''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''AED Training Device''', ' ''Mexico''', ' ''Red''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Trauma Dressing''', ' ''USA''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Pressure Bandage''', ' ''China''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Hemostatic Dressing''', ' ''Germany''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Tourniquet''', ' ''Japan''', ' ''Blue''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''First Aid Manual''', ' ''India''', ' ''White''', ' ''Health Education Materials''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''CPR Instruction Card''', ' ''USA''', ' ''Blue''', ' ''Health Education Materials''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''First Aid Chart''', ' ''France''', ' ''White''', ' ''Health Education Materials''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Emergency Guidebook''', ' ''Italy''', ' ''Red''', ' ''Health Education Materials''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Health Education Poster''', ' ''Spain''', ' ''White''', ' ''Health Education Materials''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sterilization Wrap''', ' ''Canada''', ' ''Blue''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Sterile Tray''', ' ''Mexico''', ' ''Clear''', ' ''Hygiene and Sanitation Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Waste Container''', ' ''USA''', ' ''Red''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Waste Bin''', ' ''China''', ' ''Yellow''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Disposal Syringe''', ' ''Germany''', ' ''Clear''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Contaminated Waste Bag''', ' ''Japan''', ' ''Red''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Biohazard Sharps Container''', ' ''India''', ' ''Red''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Medical Waste Cart''', ' ''USA''', ' ''Blue''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Specimen Transport Bag''', ' ''France''', ' ''Clear''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Lab Waste Container''', ' ''Italy''', ' ''Red''', ' ''Medical Waste Disposal Supplies''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''IV Armboard''', ' ''Spain''', ' ''Blue''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''IV Site Protector''', ' ''Canada''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Infusion Set''', ' ''Mexico''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Catheter Securement Device''', ' ''USA''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Feeding Tube''', ' ''China''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Central Venous Catheter''', ' ''Germany''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Enteral Feeding Pump''', ' ''Japan''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Enteral Feeding Bag''', ' ''India''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Gastrostomy Tube''', ' ''USA''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Parenteral Nutrition Bag''', ' ''France''', ' ''Clear''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Parenteral Feeding Pump''', ' ''Italy''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Cooler''', ' ''Spain''', ' ''White''', ' ''Fluid Administration Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Emergency Blanket''', ' ''Canada''', ' ''Silver''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Evacuation Chair''', ' ''Mexico''', ' ''Red''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Portable AED''', ' ''USA''', ' ''Red''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Trauma Bag''', ' ''China''', ' ''Red''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''First Aid Backpack''', ' ''Germany''', ' ''Red''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Tactical Medic Pack''', ' ''Japan''', ' ''Black''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Emergency Response Vest''', ' ''India''', ' ''Yellow''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Hazmat Suit''', ' ''USA''', ' ''Yellow''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Respirator''', ' ''France''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Protective Apron''', ' ''Italy''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Booties''', ' ''Spain''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Hazardous Material Gloves''', ' ''Canada''', ' ''Green''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Radiation Protection Apron''', ' ''Mexico''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Lead Gloves''', ' ''USA''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Safety Helmet''', ' ''China''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Surgical Face Mask''', ' ''Germany''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Isolation Mask''', ' ''Japan''', ' ''Yellow''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Protective Shoe Covers''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Sterile Adhesive Strips''', ' ''USA''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Burn Treatment Spray''', ' ''Spain''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Wound Cleansing Solution''', ' ''Canada''', ' ''Clear''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Sponges''', ' ''Mexico''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Wound Dressing Pack''', ' ''USA''', ' ''White''', ' ''Wound Care Products''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Nasal Decongestant Spray''', ' ''China''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Suction Device''', ' ''Germany''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Emergency Ventilator''', ' ''Japan''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Tracheostomy Tube''', ' ''India''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''Portable Suction Unit''', ' ''USA''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Laryngoscope Blade''', ' ''Italy''', ' ''Silver''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Laryngoscope Handle''', ' ''Spain''', ' ''Silver''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Intubation Stylet''', ' ''Canada''', ' ''Silver''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Endotracheal Tube''', ' ''Mexico''', ' ''Clear''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''BiPAP Machine''', ' ''China''', ' ''White''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''ECG Electrodes''', ' ''France''', ' ''Clear''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Defibrillator''', ' ''Spain''', ' ''Red''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''AED''', ' ''Canada''', ' ''Red''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Medical Gas Cylinder''', ' ''Mexico''', ' ''Green''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Gas Regulator''', ' ''Japan''', ' ''Silver''', ' ''Respiratory Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Surgical Light''', ' ''USA''', ' ''White''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Operating Table''', ' ''USA''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Surgical Cautery''', ' ''Italy''', ' ''White''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Electrosurgical Unit''', ' ''Spain''', ' ''White''', ' ''Surgical Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Endoscope''', ' ''Canada''', ' ''Black''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Ultrasound Machine''', ' ''Mexico''', ' ''White''', ' ''Diagnostic Instruments''');
commit;
prompt 300 records committed...
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''X-ray Machine''', ' ''USA''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''MRI Machine''', ' ''China''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Medical Shoe Cover''', ' ''Japan''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Head Cover''', ' ''India''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Face Mask''', ' ''France''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Goggles''', ' ''Spain''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Ear Protection''', ' ''Mexico''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Medical Apron''', ' ''Mexico''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Disposable Coverall''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Protective Suit''', ' ''Germany''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Biohazard Suit''', ' ''Japan''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Isolation Suit''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Medical Hazmat Suit''', ' ''France''', ' ''Clear''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Protective Gown''', ' ''Canada''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Medical Uniform''', ' ''USA''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Scrubs''', ' ''Germany''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Protective Cap''', ' ''Japan''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Hair Net''', ' ''France''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Nitrile Gloves''', ' ''Canada''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Medical Gloves''', ' ''USA''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Latex Gloves''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Vinyl Gloves''', ' ''Germany''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Chemical Resistant Gloves''', ' ''Japan''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Utility Gloves''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Heat Resistant Gloves''', ' ''France''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Cut Resistant Gloves''', ' ''Spain''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Lead Apron''', ' ''USA''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Face Mask''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''N95 Mask''', ' ''Japan''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Respirator Mask''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Full Face Respirator''', ' ''France''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Half Face Respirator''', ' ''Spain''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Disposable Respirator''', ' ''Canada''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Reusable Respirator''', ' ''Mexico''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Personal Safety Kit''', ' ''USA''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Eye Protection''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Hearing Protection''', ' ''Germany''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Medical Face Shield''', ' ''Spain''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Full Face Shield''', ' ''Canada''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Head Protection''', ' ''Mexico''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Face Protection''', ' ''USA''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Body Protection''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.2, ' ''CT Scanner''', ' ''Germany''', ' ''White''', ' ''Diagnostic Instruments''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Splint''', ' ''Mexico''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Hand Splint''', ' ''China''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Arm Sling''', ' ''Germany''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Leg Splint''', ' ''Japan''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Body Splint''', ' ''India''', ' ''Blue''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Back Splint''', ' ''France''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Cast''', ' ''Spain''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Waterproof Cast''', ' ''Canada''', ' ''Clear''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Cast Padding''', ' ''Mexico''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Splint Padding''', ' ''USA''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Cast Removal Tool''', ' ''China''', ' ''Silver''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Orthopedic Boot''', ' ''Germany''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Post-Op Shoe''', ' ''Japan''', ' ''Blue''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Walker Boot''', ' ''India''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Ankle Stabilizer''', ' ''France''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Knee Immobilizer''', ' ''Spain''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Hip Support''', ' ''Canada''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Medical Belt''', ' ''Mexico''', ' ''Blue''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Shoulder Immobilizer''', ' ''USA''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Clavicle Brace''', ' ''China''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Forearm Splint''', ' ''Germany''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Wrist Support''', ' ''Japan''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Thumb Splint''', ' ''India''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Hand Support''', ' ''France''', ' ''Blue''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Finger Sleeve''', ' ''Spain''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Toe Splint''', ' ''Canada''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Toe Separator''', ' ''Mexico''', ' ''Blue''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Foot Splint''', ' ''USA''', ' ''Gray''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Heel Protector''', ' ''China''', ' ''White''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Foot Elevator''', ' ''Germany''', ' ''Black''', ' ''Orthopedic Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Evacuation Sled''', ' ''USA''', ' ''Blue''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Transport Ventilator''', ' ''China''', ' ''White''', ' ''Emergency Resuscitation Equipment''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Transport Stretcher''', ' ''Germany''', ' ''Silver''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Patient Immobilizer''', ' ''Japan''', ' ''Gray''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Head Immobilizer''', ' ''India''', ' ''Yellow''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Transfer Board''', ' ''France''', ' ''Red''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Emergency Medical Bag''', ' ''Spain''', ' ''Blue''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.3, ' ''Medical Organizer''', ' ''Canada''', ' ''Black''', ' ''Emergency Transportation Aids''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Foot Protection''', ' ''Japan''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Disposable Booties''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Waterproof Shoe Covers''', ' ''France''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Non-Skid Shoe Covers''', ' ''Spain''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Sterile Gown''', ' ''Canada''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Sterile Drape''', ' ''Mexico''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Medical Curtain''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Protective Curtain''', ' ''Germany''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Examination Curtain''', ' ''Japan''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Privacy Screen''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Medical Partition''', ' ''France''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Surgical Screen''', ' ''Spain''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Room Divider''', ' ''Canada''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Surgical Table''', ' ''Mexico''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Examination Table''', ' ''China''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Bone Caliper''', ' ''Japan''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.4, ' ''Pelvimeter''', ' ''India''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.5, ' ''Craniometer''', ' ''France''', ' ''White''', ' ''Personal Protective Equipment (PPE)''');
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.6, ' ''Spine Caliper''', ' ''Spain''', ' ''Gray''', ' ''Personal Protective Equipment (PPE)''');
commit;
prompt 400 records committed...
insert into TOOL (weight, tool_name, made_in, color, category_name)
values (.7, ' ''Oximeter''', ' ''Canada''', ' ''Blue''', ' ''Personal Protective Equipment (PPE)''');
commit;
prompt 401 records loaded
prompt Enabling foreign key constraints for COURSE...
alter table COURSE enable constraint SYS_C007066;
prompt Enabling foreign key constraints for COURSE_TOOL...
alter table COURSE_TOOL enable constraint SYS_C007088;
prompt Enabling foreign key constraints for REGISTRATION...
alter table REGISTRATION enable constraint SYS_C007212;
alter table REGISTRATION enable constraint SYS_C007213;
prompt Enabling foreign key constraints for TOOL...
alter table TOOL enable constraint SYS_C007191;
prompt Enabling triggers for INSTRUCTOR...
alter table INSTRUCTOR enable all triggers;
prompt Enabling triggers for COURSE...
alter table COURSE enable all triggers;
prompt Enabling triggers for COURSE_TOOL...
alter table COURSE_TOOL enable all triggers;
prompt Enabling triggers for PARTICIPANT...
alter table PARTICIPANT enable all triggers;
prompt Enabling triggers for REGISTRATION...
alter table REGISTRATION enable all triggers;
prompt Enabling triggers for TCATEGORY...
alter table TCATEGORY enable all triggers;
prompt Enabling triggers for TOOL...
alter table TOOL enable all triggers;
set feedback on
set define on
prompt Done.
