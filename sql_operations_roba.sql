-- ==========================================
-- Smart Clinic Database System
-- Task 2 - Full Database Creation & Data Insertion
-- ==========================================

CREATE DATABASE IF NOT EXISTS SmartClinicDB;
USE SmartClinicDB;

-- ==========================================
-- TABLE CREATION (DDL)
-- ==========================================

-- DEPARTMENT
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50),
    Extension VARCHAR(10)
);

-- PATIENT
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Address VARCHAR(100),
    Email VARCHAR(50)
);

-- STAFF
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15),
    HireDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- DOCTOR
CREATE TABLE Doctor (
    StaffID INT PRIMARY KEY,
    Specialization VARCHAR(50),
    LicenseNumber VARCHAR(20),
    ConsultationFee DECIMAL(6,2),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- NURSE
CREATE TABLE Nurse (
    StaffID INT PRIMARY KEY,
    ShiftType VARCHAR(20),
    CertificationLevel VARCHAR(30),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- RECEPTIONIST
CREATE TABLE Receptionist (
    StaffID INT PRIMARY KEY,
    DeskNumber VARCHAR(10),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- MEDICINE
CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(80),
    Manufacturer VARCHAR(60),
    UnitPrice DECIMAL(6,2),
    StockQuantity INT
);

-- APPOINTMENT
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    StaffID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Status VARCHAR(20),
    Reason VARCHAR(150),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- TREATMENT
CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY,
    AppointmentID INT,
    TreatmentName VARCHAR(80),
    Description VARCHAR(200),
    Cost DECIMAL(8,2),
    TreatmentDate DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- PRESCRIPTION
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    TreatmentID INT,
    MedicineID INT,
    Dosage VARCHAR(30),
    Quantity INT,
    DurationDays INT,
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID),
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
);

