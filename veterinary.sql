CREATE DATABASE veterinary;

CREATE TABLE owners(
	ownerid INT PRIMARY KEY,
	ofirstname VARCHAR(50),
	olastname VARCHAR(50),
	address VARCHAR(100),
	phone VARCHAR(15),
	email VARCHAR(100)
);

CREATE TABLE animals(
    animalid INT,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
        PRIMARY KEY (animalid),
        FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments(
    appointid INT,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
        PRIMARY KEY (appointid),
        FOREIGN KEY (animalid) REFERENCES animals(animalid)
)

CREATE TABLE doctors(
    doctorid INT,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
        PRIMARY KEY (doctorid)
);

CREATE TABLE invoices(
    invoiceid INT,
    appointid INT,
    totalamount NUMERIC(10, 2),
    paymentdate TIME,
        PRIMARY KEY (invoiceid),
        FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords(
    recordid INT, 
    animalid INT,
    recorddate TIMESTAMP,
    doctorid INT,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
        PRIMARY KEY (recordid),
        FOREIGN KEY (animalid) REFERENCES animals(animalid),
        FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

