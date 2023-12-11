use  ExerciseDb

	CREATE TABLE Products (
    PID INT PRIMARY KEY,
    PName VARCHAR(255),
    PQ INT,
    PPrice DECIMAL(10,2),
    DiscountPercent DECIMAL(5,2),
    ManufacturingDate DATE
)
INSERT INTO Products (PID, PName, PQ, PPrice, DiscountPercent, ManufacturingDate)
VALUES
    (1, 'Pen', 50,500.00, 10.00, '2023-01-01'),
    (2, 'Pencil', 100, 450.00, 15.00, '2023-02-15'),
    (3, 'Eraser', 25, 355.00, 5.00, '2023-03-20'),
    (4, 'Book', 75, 7500.80, 20.00, '2023-04-10'),
    (5, 'Scale', 50, 400.00, 12.50, '2023-05-05');


CREATE FUNCTION CalculateDiscountedValue1(@price float, @discount_percent float)
RETURNS float
as
BEGIN
    DECLARE @discounted_value float;
    SET @discounted_value = @price - (@price * (@discount_percent / 100));
    RETURN @discounted_value;
END

SELECT PId, PPrice AS Price, DiscountPercent AS Discount, 
dbo.CalculateDiscountedValue1(PPrice, DiscountPercent) AS PriceAfterDiscount FROM Products