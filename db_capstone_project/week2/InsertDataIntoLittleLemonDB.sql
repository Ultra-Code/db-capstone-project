USE `LittleLemonDB`;

DELETE FROM `Customers`;

INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email)
VALUES
(1, 'John Doe', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane Doe', '987-654-3210', 'jane.doe@example.com'),
(3, 'Peter Parker', '555-1212-1212', 'peter.parker@example.com'),
(4, 'Mary Jane Watson', '444-444-4444', 'mary.jane.watson@example.com'),
(5, 'Bruce Wayne', '666-666-6666', 'bruce.wayne@example.com'),
(6, 'Clark Kent', '777-777-7777', 'clark.kent@example.com'),
(7, 'Diana Prince', '888-888-8888', 'diana.prince@example.com'),
(8, 'Jane Smith', '987-654-3210', 'jane.smith@email.com'),
(9, 'Alice Johnson', '555-555-5555', 'alice.johnson@email.com');


DELETE FROM `Bookings`;

INSERT INTO Bookings (BookingID, CustomerID, BookingDate)
VALUES
(1, 1, '2023-10-30'),
(2, 2, '2023-10-31'),
(3, 3, '2023-11-01'),
(4, 4, '2023-11-02'),
(5, 5, '2023-11-03'),
(6, 6, '2023-11-04'),
(7, 7, '2023-11-05'),
(8, 8, '2023-11-06'),
(9, 9, '2023-11-07');

DELETE FROM `MenuItems`;

INSERT INTO MenuItems (MenuItemsID, CourseName, StarterName, DesertName)
VALUES
(1, 'Italian', 'Bruschetta', 'Tiramisu'),
(2, 'Mexican', 'Guacamole', 'Churros'),
(3, 'Japanese', 'Sushi', 'Mochi'),
(4, 'Indian', 'Naan', 'Gulab Jamun'),
(5, 'Chinese', 'Spring Rolls', 'Fortune Cookies'),
(6, 'French', 'Escargot', 'Crème Brûlée'),
(7, 'American', 'Burger', 'Apple Pie'),
(8, 'Greek', 'Hummus', 'Baklava'),
(9, 'Thai', 'Spring Rolls', 'Mango Sticky Rice');

DELETE FROM `Menus`;

INSERT INTO Menus (MenuID, MenuItemsID, MenuName, Cuisine)
VALUES
(1, 1, 'Italian Feast', 'Italian'),
(2, 2, 'Mexican Delights', 'Mexican'),
(3, 3, 'Japanese Experience', 'Japanese'),
(4, 4, 'Indian Spice', 'Indian'),
(5, 5, 'Chinese Fusion', 'Chinese'),
(6, 6, 'French Cuisine', 'French'),
(7, 7, 'American Classics', 'American'),
(8, 8, 'Greek Celebration', 'Greek'),
(9, 9, 'Thai Treat', 'Thai');

DELETE FROM `Orders`;

INSERT INTO Orders (OrderID, CustomerID, MenuID, Quantity, TotalCost)
VALUES
(1, 1, 1, 2, 50),
(2, 2, 2, 3, 75),
(3, 3, 3, 4, 100),
(4, 4, 4, 1, 25),
(5, 5, 5, 2, 50),
(6, 6, 6, 3, 75),
(7, 7, 7, 4, 100),
(8, 8, 3, 1, 15),
(9, 9, 2, 1, 20);
