CREATE database IF NOT EXISTS application_quizz CHARSET utf8mb4;

USE application_quizz;


CREATE TABLE IF NOT EXISTS played(
played_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
sucessfull BOOLEAN NOT NULL,
create_at DATETIME NOT NULL,
user_id int,
quizz_id int,
question_id int
)ENGINE=InnoDB;

create table if not EXISTS quizz(
quizz_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title_quizz VARCHAR(50) NOT NULL,
description_quizz text NOT NULL,
img_quizz VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

create table if not exists category(
category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title varchar(50) not null
)ENGINE=InnoDB;

create table if not exists users(
user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
password_user VARCHAR(100) NOT NULL,
roles VARCHAR(50)  NOT NULL,
avatar VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

create table if not exists answer(
answer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
text_answer VARCHAR(50) not null,
valid BOOLEAN not null,
answer_point int NOT NULL,
question_id int
)ENGINE=InnoDB;

create table if not exists question(
question_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title_question VARCHAR(100) NOT NULL,
descritpion_question VARCHAR(255) NOT NULL,
img_question VARCHAR(50) NOT NULL,
multiple INT NOT NULL
)ENGINE=InnoDB;

create table if not EXISTS played_answer(
answer_id INT,
played_id INT,
PRIMARY KEY(answer_id, played_id)
)ENGINE=InnoDB;

create table if not EXISTS quizz_category(
quizz_id INT,
category_id INT,
PRIMARY KEY(quizz_id, category_id)
)ENGINE=InnoDB;

create table if not EXISTS quizz_question(
quizz_id INT,
question_id INT,
PRIMARY KEY(quizz_id, question_id)
)ENGINE=InnoDB;

ALTER TABLE played
ADD CONSTRAINT fk_to_assigned_quizz
FOREIGN KEY(quizz_id)
REFERENCES quizz(quizz_id)
ON DELETE CASCADE;

alter table played
ADD CONSTRAINT fk_to_played_question
FOREIGN KEY(question_id)
REFERENCES question(question_id)
ON DELETE CASCADE;

alter table played
ADD CONSTRAINT fk_to_attached_user 
FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE CASCADE;

alter table answer
ADD CONSTRAINT fk_to_add_question
FOREIGN KEY(question_id)
REFERENCES  question(question_id)
ON DELETE CASCADE;

alter table quizz_question
ADD CONSTRAINT fk_to_contrain_question
FOREIGN KEY(question_id)
REFERENCES question(question_id);

alter table quizz_question
ADD CONSTRAINT fk_to_contrain_quizz
FOREIGN KEY(quizz_id)
REFERENCES quizz(quizz_id);

alter table quizz_category
ADD CONSTRAINT fk_to_qualify_quizz
FOREIGN KEY(quizz_id)
REFERENCES quizz(quizz_id);

alter table quizz_category
ADD CONSTRAINT fk_to_qualify_category
FOREIGN KEY(category_id)
REFERENCES category(category_id);

alter table played_answer
ADD CONSTRAINT fk_to_answer_answer
FOREIGN KEY(answer_id)
REFERENCES answer(answer_id);

alter table played_answer
ADD CONSTRAINT fk_to_answer_played
FOREIGN KEY(played_id)
REFERENCES played(played_id);