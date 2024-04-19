USE [db_sql_16_04]
GO

-- 6. 
SELECT DISTINCT d.Name AS DoctorName, dep.Name AS DepartmentName
FROM Doctors d
JOIN Vacations v ON d.Id = v.DoctorId
JOIN Wards w ON w.DepartmentId = v.DoctorId
JOIN Departments dep ON dep.Id = w.DepartmentId
WHERE DATEPART(dw, v.StartDate) BETWEEN 2 AND 6; 

-- 7. 
SELECT w.Name AS WardName, dep.Name AS DepartmentName
FROM Doctors d
JOIN Vacations v ON d.Id = v.DoctorId
JOIN Wards w ON w.DepartmentId = v.DoctorId
JOIN Departments dep ON dep.Id = w.DepartmentId
WHERE d.Name = 'Helen Williams';

-- 8. 
SELECT dep.Name AS DepartmentName, d.Name AS DoctorName
FROM Departments dep
JOIN Donations don ON dep.Id = don.DepartmentId
JOIN Doctors d ON d.Id = dep.Id
WHERE don.Amount > 100000;

-- 9. 
SELECT dep.Name AS DepartmentName
FROM Departments dep
LEFT JOIN Doctors d ON dep.Id = d.Id
WHERE d.Premium = 0 OR d.Premium IS NULL;

-- 10. 
SELECT s.Name AS SpecializationName
FROM Specializations s
JOIN DoctorsSpecializations ds ON s.Id = ds.SpecializationId
JOIN Doctors d ON d.Id = ds.DoctorId
JOIN Diseases dis ON dis.Id = d.DiseaseId
WHERE dis.Severity > 3;

-- 11. 
SELECT dep.Name AS DepartmentName, d.Name AS DiseaseName
FROM Departments dep
JOIN Surveys sur ON dep.Id = sur.DepartmentId
JOIN Diseases d ON d.Id = sur.DiseaseId
WHERE sur.Date >= DATEADD(month, -6, GETDATE());

-- 12. 
SELECT dep.Name AS DepartmentName, w.Name AS WardName
FROM Departments dep
JOIN Wards w ON dep.Id = w.DepartmentId
JOIN Examinations e ON w.Id = e.WardId
JOIN Diseases d ON e.DiseaseId = d.Id
WHERE d.IsContagious = 1; 