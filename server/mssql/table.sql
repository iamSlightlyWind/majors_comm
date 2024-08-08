use comm
SET NOCOUNT ON;
go

create table users (
    id int identity(1,1) primary key,
    username nvarchar(15) not null,
    password nvarchar(32) not null,
    email nvarchar(100) not null,
    dateOfBirth date not null,
    gender int not null,
    isGoogleUser int not null
)