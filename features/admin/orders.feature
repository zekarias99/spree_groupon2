#language: ru

Функционал:
  Тестирование ордеров

  Предыстория:
    Допустим существует администратор "admin@ya.ru/secret"
    И я на странице "авторизации в административную часть"
    И я в поле "email" запишу "admin@ya.ru"
    И я в поле "password" запишу "secret"
    И я нажму "Войти"
    И я должен быть на "странице администринования"
    Допустим в системе присутствуют пользователи:
      | name | phone|

  Сценарий: Просмотор ордера и его редактирование
    Допустим есть следующие купоны:
      | name              | description   | end_date         | price |
      | Скидка на всё 40% | description_1 | Time.now + 1.day | 100   |
    Допустим есть следующие пользователи:
      | email        |
      | user_1@ya.ru |
    И я зашёл как "user_1@ya.ru"
    И допустим я на главной странице
    И я перешёл по ссылке "Купить"
    И я произвёл оплату

    И я вхожу как администратор
    И я перехожу по ссылке "Ордера"
    И я вижу таблицу ордеров:
      | Дата оплаты | Номер ордера    | Статус   | Покупатель   | Сумма | Редактирование |
      | Time.now    | Тут любой номер | Завершён | user_1@ya.ru | 100   | Редактировать  |
    И я перехожу по ссылке "Редактировать"
    И я увижу таблицу ордера:
      | Название продукта | Цена | Количество | Всего |
      | Скидка на всё 40% | 100  | 1          | 100   |
    И я в поле "количество" запишу "2"
    И я увижу таблицу ордера:
      | Название продукта | Цена | Количество | Всего |
      | Скидка на всё 40% | 100  | 2          | 200   |
    И я нажму "Сохранить"
    И я увижу "Ордер сохранён"

