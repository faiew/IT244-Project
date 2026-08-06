-- View: Display appointment details with patient and staff information
DROP VIEW IF EXISTS AppointmentDetails;

CREATE VIEW AppointmentDetails AS
SELECT
    Appointment.AppointmentID,
    Patient.FirstName AS PatientFirstName,
    Patient.LastName AS PatientLastName,
    Staff.FirstName AS StaffFirstName,
    Staff.LastName AS StaffLastName,
    Appointment.AppointmentDate,
    Appointment.Status
FROM Appointment
JOIN Patient
ON Appointment.PatientID = Patient.PatientID
JOIN Staff
ON Appointment.StaffID = Staff.StaffID;

DELIMITER $$

DROP TRIGGER IF EXISTS UpdateMedicineStock$$

CREATE TRIGGER UpdateMedicineStock
AFTER INSERT ON Prescription
FOR EACH ROW
BEGIN
    UPDATE Medicine
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE MedicineID = NEW.MedicineID;
END$$

DELIMITER ;
