-- in terminal:
-- psql < craigslist.sql
-- psql craigslist

-- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- Users and preferred region
-- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- Categories that each post belongs to

DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    pref_region INTEGER REFERENCES region ON DELETE SET NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    location_id INTEGER REFERENCES region ON DELETE SET NULL,
    category_id INTEGER REFERENCES region ON DELETE SET NULL
);


INSERT INTO region (name)
VALUES
('Southern California'),
('Northern California');

INSERT INTO users (username, password, pref_region)
VALUES
('couchlover3', 'comfycloud999', 1),
('lovefree99', 'ihoardknickknacks', 2);

INSERT INTO categories (name)
VALUES
('Furniture'),
('Electronics'),
('For Free');

INSERT INTO posts (title, description, user_id, location_id, category_id)
VALUES
('iPhone 4', 'gently used', 2, 2, 2),
('couch', 'haunted', 1, 2, 1);