USE HOSPITAL_MANAGEMENT_SYSTEM_DMDD_PROJECT
GO

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