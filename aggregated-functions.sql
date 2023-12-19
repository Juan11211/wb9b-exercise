SELECT * from northwind.suppliers;

-- how many suppliers are there
SELECT COUNT(*)
FROM northwind.suppliers;

-- sum of all employees salary
SELECT SUM(Salary)
FROM northwind.employees;

-- price of the cheapest item that northwind sells
SELECT MIN(UnitPrice)
FROM northwind.products;

-- avg price 
SELECT AVG(UnitPrice)
FROM northwind.products;

-- most expensive
SELECT MAX(UnitPrice)
FROM northwind.products;

-- supplier id, num of items 

SELECT SupplierID, COUNT(*)
FROM northwind.products
GROUP BY SupplierID;

-- cat id and avg price
SELECT CategoryID, AVG(UnitPrice)
FROM northwind.products
GROUP BY CategoryID;

-- supplier id for 5 or more items , # of items they supply
SELECT SupplierID, COUNT(QuantityPerUnit) 
FROM northwind.products
GROUP BY SupplierID
HAVING COUNT(ProductID) >= 5;

-- list product id, product name and inventory value -- calculate unit price by the # of units at hand , sort by descending order by value, if 2 or more same value or bu product name
SELECT
    ProductID,
    ProductName,
    UnitPrice,
    UnitsInStock,
    UnitsOnOrder,
    (UnitsInStock + UnitsOnOrder) AS TotalUnits,
    (UnitPrice * (UnitsInStock + UnitsOnOrder)) AS InventoryValue
FROM
    northwind.products
ORDER BY
    InventoryValue DESC,
    ProductName;
