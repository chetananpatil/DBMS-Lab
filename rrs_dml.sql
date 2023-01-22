use Rrs;
INSERT INTO train values('KAR01','BANGLORE','CHENNAI',10,'class1','BangloreExpress'),
('KAR02','BANGLORE','HASSAN',7,'class2','HASSANExpress'),
('KAR04','BANGLORE','HAVERI',8,'class1','HAVERIExpress'),
('KAR05','BIJAPUR','DAVANAGERE',6,'class1','KarnatakaExpress'),
('KAR06','BIJAPUR','SHIVMOGA',7,'class2','KarnatakaExpress'),
('KAR07','BIJAPUR','BENGALURU',5,'class3','KarnatakaExpress');
desc train;

insert into compartment values('KAR01','C1','CT1',9,'YES');
insert into compartment value('KAR02','C2','CT2',7,'NO');
insert into compartment value('KAR04','C5','CT3',8,'YES');
insert into compartment value('KAR05','C4','CT2',6,'NO');
insert into compartment value('KAR06','C3','CT1',10,'YES');
insert into compartment value('KAR07','C6','CT4',4,'NO');
SELECT * FROM COMPARTMENT;
DESC COMPARTMENT;

INSERT INTO route_info values('KAR01','BA01','BANGLORE','UD01','UDUPI',15);
INSERT INTO route_info values('KAR02','BA01','BANGLORE','HA01','HASSAN',29);
INSERT INTO route_info values('KAR04','BA01','BANGLORE','HV01','HAVERI',30);
INSERT INTO route_info values('KAR05','H01','BIJAPUR','DA01','DAVANAGERE',10);
INSERT INTO route_info values('KAR06','HA01','BIJAPUR','SH01','SHIVMOGA',17);
INSERT INTO route_info values('KAR07','HA01','BIJAPUR','BA01','BENGALURU',20);
SELECT * FROM ROUTE_INFO;

INSERT INTO USER VALUES('U1','UT1','JYOTHI','S',19,068,'SN01','2002-9-14');
INSERT INTO USER VALUES('U2','UT2','MEGHANA','N',19,009,'SN02','2002-01-30');
INSERT INTO USER VALUES('U3','UT3','SHAMATHA','SHEETY',18,130,'SN03','2003-11-18');
INSERT INTO USER VALUES('U4','UT4','SHASHANK','M',19,084,'SN04','2003-09-09');
INSERT INTO USER VALUES('U5','UT5','MYTHRI','RAJ',16,109,'SN05','2006-02-28');
INSERT INTO USER VALUES('U6','UT6','SHAKSHI','J',17,099,'SN06','2005-06-30');
SELECT * FROM USER;

INSERT INTO USER_TRAIN VALUES('KAR01','U1',7);
INSERT INTO USER_TRAIN VALUES('KAR02','U2',8);
INSERT INTO USER_TRAIN VALUES('KAR04','U3',10);
INSERT INTO USER_TRAIN VALUES('KAR05','U4',4);
INSERT INTO USER_TRAIN VALUES('KAR06','U5',2);
INSERT INTO USER_TRAIN VALUES('KAR02','U6',13);
INSERT INTO USER_TRAIN VALUES('KAR01','U5',9);
INSERT INTO USER_TRAIN VALUES('KAR04','U3',3);
SELECT * FROM USER_TRAIN;

INSERT INTO USER_PHONE VALUES('U1',8907685678);
INSERT INTO USER_PHONE VALUES('U2',9038765432);
INSERT INTO USER_PHONE VALUES('U3',7809765432);
INSERT INTO USER_PHONE VALUES('U4',6778900988);
INSERT INTO USER_PHONE VALUES('U5',9087654789);
INSERT INTO USER_PHONE VALUES('U6',8347893484);
SELECT * FROM USER_PHONE;

