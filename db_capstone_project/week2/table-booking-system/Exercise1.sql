-- Task 1
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
    VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1)
;


-- Task 2
CREATE PROCEDURE CheckBooking(@BookingDate DATE, @TableNumber INT)
BEGIN
  DECLARE @BookingStatus VARCHAR(100);

  SELECT CASE
    WHEN EXISTS(SELECT 1 FROM Bookings WHERE BookingDate = @BookingDate AND TableNumber = @TableNumber) THEN
      SET @BookingStatus = CONCAT('Table ', CAST(@TableNumber AS VARCHAR(10)), ' is already booked')
    ELSE
      SET @BookingStatus = CONCAT('Table ', CAST(@TableNumber AS VARCHAR(10)), ' is available')
  END;

  SELECT @BookingStatus AS 'Booking status';
END;

-- Task 3
CREATE PROCEDURE AddValidBooking(@BookingDate DATE, @TableNumber INT)
BEGIN
  START TRANSACTION;

  DECLARE @BookingStatus VARCHAR(100);

  INSERT INTO Bookings (BookingDate, TableNumber) VALUES (@BookingDate, @TableNumber);

  -- Check if the table is already booked on the given date
  IF EXISTS(SELECT 1 FROM Bookings WHERE BookingDate = @BookingDate AND TableNumber = @TableNumber) THEN
    -- If the table is already booked, rollback the transaction and return an error message
    ROLLBACK TRANSACTION;
    SELECT CONCAT('Table ', CAST(@TableNumber AS VARCHAR(10)), ' is already booked - booking cancelled') AS 'Booking Status';
  ELSE
    -- If the table is not booked, commit the transaction and return a success message
    COMMIT TRANSACTION;
    SELECT CONCAT('Table ', CAST(@TableNumber AS VARCHAR(10)), ' is booked successfully.') AS 'Booking Status';
  END IF;

END;
