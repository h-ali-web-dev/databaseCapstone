ALTER TABLE bookings
ADD COLUMN CustomerID INT AFTER TableNumber;

# Add foreign key 
ALTER TABLE bookings
ADD CONSTRAINT fk_customer_id FOREIGN KEY (CustomerID)
REFERENCES customers(CustomerID);

ALTER TABLE orders
DROP FOREIGN KEY booking_fk;
ALTER TABLE orders
DROP FOREIGN KEY customer_fk;

# Alter prime key auto increment
ALTER TABLE bookings
MODIFY COLUMN BookingID INT AUTO_INCREMENT;

# query1: insert bookings
INSERT INTO bookings (Date, TableNumber, CustomerID, StaffID) VALUES
("2022-10-10", 5, 1, 1),
("2022-11-12", 3, 3, 2),
("2022-10-11", 2, 2, 4),
("2022-10-13", 2, 1, 5);

# query2: create stored procedure to check booking
DELIMITER //
CREATE PROCEDURE CheckBooking(Input_date DATE, Table_number INT)
BEGIN 
	SELECT
    (CASE 
		WHEN (Exists( SELECT * FROM bookings WHERE TableNumber =Table_number AND  Date=Input_date)) THEN CONCAT("Table ", Table_number, " is already booked")
        ELSE CONCAT("Table ", Table_number, " is avaliable")
	END)
	AS Booking_status 
	FROM bookings LIMIT 1;
    END//
DELIMITER ;
CALL CheckBooking("2022-11-12", 3);

# query3: create a procedure to add valid transaction
DELIMITER //
CREATE PROCEDURE AddValidBooking(Input_date DATE, Table_number INT, Customer_id INT)
BEGIN 
    START TRANSACTION;
    INSERT INTO bookings (Date, TableNumber, CustomerID, StaffID) VALUES
    (Input_date,  Table_number,  Customer_id , 5);
    SET @counter = (SELECT COUNT(*) FROM bookings WHERE TableNumber =Table_number AND  Date=Input_date);
    IF @counter > 1 THEN 
		SET @message = CONCAT("Table ", Table_number, " is already booked");
        ROLLBACK;
	ELSE SET @message =CONCAT("Table ", Table_number, " is successfully booked");
        COMMIT;
	END IF;
    SELECT @message AS Booking_Status;
END //
DELIMITER ;
call AddValidBooking("2022-10-13", 3, 2);
DROP PROCEDURE AddValidBooking;

# query4: create procedure add booking
DELIMITER //
CREATE PROCEDURE AddBooking(Input_date DATE, Table_number INT, Customer_id INT)
BEGIN 
    
    INSERT INTO bookings (Date, TableNumber, CustomerID, StaffID) VALUES
    (Input_date,  Table_number,  Customer_id , 5);
    SELECT"New booking added" AS Confirmation;
END //
DELIMITER ;
call AddBooking("2022-12-30", 3, 2);


# query5: update booking table
DELIMITER //
CREATE PROCEDURE UpdateBooking(Booking_id INT, New_date DATE)
BEGIN 
    UPDATE bookings
    SET Date = New_date
    WHERE Booking_id = BookingID;
    
    SELECT CONCAT("Booking ", Booking_id, " Updated") AS Confirmation;
END //
DELIMITER ;
call UpdateBooking(13, "2022-12-11");

# query6: cancel booking
DELIMITER //
CREATE PROCEDURE CancelBooking(Booking_id INT)
BEGIN 
    DELETE FROM bookings
    WHERE Booking_id = BookingID;
    
    SELECT CONCAT("Booking ", Booking_id, " cancelled") AS Confirmation;
END //
DELIMITER ;
call CancelBooking(13);

	

