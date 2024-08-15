use comm
SET NOCOUNT ON;
go

declare @result int

insert into users
    (username, fullname, password, email, dateOfBirth, gender)
values
    ('jdoe', 'John Doe', 'password123', 'jdoe@example.com', '1990-01-01', '1'),
    ('asmith', 'Alice Smith', 'alicepwd', 'asmith@example.com', '1985-05-15', '0'),
    ('bwhite', 'Bob White', 'bobspass', 'bwhite@example.com', '1992-07-20', '1'),
    ('cjones', 'Carol Jones', 'carolpass', 'cjones@example.com', '1988-03-30', '0'),
    ('dgreen', 'David Green', 'davidpass', 'dgreen@example.com', '1995-11-25', '1'),
    ('esmith', 'Eve Smith', 'evepass', 'evepass@example.com', '1998-09-10', '0'),
    ('fblack', 'Frank Black', 'frankpass', 'frankpass@example.com', '1993-12-05', '1');