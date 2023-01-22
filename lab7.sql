use Railway_Reservation_System;


SELECT U.user_id, U.user_type, U.Fname, U.Lname, T.User_id, T.Arrival,
 T.Departure, T.Travel_date FROM user U,Ticket T WHERE U.user_id = T.User_id AND T.Arrival = "CHENNAI" AND T.Departure = "BANGLORE" AND 
 T.Travel_date BETWEEN '2021-10-1'AND '2021-10-31' UNION SELECT U.user_id, U.user_type, U.Fname, U.Lname, T.user_id, T.Arrival, T.Departure,
 T.Travel_date FROM user U, Ticket T WHERE U.user_id=T.user_id AND T.Arrival = "CHENNAI" AND T.Departure = "BANGLORE" AND  
 T.Travel_date BETWEEN '2022-08-01' AND '2022-08-31';
 
 
 select U.user_id,U.user_type,U.fname,U.lname
from user as U,ticket as T
where U.user_id=T.user_id and T.departure='BANGLORE'and T.arrival='CHENNAI' 
and travel_date>= '2021-10-01' and travel_date<= '2021-10-31'
AND EXISTS(select U1.user_id,U1.user_type,U1.fname,U1.lname
from user as U1,ticket as T1
where U1.user_id=T1.user_id and T1.departure='BANGLORE'and T1.arrival='CHENNAI' 
and T1.travel_date>= '2022-08-01' and T1.travel_date<= '2022-08-31');

 select U.user_id,U.user_type,U.fname,U.lname
from user as U,ticket as T
where U.user_id=T.user_id and T.departure='BANGLORE'and T.arrival='CHENNAI' 
and travel_date between '2022-08-01' and '2022-08-31'
AND NOT EXISTS(select U1.user_id,U1.user_type,U1.fname,U1.lname
from user as U1,ticket as T1
where U1.user_id=T1.user_id and T1.departure='BANGLORE'and T1.arrival='CHENNAI' 
and T1.travel_date between '2021-10-01' and '2021-10-31');
 
 /*3*/
SELECT U.User_id,U.User_type,U.Fname,U.Lname,T.User_id,T.Arrival,T.Departure,T.Travel_date
FROM User U, Ticket T 
WHERE U.User_id = T.User_id AND T.Arrival = "Chennai" AND T.Departure = "Bengaluru" AND 
T.Travel_date BETWEEN '2022-08-1' AND '2022-08-31'
AND  not  exists(
SELECT U.User_id,U.User_type,U.Fname,U.Lname,T.User_id,T.Arrival,T.Departure,T.Travel_date
FROM User U,Ticket T
WHERE U.User_id = T.User_id AND T.Arrival = "Chennai" AND T.Departure = "Bengaluru" AND
 T.Travel_date BETWEEN '2021-10-1' AND '2021-10-31');



/*4*/
    SELECT ticket.User_ID, user.User_Type, user.Fname, user.LName 
FROM ticket, user 
WHERE ticket.User_id = user.User_id and ticket.Departure = "Bengaluru" and 
ticket.Arrival = "Chennai" AND ticket.Travel_date and 
EXISTS(
SELECT ticket.User_ID, user.User_Type, user.Fname, user.LName 
FROM ticket, user  
WHERE ticket.User_id = user.User_id and ticket.Departure = "Chennai" and 
ticket.Arrival = "Bengaluru" and ticket.Travel_date BETWEEN ticket.Travel_date and 
ticket.Travel_date+7);

select u.user_id,u.user_type,u.fname,u.lname
from user as u,ticket as t
where u.user_id=t.user_id and t.departure='Banglore'and t.arrival='Chennai' 
AND  exists (select u1.user_id,u1.user_type,u1.fname,u1.lname
from user as u1,ticket as t1
where u1.user_id=t1.user_id and t.departure='Chennai'and t.arrival='Bangalore' 
and t.travel_date-t1.travel_date=7);

select distinct u.user_id,u.user_type,u.fname,u.lname
from user as u,ticket as t
where u.user_id=t.user_id and t.departure='Banglore'and t.arrival='Chennai' 
AND  not  exists (select u1.user_id,u1.user_type,u1.fname,u1.lname
from user as u1,ticket as t1
where u1.user_id=t1.user_id and t.departure='Chennai'and t.arrival='Bangalore' 
and t.travel_date-t1.travel_date=7);