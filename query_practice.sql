USE hospital_mini_db;
SELECT* FROM patients;
-- query ORDER BY
SELECT* FROM patients
WHERE gender='Male' AND address='Dhaka'
ORDER BY dob;

-- query LIKE
SELECT* FROM patients
WHERE patient_name LIKE '%ma%'
ORDER BY dob;


-- query DISTINCT
SELECT DISTINCT gender
FROM patients;


SELECT* FROM doctors;
-- query BETWEEN
SELECT* FROM doctors
WHERE consultation_fee BETWEEN 500 AND 700;

-- query 5

UPDATE patients
SET phone='01900000000' WHERE patient_id =1;

SELECT* FROM appointments;
-- query JOIN or Inner Join
SELECT p.patient_name, d.doctor_name, a.appt_date, a.appt_time, a.status
FROM appointments a JOIN patients p ON a.patient_id =p.patient_id JOIN doctors d   
ON  a.doctor_id =d.doctor_id
ORDER BY appt_date;

-- query LEFT JOIN

SELECT p.patient_name, a.appt_date, a.status
FROM patients p LEFT JOIN appointments a ON
p.patient_id = a.appt_id;


-- query RIGHT JOIN

SELECT d.doctor_name, a.appt_date, a.status
FROM appointments a RIGHT JOIN doctors d  ON
a.doctor_id = d.doctor_id;


-- SELF JOIN
SELECT d1.doctor_name, d2.doctor_name
FROM doctors d1 JOIN doctors d2 ON
d1.dept_id =d2.dept_id;


-- aggregate
SELECT COUNT(*) AS total_patients
FROM patients;

SELECT ROUND(AVG(consultation_fee), 2) AS average_fee
FROM doctors;

SELECT d.dept_name, COUNT(do.doctor_id) AS total_doctors
FROM departments d LEFT JOIN doctors do ON
d.dept_id = do.dept_id
GROUP BY d.dept_id,d.dept_name;


-- subquery and advanced sql
SELECT * FROM doctors
WHERE consultation_fee > (
    SELECT AVG(consultation_fee) FROM doctors
);

-- CTE
WITH patient_list AS(
    SELECT * FROM patients WHERE gender ='Male'
)
SELECT* FROM patient_list;


-- ROW_NUMBER() 1
SELECT ROW_NUMBER() OVER() AS row_num, patient_id, patient_name, gender 
FROM patients;

-- according to patient id ROW_NUMBER()
SELECT 
    ROW_NUMBER()OVER(ORDER BY patient_id) AS row_num,
    patient_id, patient_name, gender FROM patients; 

SELECT ROW_NUMBER() OVER(ORDER BY gender),
 patient_id, patient_name, gender FROM patients; 

-- যাদের জন্মতারিখ আগে, তারা আগে আসবে।
SELECT ROW_NUMBER() OVER(ORDER BY dob DESC),
 patient_id, patient_name,dob, gender FROM patients; 

-- Gender অনুযায়ী আলাদা ROW_NUMBER() (PARTITION BY)

SELECT
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY patient_id) AS row_num,
    patient_name, gender FROM patients;


-- Top 3 Patients
SELECT* FROM(
    SELECT ROW_NUMBER()OVER(ORDER BY patient_id) AS row_num,
    patient_id, patient_name, gender FROM patients) AS TEMP
    WHERE row_num <=3;

-- CASE Expression
SELECT doctor_name, consultation_fee,
    CASE
        WHEN consultation_fee >=800 THEN 'High'
        WHEN consultation_fee >=500 THEN 'Medium'
        ELSE 'Low'
        END AS fee_category FROM doctors
        ORDER BY fee_category;
        
-- Payment Report with GROUP BY

SELECT visitor_id, SUM(amount) AS total_paid
FROM payments GROUP BY visitor_id;


-- যেসব Patient-এর Appointment আছে, তাঁদের খুঁজুন। using EXISTS
SELECT* FROM patients p WHERE EXISTS(
    SELECT 1 FROM appointments a WHERE a.patient_id = p.patient_id
);




-- Unit 3: Advanced SQL – Views, Procedures ও Triggers
-- Views use korle  বারবার JOIN লিখতে হবে না।

CREATE VIEW patient_apptiontment_views AS
    SELECT
        p.patient_name, p.gender, p.phone, a.appt_date, a.status, dep.dept_name
        FROM appointments a JOIN patients p  
        ON a.patient_id =p.patient_id JOIN doctors d ON
        a.doctor_id = d.doctor_id JOIN departments dep ON
        d.dept_id = dep.dept_id;

SELECT* FROM patient_apptiontment_views;



















