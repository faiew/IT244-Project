-- Smart Clinic Database System
-- Course: IT244 - Introduction to Database
-- CRN: 50246
-- Semester: Summer 2026
-- Database: SmartClinicDB


-- 1. DATABASE CREATION

DROP DATABASE IF EXISTS SmartClinicDB;

CREATE DATABASE SmartClinicDB;

USE SmartClinicDB;


-- 2. TABLE CREATION

-- Department Table

CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(50) NOT NULL,
 Location VARCHAR(50),
 Extension VARCHAR(10)
);


-- Patient Table

CREATE TABLE Patient (
 PatientID INT PRIMARY KEY,
 FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 DateOfBirth DATE NOT NULL,
 Gender VARCHAR(10),
 Phone VARCHAR(15) NOT NULL,
 Address VARCHAR(100),
 Email VARCHAR(50) UNIQUE
);


-- Staff Table

CREATE TABLE Staff (
 StaffID INT PRIMARY KEY,
 FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 Phone VARCHAR(15) NOT NULL,
 HireDate DATE NOT NULL,
 DepartmentID INT NOT NULL,
 FOREIGN KEY (DepartmentID)
 REFERENCES Department(DepartmentID)
);


-- Doctor Table

CREATE TABLE Doctor (
 StaffID INT PRIMARY KEY,
 Specialization VARCHAR(50) NOT NULL,
 LicenseNumber VARCHAR(20) NOT NULL UNIQUE,
 ConsultationFee DECIMAL(6,2) NOT NULL,
 FOREIGN KEY (StaffID)
 REFERENCES Staff(StaffID)
);


-- Nurse Table

CREATE TABLE Nurse (
 StaffID INT PRIMARY KEY,
 ShiftType VARCHAR(20) NOT NULL,
 CertificationLevel VARCHAR(30) NOT NULL,
 FOREIGN KEY (StaffID)
 REFERENCES Staff(StaffID)
);


-- Receptionist Table

CREATE TABLE Receptionist (
 StaffID INT PRIMARY KEY,
 DeskNumber VARCHAR(10) NOT NULL,
 FOREIGN KEY (StaffID)
 REFERENCES Staff(StaffID)
);


-- Medicine Table

CREATE TABLE Medicine (
 MedicineID INT PRIMARY KEY,
 MedicineName VARCHAR(80) NOT NULL,
 Manufacturer VARCHAR(60) NOT NULL,
 UnitPrice DECIMAL(6,2) NOT NULL,
 StockQuantity INT NOT NULL
);


-- Appointment Table

CREATE TABLE Appointment (
 AppointmentID INT PRIMARY KEY,
 PatientID INT NOT NULL,
 StaffID INT NOT NULL,
 AppointmentDate DATE NOT NULL,
 AppointmentTime TIME NOT NULL,
 Status VARCHAR(20) NOT NULL,
 Reason VARCHAR(150),
 FOREIGN KEY (PatientID)
 REFERENCES Patient(PatientID),
 FOREIGN KEY (StaffID)
 REFERENCES Staff(StaffID)
);


-- Treatment Table

CREATE TABLE Treatment (
 TreatmentID INT PRIMARY KEY,
 AppointmentID INT NOT NULL,
 TreatmentName VARCHAR(80) NOT NULL,
 Description VARCHAR(200),
 Cost DECIMAL(8,2) NOT NULL,
 TreatmentDate DATE NOT NULL,
 FOREIGN KEY (AppointmentID)
 REFERENCES Appointment(AppointmentID)
);


-- Prescription Table

CREATE TABLE Prescription (
 PrescriptionID INT PRIMARY KEY,
 TreatmentID INT NOT NULL,
 MedicineID INT NOT NULL,
 Dosage VARCHAR(30) NOT NULL,
 Quantity INT NOT NULL,
 DurationDays INT NOT NULL,
 FOREIGN KEY (TreatmentID)
 REFERENCES Treatment(TreatmentID),
 FOREIGN KEY (MedicineID)
 REFERENCES Medicine(MedicineID)
);


-- Payment Table

CREATE TABLE Payment (
 PaymentID INT PRIMARY KEY,
 AppointmentID INT NOT NULL,
 Amount DECIMAL(8,2) NOT NULL,
 PaymentDate DATE NOT NULL,
 PaymentMethod VARCHAR(20) NOT NULL,
 PaymentStatus VARCHAR(20) NOT NULL,
 FOREIGN KEY (AppointmentID)
 REFERENCES Appointment(AppointmentID)
);


-- 3. SAMPLE DATA

-- Department Data

INSERT INTO Department
(DepartmentID, DepartmentName, Location, Extension)
VALUES
(1, 'Cardiology', 'Building A - Floor 2', '101'),
(2, 'Pediatrics', 'Building B - Floor 1', '102'),
(3, 'Orthopedics', 'Building A - Floor 3', '103'),
(4, 'Dermatology', 'Building C - Floor 2', '104'),
(5, 'Dentistry', 'Building B - Floor 2', '105');


-- Patient Data

