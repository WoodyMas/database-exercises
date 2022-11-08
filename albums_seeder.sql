USE codeup_test_db;

TRUNCATE albums;

INSERT INTO albums(artist_name, album_name, release_date, sales, genre)
VALUES('Michael Jackson', 'Thriller', 1982, 50.2, 'pop'),
     ('AC/DC', 'Back in Black', 1980, 30.1, 'hard rock'),
     ('Whitney Houston', 'The Bodyguard', 1992, 28.7,'r&b'),
     ('Pink Floyd', 'The Dark Side of the Moon', 1973, 24.8, 'progressive rock'),
     ('Eagles', 'Their Greatest Hits (1971 - 1975)', 1976, 41.2, 'country rock'),
     ('Eagles', 'Hotel California', 1976, 31.8, 'soft rock'),
     ('Shania Twain', 'Come On Over', 1997, 30.4, 'country'),
     ('Fleetwood Mac', 'Rumours', 1977, 29.3, 'soft rock'),
     ('Bee Gees', 'Saturday Night Fever', 1977, 22.1, 'disco'),
     ('Led Zeppelin', 'Led Zeppelin IV', 1971, 30.4, 'hard rock'),
     ('Michael Jackson', 'Bad', 1987, 21.1, 'pop'),
     ('Meat Loaf', 'Bat Out of Hell', 1977, 22, 'hard rock'),
     ('Alanis Morissette', 'Jagged Little Pill', 1995, 25.4, 'alternative rock'),
     ('Various artist', 'Dirty Dancing', 1987, 24.1, 'pop'),
     ('Celine Dion', 'Falling into You', 1996, 21.1, 'pop'),
     ('Adele', '21', 2011, 27.1, 'pop, soul'),
     ('The Beatles', '1', 2000, 23.2, 'rock'),
     ('Metallica', 'Metallica', 1991, 22.7, 'heavy metal'),
     ('Celine Dion', 'Lets Talk About Love', 1997, 19.5, 'pop'),
     ('Bob Marley & The Wailers', 'Legend: The Best of Bob Marley & The Wailers', 1984, 22.9, 'reggae'),
     ('Guns N Roses', 'Appetite for Destruction', 1987, 22.8, 'hard rock'),
     ('Bruce Springsteen', 'Born in the U.S.A', 1984, 22, 'heartland rock'),
     ('ABBA', 'Gold: Greatest Hits', 1992, 21.6, 'disco'),
     ('Dire Straits', 'Brothers in Arms', 1985, 21.1, 'roots rock'),
     ('Santana', 'Supernatural', 1999, 20.8, 'latin rock'),
     ('Madonna', 'The immaculate Collection', 1990, 19.8, 'pop'),
     ('Pink Floyd', 'The Wall', 1979, 18.9, 'progressive rock'),
     ('The Beatles', 'Sgt. Peppers Lonely Hearts Club Band', 1967, 18.3, 'rock'),
     ('Michael Jackson', 'Dangerous', 1991, 17.0, 'new jack swing'),
     ('The Beatles', 'Abbey Road', 1969, 16.9, 'rock');

    SELECT * FROM albums;