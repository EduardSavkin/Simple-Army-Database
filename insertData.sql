USE SQLInjectors_ArmyDB;

BEGIN TRANSACTION;

INSERT INTO Army_Block
VALUES('O01','Offence','North-East'),
('MH1','Male Housing','South-East'),
('FH1','Female Housing','South-East'),
('OH1','Officials Housing','South-East'),
('SH1','Scientist Housing','South-East'),
('TR1','Combat Training','West'),
('TR2','Sniper Control And Execution','West'),
('TR3','Drone Control And Operation','North-West'),
('TR4','Explosives And Mine Diffusion','North-West'),
('RS1','Nuclear Weapons Research And Development','North'),
('RS2','Biochemical Weapons Research And Development','North'),
('M01','Medical','South-East'),
('WS1','Weapons Storage','East'),
('VS1','Armoured Fighting Vehicles Storage','South-West'),
('VS2','Utility and Support Vehicles Storage','South'),
('VS3','Artillery Vehicles Storage','South-West'),
('SS1','Supply Storage','South-East');

INSERT INTO Offence_Facility
VALUES(01, '3B'),
(05, '3B'),
(11, '4B'),
(15, '4B'),
(25, '5B'),
(26 ,'5B');

INSERT INTO Offenders
VALUES('JM4485', '4485745268','Javier Sontano', 'Mazzeo', 'M', '1978-09-30', 'USA', 'Selling national security classified information to national enemies', '2015-08-12', 01),
('PD3324', '332450890812','Patricia', 'Deitch', 'F', '1988-02-03', 'France', 'Selling national security classified information to national enemies', '2015-04-23', 05),
('NMF537', 'F53795511801','Norman Czeitz', 'Maize', 'M', '1969-05-24', 'Germany', 'Multiple genoside attempts and acts', '2006-10-02', 11),
('AM4167', '4167901673','Albert', 'Mellinger', 'M', '1969-09-23', 'USA', 'Multiple assassinations of government officials', '2001-06-29', 15),
('HC1Z01', '1Z01386173','Herbert Fernandes', 'Chapa', 'M', '1974-12-29', 'Colombia', 'Terrorist acts across South America', '2015-04-26', 25);

INSERT INTO Housing_Facilities
VALUES('001', 'MH1'),
('002', 'MH1'),
('090', 'MH1'),
('101', 'FH1'),
('184', 'FH1'),
('301', 'OH1'),
('302', 'OH1'),
('303', 'OH1'),
('321', 'SH1'),
('341', 'SH1');

INSERT INTO Personnel
VALUES('RL8638', '8638126874390', 'Ruben', 'Van Liebenberg', 'M', '1993-04-09', 'Soldier', 'ruben8638@armysa.co.za', '0310785544', '001'),
('RS3586', '3586734409558', 'Richard', 'Stein', 'M', '1992-05-17', 'Soldier', 'richard3586@armysa.co.za', '0310805398', '001'),
('DS3860', '3860820973685', 'Dwayne Brian', 'Spielsberg', 'M', '1992-04-06', 'Soldier', 'dwayne3860@armysa.co.za', '0310717849', '002'),
('SM5976', '5976398476397', 'Sandile', 'Mniandu', 'M', '1991-05-24', 'Soldier', 'sandile5976@armysa.co.za', '0310801748', '002'),
('AS3468', '3468304967306', 'Amanda', 'Shezi', 'F', '1993-07-12', 'Soldier', 'amanda3468@armysa.co.za', '0314962375', '101'),
('KL5683', '5683846789334', 'Kaytlin', 'Van Liebenberg', 'F', '1992-11-28', 'Soldier', 'kaytlin5683@armysa.co.za', '0310785544', '101'),
('NM8346', '8346658373605', 'Nkosi', 'Mniandu', 'M', '1980-08-13', 'Scientist', 'nkosi8346@armysa.co.za', '0310801748', '321'),
('MW7845', '7845784586794', 'Michael', 'Van Wyk', 'M', '1982-10-18', 'Scientist', 'michael7845@armysa.co.za', '0310789946', '321'),
('JS2803', '2803740269505', 'John Brandon', 'Smickerson', 'M', '1986-08-19', 'Lieutenant General', 'john2803@armysa.co.za', '0316571198', '301'),
('PS8567', '8567394867348', 'Praveshen', 'Subramoney', 'M', '1975-05-04', 'Field Marshal', 'praveshen8567@armysa.co.za', '0316753063', '302'),
('DV7557', '7557386507267', 'Daniel Kendrick', 'Vermaat', 'M', '1970-01-18', 'Captain', 'daniel7557@armysa.co.za', '0315935476', '303');

