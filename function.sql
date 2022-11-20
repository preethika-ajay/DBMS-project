-- DELIMITER $$

-- CREATE FUNCTION age_of_user1(Date_of_Birth DATE) RETURNS varchar(200) DETERMINISTIC
-- BEGIN
--     DECLARE currentDate DATE;
--     Select current_date()into currentDate;

--     -- Return currentDate - Date_of_Birth;
--     Return DATE_FORMAT(FROM_DAYS(DATEDIFF(now(), Date_of_Birth)), '%Y')+0;
-- END 

-- $$

-- DELIMITER ;



Select age_of_user1(Date_of_Birth) as 'age' from user;
