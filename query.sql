USE SQLInjectors_ArmyDB;

--General select queries

SELECT Vehicle_Id, Vehicle_Name, Category, Dimensions_LxWxH, Weight_In_Tons
FROM Vehicles
WHERE Dimensions_LxWxH LIKE'[6789]%' AND Weight_In_Tons>=10.0;

SELECT Weapon_Id, Weapon_Name, Category, Quantity, Ammo_Id
FROM Weapons
WHERE (Category LIKE'%Machine_Gun' OR Category LIKE'%Rifle')
AND Quantity<=4000;

SELECT Offender_Id, Id_Number, First_Names, Surname, Country, Chamber_No, Capture_Date
FROM Offenders
WHERE Gender='M' AND Capture_Date LIKE'2015%';

--Join queries

SELECT DISTINCT(Personnel.Personnel_Id), Personnel.First_Names, Personnel.Surname, Personnel.Gender, Personnel.Rank, Housing_Facilities.Room_No, 
Housing_Facilities.Block_Id, Medical_Facility.Med_Record_Id
FROM (Personnel FULL JOIN Housing_Facilities
ON Personnel.Room_No=Housing_Facilities.Room_No)
INNER JOIN Medical_Facility
ON Personnel.Personnel_Id=Medical_Facility.Personnel_Id;

SELECT Personnel.Personnel_Id, Personnel.First_Names, Personnel.Surname, Personnel_Participation.Department_Id, 
Training_And_Research_Facilities.Department_Name
FROM (Personnel INNER JOIN Personnel_Participation
ON Personnel.Personnel_Id=Personnel_Participation.Personnel_Id)
INNER JOIN Training_And_Research_Facilities
ON Personnel_Participation.Department_Id=Training_And_Research_Facilities.Department_Id
ORDER BY Personnel.First_Names;

--Union query

SELECT personnel_id AS Person_Id, Id_Number, First_Names, Surname
FROM Personnel
UNION 
SELECT Offender_Id AS Person_Id, Id_Number, First_Names, Surname
FROM Offenders;

--Group by query

SELECT Vehicle_Id, Vehicle_Name, SUM (VPurchase_Price * Quantity) AS Vehicles_Total_Worth
FROM Vehicles
GROUP BY Vehicle_Id, Vehicle_Name
HAVING (SUM(VPurchase_Price * Quantity) > 100000000)
ORDER BY SUM(VPurchase_Price * Quantity);

--Distinct query

SELECT DISTINCT COUNT(Med_Record_Id) AS No_Of_Visits_In_AUG_2014
FROM Medical_Facility
WHERE Date LIKE'2014-08%';

--Aggregate query

SELECT (SUM(VPurchase_Price *Vehicles.Quantity)
+SUM(WPurchase_Price*Weapons.Quantity)
+SUM(APurchase_Price*Ammunition.Ammo_Quantity)) AS Arsenal_And_Vehicles_Total_Worth
FROM Vehicles, Weapons, Ammunition;

--Order by queries

SELECT * FROM Offenders
WHERE Country='USA' AND (DOB BETWEEN '1960-01-01' AND '1979-12-31')
ORDER BY DOB;

SELECT Supply_Id, Supply_Name, Quantity
FROM Supplies
WHERE Category='Consumables' AND Quantity>150
ORDER BY Quantity DESC;