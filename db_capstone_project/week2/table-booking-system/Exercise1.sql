-- Task 1
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
    VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1)
;


-- Task 2
DELIMITER //
CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
  DECLARE BookingStatus VARVARCHAR(10)(100);

  IF EXISTS(SELECT 1 FROM Bookings WHERE BookingDate = BookingDate AND TableNumber = TableNumber) THEN
    SET BookingStatus = CONCAT('Table ', CAST(TableNumber AS VARCHAR(10)), ' is already booked');
  ELSE
    SET BookingStatus = CONCAT('Table ', CAST(TableNumber AS VARCHAR(10)), ' is available');
  END IF;

  SELECT BookingStatus AS 'Booking status';
END //
DELIMITER ;


-- Task 3
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
  DECLARE BookingStatus VARVARCHAR(10)(100);

  START TRANSACTION;

  INSERT INTO Bookings (BookingDate, TableNumber) VALUES (BookingDate, TableNumber);

  -- Check if the table is already booked on the given date
  IF EXISTS(SELECT 1 FROM Bookings WHERE BookingDate = BookingDate AND TableNumber = TableNumber) THEN
    -- If the table is already booked, rollback the transaction and return an error message
    ROLLBACK;
    SET BookingStatus = CONCAT('Table ', CAST(TableNumber AS VARCHAR(10)), ' is already booked - booking cancelled') AS 'Booking Status';
;
  ELSE
    -- If the table is not booked, commit the transaction and return a success message
    COMMIT;
    SET BookingStatus = CONCAT('Table ', CAST(TableNumber AS VARCHAR(10)), ' is booked successfully.') AS 'Booking Status';
;
  END IF;

  SELECT BookingStatus AS 'Booking Status';
END //
DELIMITER ;
