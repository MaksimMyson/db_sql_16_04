USE [db_sql_16_04]
GO 

-- 1. 
SELECT COUNT(*) AS NumOfWards
FROM Wards
WHERE Places > 10;

-- 2. 
SELECT d.Building, COUNT(w.Id) AS NumOfChambers
FROM Departments d
LEFT JOIN Wards w ON d.Id = w.DepartmentId
GROUP BY d.Building;

-- 3. 
SELECT d.Name AS DepartmentName, COUNT(w.Id) AS NumOfChambers
FROM Departments d
LEFT JOIN Wards w ON d.Id = w.DepartmentId
GROUP BY d.Name;

-- 4. 
SELECT d.Name AS DepartmentName, SUM(Doc.Premium) AS TotalAllowance
FROM Doctors Doc
JOIN Departments d ON Doc.DepartmentId = d.Id
GROUP BY d.Name;

-- 5. 
SELECT d.Name AS DepartmentName
FROM Departments d
JOIN Wards w ON d.Id = w.DepartmentId
JOIN DoctorsExaminations de ON w.Id = de.WardId
GROUP BY d.Name
HAVING COUNT(DISTINCT de.DoctorId) >= 5;

-- 6. 
SELECT COUNT(*) AS NumOfDoctors, SUM(Salary + Premium) AS TotalSalary
FROM Doctors;

-- 7. 
SELECT AVG(Salary + Premium) AS AverageSalary
FROM Doctors;

-- 8. 
SELECT Name AS ChamberName
FROM Wards
WHERE Places = (SELECT MIN(Places) FROM Wards);

-- 9. 
SELECT d.Building, SUM(w.Places) AS TotalSeats
FROM Departments d
JOIN Wards w ON d.Id = w.DepartmentId
WHERE d.Building IN (1, 6, 7, 8)
GROUP BY d.Building
HAVING SUM(w.Places) > 100 AND SUM(w.Places) > 10;