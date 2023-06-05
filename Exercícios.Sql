1 - SELECT Bdate, Address 
    FROM EMPLOYEE
    WHERE Fname='John' 
    AND Minit='B' 
    AND Lname='Smith';


2 - SELECT e.Fname, e.Address, d.Dname as DepartmentName 
	FROM EMPLOYEE e 
	INNER JOIN DEPARTMENT d 
	ON e.ssn=d.mgr_ssn
	WHERE d.Dname='Research';



3 - SELECT p.Plocation, d.Dnumber, e.Lname, e.Address, e.Bdate 
	FROM PROJECT p 
	INNER JOIN DEPARTMENT 
	ON p.Pnumber=d.Dnumber
	INNER JOIN EMPLOYEE e
	ON e.ssn=d.mgr_ssn


4 - SELECT E.Lname as LastName, D.Dname as DepartmentNumber, P.Pnumber as ProjectNumber 
	FROM EMPLOYEE E 
	INNER JOIN DEPARTMENT D 
	ON E.Super_ssn=D.Mgr_ssn 
	INNER JOIN PROJECT P 
	ON D.Dnumber = P.Dnum 
	WHERE E.Lname='Smith';


13 - SELECT (SALARY*1.1) AS RESULT 
	FROM EMPLOYEE 
	WHERE FName='ProductX';

14 - SELECT * 
	FROM EMPLOYEE 
	WHERE BETWEEN 30000 
	AND 40000 
	AND Dno=5;


SELECT E.Fname
FROM EMPLOYEE E 
WHERE (SELECT COUNT(D.Essn)
	FROM DEPENDENT D WHERE D.Essn=E.Ssn);

SELECT COUNT()
	FROM DEPARTMENT D WHERE D.Dnumber=E.Dno);

SELECT Dno, COUNT(*), AVG(Salary) FROM EMPLOYEE GROUP BY Dno;


SELECT P.Pnumber, P.PName, COUNT(W.Essn) as Workers
FROM WORKS_ON W 
INNER JOIN PROJECT P 
ON P.Pnumber=W.Pno 
GROUP BY W.Pno;

SELECT ROUND(AVG(Salary),2) as Salary,COUNT(*)as People,DNO FROM EMPLOYEE GROUP BY DNO;

SELECT P.Pnumber, P.Pname,COUNT(*) FROM WORKS_ON INNER JOIN PROJECT P ON Pno=Pnumber GROUP BY Pno HAVING COUNT(*)>2;


SELECT * FROM PROJECT, WORKS_ON WHERE Pnumber=Pno;

SELECT Pname, COUNT(*) FROM PROJECT, WORKS_ON WHERE Pnumber=Pno GROUP BY Pnumber HAVING COUNT(*) > 2;

1- 
EXPLAIN 
SELECT E.Lname AS Employee_name, S.Lname AS Supervisor_name 
FROM (EMPLOYEE AS E 
LEFT OUTER JOIN EMPLOYEE AS S 
ON E.Super_ssn=S.Ssn);


2-
SELECT P.Pnumber, P.Dnum, E.Lname
FROM PROJECT P
JOIN DEPARTMENT D
ON P.Dnum=D.Dnumber
JOIN EMPLOYEE E
ON D.Mgr_ssn=E.Ssn
WHERE P.Plocation='Stafford'

3-
SELECT E.Fname AS Employee_name, S.Fname AS Supervisor_name 
FROM EMPLOYEE AS E 
LEFT JOIN EMPLOYEE AS S 
ON E.Super_ssn=S.Ssn 
WHERE S.Ssn IS NULL ;

4-
SELECT max(Salary) as MaxSalary, min(Salary) as MinSalary, AVG(Salary) as AverageSalary
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D 
ON E.Dno=D.Dnumber 
WHERE D.Dname='Research';


5-
SELECT P.Pnumber, P.Pname,
COUNT(E.ssn) AS EmployeersNumber
FROM PROJECT P
INNER JOIN WORKS_ON W
ON P.Pnumber=W.Pno
INNER JOIN EMPLOYEE E
ON W.Essn=E.Ssn
WHERE E.Dno=5
GROUP BY P.Pnumber;



SELECT CONCAT(Fname,' ' ,Lname) as Name, date_format(`Bdate`,'%d de %M %Y') as `DataNascimento` 
FROM `EMPLOYEE`;