-- PAYMENT
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    AppointmentID INT,
    Amount DECIMAL(8,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- ==========================================
-- DATA INSERTION (DML)
-- ==========================================

-- 1. Departments
INSERT INTO Department (DepartmentID, DepartmentName, Location, Extension) VALUES
(1, 'Cardiology', 'Building A - Floor 2', '101'),
(2, 'Pediatrics', 'Building B - Floor 1', '102'),
(3, 'Orthopedics', 'Building A - Floor 3', '103'),
(4, 'Dermatology', 'Building C - Floor 1', '104'),
(5, 'Radiology', 'Building C - Floor 2', '105');

-- 2. Patients
INSERT INTO Patient (PatientID, FirstName, LastName, DateOfBirth, Gender, Phone, Address, Email) VALUES
(101, 'Mohammed', 'Al-Ghamdi', '1990-05-15', 'Male', '0501112233', 'Riyadh', 'mohammed@email.com'),
(102, 'Sara', 'Al-Ahmadi', '1995-08-22', 'Female', '0502223344', 'Jeddah', 'sara@email.com'),
(103, 'Ali', 'Al-Shehri', '1988-12-10', 'Male', '0503334455', 'Dammam', 'ali@email.com'),
(104, 'Huda', 'Al-Qahtani', '1992-03-19', 'Female', '0504445566', 'Riyadh', 'huda@email.com'),
(105, 'Yousef', 'Al-Dosari', '1985-11-02', 'Male', '0505556677', 'Jeddah', 'yousef@email.com');

-- 3. Staff
INSERT INTO Staff (StaffID, FirstName, LastName, Phone, HireDate, DepartmentID) VALUES
(1, 'Fahad', 'Al-Zahrani', '0551111111', '2020-01-15', 1),
(2, 'Mona', 'Al-Harbi', '0552222222', '2021-03-10', 2),
(3, 'Khalid', 'Al-Omari', '0553333333', '2019-06-01', 3),
(4, 'Reem', 'Al-Otaibi', '0554444444', '2022-02-20', 1),
(5, 'Omar', 'Al-Saeed', '0555555555', '2023-05-05', 1),
(6, 'Lama', 'Al-Harthi', '0556666666', '2021-09-01', 4),
(7, 'Tariq', 'Al-Malki', '0557777777', '2022-11-15', 5),
(8, 'Nada', 'Al-Rashid', '0558888888', '2020-04-10', 1),
(9, 'Faisal', 'Al-Qahtani', '0559999999', '2021-07-22', 2),
(10, 'Amal', 'Al-Zahrani', '0561111111', '2022-01-05', 3),
(11, 'Bandar', 'Al-Otaibi', '0562222222', '2023-03-18', 4),
(12, 'Haya', 'Al-Subaie', '0563333333', '2020-08-01', 1),
(13, 'Nasser', 'Al-Ghamdi', '0564444444', '2021-05-12', 2),
(14, 'Wafa', 'Al-Anzi', '0565555555', '2022-09-09', 3),
(15, 'Salem', 'Al-Bishi', '0566666666', '2023-02-28', 5);

-- 4. Doctors
INSERT INTO Doctor (StaffID, Specialization, LicenseNumber, ConsultationFee) VALUES
(1, 'Cardiologist', 'LIC-1001', 300.00),
(2, 'Pediatrician', 'LIC-1002', 250.00),
(3, 'Orthopedic Surgeon', 'LIC-1003', 350.00),
(6, 'Dermatologist', 'LIC-1004', 280.00),
(7, 'Radiologist', 'LIC-1005', 260.00);

-- 5. Nurses
INSERT INTO Nurse (StaffID, ShiftType, CertificationLevel) VALUES
(4, 'Night', 'Senior Nurse'),
(8, 'Morning', 'Registered Nurse'),
(9, 'Evening', 'Senior Nurse'),
(10, 'Night', 'Registered Nurse'),
(11, 'Morning', 'Practical Nurse');

-- 6. Receptionists
INSERT INTO Receptionist (StaffID, DeskNumber) VALUES
(5, 'Desk-01'),
(12, 'Desk-02'),
(13, 'Desk-03'),
(14, 'Desk-04'),
(15, 'Desk-05');

-- 7. Medicine
INSERT INTO Medicine (MedicineID, MedicineName, Manufacturer, UnitPrice, StockQuantity) VALUES
(501, 'Aspirin 100mg', 'PharmaCorp', 15.50, 100),
(502, 'Amoxicillin 500mg', 'MediHealth', 45.00, 50),
(503, 'Ibuprofen 400mg', 'CureAll', 20.00, 80),
(504, 'Paracetamol 500mg', 'HealthPlus', 10.00, 150),
(505, 'Cetirizine 10mg', 'AllerCare', 12.50, 60);

-- 8. Appointments
INSERT INTO Appointment (AppointmentID, PatientID, StaffID, AppointmentDate, AppointmentTime, Status, Reason) VALUES
(1001, 101, 1, '2026-07-20', '09:00:00', 'Completed', 'Chest discomfort'),
(1002, 102, 2, '2026-07-21', '10:30:00', 'Completed', 'Child fever checkup'),
(1003, 103, 3, '2026-07-22', '11:00:00', 'Scheduled', 'Knee pain evaluation'),
(1004, 104, 6, '2026-07-23', '13:00:00', 'Completed', 'Skin rash consultation'),
(1005, 105, 3, '2026-07-24', '09:30:00', 'Scheduled', 'Follow-up knee X-ray');

-- 9. Treatments
INSERT INTO Treatment (TreatmentID, AppointmentID, TreatmentName, Description, Cost, TreatmentDate) VALUES
(2001, 1001, 'ECG Test', 'Electrocardiogram check', 150.00, '2026-07-20'),
(2002, 1002, 'General Examination', 'Pediatric checkup and vitals', 100.00, '2026-07-21'),
(2003, 1001, 'Blood Pressure Check', 'Routine BP monitoring during cardiology visit', 50.00, '2026-07-20'),
(2004, 1003, 'Knee X-Ray', 'Radiographic imaging of the knee joint', 120.00, '2026-07-22'),
(2005, 1004, 'Skin Examination', 'Dermatological exam and rash assessment', 90.00, '2026-07-23');

-- 10. Prescriptions
INSERT INTO Prescription (PrescriptionID, TreatmentID, MedicineID, Dosage, Quantity, DurationDays) VALUES
(3001, 2001, 501, '1 tablet daily', 30, 30),
(3002, 2002, 502, '1 capsule every 8h', 21, 7),
(3003, 2003, 503, '1 tablet as needed', 10, 10),
(3004, 2004, 501, '1 tablet daily for pain', 15, 15),
(3005, 2005, 502, '1 capsule every 12h', 14, 7);

-- 11. Payments
INSERT INTO Payment (PaymentID, AppointmentID, Amount, PaymentDate, PaymentMethod, PaymentStatus) VALUES
(4001, 1001, 450.00, '2026-07-20', 'Credit Card', 'Paid'),
(4002, 1002, 350.00, '2026-07-21', 'Cash', 'Paid'),
(4003, 1001, 50.00, '2026-07-21', 'Cash', 'Paid'),
(4004, 1003, 470.00, '2026-07-22', 'Insurance', 'Paid'),
(4005, 1004, 370.00, '2026-07-23', 'Card', 'Paid');
