create database data_warehouse;
use data_warehouse;
CREATE TABLE Dim_Location(
    Location_Id INT Not NULL,
    Borough	varchar(20),
    Zone_name	varchar(50),
    Service_zone VARCHAR(50),
    PRIMARY KEY (Location_Id)
);

Insert into Dim_Location select * from nyc_taxi.taxi_zone_lookup;
select count(*) from Dim_Location;


CREATE TABLE Dim_Business_Location(
    Business_id varchar(10) not null ,
    Industry_type VARCHAR(50),
    PRIMARY Key (Business_Id)
);

Insert into Dim_Business_Location select  distinct Industry, Business_id  from nyc_taxi.Business_Locations;

CREATE TABLE Dim_Weather(
    Weather_id  varchar(10)  not null ,
    Weather_type VARCHAR(50),
    Temperature VARCHAR(20),
    PRIMARY Key ( Weather_id)
);

Insert into Dim_Weather select Weather_id,Weather_type,Temperature from nyc_taxi.Weather_Data;


CREATE TABLE dim_Age(
    Census_id varchar(50) not null,
    Zone_name varchar(50),
    Age_16_to_19 int,
    Age_20_to_24 int,
    Age_25_to_44 int,
    Age_45_to_54 int,
    Age_55_to_60 int,
    Age_60_and_over int,
    Male int,
    Female int,
    Native int,
    foreign_born int,
    foreign_born_with_US_citizenship int,
    foreign_born_without_US_citizenship int,
    Transportation_type varchar(30)
);


CREATE TABLE dim_Income(
    Census_id Varchar(50) not null,
    Zone_name varchar(50),
    Earning_less_than_10000 int,
    Earning_10000_to_14999 int,
    Earning_15000_to_24999 int,
    Earning_25000_to_34999 int,
    Earning_35000_to_49999 int,
    Earning_50000_to_64999 int,
    Earning_65000_to_74999 int,
    Earning_75000_or_more int,
    Transportation_type varchar(30)

);

CREATE TABLE dim_Vehicles(
    Census_id varchar(50) not null,
    Zone_name varchar(50),
    No_vehicle_available int,
    one_vehicle_available int,
    two_vehicles_available int,
    three_or_more_vehicles_available int,
    Transportation_type varchar(30)
);
#drop table data_warehouse.agg_dim_public_transport;

Create table AGG_Dim_Carpooled(
car_id int auto_increment not  null,
Zone_name VARCHAR(50),
Transportation_Type VARCHAR(30),
Age_16_to_19 INT,
Age_20_to_24 INT,
Age_25_to_44 INT,
Age_45_to_54 INT,
Age_55_to_59 INT,
Age_60_or_more INT,
Male INT,
Female INT,
Native int,
foreign_born int,
foreign_born_with_US_citizenship int,
foreign_born_without_US_citizenship int,
Earning_lessthan_10000 INT,
Earning_10000_to_14999 INT,
Earning_15000_to24999 INT,
Earning_25000_to_34999 INT,
Earning_35000_to_49999 INT,
Earning_50000_to_64999 INT,
Earning_65000_to_74999 INT,
Earning_75000_or_more INT,
No_vehicle INT,
One_vehicle INT,
Two_vehicles INT,
three_or_more_vehicles INT,
primary key (car_id)
);

Create table AGG_Dim_Drive_alone(
drive_id int auto_increment not null,
Zone_name VARCHAR(50),
Transportation_Type VARCHAR(30),
Age_16_to_19 INT,
Age_20_to_24 INT,
Age_25_to_44 INT,
Age_45_to_54 INT,
Age_55_to_59 INT,
Age_60_or_more INT,
Male INT,
Female INT,
Native int,
foreign_born int,
foreign_born_with_US_citizenship int,
foreign_born_without_US_citizenship int,
Earning_lessthan_10000 INT,
Earning_10000_to_14999 INT,
Earning_15000_to24999 INT,
Earning_25000_to_34999 INT,
Earning_35000_to_49999 INT,
Earning_50000_to_64999 INT,
Earning_65000_to_74999 INT,
Earning_75000_or_more INT,
No_vehicle INT,
One_vehicle INT,
Two_vehicles INT,
three_or_more_vehicles INT,
primary key (drive_id)
);

Create table AGG_Dim_Public_transport(
pub_id int  not null auto_increment,
Zone_name VARCHAR(50),
Transportation_Type VARCHAR(30),
Age_16_to_19 INT,
Age_20_to_24 INT,
Age_25_to_44 INT,
Age_45_to_54 INT,
Age_55_to_59 INT,
Age_60_or_more INT,
Male INT,
Female INT,
Native int,
foreign_born int,
foreign_born_with_US_citizenship int,
foreign_born_without_US_citizenship int,
Earning_lessthan_10000 INT,
Earning_10000_to_14999 INT,
Earning_15000_to24999 INT,
Earning_25000_to_34999 INT,
Earning_35000_to_49999 INT,
Earning_50000_to_64999 INT,
Earning_65000_to_74999 INT,
Earning_75000_or_more INT,
No_vehicle INT,
One_vehicle INT,
Two_vehicles INT,
three_or_more_vehicles INT,
primary key (pub_id)
);

CREATE TABLE  Dim_Time(
    Time_id Varchar(10) not null ,
    curr_date_time  TIMESTAMP,
    PRIMARY key (Time_id)
);
#drop table data_warehouse.AGG_Dim_carpooled;
#use data_warehouse;
CREATE Table Fact_Taxi_Transport(
    Dim_pickup_time_id varchar(10) NOT NULL,
    Dim_Dropoff_time_id   varchar(10) NOT NULL,
    Dim_Pickup_Location_id INT NOT NULL,
    Dim_Dropoff_Location_id    INT NOT NULL,
    Dim_Business_id varchar(10) NOT NULL,
    Dim_Weather_id  varchar(10) NOT NULL,
    Dim_carpooled_id int NOT NULL,
    Dim_DriveAlone_id int NOT NULL,
    Dim_PublicTransport int NOT NULL,
    Trip_Distance DOUBLE PRECISION,
    Tip_amount DOUBLE PRECISION,
    Total_amount    DOUBLE PRECISION,
    PRIMARY key (Dim_pickup_time_id, Dim_Dropoff_time_id, Dim_Pickup_Location_id, Dim_Dropoff_location_id, Dim_Business_id, Dim_Weather_id, Dim_carpooled_id, Dim_DriveAlone_id, Dim_PublicTransport),
    FOREIGN key (Dim_pickup_time_id) REFERENCES Dim_Time(Time_id), 
    FOREIGN key (Dim_Dropoff_time_id)REFERENCES Dim_Time(Time_id),
    FOREIGN key (Dim_Pickup_Location_id) REFERENCES Dim_Location(Location_Id),  
    FOREIGN Key (Dim_Dropoff_location_id) REFERENCES Dim_Location(Location_Id),
    FOREIGN Key (Dim_Weather_id) REFERENCES Dim_Weather(Weather_id),
    FOREIGN Key (Dim_Business_id) REFERENCES Dim_Business_Location(Business_id)
);