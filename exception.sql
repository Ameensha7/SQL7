DELIMITER $$
CREATE PROCEDURE HandleDivideByZero(
IN numerator INT,
IN denominator INT
)
BEGIN
DECLARE result DECIMAL(10, 2);
IF denominator = 0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Division by zero is not allowed.';
ELSE
SET result = numerator / denominator;
SELECT result AS DivisionResult;
END IF;
END$$
DELIMITER ;

CALL HandleDivideByZero(10, 2);
CALL HandleDivideByZero(10, 0);