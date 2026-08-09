CREATE DATABASE IF NOT EXISTS SmartClinicDB;

USE SmartClinicDB;


-- Department

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50),
    Extension VARCHAR(10)
);


-- Patient

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


-- Staff

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


-- Doctor

CREATE TABLE Doctor (
    StaffID INT PRIMARY KEY,
    Specialization VARCHAR(50) NOT NULL,
    LicenseNumber VARCHAR(20) NOT NULL UNIQUE,
    ConsultationFee DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
);


-- Nurse

CREATE TABLE Nurse (
    StaffID INT PRIMARY KEY,
    ShiftType VARCHAR(20) NOT NULL,
    CertificationLevel VARCHAR(30) NOT NULL,
    FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
);


-- Receptionist

CREATE TABLE Receptionist (
    StaffID INT PRIMARY KEY,
    DeskNumber VARCHAR(10) NOT NULL,
    FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
);


-- Medicine

CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(80) NOT NULL,
    Manufacturer VARCHAR(60) NOT NULL,
    UnitPrice DECIMAL(6,2) NOT NULL,
    StockQuantity INT NOT NULL
);


-- Appointment

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


-- Treatment

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


-- Prescription

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


-- Payment

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