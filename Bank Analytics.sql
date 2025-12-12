use bank;
select * from `bank data analystics`;

#Total Loan Amount
select concat("₹ ",round(sum(`loan amount`) / 1000000, 2), " M") as Total_Loan_Amount
from `bank data analystics`;

#Total Funded Amount
select concat("₹ ",round(sum(`Funded Amount`) / 1000000, 2), " M") as Total_Funded_Amount
from `bank data analystics`;

#Total Loan Count
select concat(round(count(`Client id`)/1000,2), "K") as Loan_Count
from `bank data analystics`;

#Total Collection
select concat("₹ ",round(sum(`Total Rec Prncp` + `Total Rrec int`)/1000000, 2), " M")
as Total_Collection from `bank data analystics`;

#Total Interest
select concat("₹ ",round(sum(`Total Rrec int` )/ 1000000, 2)," M") AS Total_Interest
from `bank data analystics`;

#Default Loan Count
select count(`Client id`) as Default_Loan_Count
from `bank data analystics`
where `Is Default Loan` = "Y";

#Count of Delinquent Clients
select concat(round(count(`Client id`)/1000,2)," K") as Delinquent_Client_Count
from `bank data analystics`
where `Is Delinquent Loan` = "Y";

#Not Verified Loan
select concat(round(count(`Client id`)/1000,2)," K") as Not_Verified_Loan_Count
from `bank data analystics`
where `Verification Status` = "Not Verified";

#Branch-Wise Performance
select `Branch Name` as Branch, 
concat("₹ ", round(sum(`Total Pymnt`)/1000000, 2)," M") as Total_Payment
from `bank data analystics`
group by `Branch Name`
order by sum(`Total Pymnt`) desc
limit 10;

#Top 10 State-Wise Loan Distribution
select `State Name` as State, 
concat("₹ ",round(sum(`Loan Amount`)/1000000, 2), " M") as Total_Loan
from `bank data analystics`
group by `State Name`
order by sum(`Loan Amount`) desc
limit 10;

#Religion-Wise Loan
select `Religion` as Religion, count(`Client id`) as Loan_Count
from `bank data analystics`
group by `Religion`
order by Loan_Count desc;

#Product Group-Wise Loan
select `Purpose Category` as Purpose, 
concat("₹ ",round(sum(`Funded Amount`)/1000000, 2), " M") as Total_Funded_Amount
from `bank data analystics`
group by `Purpose Category`
order by sum(`Funded Amount`) desc;

#Disbursement Trend
select `Disbursement Date (Years)` as Yr, 
concat("₹ ",round(sum(`Funded Amount`)/1000000, 2), " M") as Loan
from `bank data analystics`
group by `Disbursement Date (Years)`
order by `Disbursement Date (Years)` asc;

#Grade wise loan
select `Grrade` as Grade, 
concat("₹ ",round(sum(`Loan Amount`)/1000000, 2), " M") as Loan
from `bank data analystics`
group by `Grrade`
order by `Grrade` asc;

#Status-Wise Loan
select `Loan Status` as Loan_Status, 
concat("₹ ",round(sum(`Loan Amount`)/1000000, 2), " M") as Loan
from `bank data analystics`
group by `Loan Status`
order by sum(`Loan Amount`) desc;

#Age Wise Loan
select Age, count(`Client id`) as Loan_Count
from `bank data analystics`
group by Age
order by Age asc;
