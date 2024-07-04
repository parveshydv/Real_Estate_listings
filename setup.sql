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

INSERT INTO sales
VALUES ('P4942','Nitin Ruhil','$9.6M');


CREATE TABLE `transactions` (
    `t_id` VARCHAR(128) PRIMARY KEY,
    `amount` INT,
    `price` INT,
    `type` VARCHAR(128),
    `prop_id` VARCHAR(128),
);



INSERT INTO transactions
VALUES (10000,96000000,'TownHouse','P4942','T202494');

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








--Total Number of Properties by Type

SELECT prop_type, COUNT(*) AS total_properties
FROM property
GROUP BY prop_type;


-- Properties and their Owner Details

SELECT p.prop_id, p.prop_type, p.prop_status, p.prop_price, c.name AS owner_name, c.email AS owner_email
FROM property p
JOIN customer c ON p.cust_id = c.cust_id;



-- Number of Properties Rented by Each Customer
SELECT c.cust_id, c.name, COUNT(r.prop_id) AS rented_properties
FROM customer c
JOIN rent r ON c.cust_id = r.cust_id
GROUP BY c.cust_id, c.name;


--List of Properties Sold by Type
SELECT p.prop_type, COUNT(s.sale_id) AS sold_properties
FROM sales s
JOIN property p ON s.prop_id = p.prop_id
GROUP BY p.prop_type;




--Find Properties That Are Not Rented ---------sub queries--------
SELECT prop_id, prop_type, prop_price
FROM property
WHERE prop_id NOT IN (
    SELECT prop_id
    FROM rent
);




-- Find Properties That Are Currently Rented Out and Their Renters
SELECT p.prop_id, c.name, c.surname, r.rent, r.security_deposit
FROM property p
JOIN rent r ON p.prop_id = r.prop_id
JOIN customer c ON r.cust_id = c.cust_id
WHERE p.prop_status = 'Rented';




















-- indexes that we made based on how common the table uses --------------------------------------------------------------------------

CREATE INDEX idx_prop_type ON property (prop_type);
CREATE INDEX idx_transac_id ON transactions(t_id);
CREATE INDEX idx_sales_prop_id ON sales (prop_id);
CREATE INDEX idx_rent_cust_id ON rent (cust_id);

-- show index from sales;





------------------------------query as --------------------------------------------------------------------------------------------------
-- 1. subquery 
SELECT prop_id, prop_type, prop_price
FROM property
WHERE prop_id NOT IN (
    SELECT prop_id
    FROM rent
);

 --2. views--------------------------------------------
 --In SQL, a view is a virtual table based on the result-set of an SQL statement.Views can also be used as 
 --security mechanisms by letting users access data through the view, without granting the users permissions 
 --to directly access the underlying base tables of the view



CREATE VIEW unrented_properties AS
SELECT prop_id, prop_type, prop_price
FROM property
WHERE prop_id NOT IN (
    SELECT prop_id
    FROM rent
    );


-- using view to retrieve all the properties
SELECT * FROM unrented_properties;

-- using view to filter unrented properties by types , here apartments
SELECT * 
FROM unrented_properties
WHERE prop_type = 'Apartment';



------------------------------transactions -------------------------------------------------------------------------------

-- Start a transaction
START TRANSACTION;

-- Insert a new customer
INSERT INTO customer (cust_id, surname, name, email, address, num)
VALUES ('C008', 'Wayne', 'Bruce', 'bruce.wayne@example.com', '1007 Mountain Drive', '555-0202');

-- Insert a new property for the customer
INSERT INTO property (prop_id, cust_id, prop_type, prop_status, prop_price, paddress)
VALUES ('P009', 'C008', 'Mansion', 'For Rent', '$15,000', '1007 Mountain Drive');

-- Attempt to record a rental agreement for the property
BEGIN
    -- Check if property is available
    DECLARE property_available INT DEFAULT 0;
    SELECT COUNT(*) INTO property_available FROM property WHERE prop_id = 'P009' AND prop_status = 'For Rent';

    -- If property is available, record rental
    IF property_available > 0 THEN
        INSERT INTO rent (prop_id, cust_id, rent, security_deposit)
        VALUES ('P009', 'C008', 15000, 5000);
    ELSE
        -- Property not available, rollback transaction
        ROLLBACK;
        SELECT 'Property not available for rent. Transaction rolled back.' AS Message;
    END IF;
END;

-- Check if rental was recorded
SELECT * FROM rent WHERE prop_id = 'P009';

-- Commit the transaction if successful
COMMIT;











------------------ More complex queries and data aggression queries ------------------------------------------------------------------------



-- complex query that retrieves detailed information about properties, their owners, sales,
-- and includes the total sales amount for each owner
SELECT 
    p.prop_id,
    p.prop_type,
    p.prop_price,
    c.name AS owner_name,
    c.email AS owner_email,
    s.sale_id,
    s.price AS sale_price,
    (SELECT SUM(price)
     FROM sales s2
     WHERE s2.cust_id = c.cust_id) AS total_sales_amount
FROM 
    property p
JOIN 
    customer c ON p.cust_id = c.cust_id
JOIN 
    sales s ON p.prop_id = s.prop_id
ORDER BY 
    c.name, p.prop_id;

-- total number of properties by each owner
SELECT 
    c.cust_id, 
    c.name, 
    COUNT(p.prop_id) AS total_properties
