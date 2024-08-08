USE pandemic; 

SELECT
    Year,
    year_difference_from_current(Year) AS year_diff
FROM
    infectious_cases;