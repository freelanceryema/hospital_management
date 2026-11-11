CREATE DATABASE hospital_mini_db;
USE hospital_mini_db;
CREATE TABLE departments(
    dept_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) not NULL UNIQUE,
    description VARCHAR (255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE =INNODB;

CREATE TABLE doctors(
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_name VARCHAR (100) NOT NULL,
    dept_id INT UNSIGNED NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR (20) UNIQUE,
    consultation_fee DECIMAL(10,2) NOT NULL CHECK(consultation_fee >=0),
    is_active BOOLEAN DEFAULT TRUE,

    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
)ENGINE =INNODB;

CREATE TABLE patients(
    patient_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100) not NULL,
    gender ENUM('Male', 'Female','Other') NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    INDEX inx_patient_phone(phone)
)ENGINE =INNODB;


CREATE TABLE appointments(
    appt_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    patient_id INT UNSIGNED NOT NULL,
    doctor_id INT NOT NULL,
    appt_date DATE NOT NULL,
    appt_time TIME NOT NULL,
    status ENUM('booked', 'completed', 'cancelled', 'no_show') NOT NULL DEFAULT 'booked',

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES doctors(doctor_id),
    UNIQUE KEY uq_doctor_slot(
        doctor_id, appt_date, appt_time
    )
)ENGINE =INNODB;


CREATE TABLE visits(
    visitor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    patient_id INT UNSIGNED NOT NULL,
    doctor_id INT NOT NULL,
    appt_id INT UNSIGNED NOT NULL UNIQUE,
    visit_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    symptoms TEXT,
    diagnosis TEXT,
    notes TEXT,
    consultaion_fee DECIMAL(10,2) NOT NULL CHECK(consultaion_fee >=0),
    FOREIGN KEY(doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY(appt_id) REFERENCES appointments(appt_id)
)ENGINE =INNODB;


CREATE TABLE payments(
    payment_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    visitor_id INT UNSIGNED NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK(amount >= 0),
    payment_method ENUM('Cash', 'Card','mobile_banking') NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    receipt_no VARCHAR(30) NOT NULL UNIQUE,

    FOREIGN KEY (visitor_id) REFERENCES visits(visitor_id)    
) ENGINE=INNODB;