INSERT INTO Medical_Facility(Med_Record_Id, Details, Personnel_Id, Date)
VALUES('L4390', 'Fractured the knee cap during physical combat practice', 'RL8638', '2014-08-10'),
('S3685', 'Dislocated shoulder during obstacle cource practice', 'KL5683', '2015-02-19'),
('M6397', 'Dislocated elbow during obstacle cource practice', 'SM5976', '2014-08-12'),
('L4390', 'Fractured the knee cap during obstacle cource practice', 'RL8638', '2015-06-29'),
('S9505', '3nd degree burns from a mishandled granade explossion', 'JS2803', '2014-09-11'),
('W6794', 'Inhaled an unknown gas substance during a failed experiment', 'MW7845', '2006-11-23');

INSERT INTO Training_And_Research_Facilities
VALUES('PCT', 'Physical Combat Training', 'Ground-Level', 'TR1'),
('WCT', 'Weapon Combat Training', 'Ground-Level', 'TR1'),
('SCE', 'Sniper Control And Execution', 'Ground-Level', 'TR2'),
('DCO', 'Drone Control And Operation', 'Ground-Level', 'TR3'),
('NRD', 'Nuclear Weapons Research And Development', 'Basement-3A', 'RS1'),
('BRD', 'Biochemical Weapons Research And Development', 'Basement-2A', 'RS2'),
('EMD', 'Explosives And Mine Diffusion', 'Ground-Level', 'TR4'),
('FVO', 'Armoured Fighting Vehicles Operation', 'Ground-Level', 'VS1'),
('AVO', 'Artillery Vehicles Operation', 'Ground-Level', 'VS3');

--Every Army personnel except scientists and the general take part in both types of combat training
--Therefore those two departments are not saved in the personnel participation table

INSERT INTO Personnel_Participation
VALUES('RL8638', 'DCO'),
('RL8638', 'SCE'),
('RS3586', 'EMD'),
('RS3586', 'FVO'),
('DS3860', 'DCO'),
('SM5976', 'DCO'),
('AS3468', 'SCE'),
('AS3468', 'DCO'),
('KL5683', 'EMD'),
('KL5683', 'AVO'),
('NM8346', 'BRD'),
('MW7845', 'NRD');

INSERT INTO Storage_Facilities
VALUES('S1', 'Basement-1C', 'SS1'),
('S2', 'Basement-1C', 'SS1'),
('W1', 'Basement-1D', 'WS1'),
('W2', 'Basement-1D', 'WS1'),
('W3', 'Basement-1D', 'WS1'),
('V1', 'Ground-Level', 'VS1'),
('V2', 'Basement-1E', 'VS1'),
('V3', 'Ground-Level', 'VS2'),
('V4', 'Ground-Level', 'VS3');

INSERT INTO Supplies(Supply_Name, Category, Quantity, SUnit_Purchase_Price, Section_Id)
VALUES('First Aid Kit', 'Medical', 2000, 140, 'S2'),
('Operation Kit', 'Medical', 300, 400, 'S2'),
('Dried Fruit', 'Consumables', 224, 120, 'S1'),
('Dried Meat', 'Consumables', 201, 200, 'S1'),
('Dairy', 'Consumables', 102, 100, 'S1'),
('Sealed Meat', 'Consumables', 197, 400, 'S1'),
('Sealed Fish', 'Consumables', 168, 260, 'S1'),
('Sealed Vegetables', 'Consumables', 179, 75, 'S1');

