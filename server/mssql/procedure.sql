use comm
SET NOCOUNT ON;
go

create or alter procedure login
    @login nvarchar(100),
    @password nvarchar(32),
    @result int output
as
begin
    IF EXISTS (SELECT 1 FROM users WHERE username = @login AND password = @password and isGoogleUser = 0)
    BEGIN
        SET @result = 1
    END
    ELSE IF EXISTS (SELECT 1 FROM users WHERE email = @login AND password = @password and isGoogleUser = 0)
    BEGIN
        SET @result = 1
    END
    ELSE
    BEGIN
        SET @result = -1
    END
end
go

create or alter procedure checkExist
    @username nvarchar(100),
    @email nvarchar(100),
    @result int output
as
begin
    IF EXISTS (SELECT 1 FROM users WHERE username = @username)
    BEGIN
        SET @result = -1
    END
    ELSE IF EXISTS (SELECT 1 FROM users WHERE email = @email)
    BEGIN
        SET @result = -2
    END
    ELSE
    BEGIN
        SET @result = 1
    END
end
go

create or alter procedure addUser
    @username nvarchar(15),
    @password nvarchar(32),
    @email nvarchar(100),
    @dateOfBirth date,
    @gender int,
    @result int output
as
begin
    declare @isGoogleUser int = 0
    begin
        insert into users (username, password, email, dateOfBirth, gender, isGoogleUser) values (@username, @password, @email, @dateOfBirth, @gender, @isGoogleUser)
        set @result = 1
    end
end
go