*CREATE DATABASE IF NOT EXISTS SmartClinicDB;
USE SmartClinicDB;
CREATE TABLE Department (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50) NOT NULL,
Location VARCHAR(50),
Extension VARCHAR(10)
);
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
CREATE TABLE Staff (
StaffID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Phone VARCHAR(15),
HireDate DATE,
DepartmentID INT,
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
CREATE TABLE Doctor (
StaffID INT PRIMARY KEY,
Specialization VARCHAR(50),
LicenseNumber VARCHAR(20),
ConsultationFee DECIMAL(6,2),
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE Nurse (
StaffID INT PRIMARY KEY,
ShiftType VARCHAR(20),
CertificationLevel VARCHAR(30),
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE Receptionist (
StaffID INT PRIMARY KEY,
DeskNumber VARCHAR(10),
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE Medicine (
MedicineID INT PRIMARY KEY,
MedicineName VARCHAR(80),
Manufacturer VARCHAR(60),
UnitPrice DECIMAL(6,2),
StockQuantity INT
);
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
CREATE TABLE Treatment (
TreatmentID INT PRIMARY KEY,
AppointmentID INT,
TreatmentName VARCHAR(80),
Description VARCHAR(200),
Cost DECIMAL(8,2),
TreatmentDate DATE,
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
CREATE TABLE Prescription (
PrescriptionID INT PRIMARY KEY,
TreatmentID INT,
MedicineID INT,
Dosage VARCHAR(30),
Quantity INT,
DurationDays INT,
FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID),
FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
;)
CREATE TABLE Payment (
PaymentID INT PRIMARY KEY,
AppointmentID INT,
Amount DECIMAL(8,2),
PaymentDate DATE,
PaymentMethod VARCHAR(20),
PaymentStatus VARCHAR(20),
FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
