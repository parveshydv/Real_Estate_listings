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