INSERT INTO Patient
(PatientID, FirstName, LastName, DateOfBirth, Gender, Phone, Address, Email)
VALUES
(101, 'Shahad', 'Faris', '1993-12-26', 'Female', '0501112233', 'Riyadh', 'shahad@email.com'),
(102, 'Rawan', 'Al-Mohammadi', '1993-11-02', 'Female', '0502223344', 'Jeddah', 'rawan@email.com'),
(103, 'Mohammed', 'Al-Ghamdi', '1990-05-15', 'Male', '0503334455', 'Riyadh', 'mohammed@email.com'),
(104, 'Sara', 'Al-Ahmadi', '1995-08-22', 'Female', '0504445566', 'Jeddah', 'sara@email.com'),
(105, 'Ali', 'Al-Shehri', '1988-12-10', 'Male', '0505556677', 'Dammam', 'ali@email.com');


-- Staff Data

INSERT INTO Staff
(StaffID, FirstName, LastName, Phone, HireDate, DepartmentID)
VALUES
(1, 'Fahad', 'Al-Zahrani', '0551111111', '2020-01-15', 1),
(2, 'Mona', 'Al-Harbi', '0552222222', '2021-03-10', 2),
(3, 'Khalid', 'Al-Omari', '0553333333', '2019-06-01', 3),
(4, 'Reem', 'Al-Otaibi', '0554444444', '2022-02-20', 1),
(5, 'Omar', 'Al-Saeed', '0555555555', '2023-05-05', 5),
(6, 'Sara', 'Ahmed', '0556666666', '2024-01-10', 2),
(7, 'Noura', 'Ali', '0557777777', '2023-05-15', 3),
(8, 'Lama', 'Khalid', '0558888888', '2022-08-20', 4),
(9, 'Huda', 'Faisal', '0559999999', '2021-11-05', 5),
(10, 'Ahmed', 'Saleh', '0551010101', '2024-02-15', 4),
(11, 'Noor', 'Hassan', '0551111112', '2024-03-20', 5),
(12, 'Maha', 'Ali', '0551212121', '2024-04-10', 1),
(13, 'Lina', 'Saad', '0551313131', '2024-05-15', 2),
(14, 'Rana', 'Omar', '0551414141', '2024-06-20', 3),
(15, 'Hala', 'Nasser', '0551515151', '2024-07-25', 5);


-- Doctor Data

INSERT INTO Doctor
(StaffID, Specialization, LicenseNumber, ConsultationFee)
VALUES
(1, 'Cardiologist', 'LIC-1001', 300.00),
(2, 'Pediatrician', 'LIC-1002', 250.00),
(3, 'Orthopedic Surgeon', 'LIC-1003', 350.00),
(10, 'Dermatologist', 'LIC-1004', 280.00),
(11, 'Dentist', 'LIC-1005', 220.00);


-- Nurse Data

INSERT INTO Nurse
(StaffID, ShiftType, CertificationLevel)
VALUES
(4, 'Night', 'Senior Nurse'),
(6, 'Morning', 'Registered Nurse'),
(7, 'Evening', 'Senior Nurse'),
(8, 'Night', 'Licensed Nurse'),
(9, 'Morning', 'Head Nurse');


-- Receptionist Data

INSERT INTO Receptionist
(StaffID, DeskNumber)
VALUES
(5, 'Desk-01'),
(12, 'Desk-02'),
(13, 'Desk-03'),
(14, 'Desk-04'),
(15, 'Desk-05');


-- Medicine Data

INSERT INTO Medicine
(MedicineID, MedicineName, Manufacturer, UnitPrice, StockQuantity)
VALUES
(501, 'Aspirin 100mg', 'PharmaCorp', 15.50, 100),
(502, 'Amoxicillin 500mg', 'MediHealth', 45.00, 50),
(503, 'Ibuprofen 400mg', 'CureAll', 20.00, 80),
(504, 'Paracetamol 500mg', 'HealthPlus', 12.00, 120),
(505, 'Vitamin C', 'WellCare', 18.00, 200);


-- Appointment Data

INSERT INTO Appointment
(AppointmentID, PatientID, StaffID, AppointmentDate, AppointmentTime, Status, Reason)
VALUES
(1001, 101, 1, '2026-07-20', '09:00:00', 'Completed', 'General consultation'),
(1002, 102, 2, '2026-07-21', '10:30:00', 'Completed', 'Routine checkup'),
(1003, 103, 3, '2026-07-22', '11:00:00', 'Scheduled', 'Knee pain evaluation'),
(1004, 104, 10, '2026-07-23', '01:00:00', 'Completed', 'Skin examination'),
(1005, 105, 11, '2026-07-24', '02:30:00', 'Scheduled', 'Dental checkup');


-- Treatment Data

INSERT INTO Treatment
(TreatmentID, AppointmentID, TreatmentName, Description, Cost, TreatmentDate)
VALUES
(2001, 1001, 'General Examination', 'Routine health assessment', 120.00, '2026-07-20'),
(2002, 1002, 'Physical Examination', 'General physical checkup', 100.00, '2026-07-21'),
(2003, 1003, 'Knee Assessment', 'Physical examination of the knee', 180.00, '2026-07-22'),
(2004, 1004, 'Skin Examination', 'Dermatology examination', 150.00, '2026-07-23'),
(2005, 1005, 'Dental Examination', 'Dental health assessment', 110.00, '2026-07-24');


