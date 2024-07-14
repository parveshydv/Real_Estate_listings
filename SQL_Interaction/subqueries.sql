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

