-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for
-- each person (we don't mind which record we take for each person). 
-- i.e., the joined table should have the same number of rows as table PEOPLE
SELECT * from people p left join (SELECT id,max(address) address from address group by id) temp on p.id=temp.id;

-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
-- i.e., the joined table should have the same number of rows as table PEOPLE
SELECT * from people p left join (select id,address from address where updatedate in (SELECT max(updatedate) from address group by id)) temp on p.id=temp.id;

