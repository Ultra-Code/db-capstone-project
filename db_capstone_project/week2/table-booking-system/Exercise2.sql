-- Task 1
DELIMITER //
CREATE PROCEDURE AddBooking(IN BookingID INT, IN CustomerID INT, IN BookingDate DATE, IN TableNumber INT)
BEGIN
  INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) VALUES (BookingID, CustomerID, BookingDate, TableNumber);

  IF ROW_COUNT() > 0 THEN
    SELECT 'New booking added.' AS Confirmation;
  ELSE
    SELECT 'Unable to add new booking.' AS Confirmation;
  END IF;
END //
DELIMITER ;

-- Task 2
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BookingID INT, IN BookingDate DATE)
BEGIN
  UPDATE Bookings SET BookingDate = BookingDate WHERE BookingID = BookingID;

  IF ROW_COUNT() > 0 THEN
    SELECT CONCAT('Booking ', CAST(BookingID AS VARCHAR(10)), ' updated successfully.') AS Confirmation;
  ELSE
    SELECT CONCAT('Booking with ID ', CAST(BookingID AS VARCHAR(10)), ' does not exist. Update failed.') AS Confirmation;
  END IF;
END //
DELIMITER ;

-- Task 3
DELIMITER //
CREATE PROCEDURE CancelBooking(IN BookingID INT)
BEGIN
  IF EXISTS(SELECT 1 FROM Bookings WHERE BookingID = BookingID)
  THEN
    DELETE FROM Bookings WHERE BookingID = BookingID;
    SELECT CONCAT('Booking ', CAST(BookingID AS VARCHAR(10)), ' cancelled successfully.') AS Confirmation;
  ELSE
    SELECT 'Booking does not exist.' AS Confirmation;
  END IF;
END //
DELIMITER ;
