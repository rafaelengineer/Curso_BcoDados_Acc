-- Create the "od" schema
CREATE SCHEMA od;

-- Set the schema context to "od"
USE od;

-- Create CATEGORIES_TAB table
CREATE TABLE od.CATEGORIES_TAB (
    CATEGORY_NAME VARCHAR(255) PRIMARY KEY,
    CATEGORY_DESCRIPTION VARCHAR(255),
    CATEGORY_ID INT,
    PARENT_CATEGORY_ID INT
);

-- Create CUSTOMERS table
CREATE TABLE od.CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUST_FIRST_NAME VARCHAR(255),
    CUST_LAST_NAME VARCHAR(255),
    CUST_ADDRESS VARCHAR(255),
    PHONE_NUMBERS VARCHAR(255),
    NLS_LANGUAGE VARCHAR(255),
    NLS_TERRITORY VARCHAR(255),
    CREDIT_LIMIT DECIMAL(10, 2),
    CUST_EMAIL VARCHAR(255),
    ACCOUNT_MGR_ID INT,
    CUST_GEO_LOCATION VARCHAR(255),
    DATE_OF_BIRTH DATE,
    MARITAL_STATUS VARCHAR(255),
    GENDER VARCHAR(1),
    INCOME_LEVEL VARCHAR(255)
);

-- Create ORDERS table
CREATE TABLE od.ORDERS (
    ORDER_ID INT PRIMARY KEY,
    ORDER_DATE DATE,
    ORDER_MODE VARCHAR(255),
    CUSTOMER_ID INT,
    ORDER_STATUS VARCHAR(255),
    ORDER_TOTAL DECIMAL(10, 2),
    SALES_REP_ID INT,
    PROMOTION_ID INT
);

-- Create ORDER_ITEMS table
CREATE TABLE od.ORDER_ITEMS (
    ORDER_ID INT,
    LINE_ITEM_ID INT PRIMARY KEY,
    PRODUCT_ID INT,
    UNIT_PRICE DECIMAL(10, 2),
    QUANTITY INT
);

-- Create PRODUCT_INFORMATION table
CREATE TABLE od.PRODUCT_INFORMATION (
    PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(255),
    PRODUCT_DESCRIPTION VARCHAR(255),
    CATEGORY_ID INT,
    WEIGHT_CLASS INT,
    WARRANTY_PERIOD INT,
    SUPPLIER_ID INT,
    PRODUCT_STATUS VARCHAR(255),
    LIST_PRICE DECIMAL(10, 2),
    MIN_PRICE DECIMAL(10, 2),
    CATALOG_URL VARCHAR(255)
);

-- Add foreign key constraints

-- Foreign keys for ORDERS table
ALTER TABLE od.ORDERS
ADD CONSTRAINT FK_CUSTOMER_ID
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID);

-- Foreign keys for ORDER_ITEMS table
ALTER TABLE od.ORDER_ITEMS
ADD CONSTRAINT FK_ORDER_ID
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID);

ALTER TABLE od.ORDER_ITEMS
ADD CONSTRAINT FK_PRODUCT_ID
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT_INFORMATION(PRODUCT_ID);

-- Foreign keys for PRODUCT_INFORMATION table
ALTER TABLE od.PRODUCT_INFORMATION
ADD CONSTRAINT FK_CATEGORY_ID
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES_TAB(CATEGORY_ID);
