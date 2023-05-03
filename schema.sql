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
    id int GENERATED ALWAYS as identity,
    full_name varchar(255) not null,
    age int not null
);

-- species table 
create table species (
    id int generated always as identity,
    name varchar(255) not null
);

-- modify the animal table
alter table animals alter column id set not null;

alter table animals alter column id add generated always as identity;

alter table animals alter delete column species;