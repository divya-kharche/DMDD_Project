--Creating a database for a Hospital Management System
create database HOSPITAL_MANAGEMENT_SYSTEM_DMDD_PROJECT
USE HOSPITAL_MANAGEMENT_SYSTEM_DMDD_PROJECT
GO

--Creating a table for the address of all the patients
CREATE TABLE Address (
  Zipcode INT PRIMARY KEY,
  city VARCHAR(50),
 [state] VARCHAR(50)
);

ALTER TABLE Address
ADD CONSTRAINT Zip_CH CHECK (LEN(Zipcode) = 5);

--Inserting values into the adress table 
INSERT INTO ADDRESS (Zipcode, city, [state]) VALUES 
(10001, 'New York', 'NY'),
(90001, 'Los Angeles', 'CA'),
(60601, 'Chicago', 'IL'),
(77001, 'Houston', 'TX'),
(85001, 'Phoenix', 'AZ'),
(19019, 'Philadelphia', 'PA'),
(78201, 'San Antonio', 'TX'),
(92101, 'San Diego', 'CA'),
(75201, 'Dallas', 'TX'),
(95101, 'San Jose', 'CA'),
(73301, 'Austin', 'TX'),
(32099, 'Jacksonville', 'FL'),
(76101, 'Fort Worth', 'TX'),
(43004, 'Columbus', 'OH'),
(94101, 'San Francisco', 'CA'),
(28201, 'Charlotte', 'NC'),
(46201, 'Indianapolis', 'IN'),
(98101, 'Seattle', 'WA'),
(80201, 'Denver', 'CO'),
(20001, 'Washington, D.C.', 'DC');

--Creating a table for patient information
CREATE TABLE Patient
(
	Patient_ID INT NOT NULL,
	Patient_First_Name VARCHAR (15) NOT NULL,
	Patient_Last_Name VARCHAR (15),
	Contact_No nvarchar(max) NOT NULL,
	Emergency_Contact_No CHAR(10) NOT NULL,
	Email_ID VARCHAR (40),
	Zipcode INT,
CONSTRAINT PT_CH CHECK (LEN(Contact_No) = 10),
CONSTRAINT PTEM_CH CHECK (LEN(Emergency_Contact_No) = 10),
CONSTRAINT Patient_PK PRIMARY KEY (Patient_ID),
CONSTRAINT Patient_FK FOREIGN KEY (Zipcode) REFERENCES ADDRESS(Zipcode)
);

ALTER table Patient
DROP CONSTRAINT PT_CH;

--Inserting data into the patient table 
INSERT INTO Patient
VALUES (1001, 'John', 'Smith', '5585512304', '5999555678', 'john.smith@example.com', 10001),
	   (1002, 'John', 'Doe', '5559876678', '5500055432', 'jane.doe@example.com', 90001),
	   (1003, 'Bob', 'Johnson', '8905553456', '5550087890', 'bob.johnson@example.com', 60601),
	   (1004, 'Mary','Davis', '5777552345', '5534756789', 'mary.davis@example.com', 77001),
	   (1005, 'David', 'Brown', '4565558765', '5554325671', 'david.brown@example.com', 85001),
	   (1006, 'Sarah', 'Wilson', '5567556543', '5552109091', 'sarah.wilson@example.com', 19019),
	   (1007, 'Michael', 'Lee', '5558767896', '5551289335', 'michael.lee@example.com', 78201),
	   (1008, 'Lisa', 'Anderson', '5587655678', '5551230244', 'lisa.anderson@example.com', 92101),
	   (1009, 'Richard', 'Garcia', '5589053214', '5198557654', 'richard.garcia@example.com', 75201),
	   (1010, 'Amy', 'Taylor', '5908554321', '5577058765', 'amy.taylor@example.com', 95101),
	   (1011, 'James', 'Hernandez', '5509856547', '5512352109', 'james.hernandez@example.com', 73301),
	   (1012, 'Jennifer', 'Martinez', '5553987456', '5000557890', 'jennifer.martinez@example.com', 32099),
	   (1013, 'Charles', 'Moore', '5534555678', '7935551234', 'charles.moore@example.com', 76101),
	   (1014, 'Elizabeth', 'Allen', '5550984321', '2345558765', 'elizabeth.allen@example.com', 43004),
	   (1015, 'Kevin', 'Young', '5553214584', '3475557654', 'kevin.young@example.com', 94101),
	   (1016, 'Kimberly', 'Wright', '5553277896', '8655551235', 'kimberly.wright@example.com', 28201),
	   (1017, 'Stephen', 'Scott', '5598256547', '8575552109', 'stephen.scott@example.com', 46201),
	   (1018, 'Amanda', 'King', '5123555678', '8725551234', 'amanda.king@example.com', 98101),
	   (1019, 'Jacob', 'Walker', '5904553214', '7095557654', 'jacob.walker@example.com', 80201),
	   (1020, 'Ashley', 'Hall', '5438554321', '7795558765', 'ashley.hall@example.com', 20001);

--Creating a table for appointment schedule
CREATE TABLE Appointment
(
    Appointment_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    Date_Time_Apt DATETIME NOT NULL,
CONSTRAINT Appointment_PK PRIMARY KEY (Appointment_ID),
CONSTRAINT Appointment_FK FOREIGN KEY (Patient_ID)
    REFERENCES Patient (Patient_ID)
);

