USE littlelemondb;
# query1: create view 
CREATE VIEW OrderView AS SELECT orderID, Quantity, Totalcost FROM orders WHERE orders.Quantity > 2;

# query2: Join tables using sub-query
SELECT  orders.CustomerID, customers.CustomerName, orders.OrderID, orders.Totalcost, menu.MenuName, tem.Courses
FROM orders 
INNER JOIN customers ON orders.customerID = customers.customerID
INNER JOIN menu ON orders.MenuID = menu.MenuID
INNER JOIN 
(SELECT menuitems.Courses, menu.MenuID FROM menuitems INNER JOIN menu on  menu.MenuItemsID = menuitems.MenuItemID) AS tem
on orders.MenuID = tem.MenuID
ORDER BY orders.Totalcost;

# query3: find name of the menu has more than 2 orders 
SELECT MenuName
FROM menu
WHERE MenuID= ANY (SELECT MenuID FROM orders where quantity > 2);

# query4: create  procedure that displays the maximum ordered quantity in the Orders table. 
DELIMITER // 
CREATE Procedure GetMaxQuantity() 
BEGIN 
    SELECT Quantity AS "Max Quantity in Order"
    FROM orders
    ORDER BY Quantity DESC LIMIT 1; 
END//
DELIMITER ; 

CALL GetMaxQuantity();

# query5: Create prepared statement
PREPARE GetOrderDetail FROM "SELECT OrderID, Quantity, TotalCost FROM orders WHERE customerID = ?";
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

# query6: create a stored procedure to cancel order
DELIMITER // 
CREATE Procedure CancelOrder(Order_ID INT) 
     BEGIN 
         DELETE 
         FROM orders
         WHERE OrderID = Order_ID;
	 END//
DELIMITER ; 
Call CancelOrder(9);

