CREATE DATABASE testing;
USE testing;

CREATE TABLE `uses` (
    `prop_id` VARCHAR(128),
    `cust_id` VARCHAR(128),
);

CREATE TABLE 'sold'(
    prop_id VARCHAR(128),
    cust_id VARCHAR(128)
);

CREATE TABLE `agent` (
    `agent_id` VARCHAR(128) PRIMARY KEY,
    `name` VARCHAR(128),
    `contact_info` VARCHAR(128)
);

CREATE TABLE 'rented'(
    prop_id VARCHAR(128),
    cust_id VARCHAR(128)
);

CREATE TABLE `requires` (
    `require_id` VARCHAR(128) PRIMARY KEY,
    `request_id` VARCHAR(128),
    FOREIGN KEY (`request_id`) REFERENCES `requirement`(`request_id`)
);

CREATE TABLE `customer` (
    `cust_id` int PRIMARY KEY,
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
    
);


CREATE TABLE `sales` (
    `prop_id` VARCHAR(128) PRIMARY KEY,
    `cust_id` VARCHAR(128),
    `price` VARCHAR(128),
);


CREATE TABLE `transactions` (
    `t_id` VARCHAR(128) PRIMARY KEY,
    `amount` INT,
    `type` VARCHAR(128),
    `prop_id` VARCHAR(128),
);



CREATE TABLE `rent` (
    `prop_id` VARCHAR(128),
    `cust_id` INT,
    `rent` INT,
    `security_deposit` INT,
    FOREIGN KEY (`prop_id`) REFERENCES `property`(`prop_id`),
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`)
);


CREATE TABLE `requirement` (
    `request_id` INT PRIMARY KEY,
    `cust_id` INT,
    `price` INT,
    `area` VARCHAR(128),
    `prop_type` VARCHAR(128),
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`)
);

