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
CREATE PROCEDURE CancelOrder(@OrderID INT)
BEGIN
  DELETE FROM Orders WHERE OrderID = @OrderID;

-- The @@ROWCOUNT system variable in SQL returns the number of rows
-- affected by the last executed statement in the batch.
-- It can be used to check the success of INSERT, UPDATE, and DELETE statements.
  IF @@ROWCOUNT > 0 THEN
    SELECT 'Order ' + CAST(@OrderID AS VARCHAR(10)) + ' is cancelled' AS Confirmation;
  ELSE
    SELECT 'Order ' + CAST(@OrderID AS VARCHAR(10)) + ' does not exist' AS Confirmation;
  END IF;
END;
