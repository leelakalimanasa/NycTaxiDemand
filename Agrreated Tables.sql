insert into data_warehouse.agg_dim_carpooled (Zone_name, Transportation_Type,Age_16_to_19,Age_20_to_24, Age_25_to_44, Age_45_to_54,
Age_55_to_59, Age_60_or_more  ,Male  ,Female  ,Native  ,
foreign_born  ,foreign_born_with_US_citizenship, foreign_born_without_US_citizenship  ,
Earning_lessthan_10000, Earning_10000_to_14999, Earning_15000_to24999, Earning_25000_to_34999,
Earning_35000_to_49999, Earning_50000_to_64999, Earning_65000_to_74999,
Earning_75000_or_more, No_vehicle  ,One_vehicle, Two_vehicles,
three_or_more_vehicles)  select A.Zone_name,A.Transportation_type, sum(Age_16_to_19),sum(Age_20_to_24), 
sum(Age_25_to_44), sum(Age_45_to_54), sum(Age_55_to_60),sum(Age_60_and_over),
sum(Male), sum(Female), sum(Native),sum(foreign_born),
sum(foreign_born_with_US_citizenship),sum(foreign_born_without_US_citizenship),
sum(Earning_less_than_10000), sum(Earning_10000_to_14999),sum(Earning_15000_to_24999), 
sum(Earning_25000_to_34999),sum(Earning_35000_to_49999),sum(Earning_50000_to_64999),
sum(Earning_65000_to_74999), sum(Earning_75000_or_more),sum(No_vehicle_available),
sum(one_vehicle_available),sum(two_vehicles_available),sum(three_or_more_vehicles_available)
FROM data_warehouse.Age as A 
JOIN data_warehouse.income as I on A.Census_id=I.Census_id
JOIN data_warehouse.vehicles as V on A.Census_id=V.Census_id
and A.Transportation_type ='carpooled'
group by A.Zone_name,A.Transportation_type ;



insert into data_warehouse.agg_dim_public_transport (Zone_name, Transportation_Type,Age_16_to_19,Age_20_to_24, Age_25_to_44, Age_45_to_54,
Age_55_to_59, Age_60_or_more  ,Male  ,Female  ,Native  ,
foreign_born  ,foreign_born_with_US_citizenship, foreign_born_without_US_citizenship  ,
Earning_lessthan_10000, Earning_10000_to_14999, Earning_15000_to24999, Earning_25000_to_34999,
Earning_35000_to_49999, Earning_50000_to_64999, Earning_65000_to_74999,
Earning_75000_or_more, No_vehicle  ,One_vehicle, Two_vehicles,
three_or_more_vehicles)  select A.Zone_name,A.Transportation_type, sum(Age_16_to_19),sum(Age_20_to_24), 
sum(Age_25_to_44), sum(Age_45_to_54), sum(Age_55_to_60),sum(Age_60_and_over),
sum(Male), sum(Female), sum(Native),sum(foreign_born),
sum(foreign_born_with_US_citizenship),sum(foreign_born_without_US_citizenship),
sum(Earning_less_than_10000), sum(Earning_10000_to_14999),sum(Earning_15000_to_24999), 
sum(Earning_25000_to_34999),sum(Earning_35000_to_49999),sum(Earning_50000_to_64999),
sum(Earning_65000_to_74999), sum(Earning_75000_or_more),sum(No_vehicle_available),
sum(one_vehicle_available),sum(two_vehicles_available),sum(three_or_more_vehicles_available)
FROM data_warehouse.Age as A 
JOIN data_warehouse.income as I on A.Census_id=I.Census_id
JOIN data_warehouse.vehicles as V on A.Census_id=V.Census_id
and A.Transportation_type ='public_transport'
group by A.Zone_name,A.Transportation_type ;



insert into data_warehouse.agg_dim_drive_alone (Zone_name, Transportation_Type,Age_16_to_19,Age_20_to_24, Age_25_to_44, Age_45_to_54,
Age_55_to_59, Age_60_or_more  ,Male  ,Female  ,Native  ,
foreign_born  ,foreign_born_with_US_citizenship, foreign_born_without_US_citizenship  ,
Earning_lessthan_10000, Earning_10000_to_14999, Earning_15000_to24999, Earning_25000_to_34999,
Earning_35000_to_49999, Earning_50000_to_64999, Earning_65000_to_74999,
Earning_75000_or_more, No_vehicle  ,One_vehicle, Two_vehicles,
three_or_more_vehicles)  select A.Zone_name,A.Transportation_type, sum(Age_16_to_19),sum(Age_20_to_24), 
sum(Age_25_to_44), sum(Age_45_to_54), sum(Age_55_to_60),sum(Age_60_and_over),
sum(Male), sum(Female), sum(Native),sum(foreign_born),
sum(foreign_born_with_US_citizenship),sum(foreign_born_without_US_citizenship),
sum(Earning_less_than_10000), sum(Earning_10000_to_14999),sum(Earning_15000_to_24999), 
sum(Earning_25000_to_34999),sum(Earning_35000_to_49999),sum(Earning_50000_to_64999),
sum(Earning_65000_to_74999), sum(Earning_75000_or_more),sum(No_vehicle_available),
sum(one_vehicle_available),sum(two_vehicles_available),sum(three_or_more_vehicles_available)
FROM data_warehouse.Age as A 
JOIN data_warehouse.income as I on A.Census_id=I.Census_id
JOIN data_warehouse.vehicles as V on A.Census_id=V.Census_id
and A.Transportation_type ='drove_alone'
group by A.Zone_name,A.Transportation_type ;