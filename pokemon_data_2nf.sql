-- Creates type table which is all the combonations of type1 and typ2 columns from the pokemon_data table
-- Each type combonation (including NULL if only one type) has a unique type_id number
CREATE TABLE type (
    type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type_1 TEXT NOT NULL,
    type_2 TEXT
);
INSERT INTO type (type_1, type_2)
SELECT DISTINCT pokemon_data.type1, pokemon_data.type2
FROM pokemon_data;

ALTER TABLE pokemon_data DROP COLUMN type1;
ALTER TABLE pokemon_data DROP COLUMN type2;

 -- Creates an against_x table which takes all the type combonations from the type table (using the type_id) and has the 
 -- multiplyer number against every type of pokemon
 CREATE TABLE against_x (
  type_id INTEGER NOT NULL, 
  against_bug REAL,
  against_dark REAL,
  against_dragon REAL,
  against_electric REAL,
  against_fairy REAL,
  against_fighting REAL,
  against_fire REAL,
  against_flying REAL,
  against_ghost REAL,
  against_grass REAL,
  against_ground REAL,
  against_ice REAL,
  against_normal REAL,
  against_poison REAL,
  against_psychic REAL,
  against_rock REAL,
  against_steel REAL,
  against_water REAL,
  FOREIGN KEY (type_id) REFERENCES type (type_id)
);
INSERT INTO against_x (type_id, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fighting, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water)
SELECT type.type_id, pokemon_data.against_bug, pokemon_data.against_dark, pokemon_data.against_dragon, pokemon_data.against_electric, pokemon_data.against_fairy, pokemon_data.against_fight, pokemon_data.against_fire, pokemon_data.against_flying, pokemon_data.against_ghost, pokemon_data.against_grass, pokemon_data.against_ground, pokemon_data.against_ice, pokemon_data.against_normal, pokemon_data.against_poison, pokemon_data.against_psychic, pokemon_data.against_rock, pokemon_data.against_steel, pokemon_data.against_water
FROM pokemon_data
LEFT JOIN type ON type.type_1 = pokemon_data.type1 AND type.type_2 = pokemon_data.type2
WHERE type.type_id IS NOT NULL;

ALTER TABLE pokemon_data DROP COLUMN against_bug;

ALTER TABLE pokemon_data DROP COLUMN against_dark;
ALTER TABLE pokemon_data DROP COLUMN against_dragon;
ALTER TABLE pokemon_data DROP COLUMN against_electric;
ALTER TABLE pokemon_data DROP COLUMN against_fairy;
ALTER TABLE pokemon_data DROP COLUMN against_fight;
ALTER TABLE pokemon_data DROP COLUMN against_fire;
ALTER TABLE pokemon_data DROP COLUMN against_flying;
ALTER TABLE pokemon_data DROP COLUMN against_ghost;
ALTER TABLE pokemon_data DROP COLUMN against_grass;
ALTER TABLE pokemon_data DROP COLUMN against_ground;
ALTER TABLE pokemon_data DROP COLUMN against_ice;
ALTER TABLE pokemon_data DROP COLUMN against_normal;
ALTER TABLE pokemon_data DROP COLUMN against_poison;
ALTER TABLE pokemon_data DROP COLUMN against_psychic;
ALTER TABLE pokemon_data DROP COLUMN against_rock;
ALTER TABLE pokemon_data DROP COLUMN against_steel;
ALTER TABLE pokemon_data DROP COLUMN against_water;