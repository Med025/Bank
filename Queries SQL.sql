use Bank_Churn;
select * from customer

select * from messy

-- 1) Counting Total Record in Databases
select count(*) from customer
-- 2) finding maximum age of the bank
select max(Age) as max_age from customer
-- 3) finding Average age of the bank
select avg(Age) as Average_age from customer
-- 4) finding minimum age of the bank
select min(Age) as Min_age from customer
-- 5) calculating age bank
select Age,count(Age) As Total_Age from customer
group by Age
order by Total_Age desc
-- 5) Ranking Age on the number the bank
select Age, count(Age) as total, dense_rank() over(order by count(Age),Age desc) as Ranking
from customer
group by Age
having total > avg(Age)
-- 7) finding count client
select Gender,Geography, count(Geography) as Total_Geography,
rank() over(partition by Gender order by count(Geography) desc) as Ranking_Geography
from customer
group by 1,2
order by 1
-- 8) finding count of geography
select Geography, count(Geography) as total_geography from customer
group by 1
order by 1 desc
-- 9) finding HasCrCard 
select HasCrCard, count(HasCrCard) as Total_use from messy
group by 1
order by 1 desc
-- 10) finding IsActiveMember
select IsActiveMember, count(IsActiveMember) as Activation from messy
group by 1
order by 1 desc

-- 11) finding sum balance by isactivemember
select IsActiveMember,round(sum(Balance),2) from messy
group by 1
order by 1 desc
-- 12) finding sum balance by numofproduct
select NumOfProducts,round(sum(Balance),2) as Total_Products from messy
group by 1
order by 1 desc
select * from messy
-- 13) finding sum balance hascrcard
select HasCrCard, round(sum(Balance),2) as Total_Card from messy
group by 1
order by 1 desc
-- 14) finding sum balance by tenure
select Tenure, sum(Balance) as Total_tenure from messy
group by 1
order by 2 desc
-- 15) finding sum balance exited
select Exited, sum(Balance) from messy
group by 1
order by 2 desc 
-- 16) finding balance and numofproduct and hascrcard and tenure and isactivemember and exited
select  HasCrCard,NumOfProducts,sum(Balance) as Total_Balance,IsActiveMember,Exited from messy
order by 3 desc
select * from messy

-- 17) Ranking
select CustomerId,Surname,Balance,
Rank() over(order by Balance desc) as Ranking
from customer
order by Ranking

-- 18) Top 5 Rows Ranking
with customer_Ranking as (
select CustomerId,Surname,Balance,
Rank() over(order by Balance desc) as Ranking
from customer
order by Ranking
)
select CustomerId,Surname,Balance
from customer_Ranking
where Ranking < 5
order by Ranking
-- 19) 
select 
CustomerId,Surname,EstimatedSalary,
row_number() over(order by CustomerId ) as Ranking_position
from customer
-- 20) 
select Surname,Geography,Balance,NumOfProducts,
rank() over(partition by Geography order by Balance desc) as Ranking_Geo
from customer