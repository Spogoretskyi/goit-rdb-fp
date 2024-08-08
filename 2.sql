USE pandemic; 

DROP TABLE IF EXISTS infectious_cases_data;

DROP TABLE IF EXISTS locations;
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Entity VARCHAR(255),
    Code VARCHAR(10)
);

DROP TABLE IF EXISTS diseases;
CREATE TABLE diseases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    disease_name VARCHAR(255)
);

CREATE TABLE infectious_cases_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_id INT,
    Year INT,
    disease_id INT,
    cases TEXT,
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (disease_id) REFERENCES diseases(id)
);

INSERT INTO locations (Entity, Code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

INSERT INTO diseases (disease_name) VALUES
('yaws'),
('polio'),
('guinea worm'),
('rabies'),
('malaria'),
('hiv'),
('tuberculosis'),
('smallpox'),
('cholera');

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.Number_yaws 
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'yaws';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.polio_cases
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'polio';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.cases_guinea_worm 
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'guinea worm';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.Number_rabies 
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'rabies';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.Number_malaria
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'malaria';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.Number_malaria 
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'hiv';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.Number_tuberculosis 
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'tuberculosis';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.Number_smallpox 
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'smallpox';

INSERT INTO infectious_cases_data (location_id, Year, disease_id, cases)
SELECT l.id, ic.Year, d.id, ic.Number_cholera_cases 
FROM infectious_cases ic
JOIN locations l ON ic.Entity = l.Entity AND ic.Code = l.Code
JOIN diseases d ON d.disease_name = 'cholera';




