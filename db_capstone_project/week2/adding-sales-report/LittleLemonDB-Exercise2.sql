-- Task 1
CREATE PROCEDURE GetMaxQuantity()
BEGIN
  SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END;

CALL GetMaxQuantity();

-- Task 2
PREPARE GetOrderDetail FROM SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?;

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3
DELIMITER //
CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
  DELETE FROM Orders WHERE OrderID = OrderID;

  IF ROW_COUNT() > 0 THEN
    SELECT CONCAT('Order ', CAST(OrderID AS VARCHAR(10)), ' is cancelled') AS Confirmation;
  ELSE
    SELECT CONCAT('Order ', CAST(OrderID AS VARCHAR(10)), ' does not exist') AS Confirmation;
  END IF;
END //
DELIMITER ;
