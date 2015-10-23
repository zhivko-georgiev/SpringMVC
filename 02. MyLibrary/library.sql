DROP database if exists `library`;
CREATE database `library` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
use `library`;

DROP TABLE if exists `author`;
CREATE TABLE `author` (
author_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(60) NOT NULL,
country VARCHAR(60) NOT NULL
) ENGINE = InnoDB CHARACTER SET=utf8;

DROP TABLE if exists `author_book`;
CREATE TABLE `author_book` (
book_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
author_id BIGINT UNSIGNED NOT NULL,
title VARCHAR(100) NOT NULL,
status VARCHAR(30) NOT NULL,
CONSTRAINT author_book_author FOREIGN KEY (author_id)
REFERENCES author(author_id)
	   ON DELETE CASCADE
       ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET=utf8;

insert into `author` (author_id, name, country) Values(1, 'Ivan Vazov', 'Bulgaria');
insert into `author` (author_id, name, country) Values(2, 'Hristo Botev', 'Bulgaria');
insert into `author` (author_id, name, country) Values(3, 'Mario Puzo', 'USA');
insert into `author` (author_id, name, country) Values(4, 'Svetlin Nakov', 'Bulgaria');
insert into `author` (author_id, name, country) Values(5, 'Napoleon Hill', 'USA');

insert into `author_book` (book_id, author_id, title, status) Values(1, 1, 'Pod Igoto', 'Available');
insert into `author_book` (book_id, author_id, title, status) Values(2, 3, 'The Godfather', 'Loaned');
insert into `author_book` (book_id, author_id, title, status) Values(3, 4, 'Introduction to programming with Java', 'Loaned');
insert into `author_book` (book_id, author_id, title, status) Values(4, 1, 'O,Shipka!', 'Loaned');
insert into `author_book` (book_id, author_id, title, status) Values(5, 3, 'The Sicilian', 'Available');
