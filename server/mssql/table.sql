use comm
SET NOCOUNT ON;
go

create table users
(
    id int identity(1,1) primary key,
    username nvarchar(15) not null,
    fullname nvarchar(50) not null,
    password nvarchar(32) not null,
    email nvarchar(100) not null,
    dateOfBirth date not null,
    gender int not null,
    role int default 0,
    active int default 1
)

create table blocks
(
    blockerId int not null,
    blockedId int not null
)

create table friends
(
    userId int not null,
    friendId int not null
)

create table requests
(
    requesterId int not null,
    requestedId int not null
)

create table messages (
    senderId int not null,
    receiverId int not null,
    type varchar(10) not null,
    content nvarchar(max) not null,
    time datetime not null
)