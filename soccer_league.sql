-- in terminal:
-- psql < soccer_league.sql
-- psql soccer_league

-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    league_rank INTEGER CHECK(league_rank > 0)
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    home_team INTEGER REFERENCES teams ON DELETE SET NULL,
    away_team INTEGER REFERENCES teams ON DELETE SET NULL,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    season_id INTEGER REFERENCES season ON DELETE SET NULL,
    ref_id INTEGER REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    game_id INTEGER REFERENCES games ON DELETE SET NULL
);

INSERT INTO teams (name, country, league_rank)
VALUES
('Arsenal', 'UK', 5),
('Manchester City', 'UK', 1),
('Liverpool', 'UK', 2),
('Chelsea', 'UK', 3);

INSERT INTO players (name, position, team_id)
VALUES
('Takehiro Tomiyasu', 'Defender', 1),
('Ferran Torres', 'Forward', 2),
('Georginio Wijnaldum', 'Midfielder', 3),
('Edouard Mendy', 'Goalkeeper', 4);

INSERT INTO referees (name)
VALUES
('Paul Tierney'),
('Mike Jones');

INSERT INTO season (start_date, end_date)
VALUES ('2019-09-14', '2020-03-19');

INSERT INTO games (home_team, away_team, location, date, season_id, ref_id)
VALUES
(1, 2, 'UK', '2019-10-29', 1, 1),
(3, 4, 'Spain', '2020-01-25', 1, 2);

INSERT INTO goals (player_id, game_id)
VALUES
(3, 1),
(2, 2);