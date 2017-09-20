USE `pages`;
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `pages` WRITE;
INSERT INTO `pages` VALUES (1,'This is the first page'),(2,'This is the second page'),(3,'This is the third page'),(4,'Here\'s another page, what is it now five?'),(5,'No I think that one was page four now this is page five'),(6,'Does that mean this page is six, or should it be five since we got page four wrong?'),(7,'I think we should start again and make the next page four'),(8,'This is page four'),(9,'Weren\'t we saying third and fourth, so that was wrong, the next one should be the fourth page.'),(10,'This is the fourth page');
UNLOCK TABLES;
GRANT ALL on `pages`.`%` to `root`@`%` IDENTIFIED BY 'password';
