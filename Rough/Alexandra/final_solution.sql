DROP PROCEDURE IF EXISTS test;

delimiter //
create procedure test()
BEGIN 

	DECLARE `should_rollback` BOOL DEFAULT FALSE;
    DECLARE cust_ID Int;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `should_rollback` = TRUE;
    
	SET cust_id = 8;
		START TRANSACTION;
		DELETE FROM my_guitar_shop.addresses 	WHERE customer_id = cust_id;
		DELETE FROM my_guitar_shop.customers	WHERE customer_id = cust_id;
-- .. other queries ...

	IF `should_rollback` THEN
		ROLLBACK;
        select 'Transaction is rollbacked' as message;
	ELSE
		COMMIT;
        select 'The customer was deleted successfully' as message;
	END IF;

end //

call test();