--Inserting values into the appointment table 
INSERT INTO Appointment
VALUES
(10001, 1001, '2023-04-08 10:00:00'),
(10002, 1002, '2023-04-08 11:00:00'),
(10003, 1003, '2023-04-08 12:00:00'),
(10004, 1004, '2023-04-08 13:00:00'),
(10005, 1005, '2023-04-08 14:00:00'),
(10006, 1006, '2023-04-08 15:00:00'),
(10007, 1007, '2023-04-08 16:00:00'),
(10008, 1008, '2023-04-09 10:00:00'),
(10009, 1009, '2023-04-09 11:00:00'),
(10010, 1010, '2023-04-09 12:00:00'),
(10011, 1011, '2023-04-09 13:00:00'),
(10012, 1012, '2023-04-09 14:00:00'),
(10013, 1013, '2023-04-09 15:00:00'),
(10014, 1014, '2023-04-09 16:00:00'),
(10015, 1015, '2023-04-10 10:00:00'),
(10016, 1016, '2023-04-10 11:00:00'),
(10017, 1017, '2023-04-10 12:00:00'),
(10018, 1018, '2023-04-10 13:00:00'),
(10019, 1019, '2023-04-10 14:00:00'),
(10020, 1020, '2023-04-10 15:00:00');

--Creating a table that contains all the information about the doctors that work at the hospital
CREATE TABLE Doctor
(
    DoctorID INT,
    Doctor_First_Name VARCHAR (20) NOT NULL,
    Doctor_Last_Name VARCHAR (20) NOT NULL,
    Speciality VARCHAR (40) NOT NULL,
    Availabilty VARCHAR (5) NOT NULL,
    Contact_No CHAR(10) NOT NULL,
CONSTRAINT Doc_PK PRIMARY KEY (DoctorID),
);

--Inserting values into the doctor table 
INSERT INTO Doctor 
VALUES
(101, 'John','Smith','Cardiologist','Y', 1234567890),
(102, 'Sarah','Johnson','Oncologist', 'N', 2345678901),
(103, 'David','Lee','Dermatologist','Y', 3456789012),
(104, 'Lisa','Kim','Ophthalmologist', 'Y', 4567890123),
(105, 'Michael','Brown','Gynecologist', 'Y', 5678901234),
(106, 'Jennifer','Davis','Endocrinologist', 'Y', 6789012345),
(107, 'Christopher','Wilson','Neurologist', 'Y', 7890123456),
(108, 'Jessica','Moore','Pediatrician','Y', 8901234567),
(109, 'William','Taylor','Orthopedist', 'Y', 9012345678),
(110, 'Elizabeth','Anderson','Psychiatrist', 'N', 0123456789),
(111, 'Andrew','Thomas','Pulmonologist', 'Y', 1234567890),
(112, 'Samantha','Jackson','Rheumatologist', 'N', 2345678901),
(113, 'Kevin','White','Urologist', 'Y', 3456789012),
(114, 'Amanda','Harris','Hematologist', 'No', 4567890123),
(115, 'Richard','Martin','Allergist/Immunologist', 'Y', 5678901234),
(116, 'Kayla','Thompson','Infectious Disease', 'Y', 6789012345),
(117, 'Charles','Garcia','Nephrologist', 'N', 7890123456),
(118, 'Emily','Martinez','Gastroenterologist', 'Y', 8901234567),
(119, 'Joseph','Robinson','Oncologist', 'N', 9012345678),
(120, 'Olivia','Clark','Neurosurgeon', 'Y', 0123456789),
(121, 'Emily','Hernandez','Cardiology','Y', 5551234567),
(122, 'Alexander', 'Kim', 'Neurology','Y', 5552345678),
(123, 'Benjamin', 'Lee', 'Oncology', 'N', 5553456789),
(124, 'Chloe', 'Martinez', 'Dermatology', 'Y', 5554567890),
(125, 'Elijah', 'Nguyen', 'Pediatrics',	'N', 5555678901),
(126, 'Maya', 'Patel', 'Gynecology', 'Y', 5556789012),
(127, 'Ryan', 'Ramirez', 'Ophthalmology', 'Y', 5557890123),
(128, 'Victoria', 'Sanchez', 'Rheumatology', 'N', 5558901234),
(129, 'Zachary', 'Torres', 'Psychiatry', 'Y', 5559012345),
(130, 'Audrey', 'Ward', 'Endocrinology', 'Y', 5550123456);

--Creating the admissions table 
CREATE TABLE Admission
(
	Admission_ID INT NOT NULL,
	Appointment_ID INT NOT NULL,
	DoctorID INT,
	TestRequirement VARCHAR (8),
	ConsultationFee DECIMAL,
	AdmissionType VARCHAR(10) constraint AdmissionType_chk check(AdmissionType IN ('Inpatient', 'Outpatient'))
CONSTRAINT Admission_PK PRIMARY KEY (Admission_ID),
CONSTRAINT Admission_FK1 FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID),
CONSTRAINT Admission_FK2 FOREIGN KEY (DoctorID) REFERENCES Doctor (DoctorID)
);

--Stored Procedure 1 
--By implementing this procedure, only the doctors that are available can be inputted into the table 
--This acts like a partial safety feature that prevents the entry of incorrect data.

GO
CREATE OR ALTER PROCEDURE AdmissionEntries 
    @Admission_ID INT, 
    @Appointment_ID INT, 
    @DoctorID INT, 
    @TestRequirement VARCHAR(10), 
    @Consultationfee INT, 
    @AdmissionType VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    IF (SELECT Availabilty  FROM Doctor WHERE DoctorID = @DoctorID) = 'Y'
    BEGIN
        INSERT INTO Admission 
        VALUES (@Admission_ID, @Appointment_ID, @DoctorID, @TestRequirement, @Consultationfee, @AdmissionType)
    END
    ELSE 
    BEGIN
        PRINT 'Invalid Input'
    END
END
GO

