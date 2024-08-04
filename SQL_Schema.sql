CREATE DATABASE testing;
USE testing;

CREATE TABLE `uses` (
    `prop_id` VARCHAR(128),
    `cust_id` VARCHAR(128),
    PRIMARY KEY (`prop_id`, `cust_id`),
    FOREIGN KEY (`prop_id`) REFERENCES `property`(`prop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE `sold` (
    `prop_id` VARCHAR(128),
    `cust_id` VARCHAR(128),
    PRIMARY KEY (`prop_id`, `cust_id`),
    FOREIGN KEY (`prop_id`) REFERENCES `property`(`prop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `agent` (
    `agent_id` VARCHAR(128) PRIMARY KEY,
    `name` VARCHAR(128),
    `contact_info` VARCHAR(128)
);

CREATE TABLE `rented` (
    `prop_id` VARCHAR(128),
    `cust_id` VARCHAR(128),
    PRIMARY KEY (`prop_id`, `cust_id`),
    FOREIGN KEY (`prop_id`) REFERENCES `property`(`prop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE `requires` (
    `request_id` INT PRIMARY KEY,
    FOREIGN KEY (`request_id`) REFERENCES `requirement`(`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `customer` (
    `cust_id` INT PRIMARY KEY,
    `name` VARCHAR(128),
    `email` VARCHAR(128),
    `address` VARCHAR(128),
    `Ph_num` VARCHAR(15)
);

CREATE TABLE `property` (
    `prop_id` VARCHAR(128) PRIMARY KEY,
    `cust_id` VARCHAR(128),
    `prop_type` VARCHAR(128),
    `prop_status` VARCHAR(128),
    `prop_price` INT,
    `prop_address` VARCHAR(128),
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`) ON DELETE SET NULL ON UPDATE CASCADE

CREATE TABLE `sales` (
    `prop_id` VARCHAR(128) PRIMARY KEY,
    `cust_id` VARCHAR(128),
    `price` VARCHAR(128),
    FOREIGN KEY (`prop_id`) REFERENCES `property`(`prop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE `transactions` (
    `t_id` VARCHAR(128) PRIMARY KEY,
    `amount` INT,
    `type` VARCHAR(128),
    `prop_id` VARCHAR(128),
    FOREIGN KEY (`prop_id`) REFERENCES `property`(`prop_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `rent` (
    `prop_id` VARCHAR(128),
    `cust_id` INT,
    `rent` INT,
    `security_deposit` INT,
    PRIMARY KEY (`prop_id`, `cust_id`),
    FOREIGN KEY (`prop_id`) REFERENCES `property`(`prop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `requirement` (
    `request_id` INT PRIMARY KEY,
    `cust_id` INT,
    `price` INT,
    `area` VARCHAR(128),
    `prop_type` VARCHAR(128),
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
