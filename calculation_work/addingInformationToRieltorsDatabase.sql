USE RieltorsDatabase
GO

CREATE PROC addClient
    @client_name NVARCHAR(255),
    @phone NVARCHAR(15)
    AS
        INSERT INTO Clients(client_name, phone) VALUES
        (@client_name,@phone)
GO

CREATE PROC addFlat
    @client_id INT,
    @region_id INT,
    @square FLOAT,
    @rooms INT,
    @floor INT,
    @price FLOAT
    AS
        INSERT INTO Flats(client_owner,region,square,rooms,floor,price) VALUES
        (@client_id,@region_id,@square,@rooms,@floor,@price)
GO

CREATE PROC addOperation
    @operation_name NVARCHAR(50)
    AS
        INSERT INTO Operations(operation_name) VALUES
        (@operation_name)
GO

CREATE PROC addRegion
    @region_name NVARCHAR(255)
    AS
        INSERT INTO Regions(region_name) VALUES
        (@region_name)
GO

CREATE PROC addRequest
    @operation INT,
    @client_id INT,
    @flat INT
    AS
        INSERT INTO Requests(operation,client_requester,flat) VALUES
        (@operation,@client_id,@flat)
GO