-- Pieces_and_providers
-- 5.1 Select the name of all the pieces. 
SELECT name from pieces;

-- 5.2  Select all the providers' data. 
SELECT * from providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT piece, avg(price) from provides group by piece;

-- 5.4  Obtain the names of all providers who supply piece 1.
SELECT name from providers a join provides b on a.code=b.provider where b.piece=1;

-- 5.5 Select the name of pieces provided by provider with code "HAL".
SELECT a.name from pieces a join provides b on a.code=b.piece where b.provider='HAL';

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------
SELECT a.name,c.name,price from pieces a join provides b on a.code=b.piece join providers c on b.provider=c.code where price = (SELECT max(price) from provides where piece=a.code);

-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT into provides(piece,provider,price) values(1,'TNBC',7);

-- 5.8 Increase all prices by one cent.
update provides set price=1+price;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE from provides where piece=4 and provider='RBT';

-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
DELETE from provides where provider='RBT';
