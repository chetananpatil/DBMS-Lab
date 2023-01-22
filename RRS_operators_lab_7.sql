use rrs;
select u.user_id,u.user_type,u.fname,u.lname
from user as u,ticket as t
where u.user_id=t.user_id and t.departure='Banglore'and t.arrival='Chennai' 
and t.travel_date>= '2020-08-01' and t.travel_date<= '2020-08-31'
UNION
select u2.user_id,u2.user_type,u2.fname,u2.lname
from user as u2,ticket as t2
where u2.user_id=t2.user_id and t2.departure='Banglore'and t2.arrival='Chennai' 
and t2.travel_date>= '2022-10-01' and t2.travel_date<= '2022-10-31'
;

select u.user_id,u.user_type,u.fname,u.lname
from user as u,ticket as t
where u.user_id=t.user_id and t.departure='Banglore'and t.arrival='Chennai' 
and travel_date>= '2021-10-01' and travel_date<= '2021-10-31'
AND exists (select u1.user_id,u1.user_type,u1.fname,u1.lname
from user as u1,ticket as t1
where u1.user_id=t1.user_id and t1.departure='Banglore'and t1.arrival='Chennai' 
and t1.travel_date>= '2022-08-01' and t1.travel_date<= '2022-08-31');


select u.user_id,u.user_type,u.fname,u.lname
from user as u,ticket as t
where u.user_id=t.user_id and t.departure='Banglore'and t.arrival='Chennai' 
and t.travel_date>= '2022-08-01' and t.travel_date<= '2022-08-31'
AND not exists (select u1.user_id,u1.user_type,u1.fname,u1.lname
from user as u1,ticket as t1
where u1.user_id=t1.user_id and t1.departure='Banglore'and t1.arrival='Chennai' 
and t1.travel_date>= '2021-10-01' and t1.travel_date<= '2021-10-31');

select u.user_id,u.user_type,u.fname,u.lname
from user as u,ticket as t
where u.user_id=t.user_id and t.departure='Banglore'and t.arrival='Chennai' 
AND  exists (select u1.user_id,u1.user_type,u1.fname,u1.lname
from user as u1,ticket as t1
where u1.user_id=t1.user_id and t.departure='Chennai'and t.arrival='Banglore' 
and t.travel_date-t1.travel_date=7);



select distinct u.user_id,u.user_type,u.fname,u.lname
from user as u,ticket as t
where u.user_id=t.user_id and t.departure='Banglore'and t.arrival='Chennai' 
AND  not  exists (select u1.user_id,u1.user_type,u1.fname,u1.lname
from user as u1,ticket as t1
where u1.user_id=t1.user_id and t.departure='Chennai'and t.arrival='Bangalore' 
and t.travel_date-t1.travel_date=7);