--	deleting logins
DROP LOGIN John
DROP LOGIN Bill

CREATE LOGIN John
   WITH PASSWORD = '123456789ABCDEF!',
   DEFAULT_DATABASE = FilmLibraryDatabase;

CREATE LOGIN Bill
	WITH PASSWORD = '123456789ABCDEF!',
	DEFAULT_DATABASE = FilmLibraryDatabase;

USE FilmLibraryDatabase
GO

--deleting users
DROP USER Bill
DROP USER John

--creating users
CREATE USER Bill for LOGIN Bill
CREATE USER John for LOGIN John 

-- give assign of role to Bill and John:
EXECUTE sp_addrolemember 'db_ddladmin', 'Bill';	
EXECUTE sp_addrolemember 'db_ddladmin', 'John';

-- delete assign of role to Bill and John:
EXECUTE sp_droprolemember 'db_ddladmin', 'Bill';
EXECUTE sp_droprolemember 'db_ddladmin', 'John';

-- gives access to execute stored procedure addActor to Bill
GRANT EXECUTE ON addActor TO Bill;
-- revoke of permissions on executing of addActor procedure
REVOKE EXECUTE ON addActor TO Bill;

GRANT SELECT, INSERT ON actors TO John;      -- add permissions for SELECT & INSERT inside of actors
REVOKE SELECT, INSERT ON actors TO John;		-- revoke permissions for SELECT & INSERT inside of actors
