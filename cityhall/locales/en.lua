local Translations = {
    error = {
        not_in_range = 'Далеч сте'
    },
    success = {
        recived_license = ' %{value} for $50'
    },
    info = {
        new_job_app = 'Изпращане вашата кандидатура до шефа на бизнеса ',
        bilp_text = 'City Services',
        city_services_menu = '~g~E~w~ - City Services Menu',
        id_card = 'Лична карта',
        driver_license = 'Шофьорска книжка',
        weaponlicense = 'Разрешително за оръжие',
        new_job = 'нова работа',
    },
    email = {
        jobAppSender = "Подател на приложение за работа",
        jobAppSub = "Благодаря за кандидатурата",
        jobAppMsg = "Hello %{gender} %{lastname}<br /><br />%{job} has received your application.<br /><br />The boss is looking into your request and will reach out to you for an interview at their earliest convenience.<br /><br />Once again, thank you for your application.",
        mr = 'Господин',
        mrs = 'Госпожа',
        sender = 'Кандидатстващ',
        subject = 'предмет',
        message = 'Съобщение в което се съобщават данни за човека и друга информация'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
