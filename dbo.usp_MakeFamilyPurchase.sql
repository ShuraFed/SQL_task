CREATE OR ALTER PROCEDURE dbo.usp_MakeFamilyPurchase (@FamilySurName varchar(255))
AS
BEGIN
    IF EXISTS (SELECT 1 FROM dbo.Family WHERE SurName = @FamilySurName)
    BEGIN
        UPDATE dbo.Family 
        SET BudgetValue -= COALESCE((SELECT SUM(dbo.Basket.Value) 
                            FROM dbo.Basket 
                            WHERE dbo.Family.ID = dbo.Basket.ID_Family),0)
        WHERE SurName = @FamilySurName;
    END
    ELSE
    BEGIN
	RAISERROR('Family "%s" is not found in the table', 16, 1,@FamilySurName) WITH NOWAIT
    END;
END;