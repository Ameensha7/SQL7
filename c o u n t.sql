CREATE TABLE Students(
StudentID INT PRIMARY KEY,
Name VARCHAR(255),
Gender ENUM('Male', 'Female')
);
CREATE TABLE StudentCounts(
Gender ENUM('Male', 'Female') PRIMARY KEY,
Count INT DEFAULT 0
);
INSERT INTO StudentCounts (Gender, Count)
VALUES ('Male', 0), ('Female', 0);

DELIMITER $$
CREATE TRIGGER UpdateCountsAfterInsert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
IF NEW.Gender = 'Male' THEN
UPDATE StudentCounts
SET Count = Count + 1
WHERE Gender = 'Male';
ELSEIF NEW.Gender = 'Female' THEN
UPDATE StudentCounts
SET Count = Count + 1
WHERE Gender = 'Female';
END IF;
END$$.

DELIMITER ;
DELIMITER $$
CREATE TRIGGER UpdateCountsAfterDelete
AFTER DELETE ON Students
FOR EACH ROW
BEGIN
IF OLD.Gender = 'Male' THEN
UPDATE StudentCounts
SET Count = Count - 1
WHERE Gender = 'Male';
ELSEIF OLD.Gender = 'Female' THEN
UPDATE StudentCounts
SET Count = Count - 1
WHERE Gender = 'Female';
END IF;
END$$
DELIMITER ;

INSERT INTO Students (StudentID, Name, Gender)
VALUES (1, 'John', 'Male'), (2, 'Jane', 'Female');
SELECT * FROM StudentCounts;
DELETE FROM Students WHERE StudentID = 1;
SELECT * FROM StudentCounts;