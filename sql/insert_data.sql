*USE SmartClinicDB;
INSERT INTO Department VALUES
(1, 'Cardiology', 'First Floor', '101'),
(2, 'Dentistry', 'Second Floor', '102'),
(3, 'Reception', 'Ground Floor', '103');
INSERT INTO Patient VALUES
(1, 'Ahmed', 'Ali', '1995-05-10', 'Male', '0501111111', 'Riyadh', 'ahmed@email.com'),
(2, 'Sara', 'Mohammed', '2000-08-15', 'Female', '0502222222', 'Riyadh', 'sara@email.com'),
(3, 'Omar', 'Khalid', '1998-02-20', 'Male', '0503333333', 'Jeddah', 'omar@email.com');
INSERT INTO Staff VALUES
(1, 'Fahad', 'Salem', '0504444444', '2020-01-10', 1),
(2, 'Mona', 'Hassan', '0505555555', '2021-03-15', 2),
(3, 'Lina', 'Ahmed', '0506666666', '2022-06-20', 3);
INSERT INTO Doctor VALUES
(1, 'Cardiologist', 'DOC1001', 300.00);
INSERT INTO Nurse VALUES
(2, 'Morning', 'Level 2');
INSERT INTO Receptionist VALUES
(3, 'D01');
INSERT INTO Medicine VALUES
(1, 'Panadol', 'GSK', 10.00, 100),
(2, 'Antibiotic', 'Pfizer', 50.00, 50);
INSERT INTO Appointment VALUES
(1, 1, 1, '2026-08-01', '10:00:00', 'Completed', 'Heart checkup'),
(2, 2, 1, '2026-08-02', '11:30:00', 'Scheduled', 'General consultation');
INSERT INTO Treatment VALUES
(1, 1, 'Medical Examination', 'Basic heart examination', 200.00, '2026-08-01');
INSERT INTO Prescription VALUES
(1, 1, 1, '500mg twice daily', 10, 5);
INSERT INTO Payment VALUES
(1, 1, 200.00, '2026-08-01', 'Card', 'Paid');
