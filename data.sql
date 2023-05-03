
-- animal data
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '02/03/20', 0,true,10.23);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '15/11/18', 2,true,8);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '01/7/21', 1,false,15.04);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Davimon', '05/12/17', 5,true,11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Chamandar', '02/08/20', 0, false, 11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '15/11/21', 2, true, 5.7);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '04/02/93', 3, false, 12.13);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', '06/12/05', 1, true, 45);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', '06/07/05', 7, true, 20.4);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', '13/10/98', 3, true, 17);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', '14/05/22', 4, true, 22);

-- owners data
insert into owners (full_name, age) values ('Sam Smith', 34);
insert into owners (full_name, age) values ('Jennifer Orwell', 19);
insert into owners (full_name, age) values ('Bob', 45);
insert into owners (full_name, age) values ('Melody Pond', 77);
insert into owners (full_name, age) values ('Dean Winchester', 14);
insert into owners (full_name, age) values ('Jodie Whittaker', 38);

-- species data
insert into species (name)  values ('Pokemon');
insert into species (name)  values ('Digimon');

-- update animals to include species_id
update animals set species_id = 2 where name like '%mon';

-- update animals to include onwers_id
update animals set species_id = 1 where name not like '%mon';

-- update animals to includes owner information
update animals set owners_id = 1 where name like 'Agumon';
update animals set owners_id = 2 where name in ('Gabumon','Pikachu');
update animals set owners_id = 3 where name in ('Davimon','Plantmon');
update animals set owners_id = 4 where name in  ('Chamandar',' Squirtle ','Blossom');
update animals set owners_id = 5 where name in ('Angemon','Boarmon');
