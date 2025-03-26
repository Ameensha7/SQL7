CREATE TABLE Professor(
ProfessorID INT PRIMARY KEY,
Name VARCHAR(255),
Department VARCHAR(255)
);
INSERT INTO Professor (ProfessorID, Name, Department) VALUES
(1, 'Dr. Smith', 'Physics'),
(2, 'Dr. Johnson', 'Mathematics');

DELIMITER $$
CREATE TRIGGER RestrictProfessorDeletion
BEFORE DELETE ON Professor
FOR EACH ROW
BEGIN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Deletion of records from the Professor table is not allowed.';
END$$
DELIMITER ;

DELETE FROM Professor WHERE ProfessorID = 1;