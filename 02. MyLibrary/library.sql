--
-- Database: `library`
--
DROP DATABASE IF EXISTS `library`;
CREATE DATABASE `library` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--
CREATE TABLE `author` (
`author_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(60) NOT NULL,
`country` VARCHAR(60) NOT NULL
) ENGINE = InnoDB CHARSET=utf8;

--
-- Sample data for table `author`
--
INSERT INTO `author` (`author_id`, `name`, `country`) VALUES
(1, 'Ivan Vazov', 'Bulgaria'),
(2, 'Hristo Botev', 'Bulgaria'),
(3, 'Mario Puzo', 'USA'),
(4, 'Svetlin Nakov', 'Bulgaria'),
(5, 'Napoleon Hill', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `author_book`
--
CREATE TABLE `author_book` (
`book_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`author_id` BIGINT UNSIGNED NOT NULL,
`title` VARCHAR(100) NOT NULL,
`status` VARCHAR(30) NOT NULL,
CONSTRAINT `author_book_author` FOREIGN KEY (`author_id`)
REFERENCES `author`(`author_id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET=utf8;

--
-- Sample data for table `author_book`
--
INSERT INTO `author_book` (`book_id`, `author_id`, `title`, `status`) VALUES
(1, 1, 'Pod Igoto', 'Available'),
(2, 3, 'The Godfather', 'Loaned'),
(3, 4, 'Introduction to programming with Java', 'Loaned'),
(4, 1, 'O,Shipka!', 'Loaned'),
(5, 3, 'The Sicilian', 'Available');