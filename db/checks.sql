-- SQL Script used only for CHECK constraints because they're not supported by phpMyAdmin

ALTER TABLE carts DROP CONSTRAINT IF EXISTS CK_CARTS_QUANTITY;
ALTER TABLE products DROP CONSTRAINT IF EXISTS CK_PRODUCTS_PRICE;
ALTER TABLE products DROP CONSTRAINT IF EXISTS CK_PRODUCTS_DISCOUNT_PERCENTAGE;
ALTER TABLE products DROP CONSTRAINT IF EXISTS CK_PRODUCTS_STOCK;
ALTER TABLE products DROP CONSTRAINT IF EXISTS CK_PRODUCTS_VISIBLE;
ALTER TABLE ratings DROP CONSTRAINT IF EXISTS CK_RATINGS_GRADE;
ALTER TABLE tickets DROP CONSTRAINT IF EXISTS CK_CARTS_RESOLVED;

ALTER TABLE carts ADD CONSTRAINT CK_CARTS_QUANTITY check(cart_quantity > 0);

ALTER TABLE products ADD CONSTRAINT CK_PRODUCTS_PRICE check(product_price > 0);
ALTER TABLE products ADD CONSTRAINT CK_PRODUCTS_DISCOUNT_PERCENTAGE check(product_discount_percentage >= 0 AND product_discount_percentage <= 100);
ALTER TABLE products ADD CONSTRAINT CK_PRODUCTS_STOCK check(product_stock >= 0);
ALTER TABLE products ADD CONSTRAINT CK_PRODUCTS_VISIBLE check(product_visible = 0 OR product_visible = 1);

ALTER TABLE ratings ADD CONSTRAINT CK_RATINGS_GRADE check(rating_grade >= 0 AND rating_grade <= 5);

ALTER TABLE tickets ADD CONSTRAINT CK_CARTS_RESOLVED check(ticket_resolved = 0 OR ticket_resolved = 1);