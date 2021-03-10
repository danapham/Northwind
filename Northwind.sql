select o.OrderID, sum(d.UnitPrice * d.Quantity) as Subtotal
from Orders o
join [Order Details] d
on o.OrderID = d.OrderID
group by o.OrderID
order by Subtotal desc

select *
from Products
where Discontinued = 0

(select o.OrderID, sum((d.UnitPrice * d.Quantity) * (1 - d.Discount)) as Subtotal
from Orders o
join [Order Details] d
on o.OrderID = d.OrderID
group by o.OrderID
order by Subtotal desc)

select *
from [Order Details]

select o.OrderID, d.ProductID, sum((d.UnitPrice * d.Quantity) * (1 - d.Discount)) as Subtotal
from Orders o
join [Order Details] d
on o.OrderID = d.OrderID
join Products p
on p.ProductID = d.ProductID
group by o.OrderID
order by Subtotal desc

select c.CategoryName, round(sum((o.unitprice * o.quantity) * (1 - o.Discount)), 2)  as Total, sum(o.Quantity) as TotalSold
from Products p
join Categories c
on c.CategoryID = p.CategoryID
join [Order Details] o
on o.ProductID = p.ProductID
group by c.CategoryName

select Top(10) * 
from Products p
where p.Discontinued = 0
order by p.UnitPrice desc

select o.OrderID
from Orders o
group by datepart(quarter, o.OrderDate)

select datepart(quarter, o.OrderDate), sum((d.UnitPrice * d.Quantity) * (1 - d.Discount)) as Subtotal
from Orders o
join [Order Details] d
on o.OrderID = d.OrderID
where YEAR(o.OrderDate) = 1997
group by datepart(quarter, o.OrderDate)
order by Subtotal desc

select *
from Products p
where p.Discontinued = 0 and p.UnitPrice > (select sum(p.unitprice)/count(UnitPrice) as AveragePrice from Products p where Discontinued = 0) 

select count(unitprice)
from Products p
where p.Discontinued = 0
