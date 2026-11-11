USE hospital_mini_db;
INSERT INTO departments(dept_name, description)
VALUES
('Medicine', 'General Medicine Department'),
('Cardiology', 'Heart Specialist Department'),
('Neurology', 'Brain and Nurve Department'),
('Orthopedics', 'Bone Specialist Department');
SELECT*from departments;

INSERT INTO doctors(dept_id, doctor_name, specialization, phone, consultation_fee)
VALUES
(1, 'Dr. Rahim Ahmed', 'General Physician', '01711111111', 500),
(2, 'Dr.Karim Hasan', 'Cardiologist','01722222222',800),
(3, 'Dr. Salma Akter', 'Neurologist','01733333333', 700),
(4,'Dr. Jamil Hosain','Medicine Specialist', '01744444444', 600);
SELECT* FROM doctors;

INSERT INTO patients(patient_name, gender,dob, phone, address) VALUES
('Abdul Rahim', 'Male','1995-05-15', '01811111111', 'Rahshahi'),
('Karim Ahmed', 'Male','1990-08-20', '01822222222', 'Dhaka'),
('Salma Akter', 'Female','1995-05-15', '0183333333', 'Bogura'),
('Nusrat Jahan', 'Female','2000-12-25', '01844444444', 'Rahshahi'),
('Jamal Uddin', 'Male','1985-07-18', '01855555555', 'Natore');
SELECT* FROM patients;



INSERT INTO appointments(patient_id, doctor_id, appt_date, appt_time, status)
VALUES
(1,1, '2026-11-10', '10:00:00', 'completed'),
(2,2, '2026-11-10', '11:00:00', 'completed'),
(3,3, '2026-11-10', '12:00:00', 'booked'),
(4,1, '2026-11-11', '10:00:00', 'completed'),
(5,4, '2026-11-11', '11:00:00', 'cancelled');
SELECT* FROM appointments;


INSERT INTO visits(patient_id, doctor_id, appt_id, symptoms, diagnosis, notes, consultaion_fee)
VALUES
(1,1,1,'Fever and headache', 'Viral Fever', 'Take rest', 500),
(2,2,2,'Chest Pain', 'Requires CArdiac Evaluation', 'Follo up required', 800);
SELECT* FROM visits;


INSERT INTO payments(visitor_id, amount, payment_method, receipt_no)values
(1, 300, 'cash', 'RC001'),
(1, 200, 'mobile_banking', 'RC002'),
(1, 800, 'cash', 'RC003');
SELECT* FROM payments;








