CREATE FUNCTION GetFullName (@EmployeeID INT)
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @FullName NVARCHAR(255);
    
    SELECT @FullName = FirstName + ' ' + LastName
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
    
    RETURN @FullName;
END;
