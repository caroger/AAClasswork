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
    ('Fred','Tabby');

-- CREATE TABLE cattoys(
--     id INTEGER PRIMARY KEY,
--     cat_id INTEGER,
--     toy_id INTEGER,

--     FOREIGN KEY (cat_id) REFERENCES cats(id),
--     FOREIGN KEY (toy_id) REFERENCES toys(id)
-- )