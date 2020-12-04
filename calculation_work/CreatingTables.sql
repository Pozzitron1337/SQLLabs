--CREATE DATABASE RieltorsDatabase

GO
DROP TABLE Requests
DROP TABLE Flats
DROP TABLE Clients
DROP TABLE Operations
DROP TABLE Regions

GO
CREATE TABLE Operations(
    id_operation INT IDENTITY PRIMARY KEY,
    operation_name NVARCHAR(50) NOT NULL
);
CREATE TABLE Regions(
    id_region INT IDENTITY PRIMARY KEY,
    region_name NVARCHAR(255) NOT NULL
);
CREATE TABLE Clients(
    id_client INT IDENTITY PRIMARY KEY,
    client_name NVARCHAR(255) NOT NULL,
    phone NVARCHAR(15) NOT NULL,
    CONSTRAINT phone CHECK(phone LIKE '[0123456789]%')

);
CREATE TABLE Flats(
    id_flat INT IDENTITY PRIMARY KEY,
    client_owner INT FOREIGN KEY REFERENCES Clients(id_client),
    region INT FOREIGN KEY REFERENCES Regions(id_region),
    square FLOAT NOT NULL,
    rooms INT NOT NULL,
    floor INT NOT NULL,
    price FLOAT NOT NULL,
    CONSTRAINT square CHECK(square>0.0),
    CONSTRAINT rooms CHECK(rooms>=0),
    CONSTRAINT price CHECK(price>0.0)
);
CREATE TABLE Requests(
    id_request INT IDENTITY PRIMARY KEY,
    operation INT FOREIGN KEY REFERENCES Operations(id_operation),
    client_requester INT FOREIGN KEY REFERENCES Clients(id_client),
    flat INT FOREIGN KEY REFERENCES Flats(id_flat)
);