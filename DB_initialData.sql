INSERT INTO customers (CustomerID, CustomerName, ContactDetail) VALUES   
(1, "Jadon Sancho", "111"),   
(2, "De Gea", "222"),  
(3, "Bruno Fernandes", "333"),  
(4, "Marcus Rashford", "444"),  
(5, "Carlos Casimiro", "555"),   
(6, "Luke Shaw", "666"),  
(7, "Lisandro Martínez", "777"),  
(8, "Raphael Varane", "888"),  
(9, "Christian Eriksen", "999");

INSERT INTO staff (StaffID, Role, Salary) VALUES
(1, "Manager", 3000000), 
(2, "Assistant Manager", 1500000), 
(3, "Head Chef", 1000000), 
(4, "Head Waiter", 500000), 
(5, "Receptionist", 250000);

INSERT INTO bookings (BookingID, Date, TableNumber, StaffID) VALUES
(1, "2023-01-30", 1, 2),
(2, "2023-01-31", 2, 1),
(3, "2023-02-01", 1, 5),
(4, "2023-01-11", 3, 1),
(5, "2023-01-15", 3, 2),
(6, "2023-01-19", 2, 4),
(7, "2023-01-12", 1, 3),
(8, "2023-01-02", 2, 5),
(9, "2023-01-16", 1, 4);

INSERT INTO menuitems (MenuItemID, Starters, Courses, Drinks, Desserts) VALUES
(1, "Smoked Salmon", "Spaghetti Bolognese", "Wine", "Carrot Cake"),
(2, "Bacon rings", "Grilled Chicken", "Cola", "Ice Cream"),
(3, "Blooming onion","Spicy Pork", "Beer", "Brownies"),
(4, "cheese cake", "Slow cooked beef", "Chardonnay", "Milkshakes"),
(5, "Butter chicken","Paella", "Sparkling wine", "Fudge");

INSERT INTO menu (MenuID, MenuItemsID, MenuName, Cuisines) VALUES
(1, 1, "Fish and noodle", "Italian"),
(2, 2, "Children", "None"),
(3, 3, "Schwein", "German"),
(4, 4, "Beef", "Franch"),
(5, 5, "Seefood", "Spanish");

INSERT INTO deliverystatus (DeliveryID, DeliveryDate, Status) VALUES
(1, "2023-01-30", "Done"),
(2, "2023-01-31", "Overcooked"),
(3, "2023-02-01", "Fighting"),
(4, "2023-01-11", "ChefKilled"),
(5, "2023-01-15", "Gunfired"),
(6, "2023-01-19", "ManagerStabbed"),
(7, "2023-01-12", "Undercooked"),
(8, "2023-01-02", "RunOutOfMeat"),
(9, "2023-01-16", "EveryoneDied");


INSERT INTO orders (OrderID, OrderDate, Quantity, TotalCost, BookingID, DeliveryID, MenuID, CustomerID) VALUES
(1, "2023-01-29", 5, 950, 1, 1, 5, 1),
(2, "2023-01-15", 2, 450, 2, 2, 3, 2),
(3, "2023-01-11", 1, 150, 3, 3, 2, 3),
(4, "2023-01-10", 3, 750, 4, 4, 1, 4),
(5, "2023-01-11", 1, 150, 5, 5, 2, 5),
(6, "2023-01-09", 4, 650, 6, 6, 4, 6),
(7, "2023-01-04", 1, 100, 7, 7, 3, 7),
(8, "2023-01-01", 2, 350, 8, 8, 1, 8),
(9, "2023-01-14", 1, 220, 9, 9, 5, 9);
