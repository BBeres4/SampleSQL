-- Customers
INSERT INTO customers (id, first_name, last_name, email, city, state) VALUES
(1, 'Ben', 'Beres', 'ben@example.com', 'Kent', 'OH'),
(2, 'Ava', 'Nguyen', 'ava@example.com', 'Columbus', 'OH'),
(3, 'Marcus', 'Hill', 'marcus@example.com', 'Cleveland', 'OH'),
(4, 'Sofia', 'Reed', 'sofia@example.com', 'Pittsburgh', 'PA');

-- Products
INSERT INTO products (id, name, price) VALUES
(1, 'Wireless Earbuds', 39.99),
(2, 'Mechanical Keyboard', 79.99),
(3, 'Coffee', 4.49),
(4, 'Chips', 3.49),
(5, 'Desk Lamp', 18.99);

-- Orders (status can be: paid, shipped, delivered, cancelled)
INSERT INTO orders (id, customer_id, order_date, status) VALUES
(1, 1, '2026-01-12', 'delivered'),
(2, 1, '2026-02-05', 'paid'),
(3, 2, '2026-01-22', 'delivered'),
(4, 3, '2026-02-02', 'cancelled'),
(5, 4, '2026-02-10', 'shipped');

-- Order items (which products are in each order)
INSERT INTO order_items (id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1), -- Ben bought 1 earbuds
(2, 1, 3, 2), -- Ben bought 2 coffees
(3, 2, 2, 1), -- Ben bought 1 keyboard
(4, 3, 4, 3), -- Ava bought 3 chips
(5, 3, 3, 1), -- Ava bought 1 coffee
(6, 4, 5, 1), -- Marcus cancelled a lamp order
(7, 5, 1, 2); -- Sofia bought 2 earbuds
