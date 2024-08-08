USE pandemic; 

SELECT
    Year AS year,
    CONCAT(Year, '-01-01') AS start_of_year,
    CURDATE() AS cur_date,
    TIMESTAMPDIFF(YEAR, CONCAT(Year, '-01-01'), CURDATE()) AS year_difference
FROM infectious_cases_data;
