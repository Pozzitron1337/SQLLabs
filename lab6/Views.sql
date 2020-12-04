CREATE VIEW ActorsView
AS
SELECT A.name[Им`я актера],F.film_name[Назва фiльму],G.genre_name[Жанр]
FROM movieMaking M
	INNER JOIN actors A ON M.actor=A.actor_id
	INNER JOIN films F ON M.film=F.film_id
	INNER JOIN genre G ON F.genre=G.genre_id
WHERE F.genre=1

CREATE VIEW howManyFilmsActorPlayed
AS
SELECT count(M.actor)[кiлькiсть фiльмiв зiграних актором],A.name[iм`я актора]
FROM movieMaking M
	INNER JOIN actors A ON M.actor=A.actor_id
	GROUP BY M.actor,A.name

CREATE VIEW topActor
AS
SELECT TOP(1) A.name[iм`я актора],count(M.actor)[зiграв найбiльше ролей за останнi 10 рокiв]
FROM movieMaking M 
	JOIN actors A ON M.actor=A.actor_id
	JOIN films F ON M.film=F.film_id
WHERE F.film_year BETWEEN CONVERT(DATE,DATEADD(year,-10,GETDATE())) and CONVERT(DATE,GETDATE())
GROUP BY M.actor,A.name
ORDER BY count(M.actor) DESC