--Inserting values into the admission table 
EXEC AdmissionEntries  100001, 10001, 101, 'No', 500, 'Outpatient';
EXEC AdmissionEntries  100002, 10002, 103, 'Yes', 750,'Inpatient';
EXEC AdmissionEntries  100003, 10003, 104, 'Yes', 600,'Outpatient';	
EXEC AdmissionEntries  100004, 10004, 105, 'No', 400,'Outpatient';																		
EXEC AdmissionEntries  100005, 10005, 106, 'No', 550,'Outpatient';
EXEC AdmissionEntries  100006, 10006, 107, 'Yes', 800,'Inpatient';
EXEC AdmissionEntries  100007, 10007, 108, 'Yes', 700,'Inpatient';
EXEC AdmissionEntries  100008, 10008, 109, 'No', 450,'Outpatient';
EXEC AdmissionEntries  100009, 10009, 111, 'No', 600,'Outpatient';
EXEC AdmissionEntries  100010, 10010, 113, 'Yes', 850,'Inpatient';
EXEC AdmissionEntries  100011, 10011, 115, 'No', 500,'Outpatient';
EXEC AdmissionEntries  100012, 10012, 116, 'Yes', 900,'Inpatient';
EXEC AdmissionEntries  100013, 10013, 118, 'No', 550,'Outpatient';
EXEC AdmissionEntries  100014, 10014, 120, 'Yes', 750,'Inpatient';
EXEC AdmissionEntries  100015, 10015, 121, 'Yes', 700,'Inpatient';
EXEC AdmissionEntries  100016, 10016, 122, 'No', 450,'Outpatient';
EXEC AdmissionEntries  100017, 10017, 124, 'No', 600,'Outpatient';
EXEC AdmissionEntries  100018, 10018, 126, 'Yes', 400,'Inpatient';
EXEC AdmissionEntries  100019, 10019, 127, 'Yes', 200,'Inpatient';
EXEC AdmissionEntries  100020, 10020, 129, 'No', 300,'Inpatient';


--Creating a table for lab information
CREATE TABLE Lab
(
	Report_No INT NOT NULL,
	Admission_ID Int,
	Test_DATE DATE NOT NULL,
	TypeOfTest VARCHAR(35),
	TestResult VARCHAR(10),
	Cost DECIMAL,
CONSTRAINT Lab_PK PRIMARY KEY (Report_No),
CONSTRAINT Lab_FK FOREIGN KEY (Admission_ID)
REFERENCES Admission(Admission_ID),
);

--Stored Procedure 2
--By implementing this procedure, only the AdmissionIDs of patients who require tests can be entered into the database

GO
CREATE OR ALTER PROCEDURE LabEntries 
    @Report_No INT, 
    @Admission_ID INT, 
    @Test_DATE DATE, 
    @TypeOfTest VARCHAR(35), 
    @TestResult VARCHAR(10), 
    @Cost DECIMAL
AS
BEGIN
    SET NOCOUNT ON;

    IF (SELECT TestRequirement FROM Admission WHERE Admission_ID = @Admission_ID) = 'Yes'
    BEGIN
        INSERT INTO Lab
        VALUES (@Report_No, @Admission_ID, @Test_DATE, @TypeOfTest, @TestResult, @Cost)
    END
    ELSE 
    BEGIN
        PRINT 'Invalid Input'
    END
END
GO


--Inserting values into the lab table 
EXEC LabEntries 1000001, '100002', '5/11/2023 16:00:00', 'Blood Test', 'Normal', 100.00;
EXEC LabEntries 1000002, '100003', '5/12/2023 11:00:00', 'Urine Test', 'Abnormal', 150.00;
EXEC LabEntries 1000003, '100006', '5/13/2023 16:30:00', 'X-Ray', 'Normal', 200.00;
EXEC LabEntries 1000004, '100007', '5/14/2023 11:30:00', 'MRI', 'Abnormal', 500.00;
EXEC LabEntries 1000005, '100010', '5/15/2023 13:00:00', 'ECG', 'Normal', 75.00;
EXEC LabEntries 1000006, '100012', '5/16/2023 16:15:00', 'CT scan', 'Normal', 400.00;
EXEC LabEntries 1000007, '100014', '5/17/2023 17:30:00', 'Ultrasound', 'Abnormal', 300.00;
EXEC LabEntries 1000008, '100015', '5/19/2023 11:00:00', 'Blood glucose test', 'Normal', 50.00;
EXEC LabEntries 1000009, '100018', '5/12/2023 11:00:00', 'CT scan', 'Abnormal', 75.00;
EXEC LabEntries 1000010, '100019', '5/20/2023 11:00:00', 'MRI', 'Normal', 50.00;

--Creating the table for records
CREATE TABLE Records
(
    Record_ID INT NOT NULL,
    Admission_ID INT NOT NULL,
    Diagnosis VARCHAR(35) NOT NULL,
    Medicines_Prescribed VARCHAR(35),
 CONSTRAINT Records_PK PRIMARY KEY (Record_ID),
 CONSTRAINT Records_FK FOREIGN KEY (Admission_ID)
	REFERENCES Admission (Admission_ID),    
);

--Inserting values into the records table
INSERT INTO Records (Record_ID, Admission_ID, Diagnosis, Medicines_Prescribed)
VALUES
(11, '100001', 'Pneumonia', 'Amoxicillin'),
(12, '100002', 'Bronchitis', 'Azithromycin'),
(13, '100003', 'Urinary tract infection', 'Ciprofloxacin'),
(14, '100004', 'Migraine', 'Sumatriptan'),
(15, '100005', 'Gastroenteritis', 'Loperamide'),
(16, '100006', 'Fractured wrist', 'Ibuprofen'),
(17, '100007', 'Herniated disc', 'Naproxen'),
(18, '100008', 'Influenza', 'Oseltamivir'),
(19, '100009', 'Sinusitis', 'Amoxicillin'),
(20, '100010', 'Hypertension', 'Amlodipine'),
(21, '100011', 'Arthritis', 'Naproxen'),
(22, '100012', 'Appendicitis', 'Ceftriaxone'),
(23, '100013', 'Depression', 'Sertraline'),
(24, '100014', 'Gallstones', 'Ursodiol'),
(25, '100015', 'Allergic rhinitis', 'Loratadine'),
(26, '100016', 'Pneumonia', 'Levofloxacin'),
(27, '100017', 'Type 2 diabetes mellitus', 'Metformin'),
(28, '100018', 'Otitis media', 'Amoxicillin'),
(29, '100019', 'Fractured shoulder', 'Ibuprofen'),
(30, '100020', 'Fractured leg', 'Ibuprofen');

