USE SQLInjectors_ArmyDB;

--Newly joined personnel

INSERT INTO Personnel
VALUES('AA3358', '3358344673038', 'Alexander', 'Ardon', 'M', '1991-06-17', 'Soldier', 'alexander3358@armysa.co.za', '0318026744', '090'),
('AN7453', '7453972074303', 'Akheel', 'Naidoo', 'M', '1992-01-30', 'Soldier', 'akheel7453@armysa.co.za', '0310701183', '090'),
('AB5178', '5178273094672', 'Agnita Miranda', 'Boven', 'F', '1992-12-25', 'Soldier', 'agnita5978@armysa.co.za', '0317029417', '184'),
('XL9468', '9468279208442', 'Xolile', 'Langa', 'F', '1993-01-26', 'Scientist', 'xolile9468@armysa.co.za', '0317084932', '341');

--Newly joined personnel participations in the army

INSERT INTO Personnel_Participation
VALUES('AA3358', 'DCO'),
('AA3358', 'AVO'),
('AN7453', 'SCE'),
('AB5178', 'SCE'),
('XL9468', 'NRD');

--Recently captured warlord with unknown Id Number

INSERT INTO Offenders(Offender_Id, First_Names, Surname, Gender, DOB, Country, Offence_Type, Capture_Date, Chamber_No)
VALUES('VR0000', 'Vitor Goncalves', 'Ribeiro', 'M', '1981-01-28', 'Brazil', 'War Crimes across Brazil and Mexico', '2016-09-29', 26);

--Id document of Vitor Goncalves Ribeiro has been recovered and his record needs to be updated

UPDATE Offenders
SET Id_Number='2692752058-0', Offender_Id='VR2692'
WHERE First_Names='Vitor Goncalves' AND Surname='Ribeiro';

--The Vektor R4 assault rifle has been enhanced and the price is scheduled to be increased
--As a result the army has decided to purchase 2000 more Vektor R4s before the new price comes into effect and update the price

UPDATE Weapons
SET Quantity=6000, WPurchase_Price=6400
WHERE Weapon_Name='Vektor R4';

--Soldier Dwayne Brian Spielsberg has violated a number of army rules and protocols several times and has been banished from the army
--This will automatically remove all participations by the said personnel

DELETE FROM Personnel
WHERE First_Names='Dwayne Brian' AND Surname='Spielsberg';

--Germany has requested transfer of all offenders that were born between 1 Jan 1960 and 31 Dec 1979 back to Germany
--due to a case that has been re-openned which dates back to that period of time

DELETE FROM Offenders
WHERE Country='Germany' AND (DOB BETWEEN '1960-01-01' AND'1979-12-31');

--New Ammunition for newly bought weapons

INSERT INTO Ammunition(Ammo_Name, Ammo_Quantity, APurchase_Price)
VALUES('20×82mm NTW 20', 12000, 290),
('99mm Rocket', 3000, 31000);

--New advanced weapons bought

INSERT INTO Weapons(Weapon_Name, Category, Quantity, Dimensions_LxWxH, Weight_In_Kgs, Ammo_Id, WPurchase_Price, Section_Id)
VALUES('Denel NTW-20', 'Anti-Materiel Rifle', 2200, '1795mm x 61mm x 192mm', 31.0, 40, 178000, 'W1'),
('Denel FT5', 'Anti-Tank Rocket Launcher', 1400, '1050mm x 186mm x 159mm', 5.9, 45, 197000, 'W3');

INSERT INTO Weapons(Weapon_Name, Category, Quantity, Dimensions_LxWxH, Weight_In_Kgs, WPurchase_Price, Section_Id)
VALUES('Starstreak', 'Manportable Mounted Surface-To-Air Missile', 400, '1397mm x 99mm x 99mm', 14.0, 1000000, 'W3');

--Newly bought vehicles

INSERT INTO Vehicles(Vehicle_Name, Manufacturer, Category, Quantity, Dimensions_LxWxH, Weight_In_Tons, VPurchase_Price, Section_Id)
VALUES('GV6 Renoster', 'Denel Vehicle Systems-DVS', 'Self-Propelled Howitzer', 43, '10.4m x 3.5m x 3.4m', 46.5, 1080000, 'V4'),
('Bateleur Mk2 127mm MRL', 'Somchem Division of Denel Ltd', 'Multiple Rocket Launcher', 24, '5.4m x 2.3m x 2.3m', 6.4, 4600000, 'V4');