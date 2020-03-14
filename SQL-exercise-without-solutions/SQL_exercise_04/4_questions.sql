-- Movie_theatres
-- 4.1 Select the title of all movies.
select title from movies;

-- 4.2 Show all the distinct ratings in the database.
SELECT distinct rating from movies;

-- 4.3  Show all unrated movies.
SELECT * from movies where rating is null;

-- 4.4 Select all movie theaters that are not currently showing a movie.
SELECT code,name from movietheaters where movie is null;

-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT * from movietheaters mt left join movies m on mt.movie=m.code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * from movietheaters mt right join movies m on mt.movie=m.code;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
select title from movies m left join movietheaters mt on m.code=mt.movie where mt.movie is null;

-- 4.8 Add the unrated movie "One, Two, Three".
INSERT into movies(code,title,rating) values(9,'One, Two, Three', null);

-- 4.9 Set the rating of all unrated movies to "G".
update movies set rating='G' where rating is null;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
delete from movietheaters where movie in (SELECT code from movies where rating='NC-17');
