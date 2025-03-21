CREATE PROCEDURE GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT EmployeeID, FirstName, LastName, DepartmentID
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
