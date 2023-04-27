CREATE TABLE ability_id (
    id INTEGER PRIMARY KEY,
    ability TEXT UNIQUE NOT NULL
);

INSERT INTO ability_id (ability)
SELECT DISTINCT replace(replace(trim(value), '[', ''), ']', '') AS ability
FROM pokemon_data,
    json_each('["' || replace(pokemon_data.field1, ',', '","') || '"]')
WHERE trim(value) <> '';

SELECT * FROM ability_id ORDER BY id ASC;