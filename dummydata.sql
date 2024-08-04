
-- Insert sample data into `customer`
INSERT INTO `customer` (`cust_id`, `name`, `email`, `address`, `Ph_num`) VALUES
(1, 'John Doe', 'john.doe@example.com', '123 Maple St', '555-1234'),
(2, 'Jane Smith', 'jane.smith@example.com', '456 Oak St', '555-5678'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '789 Pine St', '555-9012');

-- Insert sample data into `agent`
INSERT INTO `agent` (`agent_id`, `name`, `contact_info`) VALUES
('A001', 'Agent Smith', 'agent.smith@example.com'),
('A002', 'Agent Johnson', 'agent.johnson@example.com');

-- Insert sample data into `property`
INSERT INTO `property` (`prop_id`, `cust_id`, `prop_type`, `prop_status`, `prop_price`, `prop_address`) VALUES
('P001', 1, 'House', 'Available', 250000, '123 Maple St'),
('P002', 2, 'Apartment', 'Available', 150000, '456 Oak St'),
('P003', 3, 'Condo', 'Available', 300000, '789 Pine St');

-- Insert sample data into `requirement`
INSERT INTO `requirement` (`request_id`, `cust_id`, `price`, `area`, `prop_type`) VALUES
(1, 1, 200000, 'Downtown', 'Apartment'),
(2, 2, 300000, 'Suburbs', 'House'),
(3, 3, 250000, 'City Center', 'Condo');

-- Insert sample data into `requires`
INSERT INTO `requires` (`require_id`, `request_id`) VALUES
('R001', '1'),
('R002', '2'),
('R003', '3');

-- Insert sample data into `rent`
INSERT INTO `rent` (`prop_id`, `cust_id`, `rent`, `security_deposit`) VALUES
('P002', 1, 1000, 2000),
('P003', 2, 1500, 3000);

-- Insert sample data into `sales`
INSERT INTO `sales` (`prop_id`, `cust_id`, `price`) VALUES
('P001', 3, 250000);

-- The property status should automatically update to 'Sold' due to the trigger.

-- Insert sample data into `transactions`
INSERT INTO `transactions` (`t_id`, `amount`, `type`, `prop_id`) VALUES
('T001', 250000, 'Sale', 'P001'),
('T002', 1000, 'Rent', 'P002');

-- The transaction logs should automatically be populated due to the trigger.

-- Insert sample data into `uses`
INSERT INTO `uses` (`prop_id`, `cust_id`) VALUES
('P002', 1),
('P003', 2);

-- Insert sample data into `sold`
INSERT INTO `sold` (`prop_id`, `cust_id`) VALUES
('P001', 3);

-- Insert sample data into `rented`
INSERT INTO `rented` (`prop_id`, `cust_id`) VALUES
('P002', 1),
('P003', 2);

