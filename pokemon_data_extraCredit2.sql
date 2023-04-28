--Extra credit part 2, creating a table trainer with 4 entrys which have specific information about each trainer
-- Create tables
--drop table trainer;
--drop table favorite_pokemon_type;
--drop table pokemon_team;

CREATE TABLE trainer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(80) NOT NULL,
  last_name VARCHAR(80) NOT NULL
);

CREATE TABLE favorite_pokemon_type (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(20) NOT NULL,
  trainer_id INTEGER NOT NULL,
  FOREIGN KEY (trainer_id) REFERENCES trainer(id)
);

CREATE TABLE pokemon_team (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  trainer_id INTEGER NOT NULL,
  pokemon_id INTEGER NOT NULL,
  FOREIGN KEY (trainer_id) REFERENCES trainer(id),
  FOREIGN KEY (pokemon_id) REFERENCES pokemon_data(id)
);

-- Insert data
-- Ted
INSERT INTO trainer (first_name, last_name) VALUES ('Ted', 'Newart');
INSERT INTO favorite_pokemon_type (type, trainer_id) VALUES ('Electric', (SELECT id FROM trainer WHERE first_name = 'Ted' AND last_name = 'Newart'));
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Ted' AND last_name = 'Newart'), 25); 
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Ted' AND last_name = 'Newart'), 6); 
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Ted' AND last_name = 'Newart'), 143);

-- Kaarina
INSERT INTO trainer (first_name, last_name) VALUES ('Kaarina', 'Doe');
INSERT INTO favorite_pokemon_type (type, trainer_id) VALUES ('Psychic', (SELECT id FROM trainer WHERE first_name = 'Kaarina' AND last_name = 'Doe'));
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Kaarina' AND last_name = 'Doe'), 150);
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Kaarina' AND last_name = 'Doe'), 65); 
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Kaarina' AND last_name = 'Doe'), 94); 

-- Ben
INSERT INTO trainer (first_name, last_name) VALUES ('Ben', 'DOnick');
INSERT INTO favorite_pokemon_type (type, trainer_id) VALUES ('Dragon', (SELECT id FROM trainer WHERE first_name = 'Ben' AND last_name = 'DOnick'));
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Ben' AND last_name = 'DOnick'), 149); 
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Ben' AND last_name = 'DOnick'), 39); 
INSERT INTO pokemon_team (trainer_id, pokemon_id) VALUES ((SELECT id FROM trainer WHERE first_name = 'Ben' AND last_name = 'DOnick'), 45); 
