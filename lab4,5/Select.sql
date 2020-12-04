SELECT DISTINCT A.name,F.genre AS 'Актёры,которые играли в фильмах указанного жанра'
FROM movieMaking M JOIN actors A
ON M.actor=A.actor_id
JOIN films F ON F.film_id=M.film
WHERE F.genre=1

SELECT A.name,count(actor) AS 'Количество сиграных фильмов данным актёром'
FROM movieMaking M JOIN actors A
ON M.actor=A.actor_id
GROUP BY A.name

SELECT TOP(1) M.actor,A.name,count(M.actor) AS 'Максимальное количество фильмов где снялся данный актёр'
FROM movieMaking M JOIN actors A ON M.actor=A.actor_id
JOIN films F ON M.film=F.film_id
WHERE F.film_year BETWEEN CONVERT(DATE,DATEADD(year,-10,GETDATE())) and CONVERT(DATE,GETDATE())
GROUP BY M.actor,A.name
ORDER BY count(M.actor) DESC