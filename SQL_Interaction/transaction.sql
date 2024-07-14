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