FROM 
    customer c
JOIN 
    property p ON c.cust_id = p.cust_id
GROUP BY 
    c.cust_id, c.name;



--- average rent by property type
SELECT 
    p.prop_type, 
    AVG(r.rent) AS average_rent_price
FROM 
    property p
JOIN 
    rent r ON p.prop_id = r.prop_id
GROUP BY 
    p.prop_type;



-- total security deposit by each customer
SELECT 
    c.cust_id, 
    c.name, 
    SUM(r.security_deposit) AS total_security_deposit
FROM 
    customer c
JOIN 
    rent r ON c.cust_id = r.cust_id
GROUP BY 
    c.cust_id, c.name; 


--- total amount of rent collected by property type
SELECT 
    p.prop_type, 
    SUM(r.rent) AS total_rent_amount
FROM 
    property p
JOIN 
    rent r ON p.prop_id = r.prop_id
GROUP BY 
    p.prop_type;       
















----------------------------dummy data insertion-----------------------------------------------------------------------

INSERT INTO `agent` (`agent_id`, `name`, `contact_info`)
VALUES 
('A001', 'Alice Johnson', 'alice.johnson@example.com'),
('A002', 'Bob Smith', 'bob.smith@example.com'),
('A003', 'Charlie Brown', 'charlie.brown@example.com'),
('A004', 'Diana Prince', 'diana.prince@example.com'),
('A005', 'Edward Norton', 'edward.norton@example.com');








INSERT INTO `customer` (`cust_id`, `surname`, `name`, `email`, `address`, `num`)
VALUES 
('C001', 'Doe', 'John', 'john.doe@example.com', '123 Main St', '123-456-7890'),
('C002', 'Smith', 'Jane', 'jane.smith@example.com', '456 Elm St', '987-654-3210'),
('C003', 'Brown', 'Charlie', 'charlie.brown@example.com', '789 Oak St', '555-123-4567'),
('C004', 'Johnson', 'Alice', 'alice.johnson@example.com', '101 Maple St', '444-555-6666'),
('C005', 'Norton', 'Edward', 'edward.norton@example.com', '202 Pine St', '333-444-5555'),
('C006', 'Ruhil', 'Nitin', 'nruhil@gmail.com', '120 Douglas St', '250-883-0013');







INSERT INTO `property` (`prop_id`, `cust_id`, `prop_type`, `prop_status`, `prop_price`, `paddress`)
VALUES 
('P001', 'C001', 'Apartment', 'For Sale', '$500,000', '321 Cedar St'),
('P002', 'C002', 'House', 'Rented', '$850,000', '654 Birch St'),
('P003', 'C003', 'Condo', 'For Sale', '$300,000', '987 Willow St'),
('P004', 'C004', 'TownHouse', 'Rented', '$700,000', '111 Spruce St'),
('P005', 'C005', 'Villa', 'For Sale', '$1,200,000', '222 Palm St'),
('P006', 'C006', 'TownHouse', 'Rented', '$10M', '122 Hillside Ave');










INSERT INTO `requirement` (`request_id`, `cust_id`, `price`, `area`, `place`, `prop_type`)
VALUES 
('REQ001', 'C001', '$300K - $400K', '1500 sqft', 'Downtown', 'Apartment'),
('REQ002', 'C002', '$500K - $600K', '2000 sqft', 'Suburbs', 'House'),
('REQ003', 'C003', '$250K - $350K', '1200 sqft', 'City Center', 'Condo'),
('REQ004', 'C004', '$700K - $800K', '1800 sqft', 'Uptown', 'TownHouse'),
('REQ005', 'C005', '$1M - $1.5M', '3000 sqft', 'Beachside', 'Villa'),
('REQ006', 'C006', '$5M - $6M', '400 Yards', 'New York', 'Apartment');







INSERT INTO `rent` (`prop_id`, `cust_id`, `rent`, `security_deposit`)
VALUES 
('P002', 'C002', 3000, 1500),
('P004', 'C004', 2500, 1200),
('P006', 'C006', 4000, 2000);




INSERT INTO `sales` (`sale_id`, `prop_id`, `cust_id`, `price`)
VALUES 
('S001', 'P001', 'C001', '$500,000'),
('S002', 'P003', 'C003', '$300,000'),
('S003', 'P005', 'C005', '$1,200,000'),
('S004', 'P006', 'C006', '$9,600,000');









INSERT INTO `sales` (`sale_id`, `prop_id`, `cust_id`, `price`)
VALUES 
('S001', 'P001', 'C001', '$500,000'),
('S002', 'P003', 'C003', '$300,000'),
('S003', 'P005', 'C005', '$1,200,000'),
('S004', 'P006', 'C006', '$9,600,000');










INSERT INTO `transactions` (`t_id`, `amount`, `price`, `type`, `prop_id`)
VALUES 
('T001', 500000, 50000000, 'Apartment', 'P001'),
('T002', 300000, 30000000, 'Condo', 'P003'),
('T003', 1200000, 120000000, 'Villa', 'P005'),
('T004', 9600000, 960000000, 'TownHouse', 'P006');
=======
-- Find Properties That Are Currently Rented Out and Their Renters
>>>>>>> 120e2a19921eba1b3d1c31370f7b16f0d8d79b03
