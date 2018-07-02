use RoomReserve;

insert ignore into Building values('B1021', 'Cartenson', '1');
insert ignore into Building values('B1031', 'Engineering', '1');
insert ignore into Building values('B1041', 'Mandeville', '1');
insert ignore into Building values('B1051', 'ABC', '0');
insert ignore into Building values('B1061', 'North Hall', '0');
insert ignore into Building values('B1071', 'Carlson Hall', '1');
insert ignore into Building values('B1081', 'Bodine Hall', '0');
insert ignore into Building values('B1091', 'Library', '1');
commit;

insert ignore into Department values('D1','Bookstore','NorthCampus',0);
insert ignore into Department values('D2','Cafe','SouthCampus',1);
insert ignore into Department values('D3','Biomedical','MainCampus',1);
insert ignore into Department values('D4','Business','BehindCampus',0);
insert ignore into Department values('D5','Activity','EastCampus',0);
insert ignore into Department values('D6','Communication','NorthCampus',1);
insert ignore into Department values('D7','Admissions','MainCampus',1);
commit;

insert ignore into Users values('Ellen','hatie','lewa','211233126','North Side','M');
insert ignore into Users values('Ana','senior','jona','211233444','Linden Ave','M');
insert ignore into Users values('Eva','nuv','kotawa','211236274','65 waldmare','M');
insert ignore into Users values('Marshal','aro','lindsay','212036274','Brooklyn','F');
insert ignore into Users values('Norahnson','mari','hateuwa','231098674','South end','F');
insert ignore into Users values('Taran','lona','singh','232233123','Water street','F');

insert ignore into Admin values('A102','Maya','k','kellog','F','Waldemare st','211232344');
insert ignore into Admin values('A103','George','hows','felma','F','North street','211233123');
insert ignore into Admin values('A104','Angie','hoze','smith','F','9 University Ave','211233444');
insert ignore into Admin values('A105','Neva','loe','Jith','F','7 lafayette','211236274');
insert ignore into Admin values('A106','Paul','nea','Otoma','F','John str','212036274');
insert ignore into Admin values('A106','Guniya','junior','Huya','F','broad street','231098674');
insert ignore into Admin values('A107','Shelja','senior','Johnson','F','95 Ave','232233123');
commit;

insert ignore into Dates values(20,'January',2014);
insert ignore into Dates values(12,'February',2015);
insert ignore into Dates values(21,'March',2017);
insert ignore into Dates values(2,'May',2017);
insert ignore into Dates values(5,'April',2016);
insert ignore  into Dates values(9,'July',2016);
insert ignore into Dates values(23,'July',2017);
insert ignore into Dates values(11,'November',2017);
insert ignore into Dates values(8,'October',2017);
insert ignore into Dates values(5,'December',2017);
commit;


insert ignore into Rooms values('R2',101,'single',1,'D102');
insert ignore into Rooms values('R3',102,'double',1,'D102');
insert ignore into Rooms values('R4',103,'single',1,'D103');
insert ignore into Rooms values('R5',104,'double',1,'D104');
insert ignore into Rooms values('R6',105,'single',1,'D105');
insert ignore into Rooms values('R7',106,'double',1,'D101');
insert ignore into Rooms values('R8',107,'single',1,'D106');
insert ignore into Rooms values('R9',108,'double',1,'D107');
insert ignore into Rooms values('R10',109,'single',1,'D108');
commit;

insert ignore into Laboratory values('L103','Lab111','D102');
insert ignore into Laboratory values('L104','Lab112','D103');
insert ignore into Laboratory values('L105','Lab113','D104');
insert ignore into Laboratory values('L106','Lab114','D105');
insert ignore into Laboratory values('L107','Lab115','D106');
insert ignore into Laboratory values('L108','Lab116','D107');
insert ignore into Laboratory values('L109','Lab117','D108');
insert ignore into Laboratory values('L110','Lab118','D109');
commit;


insert ignore into Ratings values('Rating2','Good and Airy','R2');
insert ignore into Ratings values('Rating3','Excellent','R1');
insert ignore into Ratings values('Rating4','No internet','R7');
insert ignore into Ratings values('Rating5','Good but no internet','R8');
insert ignore into Ratings values('Rating6','Good','R9');
insert ignore into Ratings values('Rating7','Comfortable','R2');
insert ignore into Ratings values('Rating8','Excellent and internet','R2');
insert ignore into Ratings values('Rating9','Easy accesible','R3');
insert ignore into Ratings values('Rating10','Good environment','R4');
insert ignore into Ratings values('Rating11','Good and comfortable','R1');
commit;

insert ignore into Reservation values('2017-03-12','2017-04-11','Reserve102');
insert ignore into Reservation values('2017-04-13','2017-05-13','Reserve103');
insert ignore into Reservation values('2017-05-14','2017-06-14','Reserve104');
insert ignore into Reservation values('2017-06-15','2017-07-15','Reserve105');
insert ignore into Reservation values('2017-07-16','2017-08-15','Reserve106');
insert ignore into Reservation values('2017-08-16','2017-09-15','Reserve107');
insert ignore into Reservation values('2017-09-16','2017-10-13','Reserve108');
insert ignore into Reservation values('2017-10-16','2017-11-23','Reserve109');
insert ignore into Reservation values('2017-11-16','2017-12-22','Reserve110');
commit;

 insert ignore into Staff values('ST12','Tanveen','Kaur','F','Broad Street','211232344','Reserve102');
 insert ignore into Staff values('ST13','Jaag','Josh','M','John St','211233123','Reserve103');
 insert ignore into Staff values('ST14','Anam','Menns','M','Linden AVe','211233444','Reserve104');
 insert ignore into Staff values('ST15','Harpreet','Kaur','F','Waldemere','211236274','Reserve105');
 insert ignore into Staff values('ST16','Joy','Ruya','M','Broad Ave','212036274','Reserve106');
 insert ignore into Staff values('ST17','Paul','Seyfert','M','Atlantic ave','212098674','Reserve107');
 insert ignore into Staff values('ST18','John','alex','M','Lafayette st','211232314','Reserve107');
 insert ignore into Staff values('ST19','Jinny','Taskin','M','Loan ave','231098674','Reserve108');
commit;

insert ignore into Student values('S1011234','Guniya','K','Kaur','F','Broad ave','211233123','Reserve102');
insert ignore into Student values('S1014609','Anita','K','George','F','9 North ave','211233444','Reserve102');
insert ignore into Student values('S1014532','Pauline','K','Seyfert','F','Linden Ave','212036274','Reserve103');
insert ignore into Student values('S1012123','Michael','K','Lolley','F','South Hall','212098674','Reserve105');
insert ignore into Student values('S1014009','Duane','K','Kellog','F','BlackRock','231098674','Reserve106');
insert ignore into Student values('S1015643','Ellen','K','Ave','F','95 University','232233123','Reserve107');
commit;

insert ignore into Equipment values('E2','Simple','R2');
insert ignore into Equipment values('E3','Electronic','R3');
insert ignore into Equipment values('E4','Accessory','R3');
insert ignore into Equipment values('E5','Electronic','R4');
insert ignore into Equipment values('E6','Stationary','R5');
insert ignore into Equipment values('E7','Simple','R6');
insert ignore into Equipment values('E8','Extras','R9');
insert ignore into Equipment values('E9','Projector','R7');
insert ignore into Equipment values('E10','Electronic','R8');
commit;




