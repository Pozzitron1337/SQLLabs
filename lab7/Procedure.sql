USE FilmLibraryDatabase
GO
CREATE PROC ammountOfFilmWithGenre
	@Genre INT OUTPUT
AS
SELECT F.genre[код жанру],G.genre_name[Жанр],count(F.genre)[кiлькiсть фiльмiв конкретного жанру]
FROM films F 
	INNER JOIN genre G ON F.genre=G.genre_id
	WHERE F.genre=@Genre
GROUP BY F.genre,G.genre_name

GO
EXEC ammountOfFilmWithGenre 1;

GO
CREATE PROC addActor
	@actorName VARCHAR(30) OUTPUT,
	@actorBirth DATE OUTPUT,
	@actorSex INT OUTPUT
AS
IF exists(
	SELECT A.actor_id
	FROM actors A
	WHERE	A.name=@actorName AND
			A.birth=@actorBirth AND 
			A.sex=@actorSex
			)
			BEGIN
				PRINT 'this actor exists!'
			END
ELSE 
	BEGIN
		INSERT INTO actors (name,birth,sex)
		VALUES (@actorName,@actorBirth,@actorSex)
	END

GO
EXEC addActor 'Daniel Radcliff','1989-07-23','1'

