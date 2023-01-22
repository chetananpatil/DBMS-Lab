use Railway_Reservation_System;
CREATE VIEW compute_price AS
SELECT Ticket.PNR, Ticket.Train_No, Ticket.Departure, Ticket.Arrival,Route_Info.Distance, fare_details.fareperkm
FROM Ticket, Route_Info,fare_details
WHERE (Ticket.Train_No = Route_Info.Train_No AND
Ticket.Departure = Route_Info.From_Station_Name AND
Ticket.Arrival = Route_Info.To_Station_Name AND
Fare_details.Train_Type=Ticket.Train_Type AND
Fare_details.Compartment_Type =Ticket.Compartment_type);
SELECT  * FROM COMPUTE_PRICE;
DESC COMPUTE_PRICE;
CREATE VIEW passenger_no AS select PNR, count(PNR) as numbers from
Ticket_Passenger group by PNR;
select * from passenger_no;
UPDATE Payment_Info AS p INNER JOIN compute_price AS cs ON p.PNR = cs.PNR INNER JOIN passenger_no AS pn ON cs.PNR = pn.PNR SET p.Price = cs.Distance * cs.FarePerKM * pn.numbers;
select * from payment_info;

Select T.Train_No
From Train as T, Compartment as C
Where T.Train_No=C.Train_No and T.arrival='HAVERI' and T.Destinamtion='BENGALURU' and C.Availability>2;

Select U.FName, U.LName
From User as U, Ticket as T, PaymentS_Info as P
Where U.User_ID=T.User_ID and T.PNR=P.PNR and P.Price>500;

Select U.FName, U.LName, U.DOB, T.PNR
From User as U LEFT OUTER JOIN Ticket as T ON U.User_ID=T.User_ID;

Select U.FName, U.LName, U.DOB, T.PNR
From User as U LEFT OUTER JOIN Ticket as T ON U.User_ID=T.User_ID where T.PNR is null

Select T.PNR, T.Train_No, T.Travel_Date, U.FName, U.LName
From Ticket as T RIGHT OUTER JOIN User as U ON T.User_ID=U.User_ID;

Select U.User_ID, T.Train_no, T.train_Name
From User as U RIGHT OUTER JOIN Train AS T ON U.Train_no=T.Train_No;

alter table user add train_no varchar(50);

update user set train_no='KA01' WHERE USER_ID='U1';
update user set train_no='KA02' WHERE USER_ID='U2';
update user set train_no='KA03' WHERE USER_ID='U3';
update user set train_no='KA04' WHERE USER_ID='U4';
update user set train_no='KA001' WHERE USER_ID='U5';
select * from user;

