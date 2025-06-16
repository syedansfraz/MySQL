create database triggers_testing;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
insert into products values(2,'candy',30);
select * from products;
insert into orders values(2,1,5);
DELIMITER //
CREATE TRIGGER trg_reduce_stock
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END;
//
DELIMITER ;


