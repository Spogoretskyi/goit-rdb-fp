USE pandemic; 

SELECT 
    l.Entity,
    l.Code,
    AVG(CONVERT(icd.cases, DECIMAL(20, 10))) AS avg_number_rabies,
    MIN(CONVERT(icd.cases, DECIMAL(20, 10))) AS min_number_rabies,
    MAX(CONVERT(icd.cases, DECIMAL(20, 10))) AS max_number_rabies,
    SUM(CONVERT(icd.cases, DECIMAL(20, 10))) AS sum_number_rabies
FROM
    infectious_cases_data icd
JOIN
    locations l ON icd.location_id = l.id
JOIN
    diseases d ON icd.disease_id = d.id
WHERE
    d.disease_name = 'rabies'
    AND icd.cases IS NOT NULL
    AND icd.cases != ''
GROUP BY
    l.Entity,
    l.Code
ORDER BY
    avg_number_rabies DESC
LIMIT 10;