use comm
go

create table users (
    id int identity(1,1) primary key,
    username nvarchar(15) not null,
    password nvarchar(32) not null,
    dateOfBirth date not null,
    gender varchar(10) not null,
    isGoogleUser varchar(3) not null
)