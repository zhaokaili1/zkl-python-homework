-- Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
select recipient from package where weight = 1.5;

-- 7.2 What is the total weight of all the packages that he sent?
SELECT sum(weight) from package where sender = (select recipient from package where weight = 1.5);
SELECT sum(weight) from client c join package p on c.accountnumber=p.sender WHERE name = 'Al Gore''s Head';