PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS questions_follow;
DROP TABLE IF EXISTS questions_replies;
DROP TABLE IF EXISTS questions_question_likes;

CREATE TABLE users(
    id INTEGER PRIMARY KEY, 
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL,
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY, 
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id)
); 

CREATE TABLE questions_follows(
    id INTEGER PRIMARY KEY, 
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL, 

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
); 

CREATE TABLE replies(
    id INTEGER PRIMARY KEY, 
    body VARCHAR(255) NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL, 

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
); 


CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY, 
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL, 

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
); 


INSERT INTO 
    users(f_name,l_name) /*specifies the order we will be supplying values in below*/
VALUES 
    ('Fred','Tabby'),
    ('Sediqa','Fahimi'),
    ('Roger','Hu');

INSERT INTO 
    questions(title,body) /*specifies the order we will be supplying values in below*/
VALUES 
    ('SQL','How to create a table?'),
    ('Ruby','How to bubble sort?'),
    ('HTML','How to render HTML?');

INSERT INTO 
    questions_follows(question_id,user_id) /*specifies the order we will be supplying values in below*/
VALUES 
    (1,3),
    (2,1),
    (2,2);

INSERT INTO 
    replies(body,parent_id,user_id,question_id) /*specifies the order we will be supplying values in below*/
VALUES 
    ('Reply to ruby question by Sediqa',NULL, 2, 2),
    ('Reply to HTML question by Roger', NULL, 3, 3),
    ('Reply to Rogers answer on HTML by Sediqa', 2, 2, 3);

INSERT INTO 
    question_likes(user_id, question_id) /*specifies the order we will be supplying values in below*/
VALUES 
    (1 , 3),
    (1 , 2),
    (3 , 2);

