CREATE TABLE [pokemon] (
  [pokedex_number] int,
  [name] nvarchar(255),
  [classification] nvarchar(255),
  [generation] int,
  [is_legendary] int,
  [height_m] int,
  [weight_kg] int,
  [base_egg_steps] int,
  [attack] int,
  [defense] int,
  [sp_attack] int,
  [sp_defense] int,
  [speed] int,
  [hp] int,
  [base_happiness] int,
  PRIMARY KEY ([pokedex_number], [name])
)
GO

CREATE TABLE [link_ability] (
  [pokedex_number] int PRIMARY KEY,
  [ability_id] int
)
GO

CREATE TABLE [ability] (
  [ability_id] int PRIMARY KEY,
  [ability] nvarchar(255)
)
GO

CREATE TABLE [type] (
  [type_id] int PRIMARY KEY,
  [type1] nvarchar(255),
  [type2] nvarchar(255)
)
GO

CREATE TABLE [against_x] (
  [type_id] int PRIMARY KEY,
  [against_bug] nvarchar(255),
  [against_dark] nvarchar(255),
  [against_dragon] nvarchar(255),
  [against_electric] nvarchar(255),
  [against_fairy] nvarchar(255),
  [against_fight] nvarchar(255),
  [against_fire] nvarchar(255),
  [against_flying] nvarchar(255),
  [against_ghost] nvarchar(255),
  [against_grass] nvarchar(255),
  [against_ground] nvarchar(255),
  [against_ice] nvarchar(255),
  [against_normal] nvarchar(255),
  [against_psychic] nvarchar(255),
  [against_rock] nvarchar(255),
  [against_steel] nvarchar(255),
  [against_water] nvarchar(255)
)
GO

ALTER TABLE [pokemon] ADD FOREIGN KEY ([pokedex_number]) REFERENCES [link_ability] ([pokedex_number])
GO

ALTER TABLE [type] ADD FOREIGN KEY ([type_id]) REFERENCES [against_x] ([type_id])
GO

ALTER TABLE [pokemon] ADD FOREIGN KEY ([pokedex_number]) REFERENCES [type] ([type_id])
GO

ALTER TABLE [link_ability] ADD FOREIGN KEY ([ability_id]) REFERENCES [ability] ([ability_id])
GO
