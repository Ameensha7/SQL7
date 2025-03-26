CREATE TABLE Products (
ProductID INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(255),
Price DECIMAL(10, 2)
);
INSERT INTO Products (ProductName, Price)
VALUES ('Product A', 200), ('Product B', 300), ('Product C', 400);

DELIMITER $$
CREATE PROCEDURE UpdatePrice(
IN selected_id INT
)
BEGIN
DECLARE current_price DECIMAL(10, 2);
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
SELECT 'An error occurred while updating the price' AS ErrorMessage;
END;
SELECT Price INTO current_price
FROM Products
WHERE ProductID = selected_id;
IF current_price IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Record not found for the given ProductID';
END IF;
UPDATE Products
SET Price = Price + 100
WHERE ProductID = selected_id;
SELECT * FROM Products;
END$$
DELIMITER ;

CALL UpdatePrice(1);