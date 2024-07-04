/*
Hotel Reservation Analysis with SQL
*/
-- Q1. What is the total number of reservations in the dataset?
select count(*)
from dbo.[Hotel Reservation Dataset]



-- Q2. Which meal plan is the most popular among guests?
select top 1 count(type_of_meal_plan) as "meal_plan_count", type_of_meal_plan as "most_popular_meal_plan"
from dbo.[Hotel Reservation Dataset]
group by type_of_meal_plan
order by meal_plan_count desc



--Q3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) as "average price per room"
from dbo.[Hotel Reservation Dataset]
where no_of_children > 0



--Q4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select year(arrival_date) as "reservation_year", count(Booking_ID) as "total_reservations"
from dbo.[Hotel Reservation Dataset]
where year(arrival_date) = 2018
group by year(arrival_date)



--Q5. What is the most commonly booked room type? 
select top 1 count(room_type_reserved) as "most_reserved_room"
from dbo.[Hotel Reservation Dataset]
group by room_type_reserved



--Q6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(Booking_ID) as No_of_Weekend_Resevations
from dbo.[Hotel Reservation Dataset]
where no_of_weekend_nights>0



--Q7. What is the highest and lowest lead time for reservations?
select min(lead_time) as Min_Lead_Time, MAX(lead_time) as Max_Lead_Time
from dbo.[Hotel Reservation Dataset]



--Q8. What is the most common market segment type for reservations?
select top 1 count(market_segment_type) as "Most_Common_Market_Segment"
from dbo.[Hotel Reservation Dataset]
group by market_segment_type
order by "Most_Common_Market_Segment" desc



--Q9. How many reservations have a booking status of "Confirmed"?
select count(booking_status) as "Confirmed_Status"
from dbo.[Hotel Reservation Dataset]
where booking_status = 'Not_Canceled'
group by booking_status



--Q10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as 'Total_Adults', sum(no_of_children) as 'Total_Children'
from dbo.[Hotel Reservation Dataset]



--Q11. What is the average number of weekend nights for reservations involving children?
select cast(avg(no_of_week_nights) as int) as 'AVG_No_Week_Nights'
from dbo.[Hotel Reservation Dataset]
where no_of_children > 0



--Q12. How many reservations were made in each month of the year?
select year(arrival_date) as 'YEAR', month(arrival_date) as 'MONTH', count(Booking_ID)
from dbo.[Hotel Reservation Dataset]
group by  year(arrival_date), month(arrival_date)
order by YEAR, MONTH



--Q13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved as 'Room_Type', cast(avg(no_of_week_nights) as int) as 'AVG_Weekday_Night', cast(avg(no_of_weekend_nights) as int) as 'AVG_Weekend_Night'
from dbo.[Hotel Reservation Dataset]
group by room_type_reserved



--Q14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
select top 1 count(room_type_reserved) as 'Most_Common_Room_Type', cast(avg(avg_price_per_room) as numeric(10,2)) as 'AVG_Price'
from dbo.[Hotel Reservation Dataset]
group by room_type_reserved
order by Most_Common_Room_Type desc



--Q15. Find the market segment type that generates the highest average price per room.
select  top 1 market_segment_type , max(avg_price_per_room) as 'Max_AVG_Price_Per_Room'
from dbo.[Hotel Reservation Dataset]
group by market_segment_type
order by max(avg_price_per_room) desc

