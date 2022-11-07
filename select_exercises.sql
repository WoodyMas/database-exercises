USE codeup_test_db;

# The name of all albums by Pink Floyd.
SELECT album_name FROM albums WHERE artist_name = 'Pink Floyd';
# The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date FROM albums WHERE album_name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
# The genre for Nevermind
SELECT genre FROM albums WHERE album_name = 'Nevermind';
# Which albums were released in the 1990s
SELECT * FROM albums WHERE release_date > 1990 && albums.release_date < 1999;
# Which albums had less than 20 million certified sales
SELECT * FROM albums WHERE sales < 20;
# All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums WHERE genre = 'rock';