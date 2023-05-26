CREATE TABLE news_categories (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL
  );

CREATE TABLE news_comments (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  news_id INT NOT NULL,
  text_comment TEXT,
  date_comment DATE,
  FOREIGN KEY (news_id) REFERENCES news_name(id)
);

CREATE TABLE news_evaluation (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  news_id INT NOT NULL,
  evaluation INT,
  date_evaluation DATE,
  ip_address VARCHAR(20),
  FOREIGN KEY (news_id) REFERENCES news_name(id),
  CONSTRAINT unique_news_ip UNIQUE (news_id, ip_address)
);

CREATE TABLE news_name (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  news_categor_id INT NOT NULL,
  title VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  article_text TEXT,
  data_news DATE
  FOREIGN KEY (news_categor_id) REFERENCES news_categories (id)	
);