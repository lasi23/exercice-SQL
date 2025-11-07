create DATABASE if not exists collection_livre CHARSET utf8mb4;

use collection_livre;

create table if not exists author(
id_author int primary key AUTO_INCREMENT not null,
firstname VARCHAR(50) not null,
lastname VARCHAR(50) not  null,
pseudo VARCHAR(50) UNIQUE not null
)ENGINE=InnoDB;

create table if not EXISTS book(
id_book INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title_book VARCHAR(50) NOT NULL,
description_book VARCHAR(255) NOT NULL,
publication_date DATE NOT NULL,
cover VARCHAR(255) NOT NULL,
id_author INT
)ENGINE=InnoDB;

create table if not exists category(
id_category INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category_name VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

create TABLE if not exists commentary(
id_commentary INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
content VARCHAR(255) NOT NULL,
created_at DATETIME NOT NULL,
enabled BOOLEAN NOT NULL,
id_account INT,
id_book INT
)ENGINE=InnoDB;

create table if not exists `account`(
id_account INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
firstname_account VARCHAR(50) NOT NULL,
lastname_account VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
`password` VARCHAR(100) NOT NULL,
created_at DATETIME NOT NULL,
`status` BOOLEAN NOT NULL
)ENGINE=InnoDB;

create table if not exists book_category(
id_book INT,
id_category int,
PRIMARY KEY(id_book, id_category)
);

create table if not exists book_account(
id_book INT,
id_account INT,
PRIMARY KEY(id_book, id_account)
);

ALTER TABLE book
ADD CONSTRAINT fk_whrite_author
FOREIGN KEY(id_author)
REFERENCES author(id_author)
ON DELETE CASCADE;

ALTER TABLE commentary
add CONSTRAINT fk_add_book
FOREIGN KEY(id_book)
REFERENCES book(id_book)
on delete cascade;

alter table commentary
ADD CONSTRAINT fk_post_account
FOREIGN KEY(id_account)
REFERENCES account(id_account)
on delete cascade;

alter table book_category
ADD CONSTRAINT fk_detailled_book
FOREIGN KEY(id_book)
references book(id_book);

alter table book_category
ADD CONSTRAINT fk_detailed_category
FOREIGN KEY(id_category)
REFERENCES category(id_category);

alter table book_account
ADD CONSTRAINT fk_posses_book
FOREIGN KEY(id_book)
REFERENCES book(id_book);

alter table book_account
ADD CONSTRAINT fk_posses_account
FOREIGN KEY(id_account)
REFERENCES account(id_account);

