--VIEW

SELECT P.ProductID, P.ProductName, P.SupplierID, S.CompanyName, 
S.ContactName, S.Phone, P.CategoryID, C.CategoryName, P.QuantityPerUnit,
P.UnitPrice, P.UnitsInStock, P.ReorderLevel, P.Discontinued
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID

--Tüm ürünleri, Suppliersten þirket, tedarikçi adý ve telefon;
--Categories kýsmýndan da kategori adýný getir.
SELECT P.*, S.CompanyName, S.ContactName, S.Phone, 
C.CategoryName
FROM Products as P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID

--Bu þekilde method oluþturuyoruz. Bundan yapýlan sorgular sanal bir tablo oluþturur. GERÇEK BÝR TABLO DEÐÝLDÝR.
CREATE VIEW TumUrunBilgisi
AS
SELECT P.ProductID, P.ProductName, P.SupplierID, S.CompanyName, 
S.ContactName, S.Phone, P.CategoryID, C.CategoryName, P.QuantityPerUnit,
P.UnitPrice, P.UnitsInStock, P.ReorderLevel, P.Discontinued
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID

SELECT * FROM TumUrunBilgisi

--50'nin üzerinde fiyata sahip olan bu 3 ismi TumUrunBilgisi metodundan çekiyoruz.
SELECT ProductName, CompanyName, CategoryName FROM TumUrunBilgisi WHERE UnitPrice > 50

--ALP HOCA MESLEK SIRRI (Tek bir noktada kategori, ürün, tedarikçi tablosunun tamamýnda '%Mea%' yi arattýk.)
SELECT ProductID, ProductName, ProductName + ' ' + CompanyName + ' ' + CategoryName AS MergedRow FROM TumUrunBilgisi
WHERE ProductName + ' ' + CompanyName + ' ' + CategoryName LIKE '%Mea%'

SELECT OD.OrderID, OD.Quantity, OD.UnitPrice, TUB.ProductName, TUB.CategoryName, TUB.CompanyName
FROM [Order Details] AS OD
JOIN TumUrunBilgisi AS TUB ON OD.ProductID = TUB.ProductID 
