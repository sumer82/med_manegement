create database med_manegement;
use med_manegement;



CREATE TABLE patients (
    p_id int NOT NULL AUTO_INCREMENT,
    username varchar(255),
    password varchar(255),
    ph_no varchar(255),
    email varchar(255),
    LastName varchar(255),
    FirstName varchar(255),
    blood_group varchar(10),
    dob date,
    City varchar(255),
	PRIMARY KEY (p_id)
);

CREATE TABLE doctors (
    d_id int NOT NULL AUTO_INCREMENT,
    username varchar(255),
    password varchar(255),
    ph_no varchar(255),
    email varchar(255),
    LastName varchar(255),
    FirstName varchar(255),
    blood_group varchar(10),
    dob date,
    City varchar(255),
    cahrges double,
    hire_date date,
	PRIMARY KEY (d_id)
);

create table appointment(
	apt_Id int NOT NULL AUTO_INCREMENT,
    p_id int,
    d_id int,
    apt_date date,
    apt_time time,
    PRIMARY KEY (apt_id),
    FOREIGN KEY (p_id) REFERENCES patients(p_id),
    FOREIGN KEY (d_id) REFERENCES doctors(d_id)
);

create table patientsRecords (
	record_id int not null auto_increment,
    p_id int,
    d_id int,
    medAssign_id int,
    testAssign_id int,
    doc_prescription varchar(300),
    PRIMARY KEY (record_id),
    FOREIGN KEY (p_id) REFERENCES patients(p_id),
    FOREIGN KEY (d_id) REFERENCES doctors(d_id)
    
);
create table medAssigned(
	medAssign_id int not null auto_increment,
    p_id int,
    d_id int,
    med_id int,
    qty int,
    pricription varchar(300),
    primary key (medAssign_id),
	FOREIGN KEY (p_id) REFERENCES patients(p_id),
    FOREIGN KEY (d_id) REFERENCES doctors(d_id)
   
);

create table medicine(
	med_id int not null auto_increment,
    name varchar(50),
    price double,
    primary key (med_id)


);

create table testAssigned(
	testAssign_id int not null auto_increment,
    p_id int,
    d_id int,
    test_id int,
    pricription varchar(300),
    primary key (testAssign_id),
	FOREIGN KEY (p_id) REFERENCES patients(p_id),
    FOREIGN KEY (d_id) REFERENCES doctors(d_id)
    
);

create table tests(
	test_id int not null auto_increment,
    name varchar(50),
    price double,
    primary key (test_id)


);

ALTER TABLE testAssigned
ADD FOREIGN KEY (test_id) REFERENCES tests(test_id);

ALTER TABLE medAssigned
ADD FOREIGN KEY (med_id) REFERENCES medicine(med_id);

ALTER TABLE patientsRecords
ADD FOREIGN KEY (medAssign_id) REFERENCES medAssigned(medAssign_id);

ALTER TABLE patientsRecords
ADD FOREIGN KEY (testAssign_id) REFERENCES testAssigned(testAssign_id);