--Creating a table that consists all the information regarding the rooms
CREATE TABLE Room (
	Room_ID int not null PRIMARY KEY,
	Room_category varchar(10),
	Room_price int not null,
	Room_number int not null,
	Room_availability varchar(3) check (Room_availability in ('Yes', 'No'))
);

--Inserting values into the room table 
INSERT INTO Room
VALUES (10000001, 'Economy', 500, 101, 'Yes'),
	   (10000002, 'Economy', 500, 102, 'No'),
	   (10000003, 'Economy', 500, 103, 'Yes'),
	   (10000004, 'Economy', 500, 104, 'No'),
	   (10000005, 'Economy', 500, 105, 'Yes'),
	   (10000006, 'Deluxe', 1000, 201, 'No'),
	   (10000007, 'Deluxe', 1000, 202, 'Yes'),
	   (10000008, 'Deluxe', 1000, 203, 'No'),
	   (10000009, 'Deluxe', 1000, 204, 'Yes'),
	   (10000010, 'Deluxe', 1000, 205, 'No'),
	   (10000011, 'Suite', 1500, 301, 'Yes'),
	   (10000012, 'Suite', 1500, 302, 'No'),
	   (10000013, 'Suite', 1500, 303, 'Yes'),
	   (10000014, 'Suite', 1500, 304, 'No'),
	   (10000015, 'Suite', 1500, 305, 'Yes'),
	   (10000016, 'ICU', 2000, 401, 'No'),
	   (10000017, 'ICU', 2000, 402, 'Yes'),
	   (10000018, 'ICU', 2000, 403, 'No'),
	   (10000019, 'ICU', 2000, 404, 'Yes'),
	   (10000020, 'ICU', 2000, 405, 'No');

--Creating a table that consists of all the nurse information
CREATE TABLE Nurses
(
    Nurse_ID INT NOT NULL,
    F_Name_Nurse VARCHAR(25) NOT NULL,
    L_Name_Nurse VARCHAR(25) NOT NULL,
    Contact_No nvarchar(max) NOT NULL,
    Shift_time VARCHAR(5) NOT NULL,
CONSTRAINT Nurses_PK PRIMARY KEY (Nurse_ID),
);

ALTER TABLE Nurses 
ADD CONSTRAINT NURSE_CH CHECK (LEN(Contact_No) = 10);

--Inserting values into the Nurse table 
insert into Nurses VALUES
('100000001','Sarah','Johnson','9876543210','Day'),
('100000002','Emily','Brown','9865471230','Night'),
('100000003','John','Smith','9812345670','Day'),
('100000004','David','Davis','9832145670','Night'),
('100000005','Mary','Wilson','9801234567','Day'),
('100000006','Jessica','Lee','9845612370','Night'),
('100000007','Michael','Garcia','9871234560','Day'),
('100000008','Ashley','Rodriguez','9834567120','Night'),
('100000009','Daniel','Martinez','9823456710','Day'),
('100000010','Samantha','Hernandez','9845671230','Night'),
('100000011','Joshua','Moore','9801234561','Day'),
('100000012','Amanda','Jackson','9876547120','Night'),
('100000013','Christopher','Martin','9834562107','Day'),
('100000014','Elizabeth','Lee','9845671231','Night'),
('100000015','Matthew','Perez','9865432170','Day'),
('100000016','Taylor','Turner','9812345760','Night'),
('100000017','Andrew','Phillips','9876541203','Day'),
('100000018','Brianna','Campbell','9845612371','Night'),
('100000019','Kevin','Parker','9801234657','Day'),
('100000020','Olivia','Evans','9832145671','Night');

--Creating a table of prescription 
CREATE TABLE Prescription
(
	Prescription_ID INT NOT NULL,
	Admission_ID INT,
	Medicines_Purchased VARCHAR(25),
	CostOfMedicines DECIMAL,
CONSTRAINT Prescription_PK PRIMARY KEY (Prescription_ID),
CONSTRAINT Prescription_FK FOREIGN KEY (Admission_ID)
REFERENCES Admission (Admission_ID)
);

--Inserting values in the prescription table
INSERT INTO Prescription VALUES (1000000001, 100001, 'Amoxicillin', 30);
INSERT INTO Prescription VALUES(1000000002, 100002, 'Azithromycin', 30);
INSERT INTO Prescription VALUES(1000000003, 100003, 'Ciprofloxacin', 15);
INSERT INTO Prescription VALUES(1000000004, 100004, 'Sumatriptan', 50);
INSERT INTO Prescription VALUES(1000000005, 100005, 'Loperamide', 10);
INSERT INTO Prescription VALUES(1000000006, 100006, 'Ibuprofen', 10);
INSERT INTO Prescription VALUES(1000000007, 100007, 'Naproxen', 20);
INSERT INTO Prescription VALUES(1000000008, 100008, 'Oseltamivir', 40);
INSERT INTO Prescription VALUES(1000000009, 100009, 'Amoxicillin', 30);
INSERT INTO Prescription VALUES(1000000010, 100010, 'Amlodipine', 15);
INSERT INTO Prescription VALUES(1000000011, 100011, 'Naproxen', 20);
INSERT INTO Prescription VALUES(1000000012, 100012, 'Ceftriaxone', 30);
INSERT INTO Prescription VALUES(1000000013, 100013, 'Sertraline', 10);
INSERT INTO Prescription VALUES(1000000014, 100014, 'Ursodiol', 25);
INSERT INTO Prescription VALUES(1000000015, 100015, 'Loratadine', 40);
INSERT INTO Prescription VALUES(1000000016, 100016, 'Levofloxacin', 15);
INSERT INTO Prescription VALUES(1000000017, 100017, 'Metformin', 20);
INSERT INTO Prescription VALUES(1000000018, 100018, 'Amoxicillin', 30);
INSERT INTO Prescription VALUES(1000000019, 100019, 'Ibuprofen', 10);
INSERT INTO Prescription VALUES(1000000020, 100020, 'Ibuprofen', 10);

