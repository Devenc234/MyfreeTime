 DELETE from my_guitar_shop.addresses where customer_id=1;
 DELETE from my_guitar_shop.orders where customer_id=1;
 DELETE from my_guitar_shop.customers where customer_id=1;
 
 SELECT * FROM my_guitar_shop.customers;
 SELECT * FROM my_guitar_shop.addresses;
 
  DELIMITER //
 CREATE PROCEDURE test()
   BEGIN
	   BEGIN TRAN;
		DELETE from my_guitar_shop.addresses where customer_id=1;
		DELETE from my_guitar_shop.customers where customer_id=1;
		WHERE CustomerID = 8;
		BEGIN
		COMMIT TRAN;
		END;
		ELSE
		BEGIN
		ROLLBACK TRAN;
		END;
   END //
 DELIMITER ;
 
 call test();
 