INSERT INTO Vehicles(Vehicle_Name, Manufacturer, Category, Quantity, Dimensions_LxWxH, Weight_In_Tons, VPurchase_Price, Section_Id)
VALUES('Centurion Mk3', 'Vickers Defence Systems Ltd', 'Main Battle Tank', 134, '9.8m x 3.9m x 3.0m', 51.0, 875000, 'V1'),
('Rooikat', 'BAE Systems', 'Armoured Fighting Vehicle', 84, '7.1m x 2.9m x 2.6m', 28.0, 1800000, 'V1'),
('Ratel IFV', 'Reumech OMC', 'Infantry fighting vehicle', 534, '7.2m x 2.5m x 2.9m', 18.5, 2800000, 'V2'),
('Mamba Mk3', 'Denel Vehicle Systems-DVS', 'Armoured Personnel Carrier', 440, '5.4m x 2.2m x 2.4m', 5.5, 1200000, 'V1'),
('Casspir Mk3', 'Denel Vehicle Systems-DVS', 'Infantry Mobility Vehicle', 370, '6.9m x 2.4m x 2.8m', 10.9, 290000, 'V2'),
('SAMIL 50', 'SAMIL All-Wheel Drive Trucks', '4×4 5-ton Logistics Truck', 586, '5.0m x 2.3m x 2.2m', 5.0, 650000, 'V3'),
('SHE Cavallo', 'Kynos SA Development', '8×8 Heavy Logistics Truck', 391, '9.9m x 3.3m x 3.6m', 22.1, 780000, 'V3'),
('Oerlikon 35mm Twin Cannon', 'Rheinmetall Air Defence AG', 'Radar Guided Anti-Aircraft Autocannon', 102, '7.8m x 2.3m x 2.3m', 6.7, 1800000, 'V4'),
('Husky VMDD', 'DCD Protected Mobility', 'Vehicle Mounted Mine Detection System', 24, '7.3m x 2.5m x 3.5m', 8.8, 200000, 'V4');

INSERT INTO Ammunition(Ammo_Name, Ammo_Quantity, APurchase_Price)
VALUES('9×19mm Parabellum', 24000, 98),
('5.56×45mm NATO', 12000, 186),
('7.62×51mm NATO', 13200, 230),
('.50 BMG 12.7×99mm NATO', 4000, 244),
('40×46mm Grenade', 4000, 4600),
('950x40mm Propelled Grenade', 4200, 5000),
('1200x56mm Heavy Grenade', 4000, 8000);

INSERT INTO Weapons(Weapon_Name, Category, Quantity, Dimensions_LxWxH, Weight_In_Kgs, Ammo_Id, WPurchase_Price, Section_Id)
VALUES('Vektor SP1', 'Semi-Automatic Pistol', 6000, '210mm x 40.5mm x 145mm', 1.0, 5, 470, 'W1'),
('Heckler & Koch MP5', 'Submachine Gun', 6000, '349mm x 60mm x 210mm', 2.5, 5, 2449, 'W1'),
('Vektor R4', 'Assault Rifle', 4000, '1005mm x 55mm x 200mm', 9.5, 10, 5870, 'W1'),
('R1 FN-FAL', 'Designated Marksman Rifle', 4000, '748mm x 52mm x 180mm', 3.8, 15, 9700, 'W1'),
('FN MAG', 'General Purpose Machine Gun', 2600, '1263mm x 118.7mm x 263mm', 11.8, 15, 19800, 'W2'),
('M2 Browning', 'Heavy Machine Gun', 2000, '1654mm x 120.6mm x 259mm', 38.0, 20, 90200, 'W2'),
('Milkor Y2 MK-1 MGL', 'Grenade Launcher', 2000, '778mm x 198mm x 211mm', 5.3, 25, 60000, 'W3'),
('Bazalt RPG-7', 'Rocket-Propelled Grenade Launcher', 2100, '950mm x 146mm x 144mm', 7.0, 30, 20000, 'W3'),
('MILAN ER', 'Anti-tank missile', 2000, '1200mm x 190mm x 1192mm', 7.1, 35, 134000, 'W3');

INSERT INTO Weapons(Weapon_Name, Category, Quantity, Dimensions_LxWxH, Weight_In_Kgs, WPurchase_Price, Section_Id)
VALUES('M26 grenade', 'Fragmentation Hand Grenade', 15000, '210mm x 40.5mm x 145mm', 1.0, 1780, 'W1'),
('RQ-11 Raven', 'Remote-Controlled Drone', 17, '900mm x 1400mm x 290mm', 1.9, 1730000, 'W3');

COMMIT;