USE FilmLibraryDatabase

GO
CREATE TRIGGER deletefilm
ON films FOR DELETE
AS 
DECLARE @count INT
SELECT @count=COUNT(*) FROM deleted D
IF @count>0
BEGIN
	ALTER TABLE movieMaking NOCHECK CONSTRAINT FK__movieMakin__film__6E01572D
	DELETE FROM movieMaking
		FROM deleted D JOIN movieMaking M ON D.film_id=M.film
		WHERE D.film_id=M.film
	ALTER TABLE movieMaking WITH CHECK CHECK CONSTRAINT FK__movieMakin__film__6E01572D
END

GO
CREATE VIEW indexActivity
	AS
	SELECT A.actor_id,A.name,F.film_year,count(A.actor_id)[кiлькiсть фiльмiв за рiк]
	FROM	movieMaking M LEFT JOIN films F ON M.film=F.film_id
			LEFT JOIN actors A ON M.actor=A.actor_id
	GROUP BY A.actor_id,A.name,F.film_year
