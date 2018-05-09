DROP DATABASE IF EXISTS restaurant;

CREATE DATABASE restaurant;

\c restaurant

CREATE TABLE waiters(
  id SERIAL PRIMARY KEY,
  name VARCHAR(128)
);


CREATE TABLE menu_items(
  id SERIAL PRIMARY KEY,
  name VARCHAR(128),
  description TEXT,
  price NUMERIC
);


CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  menu_item_id INT REFERENCES menu_items(id),
  waiter_id INT REFERENCES waiters(id),
  notes VARCHAR(128),
  open BOOLEAN
);
