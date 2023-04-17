CREATE TABLE dbo.SKU(
ID INT identity(1,1) NOT NULL PRIMARY KEY,
Code AS 's'+CONVERT(VARCHAR(10),ID) UNIQUE,
Name VARCHAR(10)
);

CREATE TABLE dbo.Family(
ID INT identity(1,1) NOT NULL PRIMARY KEY,
SurName Varchar(20),
BudgetValue INT NOT NULL DEFAULT 0
);

CREATE TABLE dbo.Basket(
ID INT identity(1,1) NOT NULL PRIMARY KEY,
ID_SKU INT,
ID_Family INT,
Quantity INT CHECK(Quantity>=0),
Value INT CHECK(Value>=0),
PurchaseDate Date DEFAULT CURRENT_TIMESTAMP,
DiscountValue INT,
FOREIGN KEY(ID_SKU) REFERENCES dbo.SKU (ID),
FOREIGN KEY(ID_Family) REFERENCES dbo.Family (ID)
);