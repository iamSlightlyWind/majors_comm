use comm
SET NOCOUNT ON;
go

create or alter procedure login
    @login nvarchar(100),
    @password nvarchar(32),
    @result int output
as
begin
    declare @userId int
    SELECT @userId = id
    FROM users
    WHERE username = @login AND password = @password

    IF @userId IS NOT NULL
    BEGIN
        SET @result = @userId
    END
    ELSE
    BEGIN
        SELECT @userId = id
        FROM users
        WHERE email = @login AND password = @password

        IF @userId IS NOT NULL
        BEGIN
            SET @result = @userId
        END
        ELSE
        BEGIN
            SET @result = -1
        END
    END
end
go

create or alter procedure checkExist
    @username nvarchar(100),
    @email nvarchar(100),
    @result int output
as
begin
    IF EXISTS (SELECT 1
    FROM users
    WHERE username = @username)
    BEGIN
        SET @result = -1
    END
    ELSE IF EXISTS (SELECT 1
    FROM users
    WHERE email = @email)
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
    begin
        insert into users
            (username, password, email, dateOfBirth, gender)
        values
            (@username, @password, @email, @dateOfBirth, @gender)
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
        insert into friends
            (userId, friendId)
        values
            (@user1, @user2)

        delete from requests where requesterId = @user1 and requestedId = @user2
        delete from requests where requesterId = @user2 and requestedId = @user1
    end
end
go

create or alter procedure removeRequest
    @requester int,
    @requested int
as
begin
    delete from requests where requesterId = @requester and requestedId = @requested
end
go

create or alter procedure sendFriendRequest
    @requester int,
    @requested int,
    @result int output
as
begin
    IF EXISTS (SELECT 1
    FROM blocks
    WHERE blockerId = @requested AND blockedId = @requester)
    BEGIN
        SET @result = -2
    -- blocked
    END
    ELSE IF EXISTS (SELECT 1
        FROM friends
        WHERE userId = @requested AND friendId = @requester) OR EXISTS (SELECT 1
        FROM friends
        WHERE userId = @requester AND friendId = @requested)
    BEGIN
        SET @result = -1
    -- already friends
    END
    ELSE IF EXISTS (SELECT 1
    FROM requests
    WHERE requesterId = @requester AND requestedId = @requested)
    BEGIN
        SET @result = 0
    -- already requested
    END
    ELSE IF EXISTS (SELECT 1
    FROM requests
    WHERE requesterId = @requested AND requestedId = @requester)
    BEGIN
        exec setFriend @requester, @requested
        SET @result = 2
    -- accepted
    END
    ELSE 
    BEGIN
        insert into requests
            (requesterId, requestedId)
        values
            (@requester, @requested)
        SET @result = 1
    -- requested
    END
end
go

create or alter procedure removeFriend
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
    IF EXISTS (SELECT 1
    FROM blocks
    WHERE blockerId = @blocker AND blockedId = @blocked)
    BEGIN
        SET @result = -1
    END
    ELSE
    BEGIN
        exec removeFriend @blocker, @blocked
        exec removeFriend @blocked, @blocker
        insert into blocks
            (blockerId, blockedId)
        values
            (@blocker, @blocked)
        delete from requests where requesterId = @blocker and requestedId = @blocked
        delete from requests where requesterId = @blocked and requestedId = @blocker
        set @result = 1
    END
end
go

create or alter procedure unblockUser
    @blocker int,
    @blocked int,
    @result int output
as
begin
    IF EXISTS (SELECT 1
    FROM blocks
    WHERE blockerId = @blocker AND blockedId = @blocked)
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
        id not in (select friendId
        from friends
        where userId = @id)
        and
        id not in (select userId
        from friends
        where friendId = @id)
        and
        id not in (select blockedId
        from blocks
        where blockerId = @id)
        and
        id not in (select requesterId
        from requests
        where requestedId = @id)
        and
        id not in (select requestedId
        from requests
        where requesterId = @id)
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

create or alter procedure getSentRequestList
    @id int
as
begin
    select requestedId as Requested
    from requests
    where requesterId = @id
end
go

create or alter procedure getReceivedRequestList
    @id int
as
begin
    select requesterId as Requester
    from requests
    where requestedId = @id
end
go

create or alter procedure getRelation
    @user1 int,
    @user2 int,
    @result int output