--Creating a table for Insurance Information
CREATE TABLE Insurance
(
	Insurance_ID VARCHAR(15) NOT NULL,
	Patient_ID INT NOT NULL,
	Insurance_Comapany VARCHAR(25),
	Policy_Holder_Name VARCHAR(25),
	Insurance_Claim_Amt DECIMAL,
CONSTRAINT Insurance_PK PRIMARY KEY (Insurance_ID),
CONSTRAINT Insurance_FK FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);

-- Inserting values in the Insurance table 
INSERT INTO Insurance
VALUES (10000000001, 1001, 'XYZ Insurance', 'John Doe', 500),
	   (10000000002, 1002, 'ABC Insurance', 'Jane Smith', 250),
	   (10000000003, 1003, 'DEF Insurance', 'Michael Johnson', 750),
	   (10000000004, 1004, 'GHI Insurance', 'Sarah Williams', 800),
	   (10000000005, 1005, 'JKL Insurance', 'David Brown', 150),
	   (10000000006, 1006, 'MNO Insurance', 'Elizabeth Lee', 900),
	   (10000000007, 1007, 'PQR Insurance', 'William Davis', 400),
	   (10000000008, 1008, 'STU Insurance', 'Jennifer Wilson', 200),
	   (10000000009, 1009, 'VWX Insurance', 'Robert Miller', 600),
	   (10000000010, 1010, 'XYZ Insurance', 'Emily Martinez', 350),
	   (10000000011, 1011, 'ABC Insurance', 'Christopher Lee', 450),
	   (10000000012, 1012, 'DEF Insurance', 'Samantha Thompson', 550),
	   (10000000013, 1013, 'GHI Insurance', 'Ryan Garcia', 650),
	   (10000000014, 1014, 'JKL Insurance', 'Emma Hernandez', 750),
	   (10000000015, 1015, 'MNO Insurance', 'Benjamin Allen', 100),
	   (10000000016, 1016, 'PQR Insurance', 'Victoria Taylor', 300),
	   (10000000017, 1017, 'STU Insurance', 'Christopher Anderson', 450),
	   (10000000018, 1018, 'VWX Insurance', 'Andrew Hall', 800),
	   (10000000019, 1019, 'XYZ Insurance', 'Natalie Wright', 550),
	   (10000000020, 1020, 'ABC Insurance', 'Isaac Parker', 350);


--Creating a table for outpatient 
CREATE TABLE OUTPATIENT (
  Admission_ID INT,
  Date_of_Next_Appointment DATE,
  CONSTRAINT Outpatient_PK PRIMARY KEY (Admission_ID),
  CONSTRAINT Outpatient_FK FOREIGN KEY (Admission_ID) REFERENCES Admission (Admission_ID)
);

--Insertinng values in the outpatient table 
INSERT INTO OUTPATIENT 
VALUES 
(100001, '2023-05-10'),
(100003, '2023-05-14'),
(100004, null),
(100005, '2023-05-15'),
(100008, '2023-05-12'),
(100009, null),
(100011, '2023-05-13'),
(100013, null),
(100016, '2023-05-16'),
(100017, null);

--Creating a table for inpatient
CREATE TABLE INPATIENT (
  Admission_ID int PRIMARY KEY,
  Room_ID int,
  Date_Of_Discharge date,
  Date_Of_Admission date,
  CONSTRAINT Inpatient_FK FOREIGN KEY (Room_ID) REFERENCES Room (Room_ID),
  CONSTRAINT Inpatient_FK2 FOREIGN KEY (Admission_ID) REFERENCES Admission (Admission_ID)
);

--Stored Procedure 3
-- This procedure acts as a security feature letting the user only enter the rooms numbers that are available 
GO
CREATE OR ALTER PROCEDURE InpatientRooms
    @Admission_ID INT, 
    @Room_ID INT, 
    @Date_Of_Discharge date, 
    @Date_Of_Admission date

AS
BEGIN
    SET NOCOUNT ON;

    IF (SELECT Room_availability  FROM Room WHERE Room_ID= @Room_ID) = 'Yes'
    BEGIN
        INSERT INTO INPATIENT 
        VALUES (@Admission_ID, @Room_ID, @Date_Of_Discharge, @Date_Of_Admission)
    END
    ELSE 
    BEGIN
        PRINT 'Invalid Input'
    END
END
GO

--Inserting data into the inpatient table 
EXEC InpatientRooms 100002, 10000001, '2023-04-20', '2023-04-25';
EXEC InpatientRooms 100006, 10000003, '2023-04-22', '2023-04-24';
EXEC InpatientRooms 100007, 10000005, '2023-04-25', '2023-04-27';
EXEC InpatientRooms 100010, 10000007, '2023-04-26', '2023-05-01';
EXEC InpatientRooms 100012, 10000009, '2023-04-28', '2023-05-03';
EXEC InpatientRooms 100014, 10000011, '2023-04-30', '2023-05-06';
EXEC InpatientRooms 100015, 10000013, '2023-05-02', '2023-05-08';
EXEC InpatientRooms 100018, 10000015, '2023-05-05', '2023-05-11';
EXEC InpatientRooms 100019, 10000017, '2023-05-07', '2023-05-13';
EXEC InpatientRooms 100020, 10000019, '2023-05-10', '2023-05-16';

