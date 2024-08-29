create database Health_Data_db;
use Health_Data_db;

select * from ocd_patient_dataset;


-- Count & Percentage of Female vs Male that ocd -- Average obsession by Gender

SELECT Gender,
    COUNT(`Patient ID`) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obsession_score
FROM ocd_patient_dataset
GROUP BY Gender
ORDER BY patient_count DESC;


-- Average and Obsession score by ethnicities that that have ocd

SELECT Ethnicity,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obsession_score
FROM ocd_patient_dataset
GROUP BY Ethnicity
ORDER BY avg_obsession_score DESC;


-- Number of people diagnosed with ocd Year, Month and Date

SELECT 
    DATE_FORMAT(STR_TO_DATE(`OCD Diagnosis Date`, '%Y-%m-%d %H:%i:%s'), '%Y-%m-01 00:00:00') AS month,
    COUNT(*) AS patient_count
FROM 
    ocd_patient_dataset
WHERE 
    `OCD Diagnosis Date` IS NOT NULL AND `OCD Diagnosis Date` <> " "
GROUP BY 
    month
ORDER BY 
    month;

    

-- The most common obsession type(count) and it's respective average obsession count

SELECT 
    `Obsession Type`,
    COUNT(*) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obsession_score
FROM 
    ocd_patient_dataset
WHERE 
    `Obsession Type` IS NOT NULL AND `Obsession Type` <> ''
GROUP BY 
    `Obsession Type`
ORDER BY 
    patient_count DESC;
    

-- The most common compulsion type(count) and it's respective average obsession count
    
SELECT 
    `Compulsion Type`,
    COUNT(*) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obsession_score
FROM 
    ocd_patient_dataset
WHERE 
    `Compulsion Type` IS NOT NULL AND `Compulsion Type` <> ''
GROUP BY 
    `Compulsion Type`
ORDER BY 
    patient_count DESC;

