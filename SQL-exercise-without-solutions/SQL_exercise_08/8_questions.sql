-- 8.1 Obtain the names of all physicians that have performed a medical procedure they have never been certified to perform.
/* 医生和手术需要对应 */
create view temp1 as (select * from physician p join (select * from (select concat(physician, procedures) pp, physician,procedures,patient,dateundergoes from undergoes u) a where a.pp not in (select concat(u.physician, procedures) from undergoes u join trained_in t on u.procedures=t.treatment and u.physician=t.physician))as b on p.employeeid=b.physician);
SELECT * from temp1;

-- 8.2 Same as the previous query, but include the following information in the results: Physician name, name of procedure, date when the procedure was carried out, name of the patient the procedure was carried out on.
SELECT temp1.name, dateundergoes, p.name, pat.name from temp1 join procedures p on temp1.physician=p.code join patient pat on temp1.patient=pat.ssn;

-- 8.3 Obtain the names of all physicians that have performed a medical procedure that they are certified to perform, but such that the procedure was done at a date (Undergoes.Date) after the physician's certification expired (Trained_In.CertificationExpires).

-- 8.4 Same as the previous query, but include the following information in the results: Physician name, name of procedure, date when the procedure was carried out, name of the patient the procedure was carried out on, and date when the certification expired.

-- 8.5 Obtain the information for appointments where a patient met with a physician other than his/her primary care physician. Show the following information: Patient name, physician name, nurse name (if any), start and end time of appointment, examination room, and the name of the patient's primary care physician.

-- 8.6 The Patient field in Undergoes is redundant, since we can obtain it from the Stay table. There are no constraints in force to prevent inconsistencies between these two tables. More specifically, the Undergoes table may include a row where the patient ID does not match the one we would obtain from the Stay table through the Undergoes.Stay foreign key. Select all rows from Undergoes that exhibit this inconsistency.
select u.* from stay right join undergoes u on stay.stayid=u.stay where stay.patient<>u.patient;

-- 8.7 Obtain the names of all the nurses who have ever been on call for room 123.
SELECT distinct n.name from nurse n join on_call c on n.employeeid=c.nurse join  room r on c.blockfloor=r.blockfloor where r.roomnumber=123;

-- 8.8 The hospital has several examination rooms where appointments take place. Obtain the number of appointments that have taken place in each examination room.
SELECT examinationroom, count(*) from appointment group by examinationroom;

-- 8.9 Obtain the names of all patients (also include, for each patient, the name of the patient's primary care physician), such that \emph{all} the following are true:
    -- The patient has been prescribed some medication by his/her primary care physician.
    -- The patient has undergone a procedure with a cost larger that $5,000
    -- The patient has had at least two appointment where the nurse who prepped the appointment was a registered nurse.
    -- The patient's primary care physician is not the head of any department.
SELECT pat.name, pre.* from patient pat join prescribes pre on pat.ssn=pre.patient and pre.medication is not null  join undergoes u on pat.ssn=u.patient join procedures pro on pro.code=u.procedures and pro.cost>5000 join (SELECT patient, count(*) from appointment a join nurse n on a.prepnurse=n.employeeid and n.registered is TRUE group by patient HAVING count(*)>2 ) t on pat.ssn=t.patient join (SELECT p.* from physician p full join department d on p.employeeid=d.head where d.head is null) b on b.employeeid=pat.pcp;
