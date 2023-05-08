
-- animal data
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0,true,10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2,true,8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-07-01', 1,false,15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Davimon', '2017-12-05', 5,true,11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Chamandar', '2020-08-02', 0, false, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, 5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-02-04', 3, false, 12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-12-06', 1, true, 45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-07-06', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);

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


-- Add "join table" for visits

-- Insert data to vets table
insert into vet (name, age, date_of_graduation)
values 
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

  -- insert data to specialties
  insert into specialties(vet_id, species_id) 
  values
    (
      (select id from vet where name like 'William Tatcher'),
      (select id from species where name = 'Pokemon')
    ),
    (
      (select id from vet where name like 'Stephanie Mendez'),
      (select id from species where name = 'Digimon')
    ),
    (
      (select id from vet where name like 'Stephanie Mendez'),
      (select id from species where name = 'Pokemon')
    ),
    (
      (select id from vet where name like 'Jack Harkness'),
      (select id from species where name = 'Digimon')
    );


-- insert data to visits
insert into visits(animal_id, vet_id, visits_date)
values
  (
    (select id from animals where name like 'Agumon'),
    (select id from vet where name like 'William Tatcher'),
    '2020-05-24'
  ),
  (
    (select id from animals where name like 'Agumon'),
    (select id from vet where name like 'Stephanie Mendez'),
    '2020-07-22'
  ),
  (
    (select id from animals where name like 'Gabumon'),
    (select id from vet where name like 'Jack Harkness'),
    '2021-02-02'
  ),
  (
    (select id from animals where name like 'Pikachu'),
    (select id from vet where name like 'Maisy  Smith'),
    '2020-01-05'
  ),
  (
    (select id from animals where name like 'Pikachu'),
    (select id from vet where name like 'Maisy Smith'),
    '2020-03-08'
  ),
  (
    (select id from animals where name like 'Pikachu'),
    (select id from vet where name like 'Maisy Smith'),
    '2020-05-14'
  ),
  (
    (select id from animals where name like 'Davimon'),
    (select id from vet where name like 'Stephanie Mendez'),
    '2021-05-04'
  ),
  (
    (select id from animals where name like 'Chamandar'),
    (select id from vet where name like 'Jack Harkness'),
    '2021-02-24'
  ),
  (
    (select id from animals where name like 'Plantmon'),
    (select id from vet where name like 'Maisy Smith'),
    '2019-12-21'
  ),
  (
    (select id from animals where name like 'Plantmon'),
    (select id from vet where name like 'William Tatcher'),
    '2020-08-10'
  ),
  (
    (select id from animals where name like 'Plantmon'),
    (select id from vet where name like 'Maisy Smith'),
    '2021-04-07'
  ),
  (
    (select id from animals where name like 'Squirtle'),
    (select id from vet where name like 'Stephanie Mendez'),
    '2019-09-29'
  ),
  (
    (select id from animals where name like 'Angemon'),
    (select id from vet where name like 'Jack Harkness'),
    '2020-10-03'
  ),
  (
    (select id from animals where name like 'Angemon'),
    (select id from vet where name like 'Jack Harkness'),
    '2020-11-04'
  ),
  (
    (select id from animals where name like 'Boarmon'),
    (select id from vet where name like 'Maisy Smith'),
    '2019-01-24'
  ),
  (
    (select id from animals where name like 'Boarmon'),
    (select id from vet where name like 'Maisy Smith'),
    '2019-05-15'
  ),
  (
    (select id from animals where name like 'Boarmon'),
    (select id from vet where name like 'Maisy Smith'),
    '2020-02-27'
  ),
  (
    (select id from animals where name like 'Boarmon'),
    (select id from vet where name like 'Maisy Smith'),
    '2020-08-03'
  ),
  (
    (select id from animals where name like 'Boarmon'),
    (select id from vet where name like 'Stephanie Mendez'),
    '2020-05-24'
  ),
  (
    (select id from animals where name like 'Blossom'),
    (select id from vet where name like 'William Tatcher'),
    '2021-01-11'
  );

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) 
SELECT * FROM 
  (SELECT id FROM animals) animal_ids, 
  (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';