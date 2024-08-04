ALTER TABLE `agent`
MODIFY `name` VARCHAR(128) NOT NULL,
MODIFY `contact_info` VARCHAR(128) NOT NULL;

ALTER TABLE `uses`
ADD CONSTRAINT `check_uses_prop_id` CHECK (`prop_id` <> '');

ALTER TABLE `sold`
ADD CONSTRAINT `check_sold_prop_id` CHECK (`prop_id` <> '');

ALTER TABLE `rented`
ADD CONSTRAINT `check_rented_prop_id` CHECK (`prop_id` <> '');

ALTER TABLE `requires`
ADD CONSTRAINT `check_requires_ids` CHECK (`require_id` <> '' AND `request_id` <> '');

ALTER TABLE `customer`
MODIFY `name` VARCHAR(128) NOT NULL,
MODIFY `email` VARCHAR(128) NOT NULL,
MODIFY `address` VARCHAR(128) NOT NULL,
MODIFY `Ph_num` VARCHAR(15) NOT NULL,
ADD CONSTRAINT `unique_email` UNIQUE (`email`),
ADD CONSTRAINT `check_customer_email` CHECK (`email` LIKE '%_@__%.__%'),
ADD CONSTRAINT `check_customer_phone` CHECK (`Ph_num` <> '');

ALTER TABLE `property`
MODIFY `prop_type` VARCHAR(128) NOT NULL,
MODIFY `prop_status` VARCHAR(128) NOT NULL,
MODIFY `prop_address` VARCHAR(128) NOT NULL,
ADD CONSTRAINT `check_property_price` CHECK (`prop_price` > 0),
ADD CONSTRAINT `check_property_ids` CHECK (`prop_id` <> ''),
ADD CONSTRAINT `check_property_type` CHECK (`prop_type` <> ''),
ADD CONSTRAINT `check_property_status` CHECK (`prop_status` <> ''),
ADD CONSTRAINT `check_property_address` CHECK (`prop_address` <> '');

ALTER TABLE `sales`
ADD CONSTRAINT `check_sales_price` CHECK (`price` > 0),
ADD CONSTRAINT `check_sales_id` CHECK (`prop_id` <> '');

ALTER TABLE `transactions`
MODIFY `type` VARCHAR(128) NOT NULL,
ADD CONSTRAINT `check_transactions_amount` CHECK (`amount` > 0),
ADD CONSTRAINT `check_transactions_type` CHECK (`type` <> ''),
ADD CONSTRAINT `check_transactions_id` CHECK (`t_id` <> '');

ALTER TABLE `rent`
ADD CONSTRAINT `check_rent_amount` CHECK (`rent` > 0),
ADD CONSTRAINT `check_security_deposit` CHECK (`security_deposit` >= 0),
ADD CONSTRAINT `check_rent_prop_id` CHECK (`prop_id` <> '');

ALTER TABLE `requirement`
MODIFY `area` VARCHAR(128) NOT NULL,
MODIFY `prop_type` VARCHAR(128) NOT NULL,
ADD CONSTRAINT `check_requirement_price` CHECK (`price` > 0),
ADD CONSTRAINT `check_requirement_area` CHECK (`area` <> ''),
ADD CONSTRAINT `check_requirement_type` CHECK (`prop_type` <> '');
