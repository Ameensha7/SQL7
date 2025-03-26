DELIMITER $$ 
CREATE PROCEDURE CheckPrimeNumber() 
BEGIN 
DECLARE num INT; 
DECLARE i INT DEFAULT 2; 
DECLARE is_prime BOOLEAN DEFAULT TRUE; 
SELECT 'Enter a number to check if it is prime:' AS Prompt; 
SET num = @user_input; 
IF num < 2 THEN 
SET is_prime = FALSE; 
ELSE 
WHILE i <= SQRT(num) DO 
IF num MOD i = 0 THEN 
SET is_prime = FALSE;      
END IF; 
SET i = i + 1; 
END WHILE; 
END IF; 
IF is_prime THEN 
SELECT CONCAT(num, ' is a prime number.') AS Result; 
ELSE 
SELECT CONCAT(num, ' is not a prime number.') AS Result; 
END IF; 
END$$ 
DELIMITER ; 

SET @user_input = 7;
CALL CheckPrimeNumber(); 