INSERT INTO TICKET VALUES('PNR1','KAR01','2020-09-13','BANGLORE','UDUPI','19:00AM','20:15PM','U1','class1','CT1','C1');
INSERT INTO TICKET VALUES('PNR2','KAR02','2020-09-24','BANGLORE','HASSAN','16:00PM','11:45AM','U2','class1','CT2','C2');
INSERT INTO TICKET VALUES('PNR3','KAR04','2020-09-18','BANGLORE','HAVERI','4:30AM','20:00PM','U3','class3','CT3','C3');
INSERT INTO TICKET VALUES('PNR4','KAR05','2020-10-13','BIJAPUR','DAVANAGERE','19:00PM','20:15PM','U4','class2','CT1','C1');
INSERT INTO TICKET VALUES('PNR5','KAR06','2020-10-04','BIJAPUR','SHIVMOGA','15:00PM','21:15PM','U5','class1','CT4','C3');
INSERT INTO TICKET VALUES('PNR6','KAR01','2020-09-15','BIJAPUR','BENGALURU','6:00PM','7:15AM','U3','class3','CT1','C4');
INSERT INTO TICKET VALUES('PNR7','KAR05','2020-10-01','BANGLORE','HAVERI','4:00PM','5:15AM','U5','class1','CT4','C3');
INSERT INTO TICKET VALUES('PNR8','KAR04','2020-09-25','BIJAPUR','SHIVMOGA','10:00PM','11:35AM','U6','class2','CT3','C1');
SELECT * FROM TICKET;

SELECT * FROM FARE_DETAILS;

UPDATE USER SET AGE=21 WHERE USER_ID='U1';
SELECT * FROM USER;


UPDATE route_info  SET DISTANCE=40 WHERE TRAIN_NO='KAR01';
UPDATE route_info  SET DISTANCE=90 WHERE TRAIN_NO='KAR02';
UPDATE route_info  SET DISTANCE=100 WHERE TRAIN_NO='KAR04';
UPDATE route_info  SET DISTANCE=80 WHERE TRAIN_NO='KAR05';
UPDATE route_info  SET DISTANCE=75 WHERE TRAIN_NO='KAR06';
UPDATE route_info  SET DISTANCE=55 WHERE TRAIN_NO='KAR07';
SELECT * FROM ROUTE_INFO;
SELECT * FROM ROUTE_INFO WHERE 70<DISTANCE and distance<150;


update route_info set From_station_name='chennai' where Train_no='KAR01';
update route_info set To_station_name='sholingur' where Train_no='KAR01';
select * from route_info;
select * from route_info where From_station_name='chennai' and To_station_name='sholingur';
select * from train where train_type!='mail';
update route_info set From_station_name='bangalore' where Train_no='KAR02';
update route_info set To_station_name='chennai' where Train_no='KAR02';
select Train_name,Train_no from train where Train_no=(select Train_no from route_info  where From_station_name='bangalore' and To_station_name='chennai');
select train_no from route_info  where From_station_name='bangalore' and To_station_name='chennai';

update user set Age=year(curdate())-year(DOB);
select age,DOB from user;

select * from user;
update user SET DOB='1983-08-07' WHERE USER_ID='U6';
update user SET DOB='1989-07-08' WHERE USER_ID='U4';
select Fname,Lname from user where DOB<('1990-1-1') AND DOB>('1980-1-1');
SELECT *FROM user WHERE Fname LIKE 'S%';
SELECT *FROM TRAIN WHERE TRAIN_TYPE='CLASS1' AND TRAIN_NO='KAR01';
SELECT PNR,Transaction_id,BANK from payment_info WHERE BANK='UBI';
savepoint SP1;
create user chetana@localhost identified by 'chetana123';
grant SELECT ON . TO chetana@localhost;

create table extra(extra int);
insert into extra (extra) values (1),(2),(3),(4),(5);
select * from extra;
truncate extra;
select * from extra;
drop table extra;
REVOKE DELETE, UPDATE ON extra FROM jyothi@localhost;
REVOKE UPDATE ON . FROM jyothi@localhost;
REVOKE DELETE ON . FROM jyothi@localhost;
savepoint SP1;
ROLLBACK TO SP1;
RELEASE SAVEPOINT SP1