/* Retrieve all student names.
*/
select Fname, Lname from Student;

/* Retrieve names, SSN and Sex of all Users.
*/
select Fname, SSN, Sex from Users;

/* Retrieve roomID and Type from Rooms.
*/
select RoomID, type from Rooms;

/*
Retrieve ID and name of the Building.
*/
select ID, name from Building;

/*
Retrieve Ratings and description by Room ID (JOIN tables Ratings and Rooms).
*/
Select rt.RatingID, rt.description, rt.RoomID, ro.Type from Ratings rt, Rooms ro where rt.RoomID = ro.RoomID;

/*
Retrieve Room number and Department Name by Department ID (JOIN tables Rooms and Department).
*/
select ro.Number, ro.Type, dp.name from Rooms ro, Department dp where ro.DepID = dp.DepID;

/*Retrieve the Room number, Room ID and  Room Type which was never rated (NESTED QUERY)
*/
select ro.RoomID, ro.Number, ro.Type from Rooms ro where ro.RoomID NOT IN  ( select DISTINCT rt.RoomID  from Ratings rt);

/*
Sorting table Rooms by ascending ORDER OF RoomID (ORDER BY) 
*/
select ro.Number, ro.DepID from Rooms ro ORDER BY ro.DepID;

/* Sorting table Rooms by descending ORDER OF RoomID (ORDER BY)  
*/
select ro.Number, ro.DepID from Rooms ro ORDER BY ro.DepID desc;

/* Retrieve the count of male and female student. 
*/
select Sex, count(*) from Student GROUP BY Sex;

/*Retrieve the room number and room ID having more than one ratings.
*/

select RoomID from Ratings GROUP BY RoomID HAVING count(RoomID)>1;