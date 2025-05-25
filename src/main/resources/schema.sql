CREATE DATABASE IF NOT EXISTS masterdb;
use masterdb;


DROP TABLE company;
CREATE TABLE company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    address VARCHAR(255),
    pincode VARCHAR(10),
    phone_no VARCHAR(15),
    email VARCHAR(100),
    admin_name VARCHAR(100),
    identity_proof_no VARCHAR(50),
    photo_file_path VARCHAR(255)
);
