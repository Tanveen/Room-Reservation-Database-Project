CREATE DATABASE  IF NOT EXISTS `RoomReserve` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `RoomReserve`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 35.196.198.132    Database: RoomReserve
-- ------------------------------------------------------
-- Server version	5.5.56

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `DepartmentAddOrEdit`(
_DepartmentID varchar(20),
_Name Varchar(20),
_Location varchar(20),
_HasLab tinyint(1)
)
BEGIN
	IF _DepartmentID = 'D%' THEN
		INSERT INTO Department (depId,name,location,hasLab)
        VALUES (_BookName,_Author,_Description);
	else
		UPDATE Department
        SET
			name = _Name,
            location = _Location,
            depId = _DepartmentID,
            hasLab = _HasLab
		WHERE depId = _DepartmentID;
	END IF;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `DepartmentDeleteByID`(
_DepartmentID varchar(20)
)
BEGIN
	DELETE FROM Department
    WHERE depId = _DepartmentID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `DepartmentSearchByValue`(
_SearchValue VARCHAR(20)
)
BEGIN
	SELECT *
    FROM Department
    WHERE name LIKE CONCAT('%',_SearchValue,'%') || location LIKE CONCAT('%',_SearchValue,'%'); 
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `DepartmentViewAll`()
BEGIN
	SELECT *
    FROM Department;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `DepartmentViewByID`(
_DepartmentID varchar(20)
)
BEGIN
	SELECT *
    FROM Department
    WHERE depId = _DepartmentID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `ReservationAddOrEdit`(
_ResID varchar(20),
_InDate DATE,
_OutDate DATE
)
BEGIN
	IF _ResID = 'R%' THEN
		INSERT INTO Reservation (resID,InDate,OutDate)
        VALUES (_ResID,_InDate,_OutDate);
	else
		UPDATE Reservation
        SET
			resID = _ResID,
            InDate = _InDate,
            OutDate = _OutDate
		WHERE resID = _ResID;
	END IF;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `ReservationDeleteByID`(
_ResID varchar(20)
)
BEGIN
	DELETE FROM Reservation
    WHERE resID = _ResID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `ReservationSearchByValue`(
_SearchValue VARCHAR(20)
)
BEGIN
	SELECT *
    FROM Reservation
    WHERE resID LIKE CONCAT('%',_SearchValue,'%'); 
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `ReservationViewAll`()
BEGIN
	SELECT *
    FROM Reservation;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `ReservationViewByID`(
_ResID varchar(20)
)
BEGIN
	SELECT *
    FROM Reservation
    WHERE resID = _ResID;
END ;;


CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `RoomSearch`(
_SearchValue VARCHAR(20)
)
BEGIN
	SELECT *
    FROM Rooms
    WHERE RoomID LIKE CONCAT('%',_SearchValue,'%'); 
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `RoomViewAll`()
BEGIN
	SELECT *
    FROM Rooms;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `RoomDeleteByID`(
_RoomID varchar(20)
)
BEGIN
	DELETE FROM Rooms
    WHERE RoomID = _RoomID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `EquipmentViewByID`(
_EquipmentID varchar(20)
)
BEGIN
	SELECT *
    FROM Equipment
    WHERE ID = _EquipmentID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `EquipmentDeleteByID`(
_EquipmentID varchar(20)
)
BEGIN
	DELETE FROM Equipment
    WHERE ID = _EquipmentID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `EquipmentSearch`(
_SearchValue VARCHAR(20)
)
BEGIN
	SELECT *
    FROM Equipment
    WHERE ID LIKE CONCAT('%',_SearchValue,'%'); 
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `EquipmentViewAll`()
BEGIN
	SELECT *
    FROM Equipment;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `RatingViewByID`(
_RatingID varchar(20)
)
BEGIN
	SELECT *
    FROM Ratings
    WHERE RatingID = _RatingID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `RatingDeleteByID`(
_RatingID varchar(20)
)
BEGIN
	DELETE FROM Ratings
    WHERE RatingID = _RatingID;
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `RatingSearch`(
_SearchValue VARCHAR(20)
)
BEGIN
	SELECT *
    FROM Ratings
    WHERE RatingID LIKE CONCAT('%',_SearchValue,'%'); 
END ;;

CREATE DEFINER=`root`@`35.196.198.132` PROCEDURE `RatingViewAll`()
BEGIN
	SELECT *
    FROM Ratings;
END ;;