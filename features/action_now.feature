#language: ru

Функционал:
  Тестирование сегодняшней акции
  Полная проверка включая покупку

  Предыстория:
    Допустим в системе присутствуют следующие разделы для акций "Туризи и гостинници, Рестораны, Развлечения и спорт"
    # terms - Условия(может быть несколько)
    # Features - Особенности(может быть несколько)
    Допустим в системе присутствуют следующие акции:
      | name                                      | percentage | price | description   | type                | terms            | features                         | bayes | created_at | active |
      | Скидка 40% на традиционный тайский массаж |         40 |   111 | description_1 | Развлечения и спорт | terms_1, terms_2 | График работы: с 11:00 до 23:00. |   555 | Time.now   | true   |
    Допустим на "Скидка 40% на традиционный тайский массаж" есть следующие комментарии "comment_1, comment_2, comment_3"
    Допустим зарегистрирован пользователь "user2@ya.ru/secret"
    Допустим зарегистрирован пользователь "user@ya.ru/secret"
    И я вошёл как "user@ya.ru/secret"
    Допустим я "на главной странице"

  Сценарий: Проверяем сопутствующию информацию по текущей, активной акции. И покупаем в 1 клик.
    И я увижу цену акции "111"
    И я увижу статус акции "Акция состоится"
    И я увижу скидку "20"
    И я увижу что купили эту акцию "555" человек
    И я перейду по ссылке "Купить в 1 клик"
    # Оформляем покупку по кредитной карте
    И я увижу "Вы успешно приобрели купон"

  Сценарий: Покупка акции в подарок
    И я перехожу по ссылке "Покупка в подарок"
    И я в поле "Электронная почта получателя" запишу ""
    И я нажму "Ок"
    И я увижу "Электронная почта получателя имеет не верное значение"

    И я перехожу по ссылке "Покупка в подарок"
    И я в поле "Электронная почта получателя" запишу "user2@ya.ru"
    И я нажму "Ок"
    И я должен оказаться на странице "оформления заказа"
    И я в поле "количество" запишу "2"
    И я увижу сумму заказа "222"
    # Оплачиваю с помощъю доступной системы оплаты
    И я увижу "Вы успешно подарили 2 купона пользователю user2@ya.ru"

  Сценарий: Покупка акции в подарок из раздела оформления заказа
    И я перехожу по ссылке "Купить"
    И я перехожу по ссылке "Купить в подарок"
    И я в поле "Электронная почта получателя" запишу ""
    И я нажму "Ок"
    И я увижу "Электронная почта получателя имеет не верное значение"

    И я перехожу по ссылке "Покупка в подарок"
    И я в поле "Электронная почта получателя" запишу "user2@ya.ru"
    И я нажму "Ок"
    И я должен оказаться на странице "оформления заказа"
    И я в поле "количество" запишу "2"
    И я увижу сумму заказа "222"
    # Оплачиваю с помощъю доступной системы оплаты
    И я увижу "Вы успешно подарили 2 купона пользователю user2@ya.ru"


  Сценарий: Покупка акции себе(не в 1 клик)
    И я перехожу по ссылке "Купить"
    И я увижу в форме оформления заказа "111"
    И я увижу в форме оформления заказа "description_1"
    # Оплачиваю с помощъю доступной системы оплаты
    И я увижу "Вы успешно купили купон на акцию"


