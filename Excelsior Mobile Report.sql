/*
Project 1: Excelsior Mobile Report
Amanda Dang
*/

USE [22WQ_BUAN4210_Lloyd_ExcelsiorMobile];
-- 1 --
-- A
SELECT CONCAT(S.FirstName, ' ', S.LastName) AS 'Full Name', L.Minutes, L.DataInMB, L.Texts, B.Total
FROM Subscriber as S
	JOIN LastMonthUsage as L
		ON S.MIN = L.MIN
	JOIN Bill AS B
		ON L.MIN = B.MIN
ORDER BY 'Full Name';

-- B
SELECT AVG(L.Minutes) AS 'Avg Minutes', AVG(L.DataInMB) AS 'Avg Data', AVG(L.Texts) AS 'Avg Texts', AVG(B.Total) AS 'Avg Total'
FROM LastMonthUsage AS L
	JOIN Bill AS B
		ON L.MIN = B.MIN
	JOIN Subscriber AS S
		ON B.MIN = S.MIN
GROUP BY S.City;

-- C
SELECT SUM(L.Minutes) AS 'Total Minutes', SUM(L.DataInMB) AS 'Total Data', SUM(L.Texts) AS 'Total Texts', SUM(B.Total) AS 'Total Bill'
FROM LastMonthUsage AS L
	JOIN Bill AS B
		ON L.MIN = B.MIN
	JOIN Subscriber AS S
		ON B.MIN = S.MIN
GROUP BY S.City;

-- D
SELECT AVG(L.Minutes) AS 'Avg Minutes', AVG(L.DataInMB) AS 'Avg Data', AVG(L.Texts) AS 'Avg Texts', AVG(B.Total) AS 'Avg Total'
FROM LastMonthUsage AS L
	JOIN Bill AS B
		ON L.MIN = B.MIN
	JOIN Subscriber AS S
		ON B.MIN = S.MIN
GROUP BY S.PlanName;

-- E
SELECT SUM(L.Minutes) AS 'Total Minutes', SUM(L.DataInMB) AS 'Total Data', SUM(L.Texts) AS 'Total Texts', SUM(B.Total) AS 'Total Bill'
FROM LastMonthUsage AS L
	JOIN Bill AS B
		ON L.MIN = B.MIN
	JOIN Subscriber AS S
		ON B.MIN = S.MIN
GROUP BY S.PlanName;