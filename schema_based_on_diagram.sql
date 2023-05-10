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

create table invoice_items (
    id int primary key,
    unit_price decimal(5, 2),
    quantity int,
    total_price decimal(5,2),
    invoice_id int,
    treatment_id int,
    constraint fk_invoice_item_invoices foreign key(invoice_id) references invoices(id),
    constraint fk_invoice_item_treatment foreign key(treatment_id) references treatments(id)
);

create table treatments (
    id int primary key,
    type varchar(100),
    name varchar(255)
);

create table medical_histories_treatment (
    id int primary key,
    medical_history_id int,
    treatment_id int,
    constraint fk_medical_histories foreign key(medical_history_id) references medical_histories(id),
    constraint fk_treatments foreign key(treatment_id) references treatments(id)
);

-- Create indexes to improve query execution time
create index medical_histories_patients_id ON medical_histories(patient_id);
create index invoices_medical_histories_id ON invoices(medical_history_id);
create index fk_invoice_item_invoices_id ON invoice_items(invoice_id);
create index fk_invoice_item_treatment_id ON invoice_items(treatment_id);
create index fk_medical_histories_treatment_id ON medical_histories_treatment(medical_history_id);
create index fk_treatments_id ON medical_histories_treatment(treatment_id);