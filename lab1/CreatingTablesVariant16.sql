USE FilmLibraryDatabase
GO

--DROP TABLE genre,footage,sex,films,actors,movieMaking
--DROP TABLE footage,genre,sex
CREATE TABLE genre(
	genre_id INT PRIMARY KEY IDENTITY NOT NULL,
	genre_name VARCHAR(15) NOT NULL
);

CREATE TABLE footage(
	footage_id INT PRIMARY KEY IDENTITY NOT NULL,
	footage_type VARCHAR(15) NOT NULL
);

CREATE TABLE sex(
	sex_id INT PRIMARY KEY IDENTITY NOT NULL,
	sex VARCHAR(10) NOT NULL
);

CREATE TABLE films(
	film_id INT PRIMARY KEY IDENTITY NOT NULL,
	film_name VARCHAR(50) NOT NULL,
	film_year DATE NOT NULL,
	duration TIME NOT NULL,
	genre INT FOREIGN KEY REFERENCES  genre(genre_id),
	footage INT FOREIGN KEY REFERENCES footage(footage_id)
) ;

CREATE TABLE actors(
	actor_id INT PRIMARY KEY IDENTITY NOT NULL,
	name VARCHAR(30) NOT NULL,
	birth DATE NOT NULL,
	sex INT FOREIGN KEY REFERENCES sex(sex_id)
);

CREATE TABLE movieMaking(
	film INT FOREIGN KEY REFERENCES films(film_id),
	actor INT FOREIGN KEY REFERENCES actors(actor_id)
);