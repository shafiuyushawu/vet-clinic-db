/* Database schema to keep the structure of entire database. */

-- create animal table 
CREATE TABLE animals (
    id int primary key not null,
    name varchar(100) not null,
    date_of_birth date not null,
    escape_attempts int not null,
    neutered bool not null,
    weight_kg decimal not null,
    species varchar(100)
);

-- owners table 
CREATE TABLE owners (
    id int GENERATED ALWAYS as identity primary key,
    full_name varchar(255) not null,
    age int not null
);

-- species table 
create table species (
    id int generated always as identity primary key,
    name varchar(255) not null
);

-- modify the animal table
alter table animals alter column id set not null;
alter table animals alter column id add generated always as identity;

alter table animals drop column species;

alter table animals add column species_id int;
alter table animals add constraint fk_species foreign key(species_id) references species(id);

alter table animals add column owners_id int;
alter table animals add constraint fk_owners foreign key(owners_id) references owners(id);

create table vet (
    id int generated always as identity primary key not null,
    name varchar(255) not null,
    age int not null,
    date_of_graduation date not null
);

-- many-to-many relationship between the tables species and vets
drop table if exists specialties;
create table specialties (
    vet_id int,
    species_id int,
    constraint vet_specializes_in
        foreign key(vet_id) references vet(id),
    constraint species_specilized_vets
        foreign key (species_id) references species(id)
);

-- many-to-many relationship between the tables animals and vets
drop table if exists visits;
create table visits (
    animal_id int,
    vet_id int,
    visits_date date,
    constraint fk_animal_visit
        foreign key (animal_id) references animals(id),
    constraint fk_vet_visited
        foreign key (vet_id) references vet(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- creating index on animal_id
create index animal_count_index on visits (animal_id asc);
create index visit_vet_id_index on visits(vet_id asc);
create index owner_email_index on owners(email asc);
