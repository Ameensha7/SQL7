CREATE TABLE Sailorss (
sid INT PRIMARY KEY,
sname VARCHAR(255),
rating INT
);
INSERT INTO Sailorss (sid, sname, rating)
VALUES
(1, 'John', 10),
(2, 'Jane', 7),
(3, 'Mark', 8);

DELIMITER $$
CREATE PROCEDURE DisplaySailorss()
BEGIN
DECLARE sailor_id INT;
DECLARE sailor_rating INT;
DECLARE done INT DEFAULT FALSE;
DECLARE sailor_cursor CURSOR FOR
SELECT sid, rating FROM Sailorss;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN sailor_cursor;
read_loop: LOOP
FETCH sailor_cursor INTO sailor_id, sailor_rating;
IF done THEN
LEAVE read_loop;
END IF;
SELECT sailor_id AS sid, sailor_rating AS rating;
END LOOP;
CLOSE sailor_cursor;
END$$
DELIMITER ;

CALL DisplaySailorss();