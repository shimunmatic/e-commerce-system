CREATE SCHEMA IF NOT EXISTS sc_ecommerce_item;

-- categories

INSERT INTO sc_ecommerce_item.category (id, name, description, parent_id)
VALUES (1, 'Automotive', 'All for your four wheel friend', NULL),
       (2, 'Books', 'Brain food', NULL),
       (3, 'Electronics', 'Electronics', NULL),
       (4, 'Computers', 'Computers', 3),
       (5, 'Fashion', 'Clothes', NULL),
       (6, 'Home', 'Furniture', NULL);
BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE sc_ecommerce_item.category IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval((select pg_get_serial_sequence('sc_ecommerce_item.category', 'id')), COALESCE((SELECT MAX(id)+1 FROM  sc_ecommerce_item.category), 1), false);
COMMIT;

-- items
INSERT INTO sc_ecommerce_item.item (id, name, description, category_id, base_price)
VALUES (1, 'Alloy cleaner', 'Clean your alloys in a heartbeat', 1, 17.99),
       (2, 'Windscreen wipers - set of 2', 'Windscreen wipers - fits VW Golf, Audi A3', 1, 9.99),
       (3, 'Harry Potter 1', 'First Harry Potter', 2, 8.99),
       (4, 'Harry Potter 2', 'Second Harry Potter', 2, 8.99),
       (5, 'Samsung Galaxy Buds', 'Wireless headphones', 3, 59.99),
       (6, 'HP Omen Obelisk PC', 'Intel i7, 16GB RAM, 512 GB .M2 SSD', 4, 959.99),
       (7, 'Polo T-Shirt', 'Basic Polo T-Shirt', 5, 4.99),
       (8, 'Kitchen Table', 'Kitchen table 210x150x80', 6, 59.99);

BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE sc_ecommerce_item.item IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval((select pg_get_serial_sequence('sc_ecommerce_item.item', 'id')), COALESCE((SELECT MAX(id)+1 FROM  sc_ecommerce_item.item), 1), false);
COMMIT;

-- discounts
INSERT INTO sc_ecommerce_item.discount (id, name, description, active, value, value_type)
VALUES (1, '10%', 'Discount 10%', true, 10, 'PERCENT'),
       (2, '5€', 'Five euros off', true, 5,'ABSOLUTE');

INSERT INTO sc_ecommerce_item.discounted_item (id, item_id, discount_id)
VALUES (1, 1, 1),
       (2, 2, 2);

BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE sc_ecommerce_item.discount IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval((select pg_get_serial_sequence('sc_ecommerce_item.discount', 'id')), COALESCE((SELECT MAX(id)+1 FROM  sc_ecommerce_item.discount), 1), false);
COMMIT;

BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE sc_ecommerce_item.discounted_item IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval((select pg_get_serial_sequence('sc_ecommerce_item.discounted_item', 'id')), COALESCE((SELECT MAX(id)+1 FROM  sc_ecommerce_item.discounted_item), 1), false);
COMMIT;

-- item variants
INSERT INTO sc_ecommerce_item.item_variant (id, name, description, item_id, base_price)
VALUES (1, 'PaperBack - Harry Potter 1', 'First Harry Potter - paperback', 3, 8.99),
       (2, 'HardBack - Harry Potter 1', 'First Harry Potter - hardback', 3, 10.99),
       (3, 'Black - Samsung Galaxy Buds', 'Wireless headphones - Black', 5, 59.99),
       (4, 'Gold - Samsung Galaxy Buds', 'Wireless headphones - Gold', 5, 59.99);

BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE sc_ecommerce_item.item_variant IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval((select pg_get_serial_sequence('sc_ecommerce_item.item_variant', 'id')), COALESCE((SELECT MAX(id)+1 FROM  sc_ecommerce_item.item_variant), 1), false);
COMMIT;

