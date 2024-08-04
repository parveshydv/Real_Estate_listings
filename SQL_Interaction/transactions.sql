--  We will be demostrating different Isolation Levels in Transaction and how they maintain ACID behaviour


/*  1. READ COMMITED
      - Allow phantom reads (tuples can appear)
      - Will only read committed/final data, but it could change if you read it twice

The transaction updates the price of a property and reads the updated data, ensuring only committed data is read.
*/


SET TRANSACTION READ WRITE ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
UPDATE property SET prop_price = 600000 WHERE prop_id = 'P001';
SELECT * FROM property WHERE prop_id = 'P001';
COMMIT;







/*  2. READ UNCOMMITED
      -  allows dirty read

The transaction reads properties with a price below $500,000, even if the data is currently being modified by another transaction.
*/
SET TRANSACTION READ WRITE ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
SELECT * FROM property WHERE prop_price < 500000;
COMMIT;




/* 3. REPEATABLE READ
     - Allow phantom reads (tuples can appear)
     - Guarantees that if you read the same row multiple times, it will always be the same

The transaction updates property prices and reads them again to ensure consistency within the transaction.
*/

SET TRANSACTION READ WRITE ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
UPDATE property SET prop_price = prop_price * 1.1 WHERE prop_type = 'House';
SELECT * FROM property WHERE prop_type = 'House';
COMMIT;





/* 4. SERIALIZABLE

- The highest isolation level, ensuring complete isolation from other transactions. It prevents dirty reads, non-repeatable reads, and phantom reads by effectively making transactions appear to be serially executed

- The transaction inserts a new property and reads the inserted data, ensuring no other transactions interfere.

*/

SET TRANSACTION READ WRITE ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
INSERT INTO property (prop_id, cust_id, prop_type, prop_status, prop_price, paddress) 
VALUES ('P007', 2, 'Condo', 'For Sale', 450000, '789 New St');
SELECT * FROM property WHERE prop_id = 'P007';
COMMIT;






