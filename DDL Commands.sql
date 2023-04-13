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

--Creating a table that consists all the information regarding the rooms
CREATE TABLE Room (
	Room_ID int not null PRIMARY KEY,
	Room_category varchar(10),
	Room_price int not null,
	Room_number int not null,
	Room_availability varchar(3) check (Room_availability in ('Yes', 'No'))
);


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


--Creating a table for outpatient 
CREATE TABLE OUTPATIENT (
  Admission_ID INT,
  Date_of_Next_Appointment DATE,
  CONSTRAINT Outpatient_PK PRIMARY KEY (Admission_ID),
  CONSTRAINT Outpatient_FK FOREIGN KEY (Admission_ID) REFERENCES Admission (Admission_ID)
);


--Creating a table for inpatient
CREATE TABLE INPATIENT (
  Admission_ID int PRIMARY KEY,
  Room_ID int,
  Date_Of_Discharge date,
  Date_Of_Admission date,
  CONSTRAINT Inpatient_FK FOREIGN KEY (Room_ID) REFERENCES Room (Room_ID),
  CONSTRAINT Inpatient_FK2 FOREIGN KEY (Admission_ID) REFERENCES Admission (Admission_ID)
);


--Creating a bridge table between Nurses and Inpatients
CREATE TABLE Assigned (
  Admission_ID INT NOT NULL,
  Nurse_ID INT NOT NULL,
  Date_Of_Assignment DATE NOT NULL,
  PRIMARY KEY (Admission_ID, Nurse_ID, Date_Of_Assignment)
);

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


--Audit table for noting the changes in the address
CREATE TABLE AddressChangeHistory
(
    Patient_ID int not null,
    Old_Addr int,
    New_Addr int NULL,
    ChangeDate datetime null
);



--Audit table for noting the changes in the appointment date and time
CREATE TABLE Appoint_Change_History
(
    Patient_ID int not null,
    Old_Appointment DATETIME,
    New_Appointment DATETIME NULL,
    Change_Date datetime null
);