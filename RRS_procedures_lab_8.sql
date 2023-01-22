DELIMITER $$
CREATE FUNCTION no_of_tickets_purchased(uid char(7))
RETURNS LONGTEXT
DETERMINISTIC
BEGIN
 
    DECLARE value LONGTEXT;
    DECLARE count int;

    set count = (Select COUNT(*) FROM Ticket WHERE User_ID=uid);

    IF count > 3 THEN
  SET value = CONCAT('Tickets purchased - ',CONVERT(count,char),' Cannot purchase tickets current limit is over');
 
ELSE
  SET value= CONCAT('Tickets purchased - ',CONVERT(count,char),' Can purchase more tickets');
 
    END IF;
   RETURN value;
END; $$
DELIMITER ;
Select User_ID, no_of_tickets_purchased(User_ID) FROM User;


DELIMITER $$
CREATE procedure calculate_age(
IN DOB DATE,IN uid varchar(255), OUT age int)
BEGIN
set uid= (SELECT User_ID from user_train where User_ID=uid);
set age= (SELECT DATEDIFF(CURRENT_DATE(),DOB)/365);
IF uid != NULL THEN
UPDATE user_train SET Age=age WHERE User_ID=uid;
END IF;
END $$
DELIMITER ;
CALL calculate_age('2002-06-15','USR_970',@Age);
SELECT @Age;

drop procedure calculate_age;

/* calling the procedure */
CALL calculate_age('2000-10-09','USR_002',@Age);
SELECT @Age;

CALL calculate_age('2002-06-15','USR_970',@Age);
SELECT @Age;



