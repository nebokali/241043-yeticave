CREATE DATABASE yeticave
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE yeticave;

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_id CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE lots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  lot_name CHAR(250) NOT NULL,
  description CHAR(250) NOT NULL,
  img_url TEXT NOT NULL,
  start_price INT NOT NULL,
  deadline_date TIMESTAMP NOT NULL,
  price_step INT NOT NULL,
  author_id INT,
  winner_id INT,
  category_id INT,
);

CREATE TABLE bets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  price INT NOT NULL,
  user_id INT NOT NULL,
  lot_id INT NOT NULL
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email CHAR(250) NOT NULL UNIQUE,
  user_name CHAR(250) NOT NULL,
  user_password CHAR(250) NOT NULL,
  avatar_url TEXT,
  contacts CHAR(250)
);

ALTER TABLE lots ADD FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE lots ADD FOREIGN KEY (winner_id) REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE lots ADD FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;
ALTER TABLE bets ADD FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE bets ADD FOREIGN KEY (lot_id) REFERENCES lots(id) ON DELETE CASCADE;
CREATE INDEX winner_lot ON lots (deadline_date, winner_id);