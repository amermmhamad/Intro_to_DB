-- Create / select the target database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- AUTHORS
CREATE TABLE IF NOT EXISTS authors (
  author_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=INNODB;

-- CUSTOMERS
CREATE TABLE IF NOT EXISTS customers (
  customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT,
  PRIMARY KEY (customer_id)
) ENGINE=INNODB;

-- BOOKS
CREATE TABLE IF NOT EXISTS books (
  book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT UNSIGNED NOT NULL,
  price DOUBLE NOT NULL,
  publication_date DATE,
  PRIMARY KEY (book_id),
  CONSTRAINT fk_books_authors FOREIGN KEY (author_id) REFERENCES authors(author_id)
) ENGINE=INNODB;

-- ORDERS
CREATE TABLE IF NOT EXISTS orders (
  order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  customer_id INT UNSIGNED NOT NULL,
  order_date DATE NOT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=INNODB;

-- ORDER DETAILS
CREATE TABLE IF NOT EXISTS order_details (
  orderdetailid INT UNSIGNED NOT NULL AUTO_INCREMENT,
  order_id INT UNSIGNED NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  quantity DOUBLE NOT NULL,
  PRIMARY KEY (orderdetailid),
  CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_order_details_books FOREIGN KEY (book_id) REFERENCES books(book_id)
) ENGINE=INNODB;
