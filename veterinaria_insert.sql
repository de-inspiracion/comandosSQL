/* =========================
   COUNTRIES
   ========================= */

INSERT INTO countries (name, country_code)
VALUES ('Chile', 'CHL');

INSERT INTO countries (name, country_code)
VALUES ('Argentina', 'ARG');

INSERT INTO countries (name, country_code)
VALUES ('Peru', 'PER');


/* =========================
   CUSTOMERS
   ========================= */

INSERT INTO customers (
    tax_id,
    full_name,
    phone,
    email,
    country_id
)
VALUES (
    '12345678-9',
    'Juan Perez',
    '+56911112222',
    'juan@email.com',
    1
);

INSERT INTO customers (
    tax_id,
    full_name,
    phone,
    email,
    country_id
)
VALUES (
    '98765432-1',
    'Maria Gonzalez',
    '+56933334444',
    'maria@email.com',
    1
);

INSERT INTO customers (
    tax_id,
    full_name,
    phone,
    email,
    country_id
)
VALUES (
    '11222333-4',
    'Carlos Fernandez',
    '+54911223344',
    'carlos@email.com',
    2
);


/* =========================
   PETS
   ========================= */

INSERT INTO pets (
    name,
    species,
    birth_date,
    customer_id
)
VALUES (
    'Firulais',
    'Dog',
    TO_DATE('15/03/2020', 'DD/MM/YYYY'),
    1
);

INSERT INTO pets (
    name,
    species,
    birth_date,
    customer_id
)
VALUES (
    'Mishi',
    'Cat',
    TO_DATE('20/08/2021', 'DD/MM/YYYY'),
    2
);

INSERT INTO pets (
    name,
    species,
    birth_date,
    customer_id
)
VALUES (
    'Rocky',
    'Dog',
    TO_DATE('10/01/2019', 'DD/MM/YYYY'),
    3
);


/* =========================
   SPECIALTIES
   ========================= */

INSERT INTO specialties (name)
VALUES ('Surgery');

INSERT INTO specialties (name)
VALUES ('Dermatology');

INSERT INTO specialties (name)
VALUES ('General Medicine');


/* =========================
   VETERINARIANS
   ========================= */

INSERT INTO veterinarians (
    name,
    phone,
    specialty_id
)
VALUES (
    'Pedro Soto',
    '+56955556666',
    1
);

INSERT INTO veterinarians (
    name,
    phone,
    specialty_id
)
VALUES (
    'Ana Munoz',
    '+56977778888',
    2
);

INSERT INTO veterinarians (
    name,
    phone,
    specialty_id
)
VALUES (
    'Luis Rojas',
    '+56999990000',
    3
);


/* =========================
   APPOINTMENTS
   ========================= */

INSERT INTO appointments (
    reason,
    pet_id,
    veterinarian_id
)
VALUES (
    'Annual vaccination',
    1,
    3
);

INSERT INTO appointments (
    reason,
    pet_id,
    veterinarian_id
)
VALUES (
    'Skin allergy checkup',
    2,
    2
);

INSERT INTO appointments (
    reason,
    pet_id,
    veterinarian_id
)
VALUES (
    'Neutering procedure',
    3,
    1
);


/* =========================
   SERVICE_CATALOG
   ========================= */

INSERT INTO service_catalog (
    name,
    price
)
VALUES (
    'General Consultation',
    25000
);

INSERT INTO service_catalog (
    name,
    price
)
VALUES (
    'Vaccination',
    18000
);

INSERT INTO service_catalog (
    name,
    price
)
VALUES (
    'Minor Surgery',
    85000
);


/* =========================
   APPOINTMENT_SERVICES
   ========================= */

INSERT INTO appointment_services (
    service_id,
    appointment_id
)
VALUES (
    2,
    1
);

INSERT INTO appointment_services (
    service_id,
    appointment_id
)
VALUES (
    1,
    2
);

INSERT INTO appointment_services (
    service_id,
    appointment_id
)
VALUES (
    3,
    3
);

COMMIT;