DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
)

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
)

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT8,
  day DATE,
  merchant_id INT8 REFERENCES marchants(id),
  tag_id INT8 REFERENCES tags(id)
)