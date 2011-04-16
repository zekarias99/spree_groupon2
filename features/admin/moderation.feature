#language: ru

Функционал:
  Предыстория:
    Пользователи могут оставлять комментарии к купонам
    Комментарии не появляются пока не прошли модерацию
  Сценарий: Модерация комментариев
    Допустим есть следующие купоны:
      | name              | price |
      | Скидка 60% на всё | 100   |

    Допустим я зашёл как "user@ya.ru"
    И я нахожусь на "главной странице"
    И я перехожу по ссылке "Добавить комментарий"
    И я в поле "Комментарий" запишу "comment_1"
    И я нажму "Добавить"
    И я увижу "Ваш комментарий поставлен в очередь модерации, скоро он появится на сайте."

    Допустим существует администратор "admin@ya.ru/secret"
    И я на странице "авторизации в административную часть"
    И я в поле "email" запишу "admin@ya.ru"
    И я в поле "password" запишу "secret"
    И я нажму "Войти"
    И я должен быть на "странице администринования"

    И я перехожу по ссылке "Комментарии к купонам"
    И я вижу увижу "Список новых комментариев"
    И я увижу таблицу не отмодерированных комментариев:
      | body      | user         | product_name      |
      | comment_1 | user@ya.ru | Скидка 60% на всё |
    И я перейду по ссылке "Одобрить"
    И я увижу "Комментарий одобрен"
    И я не увижу "Скидка 60% на всё"

    И я перейду по ссылке "Одобренные комментарии"
    И я увижу "Скидка 60% на всё"

    Допустим я зашёл как "user@ya.ru"
    И я нахожусь на "главной странице"
    И я перехожу по ссылке "Комментарии"
    И я увижу "comment_1"

