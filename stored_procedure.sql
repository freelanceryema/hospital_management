-- USE hospital_mini_db;
-- -- Stored Procedure তৈরি করুন
-- --  Patient ID দিয়ে Patient খোঁজা, IN Parameter ব্যবহার করা হয় বাইরে থেকে Stored Procedure-এর ভিতরে Data পাঠানোর জন্য।
-- DELIMITER //

-- CREATE PROCEDURE GetPatientDetails(
--     IN p_patient_id INT
-- )
-- BEGIN
--     SELECT*FROM patients WHERE patient_id = p_patient_id;

-- END//

DELIMITER ;
CALL GetPatientDetails(4);

