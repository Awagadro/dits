DROP DATABASE IF EXISTS dits_test;

CREATE DATABASE dits_test DEFAULT CHARACTER SET 'utf8';

USE dits_test;

CREATE TABLE `Role`
(
    `roleId` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`   varchar(255)        NOT NULL
);

CREATE TABLE `User`
(
    `userId`    integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `firstName` varchar(255)        NOT NULL,
    `lastName`  varchar(255)        NOT NULL,
    `login`     varchar(255)        NOT NULL,
    `password`  varchar(255)        NOT NULL
);

CREATE TABLE `user_2_role`
(
    `roleId` integer NOT NULL,
    `userId` integer NOT NULL,
    PRIMARY KEY (`roleId`, `userId`),
    FOREIGN KEY (`roleId`) REFERENCES `Role` (`roleId`) ON DELETE CASCADE,
    FOREIGN KEY (`userId`) REFERENCES `User` (`userId`) ON DELETE CASCADE
);

CREATE TABLE `Topic`
(
    `topicId`     integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)        NOT NULL,
    `description` varchar(255)        NOT NULL
);

CREATE TABLE `Test`
(
    `testId`      integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)        NOT NULL,
    `description` varchar(255)        NOT NULL,
    `topicId`     integer             NOT NULL,
    FOREIGN KEY (`topicId`) REFERENCES `Topic` (`topicId`)
);

CREATE TABLE `Question`
(
    `questionId`  integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `description` varchar(255)        NOT NULL,
    `testId`      integer             NOT NULL,
    FOREIGN KEY (`testId`) REFERENCES `Test` (`testId`) ON DELETE CASCADE
);

CREATE TABLE `Answer`
(
    `answerId`    integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `description` varchar(255)        NOT NULL,
    `correct`     BOOLEAN             NOT NULL,
    `questionId`  integer             NOT NULL,
    FOREIGN KEY (`questionId`) REFERENCES `Question` (`questionId`) ON DELETE CASCADE
);

CREATE TABLE `Literature`
(
    `literatureId` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `description`  varchar(255)        NOT NULL,
    `questionId`   integer             NOT NULL,
    FOREIGN KEY (`questionId`) REFERENCES `Question` (`questionId`) ON DELETE CASCADE
);

CREATE TABLE `Link`
(
    `linkId`       integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `link`         varchar(255)        NOT NULL,
    `literatureId` integer             NOT NULL,
    FOREIGN KEY (`literatureId`) REFERENCES `Literature` (`literatureId`) ON DELETE CASCADE
);

CREATE TABLE `Statistic`
(
    `statisticId` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `date`        DATE                NOT NULL,
    `correct`     BOOLEAN             NOT NULL,
    `questionId`  integer             NOT NULL,
    `userId`      integer             NOT NULL,
    FOREIGN KEY (`questionId`) REFERENCES `Question` (`questionId`) ON DELETE CASCADE,
    FOREIGN KEY (`userId`) REFERENCES `User` (`userId`) ON DELETE CASCADE
);

LOCK TABLES `topic` WRITE;
INSERT INTO `topic`
VALUES (1, 'Java core', 'Java core description'),
       (2, 'Collections', 'Collections descriptions');
UNLOCK TABLES;

LOCK TABLES `test` WRITE;
INSERT INTO `test`
VALUES (1, 'Java core test', 'check general understanding', '1'),
       (2, 'Java Collection Framework test', 'check knowledge about collections', '2');
UNLOCK TABLES;

LOCK TABLES `role` WRITE;
INSERT INTO `role`
VALUES (1, 'admin'),
       (2, 'tutor'),
       (3, 'user');
UNLOCK TABLES;

LOCK TABLES `user` WRITE;
INSERT INTO `user`
VALUES (1, 'Кащей', 'Бессмертный', 'login1', 'pass1'),
       (2, 'Василиса', 'Премудрая', 'login2', 'pass2'),
       (3, 'Иван', 'Дурак', 'login3', 'pass3');
UNLOCK TABLES;

LOCK TABLES `user_2_role` WRITE;
INSERT INTO `user_2_role`
VALUES (1, 1),
       (2, 1),
       (2, 2),
       (3, 2),
       (3, 3);
UNLOCK TABLES;

LOCK TABLES `question` WRITE;
INSERT INTO `question`
VALUES (1, 'What do you know about arrays & primitive types', '1'),
       (2, 'What is autoboxing', '1'),
       (3, 'What kinds of arrays exist', '1'),
       (4, 'What kind of interfaces JCF contains', '2'),
       (5, 'What is the difference between ArrayList & LinkedList', '2'),
       (6, 'Why doesnt Collection include Map-interface', '2');
UNLOCK TABLES;

LOCK TABLES `literature` WRITE;
INSERT INTO `literature`
VALUES (1, 'About arrays & primitive types', '1'),
       (2, 'About autoboxing', '2'),
       (3, 'About kinds of arrays', '3'),
       (4, 'About kinds of interfaces JCF contains', '4'),
       (5, 'About ArrayList & LinkedList', '5'),
       (6, 'About Map-interface', '6');
UNLOCK TABLES;

LOCK TABLES `link` WRITE;
INSERT INTO `link`
VALUES (1, 'https://docs.google.com/document/linc1', '1'),
       (2, 'https://docs.google.com/document/linc2', '2'),
       (3, 'https://docs.google.com/document/linc3', '3'),
       (4, 'https://docs.google.com/document/linc4', '4'),
       (5, 'https://docs.google.com/document/linc5', '5'),
       (6, 'https://docs.google.com/document/linc6', '6');
UNLOCK TABLES;

