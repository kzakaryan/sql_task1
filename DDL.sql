DROP TABLE IF EXISTS Citizenship;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Continent;

CREATE TABLE Continent (
   id SERIAL PRIMARY KEY,
   name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Country (
     id SERIAL PRIMARY KEY,
     name VARCHAR(100) UNIQUE NOT NULL,
     continent_id INT NOT NULL,
     population BIGINT NOT NULL,
     area DOUBLE PRECISION NOT NULL,
     FOREIGN KEY (continent_id) REFERENCES Continent(id) ON DELETE CASCADE
);

CREATE TABLE Person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Citizenship (
     person_id INT NOT NULL,
     country_id INT NOT NULL,
     PRIMARY KEY (person_id, country_id),
     FOREIGN KEY (person_id) REFERENCES Person(id) ON DELETE CASCADE,
     FOREIGN KEY (country_id) REFERENCES Country(id) ON DELETE CASCADE
);