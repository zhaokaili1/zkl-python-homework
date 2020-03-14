-- Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
select s.name, p.name,hours from scientists s join assignedto a on s.ssn=a.scientist join projects p on a.project=p.code order by p.name,s.name;

-- 6.2 Select the project names which are not assigned yet
SELECT * from assignedto;
SELECT name from projects p left join assignedto a on p.code=a.project where project is null;