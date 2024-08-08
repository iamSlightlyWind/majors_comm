use comm
SET NOCOUNT ON;
go

create or alter procedure login
    @login nvarchar(100),
    @password nvarchar(32),
    @result int output
as
begin
    IF EXISTS (SELECT 1 FROM users WHERE username = @login AND password = @password)
    BEGIN
        SET @result = 1
    END
    ELSE IF EXISTS (SELECT 1 FROM users WHERE email = @login AND password = @password)
    BEGIN
        SET @result = 1
    END
    ELSE
    BEGIN
        SET @result = 0
    END
end
go