-- Prescription Data

INSERT INTO Prescription
(PrescriptionID, TreatmentID, MedicineID, Dosage, Quantity, DurationDays)
VALUES
(3001, 2001, 501, '1 tablet daily', 30, 30),
(3002, 2002, 502, '1 capsule every 8 hours', 21, 7),
(3003, 2003, 503, '1 tablet twice daily', 20, 10),
(3004, 2004, 504, '2 tablets daily', 14, 7),
(3005, 2005, 505, '1 tablet daily', 30, 30);


-- Payment Data

INSERT INTO Payment
(PaymentID, AppointmentID, Amount, PaymentDate, PaymentMethod, PaymentStatus)
VALUES
(4001, 1001, 120.00, '2026-07-20', 'Credit Card', 'Paid'),
(4002, 1002, 100.00, '2026-07-21', 'Cash', 'Paid'),
(4003, 1003, 180.00, '2026-07-22', 'Insurance', 'Pending'),
(4004, 1004, 150.00, '2026-07-23', 'Credit Card', 'Paid'),
(4005, 1005, 110.00, '2026-07-24', 'Cash', 'Paid');


-- 4. SELECT STATEMENTS

-- Display all patient records

SELECT *
FROM Patient;


-- Display all medicine records

SELECT *
FROM Medicine;


-- Display completed appointments

SELECT *
FROM Appointment
WHERE Status = 'Completed';


-- 5. JOIN QUERIES

-- Display patient names, appointment dates, and assigned staff

SELECT
 p.FirstName,
 p.LastName,
 a.AppointmentDate,
 s.FirstName AS StaffFirstName,
 s.LastName AS StaffLastName
FROM Patient p
JOIN Appointment a
 ON p.PatientID = a.PatientID
JOIN Staff s
 ON a.StaffID = s.StaffID;


-- Display patient names, treatments, and treatment costs

SELECT
 p.FirstName,
 p.LastName,
 t.TreatmentName,
 t.Cost
FROM Patient p
JOIN Appointment a
 ON p.PatientID = a.PatientID
JOIN Treatment t
 ON a.AppointmentID = t.AppointmentID;


-- 6. NESTED QUERIES

-- Find treatments with costs higher than the average treatment cost

SELECT
 TreatmentName,
 Cost
FROM Treatment
WHERE Cost > (
 SELECT AVG(Cost)
 FROM Treatment
);


-- Find patients whose appointments were handled by StaffID 1

SELECT
 FirstName,
 LastName
FROM Patient
WHERE PatientID IN (
 SELECT PatientID
 FROM Appointment
 WHERE StaffID = 1
);


-- 7. AGGREGATE FUNCTIONS WITH GROUP BY

-- Count the number of appointments assigned to each staff member

SELECT
 StaffID,
 COUNT(AppointmentID) AS TotalAppointments
FROM Appointment
GROUP BY StaffID;


-- Calculate the total payment amount for each appointment

SELECT
 AppointmentID,
 SUM(Amount) AS TotalPayment
FROM Payment
GROUP BY AppointmentID;


-- 8. UPDATE STATEMENT

-- Change the payment status of PaymentID 4003

UPDATE Payment
SET PaymentStatus = 'Paid'
WHERE PaymentID = 4003;


-- Verify the updated payment record

SELECT *
FROM Payment
WHERE PaymentID = 4003;


-- 9. DELETE STATEMENT

-- Remove PrescriptionID 3005

DELETE FROM Prescription
WHERE PrescriptionID = 3005;


-- Verify the remaining prescription records

SELECT *
FROM Prescription;


-- 10. VIEW

-- Create a view for patient appointment information

DROP VIEW IF EXISTS PatientAppointments;

CREATE VIEW PatientAppointments AS
SELECT
 p.PatientID,
 p.FirstName,
 p.LastName,
 a.AppointmentDate,
 a.AppointmentTime,
 a.Status
FROM Patient p
JOIN Appointment a
 ON p.PatientID = a.PatientID;


-- Test the view

SELECT *
FROM PatientAppointments;


-- 11. TRIGGER

-- Create a trigger to automatically update medicine stock
-- when a new prescription is inserted

DROP TRIGGER IF EXISTS UpdateMedicineStock;

DELIMITER //

CREATE TRIGGER UpdateMedicineStock
AFTER INSERT ON Prescription
FOR EACH ROW
BEGIN
 UPDATE Medicine
 SET StockQuantity = StockQuantity - NEW.Quantity
 WHERE MedicineID = NEW.MedicineID;
END //

DELIMITER ;


-- 12. TRIGGER TEST

-- Insert a new prescription to test the trigger

INSERT INTO Prescription
(PrescriptionID, TreatmentID, MedicineID, Dosage, Quantity, DurationDays)
VALUES
(3006, 2005, 501, '1 tablet daily', 5, 5);


-- Check the medicine stock after the trigger execution

SELECT *
FROM Medicine
WHERE MedicineID = 501;