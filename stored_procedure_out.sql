USE hospital_mini_db;
-- OUT Parameter ব্যবহার করা হয় Stored Procedure থেকে বাইরে Result পাঠানোর জন্য।
DELIMITER //

CREATE PROCEDURE sp_count_patients(
    OUT total_patients INT
)
BEGIN
    SELECT COUNT(*) INTO total_patients FROM patients;
END//
DELIMITER ;
CALL sp_count_patients(@total);
SELECT @total AS total_patients;