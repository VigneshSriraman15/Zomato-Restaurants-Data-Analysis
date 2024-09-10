create database zomato_analysis;

use zomato_analysis;

create table dataset (RestaurantID int,RestaurantName varchar(255),CountryCode varchar(10),City varchar(255),Address varchar(255),Locality varchar(255) 
,LocalityVerbose varchar(250) ,Longitude float ,Latitude float ,Cuisines varchar(255) ,Currency varchar(255) ,Has_Table_booking varchar(255) 
,Has_Online_delivery varchar(255) ,Is_delivering_now varchar(255) ,Switch_to_order_menu varchar(255) ,Price_range varchar(255), Votes varchar(255) 
,Average_Cost_for_two int ,Rating float, Datekey_Opening varchar(255));

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/csv2.csv"
INTO TABLE dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# KPI 1 :-  Build a country Map Table

create table country_map (CountryCode varchar(255) primary key, CountryName varchar(255));

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/csv3.csv"
INTO TABLE country_map
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from country_map;

# KPI 2 :- Build a Calendar Table using the Column Datekey
	# Add all the below Columns in the Calendar Table using the Formulas.
		# A.Year
		# B.Monthno
		# C.Monthfullname
		# D.Quarter(Q1,Q2,Q3,Q4)
		# E. YearMonth ( YYYY-MMM)
		# F. Weekdayno
		# G.Weekdayname
		# H.FinancialMOnth ( April = FM1, May= FM2  …. March = FM12)
		# I. Financial Quarter ( Quarters based on Financial Month)
        
UPDATE dataset SET Datekey_Opening = REPLACE(Datekey_Opening, '_', '/') WHERE Datekey_Opening LIKE '%_%';
alter table dataset modify column Datekey_Opening date;

select Datekey_Opening, year(Datekey_Opening) as 'Year',
month(Datekey_Opening) as 'Month No',
monthname(Datekey_Opening) as 'Month Full Name',
concat("Q",Quarter(Datekey_Opening)) as 'Quarter',
concat(year(Datekey_Opening),'-',date_format(Datekey_Opening,'%b')) as 'Year-Month', 
dayofweek(Datekey_Opening) as 'Week Day Number',
dayname(Datekey_Opening) as 'Week Day Name', 

case when monthname(Datekey_Opening)='January' then 'FM10' 
when monthname(Datekey_Opening)='February' then 'FM11'
when monthname(Datekey_Opening)='March' then 'FM12'
when monthname(Datekey_Opening)='April'then'FM1'
when monthname(Datekey_Opening)='May' then 'FM2'
when monthname(Datekey_Opening)='June' then 'FM3'
when monthname(Datekey_Opening)='July' then 'FM4'
when monthname(Datekey_Opening)='August' then 'FM5'
when monthname(Datekey_Opening)='September' then 'FM6'
when monthname(Datekey_Opening)='October' then 'FM7'
when monthname(Datekey_Opening)='November' then 'FM8'
when monthname(Datekey_Opening)='December'then 'FM9'
end as 'Financial Month',
case when monthname(Datekey_Opening) in ('January' ,'February' ,'March' )then 'FQ4'
when monthname(Datekey_Opening) in ('April' ,'May' ,'June' )then 'FQ1'
when monthname(Datekey_Opening) in ('July' ,'August' ,'September' )then 'FQ2'
else  'FQ3' end as 'Financial Quarter'
from dataset;

# KPI 3 :- Find the Numbers of Resturants based on City and Country

select country_map.CountryName, dataset.City, count(RestaurantID) as 'No. of Restaurants'
from dataset inner join country_map on dataset.CountryCode = country_map.CountryCode 
group by country_map.CountryName, dataset.City order by count(RestaurantID) desc;

select country_map.CountryName, count(RestaurantID) as 'No. of Restaurants'
from dataset inner join country_map on dataset.CountryCode = country_map.CountryCode 
group by country_map.CountryName order by count(RestaurantID) desc;

select dataset.City, count(RestaurantID) as 'No. of Restaurants'
from dataset inner join country_map on dataset.CountryCode = country_map.CountryCode 
group by dataset.City order by count(RestaurantID) desc;

# KPI 4 :- Numbers of Resturants opening based on Year, Quarter, Month

