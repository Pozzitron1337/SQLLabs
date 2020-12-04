USE FilmLibraryDatabase
GO

----constraints on input data
--ALTER TABLE actors
--	ADD CONSTRAINT actor_valid_age
--	CHECK (birth>'1899-01-01' AND birth<CONVERT(date,SYSDATETIME()))

--ALTER TABLE actors
--	ADD CONSTRAINT actor_valid_sex
--	CHECK (sex BETWEEN 1 AND 2)

--ALTER TABLE films
--	ADD CONSTRAINT film_valid_film_year
--	CHECK (film_year>'1899-01-01' AND film_year<CONVERT(date,SYSDATETIME()))

ALTER TABLE movieMaking
	ADD CONSTRAINT film_dependence FOREIGN KEY (film) REFERENCES film(film_id) ON DELETE CASCADE 


----adding Single column
--ALTER TABLE genre
--	ADD Single VARCHAR(3) NULL DEFAULT 'YES'

----removing Single column
--ALTER TABLE genre
--	DROP CONSTRAINT DF__genre__Single__4E88ABD4
--ALTER TABLE genre
--	DROP COLUMN Single;

--EXEC SP_RENAME 'footage' , 'headage';
--EXEC SP_RENAME 'headage','footage';

