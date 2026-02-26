PRAGMA foreign_keys = ON;

-- Delete tables if they already exist (prevents errors when rebuilding)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers = people who buy stuff
CREATE TABLE customers (
  id         INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name  TEXT,
  email      TEXT,
  city       TEXT,
  state      TEXT
);

-- Products = items you can buy
CREATE TABLE products (
  id    INTEGER PRIMARY KEY,
  name  TEXT,
  price REAL
);

-- Orders = a purchase made by 1 customer
CREATE TABLE orders (
  id           INTEGER PRIMARY KEY,
  customer_id  INTEGER,
  order_date   TEXT,
  status       TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Order items = the products inside an order
CREATE TABLE order_items (
  id         INTEGER PRIMARY KEY,
  order_id   INTEGER,
  product_id INTEGER,
  quantity   INTEGER,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);
