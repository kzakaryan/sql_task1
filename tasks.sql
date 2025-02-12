-- Full CRUD Queries for Country
INSERT INTO Country (name, continent_id, population, area)
VALUES ('Japan', (SELECT id FROM Continent WHERE name = 'Asia'), 126476461, 377975);

-- Read (SELECT) a Country by ID
SELECT * FROM Country WHERE id = 1;

-- Update a Country's Population
UPDATE Country
SET population = 130000000
WHERE name = 'Japan';

-- Delete a Country by ID
DELETE FROM Country WHERE id = 1;

-- Search Query with Dynamic Filters, Pagination & Sorting
SELECT * FROM Country
WHERE (continent_id = (SELECT id FROM Continent WHERE name = 'Asia') OR :continent_id IS NULL)
  AND (population >= :min_population OR :min_population IS NULL)
  AND (area <= :max_area OR :max_area IS NULL)
ORDER BY
    CASE WHEN :sort_by = 'population' THEN population END DESC,
    CASE WHEN :sort_by = 'area' THEN area END DESC
LIMIT :page_size OFFSET :page_number * :page_size;

-- Search Query with Joined Data
SELECT Country.name AS country_name, Continent.name AS continent_name, Country.population, Country.area
FROM Country
         JOIN Continent ON Country.continent_id = Continent.id
WHERE Continent.name = 'Europe'
ORDER BY Country.population DESC;

-- Statistic Query
SELECT Country.name, COUNT(Citizenship.person_id) AS num_people
FROM Country
         LEFT JOIN Citizenship ON Country.id = Citizenship.country_id
GROUP BY Country.name
ORDER BY num_people DESC;

-- Top-Something Query
SELECT name, population
FROM Country
ORDER BY population DESC
LIMIT 5;
