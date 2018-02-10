DROP PROCEDURE IF EXISTS test;

delimiter //
create procedure test()
BEGIN 
	DECLARE cust_ID Int; 
	SET cust_id = 8;
	start transaction; 
			DELETE FROM my_guitar_shop.addresses 	WHERE customer_id = cust_id;
			DELETE FROM my_guitar_shop.customers	WHERE customer_id = cust_id;
			COMMIT ;
			select 'The customer was deleted successfully' as message;
	ROLLBACK;
	select 'Transaction is rollbacked' as message;
end //

call test();

-- BEGIN TRAN;
-- BEGIN TRY
--     <query>
--     COMMIT TRAN;
-- END TRY
-- BEGIN CATCH
--      ROLLBACK TRAN;
-- END CATCH