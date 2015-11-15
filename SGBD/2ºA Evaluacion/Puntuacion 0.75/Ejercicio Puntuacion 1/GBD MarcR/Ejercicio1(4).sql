insert into Articles values
('Juguete', 20, 0.21, 15, 10),
('Televisor', 400, 0.21, 200, 100),
('Zapatos', 30, 0.15, 12, 16),
('Raton', 10, 0.18, 6, 7),
('Guantes', 4, 0.15, 2, 3)

insert into Sales values
(GETDATE())

exec insertdeatail 1, 6, 3
exec insertdeatail 1, 7, 2
exec insertdeatail 1, 8, 5
exec insertdeatail 1, 9, 3
exec insertdeatail 1, 10, 1

select * from SalesDetails
select * from Articles

delete from SalesDetails
delete from Articles