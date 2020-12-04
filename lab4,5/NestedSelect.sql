--актёры,которые в среднем снимались больше чем все актёры в среднем
select X.actor,X.actor_name
from
(SELECT M.actor,AC.name AS 'actor_name',count(M.actor) AS 'sum'
FROM movieMaking M JOIN actors AC ON M.actor=AC.actor_id
GROUP BY M.actor,AC.name) X
where X.sum>(select avg(X.sum)
			from
			(SELECT M.actor,count(M.actor) AS 'sum'
			FROM movieMaking M
			JOIN actors AC ON M.actor=AC.actor_id
			GROUP BY M.actor) X)

----актёры,которые снялись в меньше всего фильмах
select X.actor,X.actor_name
from
(SELECT M.actor,AC.name AS 'actor_name',count(M.actor) AS 'sum'
FROM movieMaking M JOIN actors AC ON M.actor=AC.actor_id
GROUP BY M.actor,AC.name) X
where X.sum IN (select min(X.sum)
			from
			(SELECT M.actor,count(M.actor) AS 'sum'
			FROM movieMaking M
			JOIN actors AC ON M.actor=AC.actor_id
			GROUP BY M.actor) X)

--фильмы,в которых актёр(актёры) больше всего снялся(cнялись)
SELECT F.film_name
FROM movieMaking M JOIN films F ON M.film=F.film_id
where M.actor IN (
	SELECT X.actor
	FROM
		(SELECT M.actor,count(M.actor) AS 'sum'
		FROM movieMaking M JOIN actors A ON M.actor=A.actor_id
		GROUP BY M.actor) X
		WHERE X.sum=(select max(X2.sum)
		FROM
			(SELECT count(M.actor) AS 'sum'
			FROM movieMaking M JOIN actors A ON M.actor=A.actor_id
			GROUP BY M.actor) X2)
)


