DELIMITER $$ 
CREATE PROCEDURE FindFactorial(IN num INT, OUT result BIGINT) 
BEGIN 
DECLARE i INT DEFAULT 1; 
SET result = 1;           
IF num < 0 THEN 
SET result = NULL; 
ELSE 
WHILE i <= num DO 
SET result = result * i; 
SET i = i + 1; 
END WHILE; 
END IF; 
END$$ 
DELIMITER ;

CALL FindFactorial(7, @factorial); 
SELECT @factorial;