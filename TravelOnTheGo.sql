create database TravelOnTheGo;
use TravelOnTheGo;

create table PASSENGER(
Passenger_name varchar(30),
Category varchar(15),
Gender varchar(10),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(10)
);

create table PRICE(
Bus_Type varchar(15),
Distance int,
Price int
);

insert into PASSENGER values("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper");
insert into PASSENGER values("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 700, "Sitting");
insert into PASSENGER values("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper");
insert into PASSENGER values("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
insert into PASSENGER values("Udit", "Non-AC", "M", "Trivandrum", "panaji", 1000, "Sleeper");
insert into PASSENGER values("Ankur", "AC", "M", "Nagpur", "Hyderabad", 500, "Sitting");
insert into PASSENGER values("Hemant", "Non-AC", "M", "panaji", "Mumbai", 700, "Sleeper");
insert into PASSENGER values("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
insert into PASSENGER values("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

insert into PRICE values("Sleeper", 350, 770);
insert into PRICE values("Sleeper", 500, 1100);
insert into PRICE values("Sleeper", 600, 1320);
insert into PRICE values("Sleeper", 700, 1540);
insert into PRICE values("Sleeper", 1000, 2200);
insert into PRICE values("Sleeper", 1200, 2640);
insert into PRICE values("Sleeper", 1500, 2700);
insert into PRICE values("Sitting", 500, 620);
insert into PRICE values("Sitting", 600, 744);
insert into PRICE values("Sitting", 700, 868);
insert into PRICE values("Sitting", 1000, 1240);
insert into PRICE values("Sitting", 1200, 1488);
insert into PRICE values("Sitting", 1500, 1860);

SELECT Gender, count(Gender) FROM (SELECT Gender FROM PASSENGER WHERE Distance >= 600) as S GROUP BY Gender;

SELECT MIN(Price) FROM PRICE WHERE Bus_Type LIKE "Sleeper";

SELECT Passenger_name FROM PASSENGER WHERE Passenger_name LIKE "S%"; 

SELECT P.Passenger_name, P.Boarding_City, P.Destination_City, P.Bus_Type, Q.Price FROM PASSENGER AS P, PRICE AS Q
WHERE P.Distance = Q.Distance AND P.Bus_Type = Q.Bus_Type;

SELECT P.Passenger_name, Q.Price FROM PASSENGER AS P, PRICE AS Q
WHERE P.Distance = Q.Distance AND Q.Distance = 1000 
AND Q.Bus_Type = P.Bus_Type AND Q.Bus_Type LIKE "Sitting";

SELECT DISTINCT P.Passenger_name, P.Boarding_City, P.Destination_City, Q.Bus_Type, Q.Price 
FROM PASSENGER as P, PRICE as Q
WHERE P.Passenger_name = "Pallavi" AND P.Distance = Q.Distance; 

SELECT DISTINCT Distance FROM PASSENGER ORDER BY Distance;

SELECT Passenger_name, Distance / (SELECT SUM(Distance) FROM PASSENGER) * 100 FROM PASSENGER;
SELECT Passenger_name, Distance / (SELECT SUM(Distance) FROM PASSENGER) * 100 as Percentage FROM PASSENGER;

SELECT Distance, Price, 
CASE
WHEN Price > 1000 THEN 'Expensive' 
WHEN Price > 500 THEN 'Average' 
ELSE 'Cheap' 
END
AS Categories 
FROM PRICE;