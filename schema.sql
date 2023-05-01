/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int primary key not null,
    name varchar(100) not null,
    date_of_birth date not null,
    escape_attempts int not null,
    neutered bool not null,
    weight_kg decimal not null,
    species varchar(100)
);

