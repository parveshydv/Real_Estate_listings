
-- Trigger to Update Property Status When Sold ->
DELIMITER $$

CREATE TRIGGER `after_property_sold`
AFTER INSERT ON `sold`
FOR EACH ROW
BEGIN
    UPDATE `property`
    SET `prop_status` = 'Sold'
    WHERE `prop_id` = NEW.`prop_id`;
END$$

DELIMITER ;

-- Trigger to Ensure Unique Email Addresses in Customer Table ->
DELIMITER $$

CREATE TRIGGER `before_insert_customer`
BEFORE INSERT ON `customer`
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM `customer` WHERE `email` = NEW.`email`) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate email address not allowed';
    END IF;
END$$

DELIMITER ;

-- Trigger to Maintain Logs of Transactions ->
CREATE TABLE `transaction_logs` (
    `log_id` INT AUTO_INCREMENT PRIMARY KEY,
    `t_id` VARCHAR(128),
    `amount` INT,
    `type` VARCHAR(128),
    `prop_id` VARCHAR(128),
    `log_timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER `after_insert_transactions`
AFTER INSERT ON `transactions`
FOR EACH ROW
BEGIN
    INSERT INTO `transaction_logs` (`t_id`, `amount`, `type`, `prop_id`)
    VALUES (NEW.`t_id`, NEW.`amount`, NEW.`type`, NEW.`prop_id`);
END$$

DELIMITER ;

-- Trigger to Ensure Rent is Greater Than Zero ->
DELIMITER $$

CREATE TRIGGER `before_insert_rent`
BEFORE INSERT ON `rent`
FOR EACH ROW
BEGIN
    IF NEW.`rent` <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rent must be greater than zero';
    END IF;
END$$

DELIMITER ;

-- Trigger to Automatically Update the Last Modified Timestamp on Customers ->
ALTER TABLE `customer`
ADD COLUMN `last_modified` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

DELIMITER $$

CREATE TRIGGER `before_update_customer`
BEFORE UPDATE ON `customer`
FOR EACH ROW
BEGIN
    SET NEW.`last_modified` = CURRENT_TIMESTAMP;
END$$

DELIMITER ;

-- Trigger to Prevent Deletion of Sold Properties ->
DELIMITER $$

CREATE TRIGGER `before_delete_property`
BEFORE DELETE ON `property`
FOR EACH ROW
BEGIN
    IF OLD.`prop_status` = 'Sold' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete sold properties';
    END IF;
END$$

DELIMITER ;
