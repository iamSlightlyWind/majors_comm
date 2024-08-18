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
    ('kjohnson', 'Karen Johnson', 'karenpass', 'kjohnson@example.com', '1988-03-22', '0'),
    ('tthomas', 'Tom Thomas', 'tomt123', 'tthomas@example.com', '1993-11-11', '1'),
    ('mrobinson', 'Mary Robinson', 'marypwd', 'mrobinson@example.com', '1995-06-05', '0'),
    ('wlee', 'William Lee', 'wlee456', 'wlee@example.com', '1990-12-17', '1'),
    ('dclark', 'David Clark', 'davidc789', 'dclark@example.com', '1982-09-30', '1'),
    ('jsmith', 'Jane Smith', 'janesmith', 'jsmith@example.com', '1987-08-14', '0'),
    ('rjackson', 'Robert Jackson', 'robertj', 'rjackson@example.com', '1994-04-08', '1');

exec setFriend '1', '2'
exec setFriend '1', '3'
exec setFriend '1', '4'
exec setFriend '1', '5'
exec setFriend '1', '6'
exec setFriend '1', '7'
exec setFriend '1', '8'
exec setFriend '1', '9'
exec setFriend '1', '10'

----
exec sendMessage '1', '2', 'text', 'Hey Alice, how was your day?', @result output
exec sendMessage '1', '2', 'text', 'I hope it wasn’t too stressful.', @result output
exec sendMessage '1', '2', 'text', 'I had a long day at work.', @result output

exec sendMessage '2', '1', 'text', 'It was okay, just a bit busy.', @result output
exec sendMessage '2', '1', 'text', 'I’m glad the weekend is near.', @result output

exec sendMessage '1', '2', 'text', 'Same here! Any plans for the weekend?', @result output
exec sendMessage '1', '2', 'text', 'I might go hiking if the weather is good.', @result output
exec sendMessage '1', '2', 'text', 'The mountains sound like a great escape.', @result output
exec sendMessage '1', '2', 'text', 'I haven’t been there in a while.', @result output

exec sendMessage '2', '1', 'text', 'That sounds awesome!', @result output
exec sendMessage '2', '1', 'text', 'I might just stay home and relax.', @result output

exec sendMessage '1', '2', 'text', 'Relaxing at home is great too.', @result output
exec sendMessage '1', '2', 'text', 'Maybe catch up on some reading?', @result output

exec sendMessage '2', '1', 'text', 'Yeah, I’ve been meaning to finish that book.', @result output
exec sendMessage '2', '1', 'text', 'Have you finished yours?', @result output
exec sendMessage '2', '1', 'text', 'I’m curious to know what you think.', @result output

exec sendMessage '1', '2', 'text', 'Almost done, just a few chapters left.', @result output

exec sendMessage '2', '1', 'text', 'Nice! You’ll have to lend it to me after.', @result output
exec sendMessage '2', '1', 'text', 'I’ve heard great things about it.', @result output

exec sendMessage '1', '2', 'text', 'For sure, I’ll bring it over when we hang out.', @result output
exec sendMessage '1', '2', 'text', 'Let’s plan something soon.', @result output
exec sendMessage '1', '2', 'text', 'It’s been too long.', @result output

exec sendMessage '2', '1', 'text', 'Definitely! We need to catch up.', @result output
exec sendMessage '2', '1', 'text', 'How about next weekend?', @result output

exec sendMessage '1', '2', 'text', 'That works for me. I’ll see you then!', @result output
---
exec sendMessage '1', '3', 'text', 'Good afternoon, Mr. White. I hope this message finds you well.', @result output
exec sendMessage '1', '3', 'text', 'I wanted to follow up on the project proposal we discussed last week.', @result output
exec sendMessage '1', '3', 'text', 'Have there been any updates on your end?', @result output

exec sendMessage '3', '1', 'text', 'Good afternoon, Mr. Doe. Thank you for reaching out.', @result output
exec sendMessage '3', '1', 'text', 'We have reviewed the proposal and are generally satisfied with the details provided.', @result output

exec sendMessage '1', '3', 'text', 'That is excellent to hear. Is there anything that needs further clarification or adjustment?', @result output

exec sendMessage '3', '1', 'text', 'There are a few minor points we would like to discuss further, specifically regarding the timeline.', @result output
exec sendMessage '3', '1', 'text', 'Would it be possible to schedule a meeting next week to address these?', @result output

exec sendMessage '1', '3', 'text', 'Certainly, Mr. White. I will arrange for a meeting early next week at your convenience.', @result output
exec sendMessage '1', '3', 'text', 'Please let me know your availability, and I will coordinate accordingly.', @result output

exec sendMessage '3', '1', 'text', 'I appreciate your prompt response, Mr. Doe. I will check my schedule and get back to you by the end of the day.', @result output

exec sendMessage '1', '3', 'text', 'Thank you, Mr. White. I look forward to our continued collaboration.', @result output
exec sendMessage '1', '3', 'text', 'Have a great day ahead.', @result output
---
exec sendMessage '1', '4', 'text', 'Good morning, Ms. Johnson. How are you today?', @result output;
exec sendMessage '4', '1', 'text', 'Good morning, Mr. Doe. I’m doing well, thank you. How about yourself?', @result output;
exec sendMessage '1', '4', 'text', 'I’m doing well, thank you. Looking forward to our meeting later.', @result output;

exec sendMessage '1', '5', 'text', 'Tom, did you catch the game last night?', @result output;
exec sendMessage '5', '1', 'text', 'Hey John, yeah I did! What a finish, right?', @result output;
exec sendMessage '1', '5', 'text', 'Absolutely, couldn’t believe that last-minute goal!', @result output;

exec sendMessage '1', '6', 'text', 'Mary, do you have any updates on the client meeting?', @result output;
exec sendMessage '6', '1', 'text', 'Yes, John. The meeting went well, and I’ll send you the summary today.', @result output;
exec sendMessage '1', '6', 'text', 'Great, looking forward to it. Thanks, Mary!', @result output;

exec sendMessage '1', '7', 'text', 'Hey William, could you review the document I sent yesterday?', @result output;
exec sendMessage '7', '1', 'text', 'Sure thing, John. I’ll check it out and let you know if I spot anything.', @result output;

exec sendMessage '1', '8', 'text', 'David, I wanted to discuss the upcoming project timeline.', @result output;
exec sendMessage '8', '1', 'text', 'Absolutely, John. Let’s schedule a meeting to go over the details.', @result output;
exec sendMessage '1', '8', 'text', 'Sounds good, I’ll send over some available times.', @result output;
exec sendMessage '8', '1', 'text', 'Looking forward to it.', @result output;

exec sendMessage '1', '9', 'text', 'Hey Jane, thanks for your hard work on the recent project.', @result output;
exec sendMessage '9', '1', 'text', 'Thanks, John! It was a tough one, but I’m glad we pulled it off.', @result output;
exec sendMessage '1', '9', 'text', 'Couldn’t have done it without you.', @result output;

exec sendMessage '1', '10', 'text', 'Robert, I need your input on the financial report.', @result output;
exec sendMessage '10', '1', 'text', 'Sure thing, John. I’ll review it and provide my comments soon.', @result output;
exec sendMessage '1', '10', 'text', 'Thanks, Robert. Let me know if anything stands out.', @result output;
