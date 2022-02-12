-- in terminal:
-- psql < medical_center.sql
-- psql medical_center

-- A medical center employs several doctors
-- A doctors can see many patients
-- A patient can be seen by many doctors
-- During a visit, a patient may be diagnosed to have one or more diseases.

DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE centers
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    center_id INTEGER REFERENCES centers ON DELETE SET NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT NOT NULL,
    birthday TEXT NOT NULL,
    doc_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    center_id INTEGER REFERENCES centers ON DELETE SET NULL
);


INSERT INTO centers (name, city, state, country)
VALUES
('One Touch Hospital', 'Thanos', 'Guardian', 'Galaxy'),
('Pokemon Center', 'Kanto', 'Johto', 'Sinnoh');

INSERT INTO diseases (name)
VALUES
('COVID-19'),
('Chickenpox'),
('Smallpox'),
('Seasonal Flu'),
('Dead');

INSERT INTO doctors (name, center_id)
VALUES
('Dr. Strange', 1),
('Nurse Joy', 2);

INSERT INTO patients (name, insurance, birthday, doc_id, center_id)
VALUES
('Pikachu', 'Medi-Pok', '2020-03-16', 2, 2),
('Peter Parker', 'New York Life', '1997-12-15', 1, 1);