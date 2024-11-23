create database project3
use project3

select * from  [OLE DB Destination]

CREATE TABLE customers (
    ID INT PRIMARY KEY,                          -- ID column as primary key
    cc_num BIGINT NOT NULL,                     -- Credit card number (Unique identifier for customers)
    first VARCHAR(50),                           -- First name
    last VARCHAR(50),                            -- Last name
    gender CHAR(1),                              -- Gender
    dob VARCHAR(200),                                    -- Date of birth
    street VARCHAR(255),                         -- Street address
    city VARCHAR(100),                           -- City
    state CHAR(2),                               -- State
    zip CHAR(10),                                -- Zip code
    job VARCHAR(100),                            -- Job title
    FOREIGN KEY (ID) REFERENCES [OLE DB Destination](ID)  -- Foreign key referencing OLE DB Destination
);

CREATE TABLE merchants (
    ID INT PRIMARY KEY,            -- ID column as primary key with auto-increment starting from 1
    merchant_name VARCHAR(255),                  -- Merchant name
    category VARCHAR(50),                         -- Merchant category
    merch_lat DECIMAL(6, 4),                     -- Merchant latitude
    merch_long DECIMAL(7, 4),                    -- Merchant longitude
    FOREIGN KEY (ID) REFERENCES [OLE DB Destination](ID)  -- Foreign key referencing OLE DB Destination
);

CREATE TABLE transactions (
    ID INT PRIMARY KEY,                          -- ID column as primary key
    cc_num BIGINT NOT NULL,                     -- Unique transaction number
    trans_date_trans_time VARCHAR(200),             -- Date and time of the transaction
    amt DECIMAL(10, 2),                         -- Transaction amount
    unix_time BIGINT,                           -- Unix timestamp of the transaction
    is_fraud TINYINT,                           -- 0: Not fraud, 1: Fraud
    FOREIGN KEY (ID) REFERENCES [OLE DB Destination](ID)  -- Foreign key referencing OLE DB Destination
);

CREATE TABLE locations (
    ID INT PRIMARY KEY,                          -- ID column as primary key
    zip CHAR(5),                                 -- Zip code
    city VARCHAR(100),                           -- City
    state CHAR(2),                               -- State
    lat DECIMAL(6, 4),                           -- Latitude of the location
    long DECIMAL(7, 4),                          -- Longitude of the location
    city_pop INT,                                -- Population of the city
    FOREIGN KEY (ID) REFERENCES [OLE DB Destination](ID)  -- Foreign key referencing OLE DB Destination
);

INSERT INTO customers (ID,cc_num, first, last, gender, dob, street, city, state, zip, job)
SELECT 
     ID ,
    cc_num, 
    first, 
    last, 
    gender, 
    dob ,
    street, 
    city, 
    state, 
    zip, 
    job
FROM [OLE DB Destination];  -- Replace with your source

SELECT * FROM customers ,locations ,merchants , transactions

INSERT INTO merchants (ID , merchant_name, category, merch_lat, merch_long)
SELECT ID, merchant, category, merch_lat, merch_long
FROM [OLE DB Destination];

INSERT INTO locations (ID,zip, city, state, lat, long, city_pop)
SELECT ID,zip, city, state, lat, long, city_pop
FROM [OLE DB Destination];

INSERT INTO transactions (ID , cc_num, amt,trans_date_trans_time, unix_time, is_fraud)
SELECT ID  ,cc_num, amt,trans_date_trans_time, unix_time, is_fraud  -- Ensure to select all necessary columns
FROM [OLE DB Destination];

SELECT * FROM locations

DROP TABLE customers
select * from [OLE DB Destination]

select * from [OLE DB Destination]

EXEC sp_rename '[OLE DB Destination].id', 'ID', 'COLUMN';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'OLE DB Destination';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'OLE DB Destination' AND COLUMN_NAME = 'ID';
ALTER TABLE [OLE DB Destination]
ALTER COLUMN ID INT NOT NULL;

ALTER TABLE [OLE DB Destination]
ADD CONSTRAINT PK_OLEDB_ID PRIMARY KEY (ID);

ALTER TABLE customerrs
ADD CONSTRAINT PK_customerrs_cc_num PRIMARY KEY (cc_num);

ALTER TABLE customers ADD ID INT;
ALTER TABLE merchants ADD ID INT;
ALTER TABLE transactions ADD ID INT;
ALTER TABLE locations ADD ID INT;

ALTER TABLE customers
ADD CONSTRAINT FK_customers_NewID FOREIGN KEY (ID)
REFERENCES [OLE DB Destination](ID);

ALTER TABLE merchants
ADD CONSTRAINT FK_merchants_NewID FOREIGN KEY (ID)
REFERENCES [OLE DB Destination](ID);

ALTER TABLE transactions
ADD CONSTRAINT FK_transactions_NewID FOREIGN KEY (ID)
REFERENCES [OLE DB Destination](ID);

ALTER TABLE locations
ADD CONSTRAINT FK_locations_NewID FOREIGN KEY (ID)
REFERENCES [OLE DB Destination](ID);


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers' AND COLUMN_NAME = 'ID';

ALTER TABLE customers
ALTER COLUMN ID INT NOT NULL;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '[OLE DB Destination]' AND COLUMN_NAME = 'dob';


select * from customers 
select * from transactions 
select * from locations 
select * from merchants 
select * from [OLE DB Destination] 