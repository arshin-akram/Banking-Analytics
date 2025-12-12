use cd;
select * from `debit and credit banking_data`;

#Total Credit
select concat("₹ ", round(sum(Amount) / 1000000, 2), " M") as Total_Credit
from `debit and credit banking_data`
where `Transaction Type` = 'Credit';

#Total Debit
select concat("₹ ", round(sum(Amount) / 1000000, 2), " M") as Total_Debit
from `debit and credit banking_data`
where `Transaction Type` = 'Debit';

#Credit to Debit Ratio
select round(sum(case when `Transaction Type` = 'Credit' then Amount else 0 end) / 
sum(case when `Transaction Type` = 'Debit' then Amount else 0 end), 2)
as Credit_Debit_Ratio from `debit and credit banking_data`;

#Net Transaction
select concat("₹ ", round((sum(case when `Transaction Type` = 'Credit' then Amount else 0 end) -
sum(case when `Transaction Type` = 'Debit' then Amount else 0 end)) /1000, 2), " K")
as Net_Transaction from `debit and credit banking_data`;

#Account Activity Ratio
select concat(round(count(`Account Number`)/sum(balance)*100,2), " %") 
as Account_Activity_Ratio from `debit and credit banking_data`;

#Flagged Transactions
select concat(round(count(*)/1000,2)," K") as Flagged_Transactions
from `debit and credit banking_data`
where Amount > 4500;

#Total transaction amount by branch
select Branch, concat(" ₹", round(sum(Amount)/1000000,2), " M") as Total_Transaction
from `debit and credit banking_data`
group by Branch
order by sum(Amount) desc;

#Total transation amount by bankname
select `Bank Name`, concat("₹ ", round(sum(Amount)/1000000,2), " M") as Total_Transaction
from `debit and credit banking_data`
group by 1
order by sum(Amount) desc;

#Top 5 Customers by transaction amount
select `Customer Name`, 
concat("₹ ", round(sum(Amount)/1000,2), " K") as Total_Transaction
from `debit and credit banking_data`
group by 1 order by sum(Amount) desc 
limit 5;

#Transaction method distribution
select `Transaction Method`, count(*) AS Number_of_Transactions,
concat(round(count(*) * 100 / (select count(*) from `debit and credit banking_data`),2), " %")
as Percentage
from `debit and credit banking_data`
group by `Transaction Method`
order by Number_of_Transactions asc;



