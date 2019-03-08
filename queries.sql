/*Категории*/
INSERT INTO categories(category_name)
    VALUES ('Доски и лыжи'),
           ('Крепления'),
           ('Ботинки'),
           ('Одежда'),
           ('Инструменты'),
           ('Разное');

/*Пользователи*/
INSERT INTO users(registration_date, email, user_name, user_password, avatar_url, contacts)
    VALUES ('2019-03-02', 'Андрей', 'test@ro.ru', 'qwerty', 'https://i.pinimg.com/originals/0c/a9/e2/0ca9e28dcb12dc698cfd2beda6d6fa64.jpg', '8-999-888-7766'),
           ('2019-02-27', 'Мария', 'testtest@ya.ru', 'QWERTY', 'https://pp.userapi.com/c840632/v840632480/82c23/250CBzQppG8.jpg', '8-989-888-7766');

/*Объявления*/
INSERT INTO lots(creation_date, lot_name, description, img_url, start_price, deadline_date, price_step, author_id, category_id)
    VALUES ('2019-03-01 13:00:00', '2014 Rossignol District Snowboard', 'Лот 1', 'img/lot-1.jpg', '10999', '2019-04-01 13:00:00', '1000', '1', '1'),
           ('2019-03-01 13:00:00', 'DC Ply Mens 2016/2017 Snowboard', 'Лот 2', 'img/lot-2.jpg', '159999', '2019-04-01 11:00:00', '1000', '2', '1'),
           ('2019-03-01 13:00:00', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Лот 3', 'img/lot-3.jpg', '8000', '2019-04-01 10:00:00', '500', '1', '2'),
           ('2019-03-01 13:00:00', 'Ботинки для сноуборда DC Mutiny Charocal', 'Лот 4', 'img/lot-4.jpg', '10999', '2019-04-01 15:00:00', '10999', '2', '3'),
           ('2019-03-01 13:00:00', 'Куртка для сноуборда DC Mutiny Charocal', 'Лот 5', 'img/lot-5.jpg', '7500', '2019-04-01 16:00:00', '800', '1', '4'),
           ('2019-03-01 13:00:00', 'Маска Oakley Canopy', 'Лот 6', 'img/lot-6.jpg', '5400', '2019-04-01 12:00:00', '500', '2', '6');

/*Ставки*/
INSERT INTO bets(creation_date, price, user_id, lot_id)
    VALUES ('2019-03-01 15:00:00', '6000', '1', '2'),
           ('2019-03-02 11:00:00', '6500', '2', '3');

/*Получить все категории*/
SELECT category_name FROM categories;

/*Получить самые новые, открытые лоты*/
SELECT l.lot_name, l.start_price, l.img_url, MAX(b.price), c.category_name
  FROM lots l
  JOIN categories c
    ON l.category_id = c.id
  JOIN bets b
    ON l.id = b.lot_id
 WHERE l.deadline_date > CURRENT_DATE() GROUP BY b.lot_id ORDER BY l.creation_date DESC;

/*Показать лот по его id*/
SELECT l.*, c.category_name
  FROM lots l
  JOIN categories c
    ON l.category_id = c.id
 WHERE l.id = 2;

/*Обновить название лота по его идентификатору*/
UPDATE lots
   SET lot_name = '2015 Rossignol District Snowboard'
 WHERE id = 1;

/*Получить список самых свежих ставок для лота по его идентификатору*/
SELECT *
  FROM bets
 WHERE lot_id = 6 ORDER BY creation_date DESC;