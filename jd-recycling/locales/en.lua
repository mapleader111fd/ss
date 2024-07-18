local Translations = {
    success = {
        you_have_been_clocked_in = "На смята сте",
    },
    text = {
        point_enter_warehouse = "Влез в склада",
        enter_warehouse= "Влез в склада",
        exit_warehouse= "Излез от склада",
        point_exit_warehouse = "Излез от склада",
        clock_out = "Излез от смяна",
        clock_in = "Влез на смяна",
        hand_in_package = "Остави кашона",
        point_hand_in_package = "Остави кашона",
        get_package = "Вземи кашона",
        point_get_package = "Вземи кашона",
        picking_up_the_package = "Взимате кашона",
        unpacking_the_package = "Отваряте кашона",
    },
    error = {
        you_have_clocked_out = "Извън смята сте"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})