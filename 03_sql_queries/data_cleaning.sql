-- Removes duplicate rows using DISTINCT
SELECT DISTINCT *
INTO Customers_Clean
FROM Customers;

SELECT DISTINCT *
INTO Products_Clean
FROM Products;

SELECT DISTINCT *
INTO Orders_Clean
FROM Orders;

-- Fill missing emails with placeholder
UPDATE Customers_Clean
SET Email = 'noemail@unknown.com'
WHERE Email IS NULL;

-- Remove extra spaces in text columns
UPDATE Customers_Clean
SET FullName = LTRIM(RTRIM(FullName));

UPDATE Products_Clean
SET ProductName = LTRIM(RTRIM(ProductName)),
    Category = LTRIM(RTRIM(Category));

-- Standardize case to lowercase
UPDATE Customers_Clean
SET Email = LOWER(Email),
    FullName = LOWER(FullName);

