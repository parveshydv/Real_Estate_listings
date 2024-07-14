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






:-- total number of properties by each owner
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
