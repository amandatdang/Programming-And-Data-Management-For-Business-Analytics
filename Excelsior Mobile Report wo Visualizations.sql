/*
Project 1: Excelsior Mobile Report
Amanda Dang
*/

USE [22WQ_BUAN4210_Lloyd_ExcelsiorMobile];
-- 1 --
-- A
SELECT TOP 2 City
FROM Subscriber
GROUP BY City
ORDER BY COUNT(City) DESC;

-- B
SELECT TOP 3 City
FROM Subscriber
GROUP BY City
ORDER BY COUNT(City) ASC;

-- C
SELECT TOP 1 PlanName
FROM Subscriber
GROUP BY PlanName
ORDER BY COUNT(PlanName) ASC;

-- 2 --
-- A
SELECT Type, COUNT(Type) AS 'Total Users'
FROM Device
GROUP BY Type;

-- B
SELECT CONCAT(FirstName, ' ', LastName) AS 'Full Name'
FROM Subscriber
WHERE MDN IN (
	SELECT MDN
	FROM DirNums
	WHERE IMEI IN (
		SELECT IMEI
		FROM Device
		WHERE Type = 'Apple'));

-- C
SELECT CONCAT(S.FirstName, ' ', S.LastName) AS 'Full Name', D.YearReleased
FROM Subscriber AS S
	JOIN DirNums AS DN
		ON S.MDN = DN.MDN
	JOIN Device AS D
		ON DN.IMEI = D.IMEI
WHERE D.YearReleased < 2018;

-- 3 --
-- A
SELECT TOP 1 S.City, S.PlanName, SUM(L.DataInMB) AS 'Total Data'
FROM Subscriber AS S
	JOIN LastMonthUsage AS L
		ON S.MIN = L.MIN
WHERE S.PlanName NOT LIKE 'Unl%'
GROUP BY S.City, S.PlanName
ORDER BY SUM(L.DataInMB) DESC;

-- 4 --
-- A
SELECT TOP 1 CONCAT(S.FirstName, ' ', S.LastName) AS 'Full Name'
FROM Subscriber AS S
	JOIN Bill AS B
		ON S.MIN = B.MIN
ORDER BY B.Total DESC;

-- B
SELECT TOP 1 M.PlanName
FROM MPlan AS M
	JOIN Subscriber AS S
		ON M.PlanName = S.PlanName
	JOIN Bill AS B
		ON S.MIN = B.MIN
ORDER BY B.Total DESC;

-- 5 --
-- A
SELECT TOP 1 LEFT(S.MDN,3) AS 'Area Code', SUM(L.Minutes) AS 'Minutes'
FROM Subscriber AS S
	JOIN LastMonthUsage AS L
		ON S.MIN = L.MIN
GROUP BY LEFT(S.MDN,3)
ORDER BY 'Minutes' DESC;

-- B
SELECT S.City
FROM Subscriber AS S
	JOIN LastMonthUsage AS L
		ON S.MIN = L.MIN
GROUP BY S.City
HAVING MAX(L.Minutes) > 700
	AND MIN(L.Minutes) < 200
ORDER BY MAX(L.Minutes) - MIN(L.Minutes) DESC;


