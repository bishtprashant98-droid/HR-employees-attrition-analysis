CREATE DATABASE hr_project;

CREATE TABLE hr_attrition (
Age INT,
Attrition VARCHAR(10),
BusinessTravel VARCHAR(50),
DailyRate INT,
Department VARCHAR(50),
DistanceFromHome INT,
Education INT,
EducationField VARCHAR(50),
EnvironmentSatisfaction INT,
Gender VARCHAR(20),
HourlyRate INT,
JobInvolvement INT,
JobLevel INT,
JobRole VARCHAR(50),
JobSatisfaction INT,
MaritalStatus VARCHAR(20),
MonthlyIncome INT,
MonthlyRate INT,
NumCompaniesWorked INT,
OverTime VARCHAR(10),
PercentSalaryHike INT,
PerformanceRating INT,
RelationshipSatisfaction INT,
StockOptionLevel INT,
TotalWorkingYears INT,
TrainingTimesLastYear INT,
WorkLifeBalance INT,
YearsAtCompany INT,
YearsInCurrentRole INT,
YearsSinceLastPromotion INT,
YearsWithCurrManager INT,
SalarySlab VARCHAR(20),
ExperienceGroup VARCHAR(20)
);

SELECT * FROM hr_attrition;

-------- Total Employees --------
SELECT COUNT(*) AS total_employees
FROM hr_attrition;

-------- Attrition Count --------
SELECT COUNT(*) AS total_employees
FROM hr_attrition
WHERE Attrition = 'YES';

------- Attrition by Department ------
SELECT Department,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_attrition
GROUP BY Department
ORDER BY attrition_count DESC;

------- Attrition by SalarySlab -------
SELECT SalarySlab,
COUNT(*) AS total,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_attrition
GROUP BY SalarySlab;

------- Attrition by Experience -------
SELECT ExperienceGroup,
COUNT(*) AS total,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_attrition
GROUP BY ExperienceGroup;

--------- Attrition by JobRole -------
SELECT JobRole,
COUNT(*) AS total,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_attrition
GROUP BY JobRole
ORDER BY attrition_count DESC;
