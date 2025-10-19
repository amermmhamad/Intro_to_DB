CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
  author_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=INNODB;

CREATE TABLE Customers (
  customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT,
  PRIMARY KEY (customer_id)
) ENGINE=INNODB;

CREATE TABLE Books (
  book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT UNSIGNED NOT NULL,
  price DOUBLE NOT NULL,
  publication_date DATE,
  PRIMARY KEY (book_id),
  CONSTRAINT fk_books_authors FOREIGN KEY (author_id) REFERENCES Authors(author_id)
) ENGINE=INNODB;

CREATE TABLE Orders (
  order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  customer_id INT UNSIGNED NOT NULL,
  order_date DATE NOT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
) ENGINE=INNODB;

CREATE TABLE Order_Details (
  orderdetailid INT UNSIGNED NOT NULL AUTO_INCREMENT,
  order_id INT UNSIGNED NOT NULL,
  book_id INT UNSIGNED NOT NULL,
  quantity DOUBLE NOT NULL,
  PRIMARY KEY (orderdetailid),
  CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  CONSTRAINT fk_order_details_books FOREIGN KEY (book_id) REFERENCES Books(book_id)
) ENGINE=INNODB;
