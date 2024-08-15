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

create or alter procedure setFriend
    @user1 int,
    @user2 int
as
begin
    begin
        insert into friends (userId, friendId) values (@user1, @user2)
    end
end
go

create or alter procedure sendFriendRequest
    @requester int,
    @requested int,
    @result int output
as
begin
    IF EXISTS (SELECT 1 FROM blocks WHERE blockerId = @requested AND blockedId = @requester)
    BEGIN
        SET @result = -2 -- blocked
    END
    ELSE IF EXISTS (SELECT 1 FROM friends WHERE userId = @requested AND friendId = @requester) OR EXISTS (SELECT 1 FROM friends WHERE userId = @requester AND friendId = @requested)
    BEGIN
        SET @result = -1 -- already friends
    END
    ELSE IF EXISTS (SELECT 1 FROM requests WHERE requesterId = @requester AND requestedId = @requested)
    BEGIN
        SET @result = 0 -- already requested
    END
    ELSE IF EXISTS (SELECT 1 FROM requests WHERE requesterId = @requested AND requestedId = @requester)
    BEGIN
        exec setFriend @requester, @requested
        SET @result = 2 -- accepted
    END
    ELSE 
    BEGIN
        insert into requests (requesterId, requestedId) values (@requester, @requested)
        SET @result = 1 -- requested
    END
end
go

create procedure removeFriend
    @user1 int,
    @user2 int
as
begin
    delete from friends where userId = @user1 and friendId = @user2
    delete from friends where userId = @user2 and friendId = @user1
end
go
        
create or alter procedure blockUser
    @blocker int,
    @blocked int,
    @result int output
as
begin
    IF EXISTS (SELECT 1 FROM blocks WHERE blockerId = @blocker AND blockedId = @blocked)
    BEGIN
        SET @result = -1
    END
    ELSE IF EXISTS (SELECT 1 FROM friends WHERE userId = @blocker AND friendId = @blocked) OR EXISTS (SELECT 1 FROM friends WHERE userId = @blocked AND friendId = @blocker)
    BEGIN
        exec removeFriend @blocker, @blocked
        exec removeFriend @blocked, @blocker
        set @result = 2 -- removed friend and blocked
    END
    ELSE
    BEGIN
        insert into blocks (blockerId, blockedId) values (@blocker, @blocked)
        SET @result = 1 -- blocked
    END
end
go

create or alter procedure unblockUser
    @blocker int,
    @blocked int,
    @result int output
as
begin
    IF EXISTS (SELECT 1 FROM blocks WHERE blockerId = @blocker AND blockedId = @blocked)
    BEGIN
        delete from blocks where blockerId = @blocker and blockedId = @blocked
        SET @result = 1
    END
    ELSE
    BEGIN
        SET @result = -1
    END
end
go

create or alter procedure getUser
    @id int,
    @username nvarchar(15) output,
    @fullname nvarchar(100) output,
    @email nvarchar(100) output,
    @dateOfBirth date output,
    @gender int output
as
begin
    SELECT @username = username,
            @fullname = fullname,
           @email = email,
           @dateOfBirth = dateOfBirth,
           @gender = gender
    FROM users
    WHERE id = @id
end
go

create or alter procedure getFriendList
    @id int
as
begin
    select friendId as Friend
    from friends
    where userId = @id

    union

    select userId as Friend
    from friends
    where friendId = @id
end
go

create or alter procedure getUserList
    @id int
as
begin
    select id
    from users
    where id != @id
    and
    id not in (select friendId from friends where userId = @id)
    and
    id not in (select userId from friends where friendId = @id)
    and
    id not in (select blockedId from blocks where blockerId = @id)
end
go

create or alter procedure getBlockList
    @id int
as
begin
    select blockedId as Blocked
    from blocks
    where blockerId = @id
end
go

create or alter procedure getRelation
    @user1 int,
    @user2 int,
    @result int output
as
begin
    IF EXISTS (SELECT 1 FROM friends WHERE userId = @user1 AND friendId = @user2) OR EXISTS (SELECT 1 FROM friends WHERE userId = @user2 AND friendId = @user1)
    BEGIN
        SET @result = 1 -- friends
    END
    ELSE IF EXISTS (SELECT 1 FROM requests WHERE requesterId = @user1 AND requestedId = @user2)
    BEGIN
        SET @result = 2 -- requested
    END
    ELSE IF EXISTS (SELECT 1 FROM requests WHERE requesterId = @user2 AND requestedId = @user1)
    BEGIN
        SET @result = 3 -- received
    END
    ELSE IF EXISTS (SELECT 1 FROM blocks WHERE blockerId = @user1 AND blockedId = @user2)
    BEGIN
        SET @result = -1 -- blocked
    END
    ELSE
    BEGIN
        SET @result = 0 -- no relation
    END
end
go