-- Country with the biggest population (id and name of the country)
SELECT id, name
FROM Country
ORDER BY population DESC
LIMIT 1;

-- Top 10 countries with the lowest population density (names of the countries)
SELECT name
FROM Country
ORDER BY (population / area) ASC
LIMIT 10;


-- Countries with population density higher than the average across all countries
SELECT name
FROM Country
WHERE (population / area) > (SELECT AVG(population / area) FROM Country);

-- Country with the longest name (if multiple, show all)
SELECT name
FROM Country
WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM Country);

-- All countries with names containing the letter “F”, sorted in alphabetical order
SELECT name
FROM Country
WHERE name ILIKE '%F%'
ORDER BY name;

-- Country with a population closest to the average population of all countries
SELECT name
FROM Country
ORDER BY ABS(population - (SELECT AVG(population) FROM Country))
LIMIT 1;

-- Count of countries for each continent
SELECT Continent.name AS continent_name, COUNT(Country.id) AS country_count
FROM Continent
         LEFT JOIN Country ON Continent.id = Country.continent_id
GROUP BY Continent.name;

-- Total area for each continent (sorted from biggest to smallest)
SELECT Continent.name AS continent_name, SUM(Country.area) AS total_area
FROM Continent
         LEFT JOIN Country ON Continent.id = Country.continent_id
GROUP BY Continent.name
ORDER BY total_area DESC;

-- Average population density per continent
SELECT Continent.name AS continent_name, AVG(Country.population / Country.area) AS avg_population_density
FROM Continent
         LEFT JOIN Country ON Continent.id = Country.continent_id
GROUP BY Continent.name;

-- Smallest country (by area) per continent
SELECT c1.name AS continent_name, c2.name AS country_name, c2.area
FROM Country c2
         JOIN Continent c1 ON c2.continent_id = c1.id
WHERE c2.area = (SELECT MIN(area) FROM Country WHERE continent_id = c1.id);

-- Continents where the average country population is less than 20 million
SELECT Continent.name AS continent_name
FROM Continent
         JOIN Country ON Continent.id = Country.continent_id
GROUP BY Continent.name
HAVING AVG(Country.population) < 20000000;

-- Person with the biggest number of citizenships
SELECT Person.id, Person.name, COUNT(Citizenship.country_id) AS citizenship_count
FROM Person
         LEFT JOIN Citizenship ON Person.id = Citizenship.person_id
GROUP BY Person.id, Person.name
ORDER BY citizenship_count DESC
LIMIT 1;

-- All people who have no citizenship
SELECT Person.id, Person.name
FROM Person
         LEFT JOIN Citizenship ON Person.id = Citizenship.person_id
WHERE Citizenship.person_id IS NULL;

-- Country with the least people in the People table
SELECT Country.name, COUNT(Citizenship.person_id) AS people_count
FROM Country
         LEFT JOIN Citizenship ON Country.id = Citizenship.country_id
GROUP BY Country.id, Country.name
ORDER BY people_count ASC
LIMIT 1;

-- Continent with the most people in the People table
SELECT Continent.name, COUNT(Citizenship.person_id) AS total_people
FROM Continent
         JOIN Country ON Continent.id = Country.continent_id
         JOIN Citizenship ON Country.id = Citizenship.country_id
GROUP BY Continent.name
ORDER BY total_people DESC
LIMIT 1;

-- Find pairs of people with the same name (print 2 IDs and the name)
SELECT p1.id AS person1_id, p2.id AS person2_id, p1.name
FROM Person p1
         JOIN Person p2 ON p1.name = p2.name AND p1.id < p2.id;