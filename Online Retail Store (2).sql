USE OnlineRetailStore;
GO

-- =============================================
-- 1. INSERT OPERATIONS
-- =============================================

-- 1. Insert a new Customer

INSERT INTO Customers
(
    FullName,
    PhoneNumber,
    Email,
    ShippingAddress,
    RegistrationDate
)
VALUES
(
    'Ahmed Mohamed',
    '01012345678',
    'ahmed@gmail.com',
    'Cairo, Egypt',
    '2026-09-23'
);
GO


-- 2. Insert 3 new Suppliers

INSERT INTO Suppliers
(
    Name,
    Country,
    Email,
    Address,
    ContactNumber
)
VALUES
(
    'Tech Supplier',
    'Egypt',
    'tech@supplier.com',
    'Cairo, Egypt',
    '01011111111'
),
(
    'Global Electronics',
    'Egypt',
    'global@supplier.com',
    'Giza, Egypt',
    '01022222222'
),
(
    'Smart Products',
    'Egypt',
    'smart@supplier.com',
    'Alexandria, Egypt',
    '01033333333'
);
GO


-- 3. Insert 2 Categories

INSERT INTO Categories
(
    Name,
    Description
)
VALUES
(
    'Electronics',
    'Electronic devices and accessories'
),
(
    'Computers',
    'Computers and computer accessories'
);
GO


-- 4. Allow Product to be inserted with only Name and UnitPrice

ALTER TABLE Products
ADD CONSTRAINT DF_Products_StockQuantity
DEFAULT 0 FOR StockQuantity;
GO

ALTER TABLE Products
ALTER COLUMN CategoryId INT NULL;
GO


-- 5. Insert Product using only Name and UnitPrice

INSERT INTO Products
(
    Name,
    UnitPrice
)
VALUES
(
    'Wireless Mouse',
    75.00
);
GO


-- 6. Create ArchivedStock

CREATE TABLE ArchivedStock
(
    TranId INT PRIMARY KEY,
    ProductId INT NOT NULL,
    QuantityChange INT NOT NULL,
    TranDate DATETIME
);
GO


-- 7. Archive StockTransactions before 2023

INSERT INTO ArchivedStock
(
    TranId,
    ProductId,
    QuantityChange,
    TranDate
)
SELECT
    TranId,
    ProductId,
    QuantityChange,
    TranDate
FROM StockTransactions
WHERE TranDate < '2023-01-01';
GO


-- =============================================
-- 2. UPDATE OPERATIONS
-- =============================================

-- 1. Increase UnitPrice by 10%
--    for products under 100 EGP

UPDATE Products
SET UnitPrice = UnitPrice * 1.10
WHERE UnitPrice < 100;
GO


-- 2. Update Order Status

UPDATE Orders
SET Status =
    CASE
        WHEN TotalAmount > 5000 THEN 'Premium'
        ELSE 'Standard'
    END;
GO


-- =============================================
-- Verification
-- =============================================

SELECT *
FROM Customers;

SELECT *
FROM Suppliers;

SELECT *
FROM Categories;

SELECT *
FROM Products;

SELECT *
FROM ArchivedStock;

SELECT *
FROM Orders;
GO