select year(Datekey_Opening) as 'Year', concat("Q",quarter(Datekey_Opening)) as 'Quarter', monthname(Datekey_Opening) as 'Month', 
count(RestaurantID) as 'No. of Restaurants' from dataset group by year(Datekey_Opening), quarter(Datekey_Opening), monthname(Datekey_Opening) 
order by year(Datekey_Opening), quarter(Datekey_Opening), month(Datekey_Opening);

select year(Datekey_Opening) as 'Year', count(RestaurantID) as 'No. of Restaurants' from dataset group by year(Datekey_Opening) 
order by year(Datekey_Opening);

select concat("Q",quarter(Datekey_Opening)) as 'Quarter', count(RestaurantID) as 'No. of Restaurants' from dataset group by quarter(Datekey_Opening) 
order by quarter(Datekey_Opening);

select monthname(Datekey_Opening) as 'Month Name', count(RestaurantID) as 'No. of Restaurants' from dataset group by monthname(Datekey_Opening) 
order by month(Datekey_Opening);

# KPI 5 :- Count of Resturants based on Average Ratings

select case when Rating < 1.5 then "1.0-1.5" when Rating < 2 then "1.5-2.0" when Rating < 2.5 then "2.0-2.5" when Rating < 3 then "2.5-3.0" 
when Rating < 3.5 then "3.0-3.5" when Rating < 4 then "3.5-4.0" when Rating < 4.5 then "4.0-4.5" when Rating < 5 then "4.5-5.0" end as 'Rating_Range', 
count(RestaurantID) as 'No. of Restaurants' from dataset group by Rating_Range order by Rating_Range;

# KPI 6 :- Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets

with tab1 as (select RestaurantID, Average_Cost_for_two, case when Average_Cost_for_two < 100 then "0-100" when Average_Cost_for_two < 500 then "100-500" 
when Average_Cost_for_two < 1000 then "500-1000" when Average_Cost_for_two < 2000 then "1000-2000" when Average_Cost_for_two < 3000 then "2000-3000" 
when Average_Cost_for_two < 4000 then "3000-4000" when Average_Cost_for_two < 5000 then "4000-5000" when Average_Cost_for_two < 10000 then "5000-10000" 
when Average_Cost_for_two > 10000 then ">10000" end as Price_Range from dataset) 
select Price_Range, count(RestaurantID) as "No. of Restaurants" from tab1 group by Price_Range order by count(RestaurantID) desc;

# KPI 7 :- Percentage of Resturants based on "Has_Table_booking"

select Has_Table_booking, count(RestaurantID) as "No. of Restaurants", concat(round(((count(RestaurantID)/(select count(*) from dataset))*100),2),"%") 
as 'Percentage of Restaurants' from dataset group by Has_Table_booking;

# KPI 8 :- Percentage of Resturants based on "Has_Online_delivery"

select Has_Online_delivery, count(RestaurantID) as "No. of Restaurants", concat(round(((count(RestaurantID)/(select count(*) from dataset))*100),2),"%") 
as 'Percentage of Restaurants' from dataset group by Has_Online_delivery;

# KPI 9 :- Develop Charts based on Cusines, City, Ratings

select Cuisines, count(RestaurantID) as 'No. of Restaurants' from dataset group by Cuisines order by count(RestaurantID) desc;

select City, case when Rating < 1.5 then "1.0-1.5" when Rating < 2 then "1.5-2.0" when Rating < 2.5 then "2.0-2.5" when Rating < 3 then "2.5-3.0" 
when Rating < 3.5 then "3.0-3.5" when Rating < 4 then "3.5-4.0" when Rating < 4.5 then "4.0-4.5" when Rating < 5 then "4.5-5.0" end as 'Rating_Range', 
count(RestaurantID) as 'No. of Restaurants' from dataset group by City, Rating_Range order by City, Rating_Range;

# KPI 10 :- Country, City & Restaurants Vs Total Votes

select country_map.CountryName, dataset.City, dataset.RestaurantName, sum(dataset.Votes) as 'Total Votes'
from dataset inner join country_map on dataset.CountryCode = country_map.CountryCode 
group by country_map.CountryName, dataset.City, dataset.RestaurantName order by sum(Votes) desc;