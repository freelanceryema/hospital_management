USE hospital_mini_db;
DELIMITER //
CREATE TRIGGER before_patient_insert
BEFORE INSERT ON patients
FOR EACH ROW
BEGIN
    SET NEW.patient_name = TRIM(NEW.patient_name);
END //
DELIMITER ;

INSERT INTO patients(
    patient_name, gender, dob
)values
('   Lema   ', 'female', '1989-08-15');


