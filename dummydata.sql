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









INSERT INTO `transactions` (`t_id`, `amount`, `price`, `type`, `prop_id`)
VALUES 
('T001', 500000, 50000000, 'Apartment', 'P001'),
('T002', 300000, 30000000, 'Condo', 'P003'),
('T003', 1200000, 120000000, 'Villa', 'P005'),
('T004', 9600000, 960000000, 'TownHouse', 'P006');
