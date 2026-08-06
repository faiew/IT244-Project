-- Display all patients
SELECT *
FROM Patient;

-- Display all departments
SELECT *
FROM Department;

-- Display appointments with patient names
SELECT
    Appointment.AppointmentID,
    Patient.FirstName,
    Patient.LastName,
    Appointment.AppointmentDate,
    Appointment.Status
FROM Appointment
JOIN Patient
ON Appointment.PatientID = Patient.PatientID;

-- Display staff members with their departments
SELECT
    Staff.FirstName,
    Staff.LastName,
    Department.DepartmentName
FROM Staff
JOIN Department
ON Staff.DepartmentID = Department.DepartmentID;

-- Count number of appointments for each patient
SELECT
    PatientID,
    COUNT(AppointmentID) AS NumberOfAppointments
FROM Appointment
GROUP BY PatientID;

-- Find patients who have appointments
SELECT
    FirstName,
    LastName
FROM Patient
WHERE PatientID IN (
    SELECT PatientID
    FROM Appointment
);

-- Update medicine stock
UPDATE Medicine
SET StockQuantity = StockQuantity + 20
WHERE MedicineID = 501;

-- Delete a payment record
DELETE FROM Payment
WHERE PaymentID = 4005;
