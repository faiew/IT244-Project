USE SmartClinicDB;


-- VIEW

DROP VIEW IF EXISTS AppointmentDetails;

CREATE VIEW AppointmentDetails AS
SELECT
    a.AppointmentID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    s.FirstName AS StaffFirstName,
    s.LastName AS StaffLastName,
    a.AppointmentDate,
    a.Status
FROM Appointment a
JOIN Patient p
    ON a.PatientID = p.PatientID
JOIN Staff s
    ON a.StaffID = s.StaffID;


-- Test the view

SELECT *
FROM AppointmentDetails;


-- TRIGGER

DROP TRIGGER IF EXISTS UpdateMedicineStock;

DELIMITER $$

CREATE TRIGGER UpdateMedicineStock
AFTER INSERT ON Prescription
FOR EACH ROW
BEGIN
    UPDATE Medicine
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE MedicineID = NEW.MedicineID;
END$$

DELIMITER ;


-- Test the trigger

INSERT INTO Prescription
(PrescriptionID, TreatmentID, MedicineID, Dosage, Quantity, DurationDays)
VALUES
(3006, 2005, 501, '1 tablet daily', 5, 5);

SELECT *
FROM Medicine
WHERE MedicineID = 501;