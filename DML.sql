-- Insert Continents
INSERT INTO Continent (name) VALUES
         ('Europe'),
         ('Asia'),
         ('Africa'),
         ('North America'),
         ('South America'),
         ('Australia'),
         ('Antarctica');

-- Insert Countries
INSERT INTO Country (name, continent_id, population, area) VALUES
       ('Germany', 1, 83783942, 357022),
       ('France', 1, 65273511, 551695),
       ('China', 2, 1439323776, 9596961),
       ('India', 2, 1393409038, 3287263),
       ('Brazil', 5, 212559417, 8515767),
       ('USA', 4, 331002651, 9833517),
       ('Australia', 6, 25687041, 7692024);

-- Insert People
INSERT INTO Person (name) VALUES
      ('John Doe'),
      ('Alice Smith'),
      ('Michael Brown'),
      ('Emily Davis'),
      ('Daniel Wilson');

-- Insert Citizenship Data
INSERT INTO Citizenship (person_id, country_id) VALUES
    (1, 1), -- John Doe -> Germany
    (2, 2), -- Alice Smith -> France
    (3, 3), -- Michael Brown -> China
    (4, 4), -- Emily Davis -> India
    (5, 5), -- Daniel Wilson -> Brazil
    (2, 6), -- Alice Smith -> USA
    (3, 7); -- Michael Brown -> Australia
