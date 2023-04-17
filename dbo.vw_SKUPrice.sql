CREATE VIEW dbo.vw_SKUPrice AS
SELECT *,dbo.udf_GetSKUPrice(ID) AS price
FROM dbo.SKU
;