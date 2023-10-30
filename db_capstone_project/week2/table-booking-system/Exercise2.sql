-- Task 1
CREATE PROCEDURE AddBooking(IN BookingID INT, IN CustomerID INT, IN BookingDate DATE, IN TableNumber INT)
BEGIN
  INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) VALUES (@BookingID, @CustomerID, @BookingDate, @TableNumber);

  IF @@ROWCOUNT > 0 THEN
    SELECT 'New booking added.' AS Confirmation;
  ELSE
    SELECT 'Unable to add new booking.' AS Confirmation;
  END IF;
END;

-- Task 2
CREATE PROCEDURE UpdateBooking(@BookingID INT, @BookingDate DATE)
BEGIN
  UPDATE Bookings SET BookingDate = @BookingDate WHERE BookingID = @BookingID;

  IF @@ROWCOUNT > 0 THEN
    SELECT CONCAT('Booking ', CAST(@BookingID AS VARCHAR(10)), ' updated successfully.') AS Confirmation;
  ELSE
    SELECT CONCAT('Booking with ID ', CAST(@BookingID AS VARCHAR(10)), ' does not exist. Update failed.') AS Confirmation;
  END IF;
END;

-- Task 3
CREATE PROCEDURE CancelBooking(@BookingID INT)
BEGIN
  IF EXISTS(SELECT 1 FROM Bookings WHERE BookingID = @BookingID)
  THEN
    DELETE FROM Bookings WHERE BookingID = @BookingID;
  ELSE
    SELECT 'Booking does not exist.';
  END IF;
END;
