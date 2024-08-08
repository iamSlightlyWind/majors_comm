use comm
SET NOCOUNT ON;
go

insert into users (username, password, email, dateOfBirth, gender, isGoogleUser) 
values ('becky', 'password', 'becky@beck', '1990-01-01', '0', '0'),
('joe', 'password', 'joe@joe', '1990-01-01', '0', '0'),
('jane', 'password', 'jane@jane', '1990-01-01', '0', '0'),
('john', 'password', 'john@john', '1990-01-01', '0', '0'),
('jim', 'password', 'jim@jim', '1990-01-01', '0', '0');