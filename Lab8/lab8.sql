SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  email VARCHAR(255),
  password VARCHAR(255),
  PRIMARY KEY (id)
);

INSERT INTO users (id, name, email) VALUES
(1, 'Vlad', 'Vlad333@gmail.com'),
(2, 'Alex', 'Alex@gmail.com'),
(3, 'Nik', 'Nik@gmail.com'),
(4, 'Adam', 'Adam@gmail.com'),
(5, 'Moris', 'iris1@gmail.com');

DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
  id INT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  description TEXT COLLATE utf8_unicode_ci, 
  PRIMARY KEY (id)
);

INSERT INTO projects (id, name, description) VALUES
(1, 'project1', 'project1'),
(2, 'project2', 'project2'),
(3, 'project2', 'project2');

DROP TABLE IF EXISTS participants_users;
CREATE TABLE participants_users (
  id INT(4) NOT NULL AUTO_INCREMENT,
  projects_id INT(4) UNSIGNED NOT NULL,
  users_id INT(4) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (projects_id) REFERENCES projects(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO participants_users (id, projects_id, users_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 3, 5);

DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks (
  id INT(4) UNSIGNED NOT NULL PRIMARY KEY,
  name varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  projects_id INT(4) UNSIGNED NOT NULL,
  author INT(4) UNSIGNED NOT NULL,
  description TEXT,
  FOREIGN KEY (projects_id) REFERENCES projects(id),
  FOREIGN KEY (author) REFERENCES participants_users(users_id)
);

INSERT INTO tasks (id, name, projects_id, author, description) VALUES
(1,	'task1', 1, 1,	'task 1 ....'),
(2,	'task2', 1, 1,	'task ..... 2 '),
(3,	'task3', 5, 3,	'task 3 ....');

DROP TABLE IF EXISTS task_executors;
CREATE TABLE task_executors (
  id INT(4) PRIMARY KEY,
  task_id INT(4) UNSIGNED NOT NULL,
  users_id INT(4) UNSIGNED NOT NULL,
  FOREIGN KEY (task_id) REFERENCES tasks(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO task_executors (id, task_id, users_id) VALUES
(1,	1, 2),
(2,	1, 3),
(3,	2, 5),
(4,	3, 5);


CREATE TABLE files (
  id INT(4) PRIMARY KEY,
  link VARCHAR(255) COLLATE utf8_unicode_ci
);

CREATE TABLE files_projects (
  id INT(4) PRIMARY KEY,
  file_id INT(4),
  project_id INT(4),
  FOREIGN KEY (file_id) REFERENCES files(id),
  FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE files_tasks (
  id INT(4) PRIMARY KEY,
  file_id INT(4),
  task_id INT(4),
  FOREIGN KEY (file_id) REFERENCES files(id),
  FOREIGN KEY (task_id) REFERENCES tasks(id)
);

DROP TABLE IF EXISTS files;
INSERT INTO files (id, link) VALUES
(1,	1, 0, 'c:\user1\1.txt'),
(2,	1, 1, 'c:\user1\2.txt'),
(3,	2, 3, 'c:\user1\1.txt');


