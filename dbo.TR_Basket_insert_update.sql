CREATE OR ALTER TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
BEGIN
    UPDATE dbo.Basket
    SET DiscountValue = CASE 
        WHEN inserted.ID_SKU IN (
            SELECT ID_SKU FROM inserted GROUP BY ID_SKU HAVING COUNT(*) > 1
        ) THEN inserted.Value * 0.05
        ELSE 0
    END
    FROM dbo.Basket
    JOIN inserted ON dbo.Basket.ID = inserted.ID;
END;