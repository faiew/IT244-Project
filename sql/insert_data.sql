USE SmartClinicDB;

-- Insert into Department
INSERT INTO Department (DepartmentID, DepartmentName, Location, Extension) VALUES
(1, 'Cardiology', 'Building A - Floor 2', '101'),
(2, 'Pediatrics', 'Building B - Floor 1', '102'),
(3, 'Orthopedics', 'Building A - Floor 3', '103'),
(4, 'Dermatology', 'Building C - Floor 2', '104'),
(5, 'Dentistry', 'Building B - Floor 2', '105');

-- Insert into Patient
INSERT INTO Patient (PatientID, FirstName, LastName, DateOfBirth, Gender, Phone, Address, Email) VALUES
(101, 'Shahad', 'Faris', '1993-12-26', 'Female', '0501112233', 'Riyadh', 'shahad@email.com'),
(102, 'Rawan', 'Al-Mohammadi', '1993-11-02', 'Female', '0502223344', 'Jeddah', 'rawan@email.com'),
(103, 'Mohammed', 'Al-Ghamdi', '1990-05-15', 'Male', '0503334455', 'Riyadh', 'mohammed@email.com'),
(104, 'Sara', 'Al-Ahmadi', '1995-08-22', 'Female', '0504445566', 'Jeddah', 'sara@email.com'),
(105, 'Ali', 'Al-Shehri', '1988-12-10', 'Male', '0505556677', 'Dammam', 'ali@email.com');

-- Insert into Staff
INSERT INTO Staff (StaffID, FirstName, LastName, Phone, HireDate, DepartmentID) VALUES
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

-- Insert into Doctor
INSERT INTO Doctor (StaffID, Specialization, LicenseNumber, ConsultationFee) VALUES
(1, 'Cardiologist', 'LIC-1001', 300.00),
(2, 'Pediatrician', 'LIC-1002', 250.00),
(3, 'Orthopedic Surgeon', 'LIC-1003', 350.00),
(10, 'Dermatologist', 'LIC-1004', 280.00),
(11, 'Dentist', 'LIC-1005', 220.00);

-- Insert into Nurse
INSERT INTO Nurse (StaffID, ShiftType, CertificationLevel) VALUES
(4, 'Night', 'Senior Nurse'),
(6, 'Morning', 'Registered Nurse'),
(7, 'Evening', 'Senior Nurse'),
(8, 'Night', 'Licensed Nurse'),
(9, 'Morning', 'Head Nurse');

-- Insert into Receptionist
INSERT INTO Receptionist (StaffID, DeskNumber) VALUES
(5, 'Desk-01'),
(12, 'Desk-02'),
(13, 'Desk-03'),
(14, 'Desk-04'),
(15, 'Desk-05');

-- Insert into Medicine
INSERT INTO Medicine (MedicineID, MedicineName, Manufacturer, UnitPrice, StockQuantity) VALUES
(501, 'Aspirin 100mg', 'PharmaCorp', 15.50, 100),
(502, 'Amoxicillin 500mg', 'MediHealth', 45.00, 50),
(503, 'Ibuprofen 400mg', 'CureAll', 20.00, 80),
(504, 'Paracetamol 500mg', 'HealthPlus', 12.00, 120),
(505, 'Vitamin C', 'WellCare', 18.00, 200);

-- Insert into Appointment
INSERT INTO Appointment (AppointmentID, PatientID, StaffID, AppointmentDate, AppointmentTime, Status, Reason) VALUES
(1001, 101, 1, '2026-07-20', '09:00:00', 'Completed', 'General consultation'),
(1002, 102, 2, '2026-07-21', '10:30:00', 'Completed', 'Routine checkup'),
(1003, 103, 3, '2026-07-22', '11:00:00', 'Scheduled', 'Knee pain evaluation'),
(1004, 104, 10, '2026-07-23', '01:00:00', 'Completed', 'Skin examination'),
(1005, 105, 11, '2026-07-24', '02:30:00', 'Scheduled', 'Dental checkup');

-- Insert into Treatment
INSERT INTO Treatment (TreatmentID, AppointmentID, TreatmentName, Description, Cost, TreatmentDate) VALUES
(2001, 1001, 'General Examination', 'Routine health assessment', 120.00, '2026-07-20'),
(2002, 1002, 'Physical Examination', 'General physical checkup', 100.00, '2026-07-21'),
(2003, 1003, 'Knee Assessment', 'Physical examination of the knee', 180.00, '2026-07-22'),
(2004, 1004, 'Skin Examination', 'Dermatology examination', 150.00, '2026-07-23'),
(2005, 1005, 'Dental Examination', 'Dental health assessment', 110.00, '2026-07-24');

-- Insert into Prescription
INSERT INTO Prescription (PrescriptionID, TreatmentID, MedicineID, Dosage, Quantity, DurationDays) VALUES
(3001, 2001, 501, '1 tablet daily', 30, 30),
(3002, 2002, 502, '1 capsule every 8 hours', 21, 7),
(3003, 2003, 503, '1 tablet twice daily', 20, 10),
(3004, 2004, 504, '2 tablets daily', 14, 7),
(3005, 2005, 505, '1 tablet daily', 30, 30);

-- Insert into Payment
INSERT INTO Payment (PaymentID, AppointmentID, Amount, PaymentDate, PaymentMethod, PaymentStatus) VALUES
(4001, 1001, 120.00, '2026-07-20', 'Credit Card', 'Paid'),
(4002, 1002, 100.00, '2026-07-21', 'Cash', 'Paid'),
(4003, 1003, 180.00, '2026-07-22', 'Insurance', 'Pending'),
(4004, 1004, 150.00, '2026-07-23', 'Credit Card', 'Paid'),
(4005, 1005, 110.00, '2026-07-24', 'Cash', 'Paid');
