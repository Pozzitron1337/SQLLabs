USE RieltorsDatabase
GO

SELECT C.client_name,F.id_flat,F.square
FROM Flats F INNER JOIN Clients C ON F.client_owner=C.id_client

SELECT F.rooms,F.floor,count(*)[кількість таких квартир,що мають дану кількість кімнат та знаходяться на даному поверсі]
FROM Flats F
GROUP BY F.rooms,F.floor

SELECT AVG(price)[середня ціна трикімнатної квартири] 
FROM Flats
WHERE rooms=3

SELECT F.region,COUNT(F.region)[сумарне число заявок по районах міста]
FROM Requests R INNER JOIN Flats F ON R.flat=F.id_flat
GROUP BY F.region

SELECT * FROM Requests
CREATE PROC deleteRequest
    @id_to_delete INT
    AS
        DELETE FROM Requests
        WHERE id_request = @id_to_delete
    GO
GO
EXEC deleteRequest 3
GO
SELECT * FROM Requests

SELECT * FROM Flats
CREATE PROC changePrice
    @id_client INT,
    @client_flat_id INT,
    @new_price FLOAT
    AS
        UPDATE Flats
        SET price=@new_price
        WHERE client_owner=@id_client AND id_flat=@client_flat_id
     GO
EXEC changePrice 1,1,45000
GO
SELECT * FROM Flats

CREATE PROC getClientByName
    @client_name NVARCHAR(255)
    AS
        SELECT * FROM Clients С
        WHERE С.client_name=@client_name
    GO 
EXEC getClientByName "Ума Дурман"

CREATE PROC getClientByPhone
    @client_phone NVARCHAR(15)
    AS
        SELECT * FROM Clients С
        WHERE С.phone=@client_phone
    GO 
EXEC getClientByName "Ума Дурман"
EXEC getClientByPhone "380678924433"

CREATE PROC getFlats
    @low FLOAT,
    @high FLOAT,
    @region INT
    AS
        SELECT id_flat
        FROM Flats
        WHERE region=@region AND (square BETWEEN @low AND @high)
    GO
EXEC getFlats 45.0,200.0,1

SELECT region,rooms,COUNT(*)[кількість таких квартир,що мають дану кількість кімнат та знаходяться в одному регіоні]
FROM Flats
GROUP BY region,rooms

SELECT R.client_requester,F.client_owner
FROM Requests R INNER JOIN Flats F ON R.flat=F.id_flat
--Обираються 2 клієнта та формується угода та надсилається ця угода цим двом клієнтам.