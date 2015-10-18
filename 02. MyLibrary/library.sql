create database if not exists `library`;
use `library`;

drop table if exists `book`;
CREATE TABLE `book` (
    `book_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NULL DEFAULT NULL,
    `status` VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `author`;
CREATE TABLE `author` (
    `author_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `country` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
drop table if exists `book_author`;
CREATE TABLE `book_author` (
    `book_id` BIGINT(20) NOT NULL,
    `author_id` BIGINT(20) NOT NULL,
    PRIMARY KEY (`book_id`, `author_id`),
    CONSTRAINT `FK_BOOK` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
    CONSTRAINT `FK_AUTHOR` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8;