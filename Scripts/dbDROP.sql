SET FOREIGN_KEY_CHECKS = 0;
drop table if exists Admin;
drop table if exists Building;
drop table if exists dates;
drop table if exists Department;
drop table if exists Equipment;
drop table if exists Laboratory;
drop table if exists Ratings;
drop table if exists Reservation;
drop table if exists Rooms;
drop table if exists Staff;
drop table if exists Student;
drop table if exists University;
drop table if exists Users;
SET FOREIGN_KEY_CHECKS = 1;

CREATE SCHEMA IF NOT EXISTS `RoomReserve` DEFAULT CHARACTER SET latin1 ;
USE `RoomReserve` ;

-- -----------------------------------------------------
-- Table `RoomReserve`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Users` (
  `Fname` VARCHAR(20) NOT NULL,
  `MName` VARCHAR(20) NULL DEFAULT NULL,
  `LName` VARCHAR(20) NOT NULL,
  `SSN` INT(9) NOT NULL,
  `address` VARCHAR(20) NOT NULL,
  `Sex` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`SSN`),
  INDEX `user_ssn` (`SSN` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Admin` (
  `AdminID` VARCHAR(20) NOT NULL,
  `Fname` VARCHAR(20) NOT NULL,
  `Mname` VARCHAR(20) NOT NULL,
  `Lname` VARCHAR(20) NOT NULL,
  `Sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(20) NOT NULL,
  `SSN` INT(9) NOT NULL,
  PRIMARY KEY (`AdminID`),
  INDEX `SSN` (`SSN` ASC),
  CONSTRAINT `admin_ibfk_1`
    FOREIGN KEY (`SSN`)
    REFERENCES `RoomReserve`.`Users` (`SSN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Building` (
  `ID` VARCHAR(20) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `hasDepartment` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Date` (
  `Day` INT(2) NOT NULL,
  `Month` VARCHAR(10) NOT NULL,
  `Year` INT(4) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Department` (
  `DepID` VARCHAR(20) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `location` VARCHAR(20) NOT NULL,
  `hasLAB` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`DepID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Rooms` (
  `RoomID` VARCHAR(20) NOT NULL,
  `Number` INT(4) NOT NULL,
  `Type` VARCHAR(20) NOT NULL,
  `Has_Equipment` TINYINT(1) NULL DEFAULT NULL,
  `DepID` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  INDEX `DepID` (`DepID` ASC),
  CONSTRAINT `rooms_ibfk_1`
    FOREIGN KEY (`DepID`)
    REFERENCES `RoomReserve`.`Department` (`DepID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Equipment` (
  `ID` VARCHAR(20) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `RoomID` VARCHAR(20) NOT NULL,
  INDEX `RoomID` (`RoomID` ASC),
  CONSTRAINT `equipment_ibfk_1`
    FOREIGN KEY (`RoomID`)
    REFERENCES `RoomReserve`.`Rooms` (`RoomID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Laboratory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Laboratory` (
  `LabID` VARCHAR(20) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `DepID` VARCHAR(20) NULL DEFAULT NULL,
  INDEX `DepID` (`DepID` ASC),
  CONSTRAINT `laboratory_ibfk_1`
    FOREIGN KEY (`DepID`)
    REFERENCES `RoomReserve`.`Department` (`DepID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Ratings` (
  `RatingID` VARCHAR(20) NULL DEFAULT NULL,
  `description` VARCHAR(50) NOT NULL,
  `RoomID` VARCHAR(20) NOT NULL,
  INDEX `RoomID` (`RoomID` ASC),
  CONSTRAINT `ratings_ibfk_1`
    FOREIGN KEY (`RoomID`)
    REFERENCES `RoomReserve`.`Rooms` (`RoomID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Reservation` (
  `InDate` DATE NULL DEFAULT NULL,
  `OutDate` DATE NULL DEFAULT NULL,
  `UserID` VARCHAR(20) NOT NULL,
  `ResID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ResID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Staff` (
  `StaffID` VARCHAR(20) NOT NULL,
  `Fname` VARCHAR(20) NOT NULL,
  `Mname` VARCHAR(20) NOT NULL,
  `Lname` VARCHAR(20) NOT NULL,
  `Sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(20) NOT NULL,
  `SSN` INT(9) NOT NULL,
  `ResID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `SSN` (`SSN` ASC),
  INDEX `ResID` (`ResID` ASC),
  CONSTRAINT `staff_ibfk_1`
    FOREIGN KEY (`SSN`)
    REFERENCES `RoomReserve`.`Users` (`SSN`),
  CONSTRAINT `staff_ibfk_2`
    FOREIGN KEY (`ResID`)
    REFERENCES `RoomReserve`.`Reservation` (`ResID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`Student` (
  `StudentID` VARCHAR(20) NOT NULL,
  `Fname` VARCHAR(20) NOT NULL,
  `Mname` VARCHAR(20) NOT NULL,
  `Lname` VARCHAR(20) NOT NULL,
  `Sex` VARCHAR(1) NOT NULL,
  `address` VARCHAR(20) NOT NULL,
  `SSN` INT(9) NOT NULL,
  `ResID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`StudentID`),
  INDEX `SSN` (`SSN` ASC),
  INDEX `ResID` (`ResID` ASC),
  CONSTRAINT `student_ibfk_1`
    FOREIGN KEY (`SSN`)
    REFERENCES `RoomReserve`.`Users` (`SSN`),
  CONSTRAINT `student_ibfk_2`
    FOREIGN KEY (`ResID`)
    REFERENCES `RoomReserve`.`Reservation` (`ResID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `RoomReserve`.`University`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomReserve`.`University` (
  `UnivID` VARCHAR(20) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`UnivID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

