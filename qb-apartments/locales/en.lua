local Translations = {
    error = {
        to_far_from_door = 'Твърде далеч си от вратата',
        nobody_home = 'Няма никой в къщи..',
        nobody_at_door = 'Няма никой на вратата...'
    },
    success = {
        receive_apart = 'Получихте апартамент',
        changed_apart = 'Преместихте апартамента си',
    },
    info = {
        at_the_door = 'Има някой на вратата!',
    },
    text = {
        options = '[E] Опции на апартамента',
        enter = 'Влез',
        ring_doorbell = 'Звънни на звънеца',
        logout = 'Смени персонажите',
        change_outfit = 'Гардероб',
        open_stash = 'Склад',
        move_here = 'Премести се тук',
        open_door = 'Отвори вратата',
        leave = 'Напусни апартамент',
        close_menu = '⬅ Затвори менюто',
        tennants = 'Наематели',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})