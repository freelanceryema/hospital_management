USE hospital_mini_db;

DELIMITER //

CREATE PROCEDURE sp_double_number(
    INOUT num INT
)
BEGIN

    SET num = num * 2;

END //

DELIMITER ;


SET @number = 10;

CALL sp_double_number(@number);

SELECT @number AS result;