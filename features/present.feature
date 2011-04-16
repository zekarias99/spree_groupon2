#language: ru

Функционал: 
  Тестирование подарочных карт
 
  Предыстория:
    Допустим в системе присутствуют следующие разделы для акций "Туризи и гостинници, Рестораны, Развлечения и спорт"
    # terms - Условия(может быть несколько)
    # Features - Особенности(может быть несколько)
    Допустим в системе присутствуют следующие акции:
      | name                                      | percentage | price | description   | type                | terms            | features                         | bayes | created_at | active | city   |
      | Скидка 40% на традиционный тайский массаж | 40         | 111   | description_1 | Развлечения и спорт | terms_1, terms_2 | График работы: с 11:00 до 23:00. | 555   | Time.now   | true   | Москва |
    Допустим на "Скидка 40% на традиционный тайский массаж" есть следующие комментарии "comment_1, comment_2, comment_3"
    Допустим зарегистрирован пользователь "user@ya.ru/secret"
    И у пользователя "user@ya.ru" на балансе "1000" рублей
    Допустим зарегистрирован пользователь "user2@ya.ru/secret"
    И я вошёл как "user@ya.ru/secret"
    Допустим я "на главной странице"

  Сценарий: Отправка подарка пользователю сайта и принятие этого подарка
    И я перейду по ссылке "Подарки"
    И я в поле "Имя отправителя" запишу ""
    И я в поле "Сумма" запишу ""
    И я нажму "Создать"

    И я увижу "Заполните имя получателя"
    И я увижу "Заполните электронную почту получателя"
    И я увижу "Заполните текст сообщения"
    И я увижу "Заполните сумму подарка"
    И я увижу "Заполните имя отправителя"

    И я в поле "имя отправителя" запишу "Дед мороз"
    И я в поле "Имя получателя" запишу "Дружбану"
    И я в поле "Электронная почта получателя" запишу "user2@ya.ru"
    И я в поле "Сумма" запишу "1000"
    И я в поле "Текст сообщения" запишу "Текст сообщения"
    И я нажму "Создать"
    И я увижу "Подарочная карта на сумму 1000 была отправленна пользователю user2@ya.ru, если пользователь в течение месяца не примет подарок, средства будут возвращенны."
    И на рублёвом балансе пользователя должно быть "0" рублей

    И я вошёл как "user@ya.ru/secret"
    И я перейду по ссылке "Профаил"
    И я перейду по ссылке "Купоны"
    И я перейду по ссылке "Подарки"
    И я увижу "У вас подарочная от карта на сумму 1000 рублей"
    И я нажму "Принять подарок"
    И я увижу "Ваш баланс увеличен на 1000 рублей, от пользователя Дед Мороз"

  Сценарий: Отправка подарка пользователю, который не зарегистрироват на сервисе
    И я в поле "имя отправителя" запишу "Дед мороз"
    И я в поле "Имя получателя" запишу "Дружбану"
    И я в поле "Электронная почта получателя" запишу "not_exist@ya.ru"
    И я в поле "Сумма" запишу "1000"
    И я в поле "Текст сообщения" запишу "Текст сообщения"
    И я нажму "Создать"
    И я увижу "Мы отправили письмо на not_exist@ya.ru. Для получения, подарка пользователю предстоит пройти регистрацию, если пользователь не пройдёт регистрацию в течение месяца, средства будут возвращенны."

    И я открою письмо пришедшее на адрес "not_exist@ya.ru" с темой "Подарочная карта на 1000 рублей от DOMAIN"
    И в теле письма будет "Это подарочная карта, для её активации вам следует пройти регистрацию на DIMAIN."
    И я перейду по ссылке в письме "регистрацию"
    И я пройду регистрацию как "not_exist@ya.ru" с подтверждением
    И я вошёл как "not_exist@ya.ru"
    И я перейду по ссылке "Профаил"
    И я перейду по ссылке "Купоны"
    И я перейду по ссылке "Подарки"
    И я увижу "У вас подарочная от карта на сумму 1000 рублей"
    И я нажму "Принять подарок"
    И я увижу "Ваш баланс увеличен на 1000 рублей, от пользователя Дед Мороз"


