-- from the terminal run:
-- psql outer_space

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE sun
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT CHECK(orbital_period_in_years > 0),
  orbits_around INTEGER REFERENCES sun ON DELETE SET NULL,
  galaxy INTEGER REFERENCES galaxy ON DELETE SET NULL,
  moons TEXT[]
);

INSERT INTO galaxy (name)
VALUES ('Milky Way');

INSERT INTO sun (name)
VALUES 
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 1, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 2, 1, '{}'),
  ('Gliese 876 b', 0.23, 3, 1, '{}');