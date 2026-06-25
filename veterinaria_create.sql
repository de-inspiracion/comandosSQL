CREATE TABLE countries (
    country_id NUMBER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR2(20) NOT NULL,
    country_code CHAR(3),
    CONSTRAINT pk_countries PRIMARY KEY (country_id)
);

CREATE TABLE customers (
    customer_id NUMBER GENERATED ALWAYS AS IDENTITY,
    tax_id VARCHAR2(20) NOT NULL,
    full_name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(20),
    email VARCHAR2(50) NOT NULL,
    country_id NUMBER,
    CONSTRAINT pk_customers PRIMARY KEY (customer_id),
    CONSTRAINT fk_customer_country
        FOREIGN KEY (country_id)
        REFERENCES countries(country_id)
);


CREATE TABLE pets (
    pet_id NUMBER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR2(50) NOT NULL,
    species VARCHAR2(30) NOT NULL,
    birth_date DATE NOT NULL,
    customer_id NUMBER NOT NULL,
    CONSTRAINT pk_pets PRIMARY KEY (pet_id),
    CONSTRAINT fk_pet_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE specialties (
    specialty_id NUMBER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR2(30) DEFAULT 'Veterinarian',
    CONSTRAINT pk_specialties PRIMARY KEY (specialty_id)
);

CREATE TABLE veterinarians (
    veterinarian_id NUMBER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR2(30) NOT NULL,
    phone VARCHAR2(30) NOT NULL,
    specialty_id NUMBER NOT NULL,
    CONSTRAINT pk_veterinarians PRIMARY KEY (veterinarian_id),
    CONSTRAINT fk_veterinarian_specialty
        FOREIGN KEY (specialty_id)
        REFERENCES specialties(specialty_id)
);


CREATE TABLE appointments (
    appointment_id NUMBER GENERATED ALWAYS AS IDENTITY,
    appointment_date DATE DEFAULT SYSDATE,
    reason VARCHAR2(120),
    pet_id NUMBER NOT NULL,
    veterinarian_id NUMBER NOT NULL,
    CONSTRAINT pk_appointments PRIMARY KEY (appointment_id),
    CONSTRAINT fk_appointment_pet
        FOREIGN KEY (pet_id)
        REFERENCES pets(pet_id),
    CONSTRAINT fk_appointment_veterinarian
        FOREIGN KEY (veterinarian_id)
        REFERENCES veterinarians(veterinarian_id)
);

CREATE TABLE service_catalog (
    service_id NUMBER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR2(30) NOT NULL,
    price FLOAT NOT NULL,
    CONSTRAINT pk_service_catalog PRIMARY KEY (service_id)
);


CREATE TABLE appointment_services (
    service_id NUMBER,
    appointment_id NUMBER,

    CONSTRAINT pk_appointment_services
        PRIMARY KEY (service_id, appointment_id),

    CONSTRAINT fk_appointment_service
        FOREIGN KEY (service_id)
        REFERENCES service_catalog(service_id),

    CONSTRAINT fk_service_appointment
        FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
);


