CREATE TABLE Sailors ( 
sid INT PRIMARY KEY, 
name VARCHAR(50), 
rating INT 
); 
INSERT INTO Sailors (sid, name, rating) 
VALUES 
(101, 'John', 5), 
(102, 'Mary', 3), 
(103, 'Alex', 4); 
DELIMITER $$ 
CREATE FUNCTION GetSailorRating(sailor_id INT) 
RETURNS INT 
DETERMINISTIC 
BEGIN 
DECLARE sailor_rating INT; 
SELECT rating INTO sailor_rating 
FROM Sailors 
WHERE sid = sailor_id; 
RETURN sailor_rating;
END$$ 
DELIMITER ; 

SELECT GetSailorRating(101) AS Rating; 