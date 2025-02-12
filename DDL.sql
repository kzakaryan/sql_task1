CREATE TABLE Continent (
   id SERIAL PRIMARY KEY,
   name VARCHAR(100) UNIQUE NOT NULL,
   total_area NUMERIC NOT NULL CHECK (total_area > 0)
);

CREATE TABLE Country (
     id SERIAL PRIMARY KEY,
     name VARCHAR(100) UNIQUE NOT NULL,
     continent_id INT NOT NULL REFERENCES Continent(id) ON DELETE CASCADE,
     population BIGINT NOT NULL CHECK (population >= 0),
     area NUMERIC NOT NULL CHECK (area > 0)
);

CREATE TABLE Person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Citizenship (
     person_id INT NOT NULL REFERENCES Person(id) ON DELETE CASCADE,
     country_id INT NOT NULL REFERENCES Country(id) ON DELETE CASCADE,
     PRIMARY KEY (person_id, country_id)
);