-- database
CREATE DATABASE quizdb;
USE quizdb;

-- table
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(50)
);

-- table
CREATE TABLE question (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT,
    option_a TEXT,
    option_b TEXT,
    option_c TEXT,
    option_d TEXT,
    correction_option CHAR(1)
);
-- faculty table

CREATE TABLE faculty (
    fac_id INT AUTO_INCREMENT PRIMARY KEY,
    fac_name VARCHAR(50) UNIQUE,
    password VARCHAR(50)
    );
    
-- scores table
    
CREATE TABLE scores (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    score INT,
    quiz_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES user(username)
);

