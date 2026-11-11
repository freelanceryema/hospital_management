CREATE TABLE patient_logs(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT UNSIGNED,
    action_type VARCHAR(20),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_patient_logs
AFTER INSERT ON patients
FOR EACH ROW
BEGIN
  INSERT INTO patient_logs(
    patient_id, action_type
  )VALUES(
    NEW.patient_id, 'INSERT'
  );  
END //
DELIMITER ;
SELECT* FROM patient_logs;