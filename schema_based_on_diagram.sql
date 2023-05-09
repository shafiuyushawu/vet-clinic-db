create table patients (
    id int primary key,
    name varchar(100),
    date_of_birth date 
);

create table medical_histories(
    id int primary key,
    admitted_at timestamp,
    patient_id int,
    status varchar(100),
    constraint medical_histories_patients foreign key(patient_id) references patients(id)
);

create table invoices (
    id int primary key,
    total_amount decimal(5,2),
    generated_at timestamp,
    payed_at int,
    medical_history_id int,
    constraint fk_invoices_medical_histories foreign key(medical_history_id) references medical_histories(id)
);