--Creating a bridge table between Nurses and Inpatients
CREATE TABLE Assigned (
  Admission_ID INT NOT NULL,
  Nurse_ID INT NOT NULL,
  Date_Of_Assignment DATE NOT NULL,
  PRIMARY KEY (Admission_ID, Nurse_ID, Date_Of_Assignment)
);

--Inserting values into the assigned table
INSERT INTO Assigned (Admission_ID, Nurse_ID, Date_Of_Assignment)
VALUES 
  (100002, 100000001, '2023-04-20'),
  (100006, 100000003, '2023-04-22'),
  (100007, 100000005, '2023-04-25'),
  (100010, 100000007, '2023-04-26'),
  (100012, 100000009, '2023-04-28'),
  (100014, 100000011, '2023-04-30'),
  (100015, 100000013, '2023-05-02'),
  (100018, 100000015, '2023-05-05'),
  (100019, 100000017, '2023-05-07'),
  (100020, 100000019, '2023-05-10');

--Creating a table for visitors
CREATE TABLE Visitors (
  VisitorID varchar(15) NOT NULL PRIMARY KEY,
  Admission_ID INT NOT NULL,
  Patient_ID INT NOT NULL,
  Visitor_Name VARCHAR(50) NOT NULL,
  Date_Of_Visit DATE NOT NULL,
  CONSTRAINT Visitors_FK FOREIGN KEY (Admission_ID) REFERENCES Admission(Admission_ID),
  CONSTRAINT Visitors_FK2 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

--Inserting values into the visitors table
INSERT INTO Visitors VALUES
(1000000000001, 100002, 1002, 'John Doe', '2023-04-21'),
(1000000000002, 100006, 1006, 'Jane Smith', '2023-04-23'),
(1000000000003, 100007, 1007, 'Michael Johnson', '2023-04-26'),
(1000000000004, 100010, 1010, 'Sarah Wilson', '2023-04-27'),
(1000000000005, 100012, 1012, 'David Brown', '2023-04-29'),
(1000000000006, 100014, 1014, 'Emily Davis', '2023-04-30'),
(1000000000007, 100015, 1015, 'William Garcia', '2023-05-03'),
(1000000000008, 100018, 1018, 'Samantha Hernandez', '2023-05-06'),
(1000000000009, 100019, 1019, 'Daniel Lee', '2023-05-08'),
(1000000000010, 100020, 1020, 'Olivia Lopez', '2023-05-11');

--Creating a table for Billing Information
CREATE TABLE Billing
(
    Billing_ID VARCHAR(15) NOT NULL,
    Admission_ID INT NOT NULL,
    Insurance_ID VARCHAR(15) NOT NULL,
    Room_ID INT,
	Date_Time_bill DATETIME NOT NULL,
CONSTRAINT Billing_PK PRIMARY KEY (Billing_ID),
CONSTRAINT Billing_FK1 FOREIGN KEY (Admission_ID) REFERENCES Admission (Admission_ID),  
CONSTRAINT Billing_FK2 FOREIGN KEY (Insurance_ID) REFERENCES Insurance (Insurance_ID),
CONSTRAINT Billing_FK3 FOREIGN KEY (Room_ID) REFERENCES Room (Room_ID),  
);

--Inserting values in the billing table
INSERT INTO Billing
VALUES (100000000001, 100001, 10000000001, NULL, '2023-04-10 10:30:00'),
       (100000000002, 100002, 10000000002, 10000001, '2023-04-26 9:15:00'),
	   (100000000003, 100003, 10000000003, NULL, '2023-04-11 12:00:00'),
	   (100000000004, 100004, 10000000004, NULL, '2023-04-11 13:00:00'),
	   (100000000005, 100005, 10000000005, NULL, '2023-04-12 14:00:00'),
	   (100000000006, 100006, 10000000006, 10000003, '2023-04-25 13:15:00'),
	   (100000000007, 100007, 10000000007, 10000005, '2023-04-28 10:00:00'),
	   (100000000008, 100008, 10000000008, NULL, '2023-04-13 10:00:00'),
	   (100000000009, 100009, 10000000009, NULL, '2023-04-14 11:00:00'),
	   (100000000010, 100010, 10000000010, 10000007, '2023-05-02 16:15:00'),
	   (100000000011, 100011, 10000000011, NULL, '2023-04-15 13:00:00'),
	   (100000000012, 100012, 10000000012, 10000009, '2023-05-04 9:45:00'),
	   (100000000013, 100013, 10000000013, NULL, '2023-04-15 15:00:00'),
	   (100000000014, 100014, 10000000014, 10000011, '2023-07-05 11:15:00'),
	   (100000000015, 100015, 10000000015, 10000013, '2023-05-09 16:00:00'),
	   (100000000016, 100016, 10000000016, NULL, '2023-04-16 11:00:00'),
	   (100000000017, 100017, 10000000017, NULL, '2023-04-16 12:00:00'),
	   (100000000018, 100018, 10000000018, 10000015, '2023-05-12 14:15:00'),
	   (100000000019, 100019, 10000000019, 10000017, '2023-05-14 11:00:00'),
	   (100000000020, 100020, 10000000020, 10000019, '2023-05-17 15:45:00');

-- Stored Procedure 4
-- This stored proceudre diplays all the necessary information about the doctors that are available at the time
GO
CREATE or ALTER PROCEDURE Available_Doctors
    @DoctorID INT = NULL,
    @Doctor_First_Name VARCHAR(10) = NULL,
    @Doctor_Last_Name VARCHAR(10) = NULL,
    @Speciality VARCHAR(15) = NULL,
    @Availabilty VARCHAR(5) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DoctorID, Doctor_First_Name, Doctor_Last_Name, Speciality
    FROM Doctor
    WHERE (@DoctorID IS NULL OR DoctorID = @DoctorID)
    AND (@Doctor_First_Name IS NULL OR Doctor_First_Name = @Doctor_First_Name)
    AND (@Doctor_Last_Name IS NULL OR Doctor_Last_Name = @Doctor_Last_Name)
    AND (@Speciality IS NULL OR Speciality = @Speciality)
    AND (@Availabilty IS NULL OR Availabilty = @Availabilty)
    AND Availabilty = 'Y';
END

EXEC Available_Doctors NULL, NULL, NULL, NULL, 'Y';
GO

--Stored Procedure 5
--This stored procedure will help us see all the available rooms at a particular time 
GO
CREATE or ALTER PROCEDURE Available_Rooms
    @Room_ID INT = NULL,
    @Room_category CHAR(9) = NULL,
    @Room_price DECIMAL = NULL,
    @Room_number INT = NULL,
    @Room_availability VARCHAR(9) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Room_ID, Room_category, Room_price, Room_number
    FROM Room
    WHERE (@Room_ID IS NULL OR Room_ID = @Room_ID)
    AND (@Room_Category IS NULL OR Room_Category = @Room_Category)
    AND (@Room_Price IS NULL OR Room_Price = @Room_Price)
    AND (@Room_number IS NULL OR Room_number = @Room_number)
    AND (@Room_availability IS NULL OR Room_availability = @Room_availability)
    AND Room_availability = 'Yes';
END

EXEC Available_Rooms NULL, NULL, NULL, NULL, 'Yes';
GO

--Creating a non-clustered index for the patient table
CREATE NONCLUSTERED INDEX patients_name_idx ON Patient (Patient_Last_Name);

--Creating a non-clustered index for the appointment table 
CREATE NONCLUSTERED INDEX appointments_date_idx ON Appointment (Date_Time_Apt);

--Creating a non-clustered index on the doctors table
CREATE NONCLUSTERED INDEX doctors_specialization_idx ON Doctor (Speciality);

--Creating a non-clustered index for the room table
CREATE NONCLUSTERED INDEX RoomNumber_idx ON Room (Room_number);

--Creating a non-clustered index for the visitors table
CREATE NONCLUSTERED INDEX visitors_patient_date_idx ON Visitors (Patient_ID, Date_of_Visit);

--Creating a View 
--View - Patient, Doctor

GO
CREATE VIEW PatientDoctor AS
SELECT p.Patient_ID, p.Patient_First_Name, p.Patient_Last_Name, dr.DoctorID, dr.Doctor_First_Name, dr.Doctor_Last_Name, dr.Speciality
FROM Patient p
JOIN Appointment a ON p.Patient_ID = a.Patient_ID
JOIN Admission ad ON a.Appointment_ID = ad.Appointment_ID
JOIN Doctor dr ON ad.DoctorID = dr.DoctorID;

GO
SELECT Patient_First_Name, Patient_Last_Name, Doctor_First_Name, Doctor_Last_Name, Speciality FROM PatientDoctor;

--Creating a View
--View - Patient, Rooms

GO
CREATE VIEW PatientRooms AS
SELECT p.Patient_ID, p.Patient_First_Name, p.Patient_Last_Name, ro.Room_ID, ro.Room_number
FROM Patient p
JOIN Appointment a ON p.Patient_ID = a.Patient_ID
JOIN Admission ad ON a.Appointment_ID = ad.Appointment_ID
JOIN INPATIENT ip ON ad.Admission_ID = ip.Admission_ID
JOIN Room ro ON ip.Room_ID = ro.Room_ID;

GO
SELECT Patient_First_Name, Patient_Last_Name, Room_number FROM PatientRooms;

--Creting a view 
--View - Patient,Prescription

GO
CREATE VIEW PatientPrescription AS
SELECT p.Patient_ID, p.Patient_First_Name, p.Patient_Last_Name, pr.Prescription_ID, pr.Medicines_Purchased
FROM Patient p
JOIN Appointment a ON p.Patient_ID = a.Patient_ID
JOIN Admission ad ON a.Appointment_ID = ad.Appointment_ID
JOIN Prescription pr ON ad.Admission_ID = pr.Admission_ID;

GO
SELECT Patient_First_Name, Patient_Last_Name, Medicines_Purchased FROM PatientPrescription;

--Creating a DML trigger for updating the patient address (Trigger 1)

CREATE TABLE AddressChangeHistory
(
    Patient_ID int not null,
    Old_Addr int,
    New_Addr int NULL,
    ChangeDate datetime null
);
GO
CREATE TRIGGER PatientChangeAddress
ON Patient
FOR UPDATE, INSERT
AS 
BEGIN
  -- Check if Zipcode column is updated
  IF UPDATE(Zipcode)
  BEGIN
    -- Insert records into AddressChangeHistory for updated records
    INSERT INTO AddressChangeHistory (Patient_ID, Old_Addr, New_Addr, ChangeDate)
    SELECT d.Patient_ID, d.Zipcode, i.Zipcode, GETDATE()
    FROM DELETED d
    JOIN INSERTED i ON d.Patient_ID = i.Patient_ID
    WHERE d.Zipcode <> i.Zipcode; -- Only insert if Zipcode value has changed
  END
END

--Sample Update Query
select Patient_ID, Zipcode
from Patient WHERE Patient_ID= 1003
update Patient set Zipcode = 94101 WHERE Patient_ID= 1003
select Patient_ID, Old_Addr, New_Addr from [AddressChangeHistory]

-- Creating a DML Trigger to keep a tab on the appointment dates if changed (Trigger 2)
CREATE TABLE Appoint_Change_History
(
    Patient_ID int not null,
    Old_Appointment DATETIME,
    New_Appointment DATETIME NULL,
    Change_Date datetime null
);
--Creating a DML trigger for changing the appointment date
GO
CREATE TRIGGER PatientChangeAppoint
ON Appointment
FOR UPDATE, INSERT
AS 
BEGIN
  -- Check if Date_Time_Apt column is updated
  IF UPDATE(Date_Time_Apt)
  BEGIN
    -- Insert records into AppointChangeHistory for updated records
    INSERT INTO Appoint_Change_History (Patient_ID, Old_Appointment, New_Appointment, Change_Date)
    SELECT d.Patient_ID, d.Date_Time_Apt, i.Date_Time_Apt, GETDATE()
    FROM DELETED d
    JOIN INSERTED i ON d.Patient_ID = i.Patient_ID
    WHERE d.Date_Time_Apt <> i.Date_Time_Apt; -- Only insert if Date_Time_Apt value has changed
  END
END
GO

--Sample Update query
select Appointment_ID, Date_Time_Apt
from Appointment WHERE Patient_ID= 1002
update Appointment set Date_Time_Apt ='2023-04-08 12:00:00' WHERE Patient_ID= 1002
select Old_Appointment, New_Appointment, Change_Date from [Appoint_Change_History]

--Creating an encryption code for the patient table in order to encrypt the contact info of the patients. 
-- Createing database master key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Hmsgroup@11';

-- Creating a certificate to encrypt the symmetric key
CREATE CERTIFICATE ContNo WITH SUBJECT = 'Patient Contact No';

-- Creating a symmetric key with the certificate and algorithm AES_256
CREATE SYMMETRIC KEY ContNo_SM
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE ContNo;

-- Encrypting the Contact_No column using the symmetric key
OPEN SYMMETRIC KEY ContNo_SM
DECRYPTION BY CERTIFICATE ContNo;
UPDATE dbo.Patient SET Contact_No = EncryptByKey(Key_GUID('ContNo_SM'), CONVERT(varchar, Contact_No));

--Sample code to see the encryption
select Contact_No from Patient;

-- Decrypting the Contact_No column using the symmetric key
OPEN SYMMETRIC KEY ContNo_SM
DECRYPTION BY CERTIFICATE ContNo;

SELECT Contact_No, CONVERT(varchar, DecryptByKey(Contact_No)) AS Decrypted_Contact_No FROM dbo.Patient;

--UDF for Inpatient 
GO
CREATE FUNCTION HospitalStayCost(@Admission_ID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @totalCost DECIMAL(10,2);

    SELECT @totalCost = 
        COALESCE(SUM(Lab.Cost), 0) +
        COALESCE(SUM(Room.Room_Price), 0) +
        COALESCE(SUM(Prescription.CostOfMedicines), 0) +
		COALESCE(SUM(Admission.ConsultationFee), 0)
    FROM Admission
    INNER JOIN Inpatient ON Admission.Admission_ID = Inpatient.Admission_ID 
    LEFT JOIN Lab ON Inpatient.Admission_ID = Lab.Admission_ID 
    LEFT JOIN Room ON Inpatient.Room_ID = Room.Room_ID
    LEFT JOIN Prescription ON Inpatient.Admission_ID = Prescription.Admission_ID
    WHERE Inpatient.Admission_ID = @Admission_ID;

    RETURN @totalCost;
END;
GO


SELECT Admission_ID, Room_ID, Date_Time_bill, Total_Bill, Bill_After_Insurance From Billing

--UDF For Outpatient

GO
CREATE FUNCTION HospitalOutpatientBill(@Admission_ID_Outpatient INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @totalCost_Outpatient DECIMAL(10,2);

    SELECT @totalCost_Outpatient = 
        COALESCE(SUM(Lab.Cost), 0) +
        COALESCE(SUM(Prescription.CostOfMedicines), 0) +
		COALESCE(SUM(Admission.ConsultationFee), 0)
    FROM Admission
    INNER JOIN OUTPATIENT ON Admission.Admission_ID = OUTPATIENT.Admission_ID 
    LEFT JOIN Lab ON OUTPATIENT.Admission_ID = Lab.Admission_ID 
    LEFT JOIN Prescription ON OUTPATIENT.Admission_ID = Prescription.Admission_ID
    WHERE OUTPATIENT.Admission_ID = @Admission_ID_Outpatient;

    RETURN @totalCost_Outpatient;
END;
GO


-- Creating Total Bill column which is the sum of 2 UDF columns: 
--1)HospitalStayCost, total cost for inpatients and 2) HospitalOutpatientBill, total cost for outpatients

ALTER TABLE Billing
ADD Total_Bill Decimal(10,2) NULL;

UPDATE Billing
SET Total_Bill = dbo.HospitalStayCost(Admission_ID) + dbo.HospitalOutpatientBill(Admission_ID);

--Adding a column Bill after the insurance claim amount subtracted

ALTER TABLE Billing
ADD Bill_After_Insurance DECIMAL;

UPDATE Billing
SET Bill_After_Insurance = 
    CASE 
        WHEN Billing.Total_Bill - Insurance.Insurance_Claim_Amt < 0 THEN 0 
        ELSE Billing.Total_Bill - Insurance.Insurance_Claim_Amt 
    END
FROM Billing INNER JOIN Insurance
ON Billing.Insurance_ID = Insurance.Insurance_ID;

SELECT Admission_ID, Room_ID, Date_Time_bill, Total_Bill, Bill_After_Insurance From Billing
