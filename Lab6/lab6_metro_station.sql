CREATE TABLE stations (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  branch_id INT NOT NULL,
  transfer_id INT DEFAULT NULL,
  next INT DEFAULT NULL,
  previous INT DEFAULT NULL
);

CREATE TABLE branch (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  color VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL
);

CREATE TABLE m_transfer (
  id INT PRIMARY KEY,
  to_station_id INT,
  iz_station_id INT
);

INSERT INTO branch (id, name, color) VALUES
(3, 'Олексіївська', 'зелена'),
(2, 'Салтівська', 'блакитна'),
(1, 'Холодногірсько-Заводська', 'червона');

INSERT INTO m_transfer (id, to_station_id, iz_station_id) VALUES
(1,	21,	4),
(3,	30,	6),
(4,	27,	20),
(5,	4,	21),
(6,	20,	27),
(7,	6,	30);

INSERT INTO stations (id, name, branch_id, transfer_id, next, previous) VALUES
(1,	'Холодна гора',	1,	NULL,	2,	NULL),
(2,	'Південний вокзал',	1,	NULL,	2,	1),
(3,	'Центральний ринок',	1,	NULL,	4,	2),
(4,	'Майдан конституції',	1,	1,	5,	3),
(5,	'Проспект Гагаріна',	1,	NULL,	6,	4),
(6,	'Метробудівників',	1,	3,	7,	5),
(7,	'Завод імені Малишева',	1,	NULL,	8,	6),
(8,	'Московський проспект',	1,	NULL,	9,	7),
(9,	'Палац спорту',	1,	NULL,	10,	8),
(10, 'Армійська',	1,	NULL,	11,	9),
(11, 'Імені О.С.Маселького',	1,	NULL,	12,	10),
(12, 'Тракторний завод',	1,	NULL,	13,	11),
(13, 'Індустіальна',	1,	NULL,	NULL,	12),
(14, 'Героїв Праці',	2,	NULL,	14,	NULL),
(15, 'Студентська',	2,	NULL,	16,	14),
(16, 'Академіка Павлова',	2,	NULL,	17,	15),
(17, 'Академіка Барабашова',	2,	NULL,	18,	16),
(18, 'Київська',	2,	NULL,	19,	17),
(19, 'Пушкінська',	2,	NULL,	20,	18),
(20, 'Університет',	2,	4,	21,	19),
(21, 'Історичний музей',	2,	5,	NULL,	20),
(22,  'Перемога',	3,	NULL,	23,	NULL),
(23, 'Олексіївська',	3,	NULL,	24,	22),
(24, '23 серпня',	3,	NULL,	25,	23),
(25, 'Ботанічний сад',	3,	NULL,	26,	24),
(26, 'Наукова',	3,	NULL,	27,	25),
(27, 'Держпром',	3,	6,	28,	26),
(28, 'Архітектора Бекетова',	3,	NULL,	29,	27),
(29, 'Захисників України',	3,	NULL,	30,	28),
(30, 'Спортивна',	3,	7,	NULL,	22);
