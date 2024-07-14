CREATE DATABASE testing;
USE testing;

CREATE TABLE `uses` (
    `use_id` VARCHAR(128) PRIMARY KEY,
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
    `cust_id` VARCHAR(128) PRIMARY KEY,
    `surname` VARCHAR(128),
    `name` VARCHAR(128),
    `email` VARCHAR(128),
    `address` VARCHAR(128),
    `num` VARCHAR(20)
);



CREATE TABLE `property` (
    `prop_id` VARCHAR(128) PRIMARY KEY,
    `cust_id` VARCHAR(128),
    `prop_type` VARCHAR(128),
    `prop_status` VARCHAR(128),
    `prop_price` VARCHAR(128),
    `paddress` VARCHAR(128),
    
);


CREATE TABLE `sales` (
    `prop_id` VARCHAR(128) PRIMARY KEY,
    `cust_id` VARCHAR(128),
    `price` VARCHAR(128),
);


CREATE TABLE `transactions` (
    `t_id` VARCHAR(128) PRIMARY KEY,
    `amount` INT,
    `price` INT,
    `type` VARCHAR(128),
    `prop_id` VARCHAR(128),
);



CREATE TABLE `rent` (
    `prop_id` VARCHAR(128),
    `cust_id` VARCHAR(128),
    `rent` INT,
    `security_deposit` INT,
    PRIMARY KEY (`prop_id`),
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`)
);


CREATE TABLE `requirement` (
    `request_id` VARCHAR(128) PRIMARY KEY,
    `cust_id` VARCHAR(128),
    `price` VARCHAR(128),
    `area` VARCHAR(128),
    `place` VARCHAR(128),
    `prop_type` VARCHAR(128),
    FOREIGN KEY (`cust_id`) REFERENCES `customer`(`cust_id`)
);

