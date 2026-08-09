USE SmartClinicDB;

-- 1. SELECT STATEMENTS

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


-- 2. JOIN QUERIES

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


-- 3. NESTED QUERIES

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


-- 4. AGGREGATE FUNCTIONS WITH GROUP BY

-- Count appointments for each staff member
SELECT
    StaffID,
    COUNT(AppointmentID) AS TotalAppointments
FROM Appointment
GROUP BY StaffID;

-- Calculate total payment for each appointment
SELECT
    AppointmentID,
    SUM(Amount) AS TotalPayment
FROM Payment
GROUP BY AppointmentID;


-- 5. UPDATE STATEMENT

-- Change the payment status of PaymentID 4003
UPDATE Payment
SET PaymentStatus = 'Paid'
WHERE PaymentID = 4003;

-- Verify the updated payment
SELECT *
FROM Payment
WHERE PaymentID = 4003;


-- 6. DELETE STATEMENT

-- Remove PrescriptionID 3005
DELETE FROM Prescription
WHERE PrescriptionID = 3005;

-- Verify the remaining prescriptions
SELECT *
FROM Prescription;