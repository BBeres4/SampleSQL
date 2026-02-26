-- 1) Show all orders with customer names (basic JOIN)
SELECT
  o.id AS order_id,
  o.order_date,
  o.status,
  c.first_name || ' ' || c.last_name AS customer
FROM orders o
JOIN customers c ON c.id = o.customer_id
ORDER BY o.order_date;


-- 2) Show each order and what items are inside it (JOIN 3 tables)
SELECT
  o.id AS order_id,
  p.name AS product,
  oi.quantity,
  p.price,
  (oi.quantity * p.price) AS line_total
FROM order_items oi
JOIN orders o   ON o.id = oi.order_id
JOIN products p ON p.id = oi.product_id
ORDER BY o.id;


-- 3) Total cost per order (GROUP BY + SUM)
-- Ignore cancelled orders
SELECT
  o.id AS order_id,
  ROUND(SUM(oi.quantity * p.price), 2) AS order_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN products p     ON p.id = oi.product_id
WHERE o.status != 'cancelled'
GROUP BY o.id
ORDER BY order_total DESC;


-- 4) How much money each customer has spent (simple “analytics” query)
SELECT
  c.first_name || ' ' || c.last_name AS customer,
  ROUND(SUM(oi.quantity * p.price), 2) AS total_spent
FROM customers c
JOIN orders o        ON o.customer_id = c.id
JOIN order_items oi  ON oi.order_id = o.id
JOIN products p      ON p.id = oi.product_id
WHERE o.status != 'cancelled'
GROUP BY c.id
ORDER BY total_spent DESC;


-- 5) Best-selling products (by quantity sold)
SELECT
  p.name AS product,
  SUM(oi.quantity) AS total_units_sold
FROM products p
JOIN order_items oi ON oi.product_id = p.id
JOIN orders o       ON o.id = oi.order_id
WHERE o.status != 'cancelled'
GROUP BY p.id
ORDER BY total_units_sold DESC;
