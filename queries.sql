/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg < 10.5;
SELECT name from animals WHERE neutered=true;
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- query and update animals tables
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT before_weight_update;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO before_weight_update;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;


SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;
select neutered,sum(escape_attempts) as sum from animals GROUP BY neutered;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


INSERT INTO contacts(customer_id, contact_me, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');


-- what animal belong to melody pond?
select full_name, name from owners 
join animals on animals.owners_id = owners.id where owners.full_name = 'Melody Pond';

-- List all animals that are pokemon
select animals.*, species.name as animal_Type from animals 
join species on animals.species_id = species.id 
where species.name like 'Pokemon';

-- List all owners and their animals.
select * from owners left join animals on animals.owners_id = owners.id;

-- How many animals are there per species?
select species.name, count(*) as amount from species
join animals on animals.species_id = species.id 
group by species.name;

-- List all Digimon owned by Jennifer Orwell. 
select species.name as species_name, animals.name as animal_name, owners.full_name
from species
join animals on species.id = animals.species_id
join owners on owners.id = animals.owners_id
where owners.full_name = 'Jennifer Orwell' and species.name LIKE 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
select * from animals
join owners on animals.owners_id=owners.id
where animals.escape_attempts<1 
and owners.full_name like 'Dean Winchester';

-- Who owns the most animals? 
select owners.full_name as full_name,count(*) as count from animals
join owners on animals.owners_id=owners.id
group by owners.full_name
order by count DESC;

-- add join table for visits

-- who was the last animal seen by William Tatchers?
select animals.name as animal_name, vet.name as vet_name, visits.visits_date from animals
join  visits on  visits.animal_id = animals.id
join vet on vet.id = visits.vet_id
where vet.name like 'William Tatcher'
order by visits.visits_date desc limit 1;

-- How many different animals did Stephanie Mendez see?
select count(distinct animals.name) from animals
join visits on animals.id = visits.animal_id
join vet on visits.vet_id = vet.id
where vet.name like 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
select * from vet 
left join specialties on vet.id = specialties.vet_id
left join species on species.id = specialties.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select animals.name, visits.visits_date from animals
join visits on animals.id = visits.animal_id
join vet on visits.vet_id = vet.id
where vet.name like 'Stephanie Mendez'
and visits.visits_date between '2020-04-01' and '2020-08-30';


