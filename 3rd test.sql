use Test;

--Question 1

select * from [dbo].[Sales_Data$]

select * from [dbo].[Sales_Data$] where OrderStatus='Completed';

select State , COUNT(distinct OrderID)as Total_Orders from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(Quantity)as Total_Quantity from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(NetSales)as Total_sales from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(Profit)as Total_Profit from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(NetSales) / COUNT(distinct OrderID) from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(NetSales) as total_Sales from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State having sum(NetSales)>1000000;

select State , sum(NetSales) as total_Sales from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State  order by total_Sales;


--Question 2 CTE: Top Customers By sales

with CustomerSales as
(
    select
        CustomerID,
        CustomerName,
        sum(NetSales) as TotalSales
     from [dbo].[Sales_Data$]
     where OrderStatus = 'Completed'
     group by CustomerID, CustomerName
)
select top 5
    CustomerID,CustomerName,Totalsales
from CustomerSales
order by TotalSales desc;


--Question 3 window function :State sales Ranking

with StateSales as
(
    select State,sum(NetSales) as TotalSales
    from [dbo].[Sales_Data$]
    where OrderStatus = 'Completed'
    group by State
)
select
    State,TotalSales,rank() over (order by TotalSales desc) as SalesRank
from StateSales
order by  SalesRank;