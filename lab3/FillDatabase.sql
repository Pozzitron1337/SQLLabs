USE FilmLibraryDatabase
GO

DELETE FROM footage
DELETE FROM sex
DELETE FROM genre
DELETE FROM films
DELETE FROM actors
DELETE FROM movieMaking

SET IDENTITY_INSERT footage OFF 
SET IDENTITY_INSERT sex OFF
SET IDENTITY_INSERT genre OFF
SET IDENTITY_INSERT films OFF
SET IDENTITY_INSERT actors OFF


INSERT INTO footage(footage_type) VALUES
('black-white'),
('colored')

INSERT INTO sex(sex) VALUES
('male'),
('female')

INSERT INTO genre(genre_name) VALUES
('action'),
('drama'),
('comedy'),
('triller'),
('horror')

INSERT INTO films(film_name,film_year,duration,genre,footage) VALUES
('John Wick','2014-10-24','01:41:00',1,2),
('John Wick 2','2017-01-30','01:41:00',1,2),
('John Wick 3','2019-05-09','02:01:00',1,2)

INSERT INTO actors(name,birth,sex) VALUES
('Keanu Reeves','1964-09-02',1),
('Michael Nyqvist','1960-10-8',1),
('Ruby Rose','1986-03-20',2)

INSERT INTO movieMaking(film,actor) VALUES
(1,1),
(2,1),
(3,1),
(1,2),
(2,3)