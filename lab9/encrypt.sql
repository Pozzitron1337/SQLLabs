USE master
GO

--	Showing existing symmetric keys that was assigned for database
SELECT *								
FROM sys.symmetric_keys;			
GO										

USE FilmLibraryDatabase
GO

-- creating of new master-key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '1qazZAQ!';				
GO

-- creating of certificate with metadata field 'Protect Data'
CREATE CERTIFICATE Certificate1 
WITH SUBJECT = 'Protect Data'
GO

-- creating symmetric key
CREATE SYMMETRIC KEY SymmetricKey1
	WITH ALGORITHM = AES_128
	ENCRYPTION BY CERTIFICATE Certificate1
GO

-- adding new column for future encrypted data
ALTER TABLE actors										
	ADD actor_name_encrypt varbinary(MAX) NULL
GO

-- encryption
OPEN SYMMETRIC KEY SymmetricKey1
	DECRYPTION
		BY CERTIFICATE Certificate1;
GO

UPDATE actors
	SET actor_name_encrypt = EncryptByKey (Key_GUID('SymmetricKey1'), actors.name)
	FROM actors;
GO

-- close encryption procedure
CLOSE SYMMETRIC KEY SymmetricKey1;
GO
--end encryotion

-- decryption:
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1
GO

SELECT 
	A.actor_id,
	A.actor_name_encrypt AS 'encrypted actor name',
	CONVERT(varchar, DecryptByKey(A.actor_name_encrypt)) AS 'decrypted actor name'	
FROM actors A

CLOSE SYMMETRIC KEY SymmetricKey1
GO
--end decryption