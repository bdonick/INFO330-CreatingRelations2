-- Creates an ability_id table which has all the abilities from the abilities column seperated into individual abilities with unique id numbers
CREATE TABLE ability_id (
    id INTEGER PRIMARY KEY,
    ability TEXT UNIQUE NOT NULL
);

INSERT INTO ability_id (ability)
SELECT DISTINCT replace(replace(replace(trim(value), '[', ''), ']', ''), '''', '') AS ability
FROM pokemon_data,
json_each('["' || replace(pokemon_data.abilities, ',', '","') || '"]')
WHERE trim(value) <> '';

SELECT * FROM ability_id ORDER BY id ASC;

-- Drops the abilities column from the pokemon_data table
ALTER TABLE pokemon_data DROP COLUMN abilities;