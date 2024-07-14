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