as
begin
    IF EXISTS (SELECT 1
        FROM friends
        WHERE userId = @user1 AND friendId = @user2) OR EXISTS (SELECT 1
        FROM friends
        WHERE userId = @user2 AND friendId = @user1)
    BEGIN
        SET @result = 1
    -- friends
    END
    ELSE IF EXISTS (SELECT 1
    FROM requests
    WHERE requesterId = @user1 AND requestedId = @user2)
    BEGIN
        SET @result = 2
    -- requested
    END
    ELSE IF EXISTS (SELECT 1
    FROM requests
    WHERE requesterId = @user2 AND requestedId = @user1)
    BEGIN
        SET @result = 3
    -- received
    END
    ELSE IF EXISTS (SELECT 1
    FROM blocks
    WHERE blockerId = @user1 AND blockedId = @user2)
    BEGIN
        SET @result = -1
    -- blocked
    END
    ELSE
    BEGIN
        SET @result = 0
    -- no relation
    END
end
go

create or alter procedure sendMessage
    @sender int,
    @receiver int,
    @type varchar(10),
    @content nvarchar(max),
    @result int output
as
begin
    if exists (select 1
        from blocks
        where blockerId = @sender and blockedId = @receiver)
        or exists (select 1
        from blocks
        where blockerId = @receiver and blockedId = @sender)
    begin
        set @result = -1
    end
    else
    if exists (select 1
        from friends
        where userId = @sender and friendId = @receiver)
        or exists (select 1
        from friends
        where userId = @receiver and friendId = @sender)
    begin
        insert into messages
            (senderId, receiverId, type, content, time)
        values
            (@sender, @receiver, @type, @content, getdate())
        set @result = 1
    end
    else
    begin
        set @result = 0
    end
end
go

create or alter procedure getMessages
    @user1 int,
    @user2 int
as
begin
    select senderId as Sender,
        receiverId as Receiver,
        type as Type,
        content as Content,
        time as Time
    from messages
    where (senderId = @user1 and receiverId = @user2)
        or (senderId = @user2 and receiverId = @user1)
    order by time asc
end
go

CREATE OR ALTER PROCEDURE getPreview
    @requesterID INT
AS
BEGIN
    SELECT
        m.senderId,
        m.receiverId,
        m.type,
        m.content,
        m.time
    FROM
        messages m
        INNER JOIN
        (SELECT
            CASE 
                 WHEN senderId = @requesterID THEN receiverId 
                 ELSE senderId 
             END AS conversationPartner,
            MAX(time) AS latestTime
        FROM
            messages
        WHERE 
             senderId = @requesterID OR receiverId = @requesterID
        GROUP BY 
             CASE 
                 WHEN senderId = @requesterID THEN receiverId 
                 ELSE senderId 
             END
        ) latestMessages
        ON 
        ((m.senderId = @requesterID AND m.receiverId = latestMessages.conversationPartner) OR
         (m.receiverId = @requesterID AND m.senderId = latestMessages.conversationPartner))
        AND m.time = latestMessages.latestTime
    ORDER BY 
        m.time DESC;
END
go

create or alter procedure deleteMessage
    @sender int,
    @receiver int,
    @time datetime
as
begin
    delete from messages
    where senderId = @sender and receiverId = @receiver and time = @time
end
go

create or alter procedure updateProfile
    @id int,
    @fullname nvarchar(50) = null,
    @password nvarchar(32) = null,
    @dateOfBirth date = null
as
begin
    update users
    set fullname = ISNULL(@fullname, fullname),
        password = ISNULL(@password, password),
        dateOfBirth = ISNULL(@dateOfBirth, dateOfBirth)
    where id = @id
end
go

create or alter procedure checkRole
    @id int,
    @role int output
as
begin
    select @role = role
    from users
    where id = @id
end
go

create or alter procedure deactivateAccount
    @id int
as
begin
    update users
    set active = 0
    where id = @id
end
go

create or alter procedure activateAccount
    @id int
as
begin
    update users
    set active = 1
    where id = @id
end
go

create or alter procedure getActiveAccounts
as
begin
    select id
    from users
    where active = 1 and role = 0
end
go

create or alter procedure getDeactivatedAccounts
as
begin
    select id
    from users
    where active = 0 and role = 0
end
go