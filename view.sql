---Handling missing and unknown values
UPDATE diabetic_data
SET race = "other"
where race = "?" 
--------------------
update diabetic_data
SET weight = NULL
WHERE weight = "?"
----------------------
UPDATE diabetic_data
SET payer_code = "other"
WHERE payer_code = NULL
-----------------------------
UPDATE diabetic_data
SET   medical_specialty = "other"
WHERE medical_specialty = "?" 
------------------------------
UPDATE diabetic_data
SET diag_1  = NULL 
WHERE diag_1 = "?"
-------------------------
UPDATE diabetic_data 
SET diag_2 = NULL 
WHERE diag_2 = "?"
--------------------------
UPDATE diabetic_data 
SET diag_3 = NULL 
WHERE diag_3 = "?"
------------------------
-- Create a new column (Readmit_30_Days_Flag) with a value of 1 for patients who returned early

ALTER TABLE diabetic_data
ADD COLUMN Readmit_30_Days_Flag INT;

UPDATE diabetic_data
SET Readmit_30_Days_Flag = CASE
    WHEN readmitted = '<30' THEN 1
    ELSE 0
END;
-----------------------

-- Calculate the number and percentage of patients readmitted within 30 days
SELECT 
 count(*) as Total_Encounters,
 sum(Readmit_30_Days_Flag) as Early_Readmissions_Count,
 CAST(sum(Readmit_30_Days_Flag )* 100.00 / count(*) as REAL) as Readmission_Rate_Percentage
FROM diabetic_data 

----- 
SELECT 
 age ,
 count(*) as Total_Group_Age , 
 CAST( sum(Readmit_30_days_flag) * 100 / count(*) as REAL) as Readmission_rate
from diabetic_data 
GROUP by age 
ORDER by Readmission_rate DESC 

------Readmission rate analysis by number of medications
SELECT 
	CASE
		when num_medications  < 10 then 'low 1-9'
		WHEN num_medications BETWEEN 10 and 19 then 'medium 10-19'
		ELSE 'High +20'
	END as Medication_Category,
    COUNT(*) AS Patient_Count,
    CAST(SUM(Readmit_30_Days_Flag) * 100.0 / COUNT(*) AS REAL) AS Readmission_Rate
FROM
    diabetic_data
GROUP BY
    Medication_Category
ORDER BY
    Readmission_Rate DESC;

 


-----Top 10 Primary Diagnoses Associated with the Risk of Readmission

SELECT 
	diag_1 as PRIMARY_Diagnosis,
	count(*) as Diagnosis_count,
	 -- Calculate the readmission rate for each diagnosis.
	CAST(SUM(Readmit_30_Days_Flag) * 100.0 / COUNT(*) AS REAL) AS  Readmission_Rate_Percentage
FROM
	diabetic_data 
WHERE
    diag_1 IS NOT NULL 
GROUP by 
	diag_1
order by 
	Diagnosis_count DESC              
LIMIT 10 
---Patient behavior before admission

SELECT 
	--Rename the alert flag to be descriptive.
	CASE 
		WHEN Readmit_30_Days_Flag = 1 THEN 'Re-Amitted (<30 Day)'
		ELSE 'NOT Early Re-Amitted'
	END As Readmission_Status , 
    --Average emergency room visits
	Avg(number_emergency) As Avg_Emergency_visits , 
	-- Average previous hospital visits
	Avg(number_inpatient) As Avg_Pervious_Impatient_visits 
FROM
	diabetic_data
GROUP By 
	Readmission_Status 
---Overall 30-Day Readmission Rate

SELECT 
    ---Global_Readmission_Rate
	CAST(SUM(Readmit_30_Days_Flag) * 100.0 / COUNT(*) AS REAL) AS Global_Readmission_Rate,
    COUNT(*) AS Total_Encounters
FROM 
	diabetic_data ; 
