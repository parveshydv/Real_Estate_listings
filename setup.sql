CREATE DATABASE Real_Estate_listing;
USE Real_Estate_listing;

CREATE TABLE 'uses'(
    id VARCHAR(128),
    prop_id VARCHAR(128),
    cust_id VARCHAR(128)
);

CREATE TABLE 'sold'(
    prop_id VARCHAR(128),
    cust_id VARCHAR(128)
);

CREATE TABLE 'agent'(
    prop_id VARCHAR(128),
    cust_id VARCHAR(128),
    t_id VARCHAR(128)
);

CREATE TABLE 'rented'(
    prop_id VARCHAR(128),
    cust_id VARCHAR(128)
);

CREATE TABLE 'requires'(
    id VARCHAR(128),
    request_id VARCHAR(128)
);


CREATE TABLE `customer`(
    `surname` VARCHAR(128),
    `name` VARCHAR(128),
    `email` VARCHAR(128),
    `address` VARCHAR(128),
    `num` INT,
    `id` VARCHAR(128)
);

INSERT INTO customer
VALUES ('Ruhil','Nitin','nruhil@gmail.com','120 Douglas St',+1(250)883-0013,'C124');


CREATE TABLE `prop`(
    `prop_id` VARCHAR(128),
    `cust_id` VARCHAR(128),
    `prop_type` VARCHAR(128),
    `prop_status` VARCHAR(128),
    `prop_price` VARCHAR(128),
    `paddress` VARCHAR(128) 
);

INSERT INTO prop
VALUES ('P4942', 'C124', 'TownHouse','Sold','$10M','122 Hillside ave');


CREATE TABLE `sales`(
    `prop_id` VARCHAR(128),
    `sold_to` VARCHAR(128),
    `price` VARCHAR(128)
);

INSERT INTO sales
VALUES ('P4942','Nitin Ruhil','$9.6M');


CREATE TABLE `transactions`(
    `amount` INT,
    `price` INT,
    `type` VARCHAR(128),
    `prop_id` VARCHAR(128),
    `t_id` VARCHAR(128)
);

NSERT INTO transactions
VALUES (10000,96000000,'TownHouse','P4942','T202494');


CREATE TABLE `rent`(
    `rent` INT,
    `rented_to` VARCHAR(128),
    `pro_id` VARCHAR(128),
    `security_deposit` INT
    );

INSERT INTO rent
VALUES (4000,'Parvesh Yadav','P4942',2000);


CREATE TABLE `requirement`(
    `request_by` VARCHAR(128),
    `request_id` VARCHAR(128),
    `price` VARCHAR(128),
    `area` VARCHAR(128),
    `place` VARCHAR(128),
    `prop_type` VARCHAR(128) 
);

INSERT INTO requirement
VALUES ('Parvesh Yadav','P2483','$5M - $6M','400 Yards','New York','Appartment');
