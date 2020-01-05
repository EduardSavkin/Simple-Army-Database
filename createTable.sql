CREATE DATABASE SQLInjectors_ArmyDB;

USE SQLInjectors_ArmyDB;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Army_Block')
DROP TABLE Army_Block
GO
CREATE TABLE Army_Block
(Block_Id char(3) PRIMARY KEY NOT NULL,
 Facility_Name varchar(60),
 Quadrant varchar(20));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Offence_Facility')
DROP TABLE Offence_Facility
GO
CREATE TABLE Offence_Facility
(Chamber_No int PRIMARY KEY NOT NULL,
 Basement_Level char(2));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Offenders')
DROP TABLE Offenders
GO
CREATE TABLE Offenders
(Offender_Id char(6) PRIMARY KEY NOT NULL,
 Id_Number varchar(13),
 First_Names varchar(40),
 Surname varchar(15),
 Gender char(1),
 DOB Date,
 Country varchar(20),
 Offence_Type varchar(90),
 Capture_Date Date,
 Chamber_No int,
 FOREIGN KEY(Chamber_No) REFERENCES Offence_Facility(Chamber_No));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Housing_Facilities')
DROP TABLE Housing_Facilities
GO
CREATE TABLE Housing_Facilities
(Room_No char(3) PRIMARY KEY NOT NULL,
 Block_Id char(3),
 FOREIGN KEY(Block_Id) REFERENCES Army_Block(Block_Id));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Personnel')
DROP TABLE Personnel
GO
CREATE TABLE Personnel
(Personnel_Id char(6) PRIMARY KEY NOT NULL,
 Id_Number char(13) NOT NULL,
 First_Names varchar(40),
 Surname varchar(25),
 Gender char(1),
 DOB Date,
 Rank varchar(20),
 Email varchar(30),
 Family_Home_Number char(10),
 Room_No char(3)
 FOREIGN KEY(Room_No) REFERENCES Housing_Facilities(Room_No));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Medical_Facility')
DROP TABLE Medical_Facility
GO
CREATE TABLE Medical_Facility
(Visit_Id int IDENTITY(1,1) NOT NULL,
 Med_Record_Id char(5) NOT NULL,
 Details varchar(100),
 Personnel_Id char(6),
 Date Date,
 CONSTRAINT pk_medical PRIMARY KEY(Visit_Id, Med_Record_Id),
 FOREIGN KEY(Personnel_Id) REFERENCES Personnel(Personnel_Id)
 ON DELETE CASCADE);

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Training_And_Research_Facilities')
DROP TABLE Training_And_Research_Facilities
GO
CREATE TABLE Training_And_Research_Facilities
(Department_Id char(3) PRIMARY KEY NOT NULL,
 Department_Name varchar(60),
 Location_Level varchar(20),
 Block_Id char(3),
 FOREIGN KEY(Block_Id) REFERENCES Army_Block(Block_Id));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Personnel_Participation')
DROP TABLE Personnel_Participation
GO
CREATE TABLE Personnel_Participation
(Personnel_Id char(6) NOT NULL,
 Department_Id char(3) NOT NULL,
 CONSTRAINT pk_Participation PRIMARY KEY(Personnel_Id, Department_Id),
 FOREIGN KEY(Personnel_Id) REFERENCES Personnel(Personnel_Id)
 ON DELETE CASCADE,
 FOREIGN KEY(Department_Id) REFERENCES Training_And_Research_Facilities(Department_Id));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Storage_Facilities')
DROP TABLE Storage_Facilities
GO
CREATE TABLE Storage_Facilities
(Section_Id char(2) PRIMARY KEY NOT NULL,
 Storage_Level varchar(20),
 Block_Id char(3),
 FOREIGN KEY(Block_Id) REFERENCES Army_Block(BLock_Id));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Supplies')
DROP TABLE Supplies
GO
CREATE TABLE Supplies
(Supply_Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
 Supply_Name varchar(30),
 Category varchar(25),
 Quantity int,
 SUnit_Purchase_Price decimal,
 Section_Id char(2),
 FOREIGN KEY(Section_Id) REFERENCES Storage_Facilities(Section_Id));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Vehicles')
DROP TABLE Vehicles
GO
CREATE TABLE Vehicles
(Vehicle_Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
 Vehicle_Name varchar(50),
 Manufacturer varchar(40),
 Category varchar(50),
 Quantity int,
 Dimensions_LxWxH varchar(30),
 Weight_In_Tons decimal(3,1),
 VPurchase_Price decimal,
 Section_Id char(2),
 FOREIGN KEY(Section_Id) REFERENCES Storage_Facilities(Section_Id));

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Ammunition')
DROP TABLE Ammunition
GO
CREATE TABLE Ammunition
(Ammo_Id int PRIMARY KEY IDENTITY(5,5) NOT NULL,
 Ammo_Name varchar(30),
 Ammo_Quantity int,
 APurchase_Price decimal);

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Weapons')
DROP TABLE Weapons
GO
CREATE TABLE Weapons
(Weapon_Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
 Weapon_Name varchar(40),
 Category varchar(50),
 Quantity int,
 Dimensions_LxWxH varchar(30),
 Weight_In_Kgs decimal(4,1),
 Ammo_Id int,
 WPurchase_Price decimal,
 Section_Id char(2),
 FOREIGN KEY(Section_Id) REFERENCES Storage_Facilities(Section_Id),
 FOREIGN KEY(Ammo_Id) REFERENCES Ammunition(Ammo_Id));