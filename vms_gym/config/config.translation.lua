-- ▀█▀ █▀▄ ▄▀▄ █▄ █ ▄▀▀ █   ▄▀▄ ▀█▀ ██▀
--  █  █▀▄ █▀█ █ ▀█ ▄██ █▄▄ █▀█  █  █▄▄

Config.Language = 'EN' -- 'EN' / 'CZ' / 'DE' / 'FR' / 'ES' / 'PT' / 'PL'

Config.Translate = {
    ['EN'] = {
        ["blip.gym"] = "Фитнес",

        ["action.open_jobmenu"] = "Натиснете ~INPUT_CONTEXT~, за да отворите менюто",

        ["action.open_buymembership"] = "Натиснете ~INPUT_CONTEXT~, за да купите членство",

        ['action.bench'] = "Натиснете ~INPUT_CONTEXT~, за да седнете на пейката",
        ['action.pull-up'] = "Натиснете ~INPUT_CONTEXT~ за издърпвания",
        ['action.push-up'] = "Натиснете ~INPUT_CONTEXT~ за лицеви опори",
        ['action.barbell'] = "Натиснете ~INPUT_CONTEXT~, за да вземете щанга",
        ['action.dumbbells'] = "Натиснете ~INPUT_CONTEXT~, за да вземете гири",
        ['action.treadmill'] = "Натиснете ~INPUT_CONTEXT~, за да се качите на бягащата пътека",

        ['progressbar.bench'] = "Правите лежанка",
        ['progressbar.pull-up'] = "Правите набирания",
        ['progressbar.push-up'] = "Правите лицеви опори",
        ['progressbar.barbell'] = "Вдигате щанга",
        ['progressbar.dumbbells'] = "Вдигате дъмбели",
        ['progressbar.treadmill'] = "Вие бягате на бягаща пътека",

        ['menu.title.job_menu'] = "Фитнес меню",
        ['menu.element.grant_membership'] = "Предоставяне на членство",
        ['menu.element.boss_menu'] = "Шефско меню ",
        ['menu.title.select_player'] = 'Изберете играч',
        ['menu.element.grant_membership_to_player'] = "Предоставяне на членство за %s", -- %s = ID на играч"
        ['menu.title.select_membership_time'] = 'Изберете време за членство',
        ['menu.element.membership_hours'] = "Членство за %s час(а) - <span style='цвят:зелен'>$%s</span>",
        ['menu.element.membership'] = "Членство за %s ден- <span style='цвят:зелен'>$%s</span>",

        ['question.title.buy_membership'] = "Членство",
        ['question.description.buy_membership'] = "Искате ли да закупите членство във фитнес за %s$ за %s дни?",
        ['question.description.buy_membership_hours'] = "Искате ли да закупите членство във фитнес за %s$ за %s часа?",

        ['menu.title.buy_membership'] = "Членство",
        ['menu.element.accept_membership'] = "Купете членство за %s$ за %s дни",
        ['menu.element.accept_membership_hours'] = "Купете членство за %s$ за %s часа",
        ['menu.element.reject_membership'] = "Отхвърлете закупуването на членство",

        ['no_players_around'] = 'Никакви хора наоколо.',

        ['notify.title.gym'] = "Фитнес",
        ['notify.title.strenght'] = "СИЛА",
        ['notify.title.condition'] = "СЪСТОЯНИЕ",
        ['notify.title.driving'] = "ШОФИРАНЕ",
        ['notify.title.shooting'] = "СТРЕЛБА",
        ['notify.title.flying'] = "ЛЕТЕНЕ",

        ['incrase_strenght'] = "+%s сила.",
        ['incrase_condition'] = "+%s състояние.",
        ['incrase_driving'] = "+%s шофиране.",
        ['incrase_shooting'] = "+%s стрелба.",
        ['incrase_flying'] = "+%s летене.",

        ['decrease_strenght'] = "-%s сила.",
        ['decrease_condition'] = "-%s състояние.",
        ['decrease_flying'] = "-%s летене.",
        ['decrease_shooting'] = "-%s стрелба.",
        ['decrease_driving'] = "-%s шофиране.",

        ['bought_membership'] = "Закупихте членство във фитнес залата.",
        ['no_money_for_membership'] = "Нямате пари за членство в тази фитнес зала.",

        ['selled_membership'] = "Продаден абонамент за фитнес.",
        ['customer_did_not_buy'] = "Клиентът не е купил членство във фитнес зала.",

        ['out_of_breath'] = "Задъхвате се.<br>Тренирайте състоянието си, като бягате, карате колело или се гмуркате.",
        ['place_taken'] = "Tова място е заето.",
        ['no_membership'] = "Нямате членство за тази фитнес зала.",
    },
    
    ['CZ'] = {
        ["blip.gym"] = "Gym",

        ["action.open_jobmenu"] = "Zmackni ~INPUT_CONTEXT~ to open menu",

        ["action.open_buymembership"] = "Zmackni ~INPUT_CONTEXT~ pro zakoupeni permanentky",

        ['action.bench'] = "Zmackni ~INPUT_CONTEXT~ pro sednuti na bench",
        ['action.pull-up'] = "Zmackni ~INPUT_CONTEXT~ na pritahovani",
        ['action.push-up'] = "Zmackni ~INPUT_CONTEXT~ na kliky",
        ['action.barbell'] = "Zmackni ~INPUT_CONTEXT~ pro cinku do ruky",
        ['action.dumbbells'] = "Zmackni ~INPUT_CONTEXT~ pro cinky do ruky",
        ['action.treadmill'] = "Zmackni ~INPUT_CONTEXT~ na bezecky pas",

        ['progressbar.bench'] = "Benchujes",
        ['progressbar.pull-up'] = "Delas Pritahovani",
        ['progressbar.push-up'] = "Delas Kliky",
        ['progressbar.barbell'] = "Zvedas Cinku",
        ['progressbar.dumbbells'] = "Zvedas Cinky",
        ['progressbar.treadmill'] = "Behas na Pasu",

        ['menu.title.job_menu'] = "Gym Menu",
        ['menu.element.grant_membership'] = "Permanentka",
        ['menu.element.boss_menu'] = "Boss Menu",
        ['menu.title.select_player'] = 'Vybrat Hrace',
        ['menu.element.grant_membership_to_player'] = "Permanentka pro %s", -- %s = Player ID
        ['menu.title.select_membership_time'] = 'Vyber casu pro permanentku',
        ['menu.element.membership_hours'] = "Membership for %s hour(s) - <span style='color:green'>$%s</span>",
        ['menu.element.membership'] = "Permanentka na %s den - <span style='color:green'>$%s</span>",

        ['question.title.buy_membership'] = "Permanentka",
        ['question.description.buy_membership'] = "Chces si zakoupit permanentku v gymu za %s$ na %s days?",
        ['question.description.buy_membership_hours'] = "Do you want to purchase a gym membership for %s$ on %s hours?",

        ['menu.title.buy_membership'] = "Permanentka",
        ['menu.element.accept_membership'] = "Koupit permanentku za %s$ na %s days",
        ['menu.element.accept_membership_hours'] = "Buy membership for %s$ on %s hours",
        ['menu.element.reject_membership'] = "Odmitnout permanentku",

        ['no_players_around'] = 'Zadni Lide v okolo.',

        ['notify.title.gym'] = "GYM",
        ['notify.title.strenght'] = "SILA",
        ['notify.title.condition'] = "KONDICE",
        ['notify.title.driving'] = "RIZENI",
        ['notify.title.shooting'] = "STRELBA",
        ['notify.title.flying'] = "LÉTÁNÍ",

        ['incrase_strenght'] = "+%s sily.",
        ['incrase_condition'] = "+%s kondicky.",
        ['incrase_driving'] = "+%s rizeni.",
        ['incrase_shooting'] = "+%s strelby.",
        ['incrase_flying'] = "+%s létání.",

        ['decrease_strenght'] = "-%s sily.",
        ['decrease_condition'] = "-%s kondicky.",
        ['decrease_driving'] = "-%s rizeni.",
        ['decrease_shooting'] = "-%s strelby.",
        ['decrease_flying'] = "-%s létání.",

        ['bought_membership'] = "Zakoupil jste si permanentku do gymu",
        ['no_money_for_membership'] = "Nemate dostatek penez na permanentku",

        ['selled_membership'] = "Prodat Permanentku",
        ['customer_did_not_buy'] = "Zakaznik jsi nezakoupil permanentku",

        ['out_of_breath'] = "Jsi bez dechu!<br>Trenujte kondici behem, jizdou na kole ci potapenim",
        ['place_taken'] = "Toto misto je zabrane",
        ['no_membership'] = "Nemate permanentku",
    },

    ['DE'] = {
        ["blip.gym"] = "Fitnessstudio",

        ["action.open_jobmenu"] = "Drücke ~INPUT_CONTEXT~ um das Menü zu öffnen",

        ["action.open_buymembership"] = "Drücke ~INPUT_CONTEXT~ um eine Mitgliedschaft zu kaufen",

        ['action.bench'] = "Drücke ~INPUT_CONTEXT~ um dich auf die Bank zu setzen",
        ['action.pull-up'] = "Drücke ~INPUT_CONTEXT~ für Klimmzüge",
        ['action.push-up'] = "Drücke ~INPUT_CONTEXT~ für Liegestütze",
        ['action.barbell'] = "Drücke ~INPUT_CONTEXT~ um die Langhanteln zu nehmen",
        ['action.dumbbells'] = "Drücke ~INPUT_CONTEXT~ um die Langhanteln zu nehmen",
        ['action.treadmill'] = "Drücke ~INPUT_CONTEXT~ um auf das Laufband zu gehen",

        ['progressbar.bench'] = "Du machst Bankdrücken",
        ['progressbar.pull-up'] = "Du machst Klimmzüge",
        ['progressbar.push-up'] = "Du machst Liegestütze",
        ['progressbar.barbell'] = "Du hebst Langhantel",
        ['progressbar.dumbbells'] = "Du hebst Hanteln",
        ['progressbar.treadmill'] = "Du läufst Laufband",

        ['menu.title.job_menu'] = "Fitnessstudio Menü",
        ['menu.element.grant_membership'] = "Mitgliedschaft genehmigen",
        ['menu.element.boss_menu'] = "Boss Menü",
        ['menu.title.select_player'] = 'Spieler wählen',
        ['menu.element.grant_membership_to_player'] = "Mitgliedschaft für %s genehmigen", -- %s = Player ID
        ['menu.title.select_membership_time'] = 'Wähle die Laufzeit der Mitgliedschaft',
        ['menu.element.membership_hours'] = "Membership for %s hour(s) - <span style='color:green'>$%s</span>",
        ['menu.element.membership'] = "Mitglied für %s Tag(e) - <span style='color:green'>$%s</span>",

        ['question.title.buy_membership'] = "Mitgliedschaft",
        ['question.description.buy_membership'] = "Möchtest du eine Mitgliedschaft im Fitnessstudio für %s$ für %s Tage abschließen?",
        ['question.description.buy_membership_hours'] = "Do you want to purchase a gym membership for %s$ on %s hours?",

        ['menu.title.buy_membership'] = "Mitgliedschaft",
        ['menu.element.accept_membership'] = "Kaufe Mitgliedschaft für %s$ für %s Tage",
        ['menu.element.accept_membership_hours'] = "Buy membership for %s$ on %s hours",
        ['menu.element.reject_membership'] = "Keine Mitgliedschaft abschließen",

        ['no_players_around'] = 'Es befindet sich niemand in der Nähe.',

        ['notify.title.gym'] = "Fitnessstudio",
        ['notify.title.strenght'] = "KRAFT",
        ['notify.title.condition'] = "KONDITION",
        ['notify.title.driving'] = "FAHREN",
        ['notify.title.shooting'] = "SCHIEßEN",
        ['notify.title.flying'] = "FLIEGEN",

        ['incrase_strenght'] = "+%s kraft.",
        ['incrase_condition'] = "+%s kondition.",
        ['incrase_driving'] = "+%s fahren.",
        ['incrase_shooting'] = "+%s schießen.",
        ['incrase_flying'] = "+%s fliegen.",

        ['decrease_strenght'] = "-%s kraft.",
        ['decrease_condition'] = "-%s kondition.",
        ['decrease_driving'] = "-%s fahren.",
        ['decrease_shooting'] = "-%s schießen.",
        ['decrease_flying'] = "+%s fliegen.",

        ['bought_membership'] = "Du hast eine Fitnessstudio Mitgliedschaft erworben.",
        ['no_money_for_membership'] = "Du hast nicht genug Geld für eine Mitgliedschaft.",

        ['selled_membership'] = "Fitnessstudio Mitgliedschaft verkauft.",
        ['customer_did_not_buy'] = "Der Kunde hat keine Mitgliedschaft gekauft",

        ['out_of_breath'] = "Du bist außer Atem.<br>Trainiere deine Kondition in dem du läufst, Rad fährst oder tauchst.",
        ['place_taken'] = "Dieser Platz ist belegt.",
        ['no_membership'] = "du hast in diesem Fitnessstudio keine Mitgliedschaft.",
    },

    ['FR'] = {
        ["blip.gym"] = "Salle de sport",

		["action.open_jobmenu"] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu",

		["action.open_buymembership"] = "Appuyez sur ~INPUT_CONTEXT~ pour acheter une adhésion",

		['action.bench'] = "Appuyez sur ~INPUT_CONTEXT~ pour vous asseoir sur le banc",
		['action.pull-up'] = "Appuyez sur ~INPUT_CONTEXT~ pour faire des tractions",
		['action.push-up'] = "Appuyez sur ~INPUT_CONTEXT~ pour faire des pompes",
		['action.barbell'] = "Appuyez sur ~INPUT_CONTEXT~ pour prendre une barre",
		['action.dumbbells'] = "Appuyez sur ~INPUT_CONTEXT~ pour prendre des haltères",
		['action.treadmill'] = "Appuyez sur ~INPUT_CONTEXT~ pour monter sur le tapis de course",

		['progressbar.bench'] = "Vous faites du développé couché",
		['progressbar.pull-up'] = "Vous faites des tractions",
		['progressbar.push-up'] = "Vous faites des pompes",
		['progressbar.barbell'] = "Vous soulevez une barre",
		['progressbar.dumbbells'] = "Vous soulevez des haltères",
		['progressbar.treadmill'] = "Vous courez sur le tapis de course",

		['menu.title.job_menu'] = "Menu de la salle de sport",
		['menu.element.grant_membership'] = "Accorder une adhésion",
		['menu.element.boss_menu'] = "Menu du patron",
		['menu.title.select_player'] = 'Sélectionner un joueur',
		['menu.element.grant_membership_to_player'] = "Accorder une adhésion à %s", -- %s = ID du joueur
		['menu.title.select_membership_time'] = 'Sélectionner la durée de l\'adhésion',
        ['menu.element.membership_hours'] = "Membership for %s hour(s) - <span style='color:green'>$%s</span>",
		['menu.element.membership'] = "Adhésion pour %s jour(s) - <span style='color:green'>$%s</span>",

		['question.title.buy_membership'] = "Adhésion",
		['question.description.buy_membership'] = "Voulez-vous acheter une adhésion pour %s$ pendant %s jours ?",
        ['question.description.buy_membership_hours'] = "Do you want to purchase a gym membership for %s$ on %s hours?",

		['menu.title.buy_membership'] = "Adhésion",
		['menu.element.accept_membership'] = "Acheter l'adhésion pour %s$ pendant %s jours",
        ['menu.element.accept_membership_hours'] = "Buy membership for %s$ on %s hours",
		['menu.element.reject_membership'] = "Rejeter l'achat d'une adhésion",

		['no_players_around'] = 'Aucune personne aux alentours.',

		['notify.title.gym'] = "SALLE DE SPORT",
		['notify.title.strenght'] = "FORCE",
		['notify.title.condition'] = "CONDITION",
		['notify.title.driving'] = "CONDUITE",
		['notify.title.shooting'] = "TIR",
        ['notify.title.flying'] = "VOL EN",

		['incrase_strenght'] = "+%s force.",
		['incrase_condition'] = "+%s condition.",
		['incrase_driving'] = "+%s conduite.",
		['incrase_shooting'] = "+%s tir.",
        ['incrase_flying'] = "+%s vol en.",

		['decrease_strenght'] = "-%s force.",
		['decrease_condition'] = "-%s condition.",
		['decrease_driving'] = "-%s conduite.",
		['decrease_shooting'] = "-%s tir.",
        ['decrease_flying'] = "+%s vol en.",

		['bought_membership'] = "Vous avez acheté une adhésion à la salle de sport.",
		['no_money_for_membership'] = "Vous n'avez pas assez d'argent pour acheter une adhésion à cette salle de sport.",

		['selled_membership'] = "Vous avez vendu une adhésion à la salle de sport.",
		['customer_did_not_buy'] = "Le client n'a pas acheté d'adhésion à la salle de sport.",

		['out_of_breath'] = "Vous êtes à bout de souffle.<br>Améliorez votre condition en courant, en faisant du vélo ou de la plongée.",
		['place_taken'] = "Cet emplacement est occupé.",
		['no_membership'] = "Vous n'avez pas d'adhésion pour cette salle de sport.",
    },

    ['ES'] = {
        ["action.open_jobmenu"] = "Presiona ~INPUT_CONTEXT~ para abrir el menu",

        ["action.open_buymembership"] = "Presiona ~INPUT_CONTEXT~ para comprar la membresia",

        ['action.bench'] = "Presiona ~INPUT_CONTEXT~ para sentarte en el banco",
        ['action.pull-up'] = "Presiona ~INPUT_CONTEXT~ para hacer dominadas",
        ['action.push-up'] = "Presiona ~INPUT_CONTEXT~ para hacer flexiones",
        ['action.barbell'] = "Presiona ~INPUT_CONTEXT~ para tomar la barra",
        ['action.dumbbells'] = "Presiona ~INPUT_CONTEXT~ para tomar las mancuernas",
        ['action.treadmill'] = "Presiona ~INPUT_CONTEXT~ para subirte a la cinta de correr",

        ['progressbar.bench'] = "Estas levantando en el banco",
        ['progressbar.pull-up'] = "Estas haciendo dominadas",
        ['progressbar.push-up'] = "Estas haciendo flexiones",
        ['progressbar.barbell'] = "Estas levantando la barra",
        ['progressbar.dumbbells'] = "Estas levantando mancuernas",
        ['progressbar.treadmill'] = "Estas corriendo en la cinta",

        ['menu.title.job_menu'] = "Menu del Gimnasio",
        ['menu.element.grant_membership'] = "Otorgar Membresia",
        ['menu.element.boss_menu'] = "Menu del Jefe",
        ['menu.title.select_player'] = 'Seleccionar jugador',
        ['menu.element.grant_membership_to_player'] = "Otorgar Membresia para %s", -- %s = ID del Jugador
        ['menu.title.select_membership_time'] = 'Seleccionar duracion de la membresia',
        ['menu.element.membership_hours'] = "Membership for %s hour(s) - <span style='color:green'>$%s</span>",
        ['menu.element.membership'] = "Membresia por %s dia(s) - <span style='color:green'>$%s</span>",

        ['question.title.buy_membership'] = "Membresia",
        ['question.description.buy_membership'] = "Quieres comprar una membresia del gimnasio por %s$ durante %s dias?",
        ['question.description.buy_membership_hours'] = "Do you want to purchase a gym membership for %s$ on %s hours?",

        ['menu.title.buy_membership'] = "Membresia",
        ['menu.element.accept_membership'] = "Comprar membresia por %s$ durante %s dias",
        ['menu.element.accept_membership_hours'] = "Buy membership for %s$ on %s hours",
        ['menu.element.reject_membership'] = "Rechazar compra de la membresia",

        ['no_players_around'] = 'No hay gente cerca.',

        ['notify.title.gym'] = "GIMNASIO",
        ['notify.title.strenght'] = "FUERZA",
        ['notify.title.condition'] = "CONDICION",
        ['notify.title.driving'] = "CONDUCCION",
        ['notify.title.shooting'] = "DISPARO",
        ['notify.title.flying'] = "VOLAR",

        ['incrase_strenght'] = "+%s fuerza.",
        ['incrase_condition'] = "+%s condicion.",
        ['incrase_driving'] = "+%s conduccion.",
        ['incrase_shooting'] = "+%s disparo.",
        ['incrase_flying'] = "+%s volar.",

        ['decrease_strenght'] = "-%s fuerza.",
        ['decrease_condition'] = "-%s condicion.",
        ['decrease_driving'] = "-%s conduccion.",
        ['decrease_shooting'] = "-%s disparo.",
        ['decrease_flying'] = "+%s volar.",

        ['bought_membership'] = "Has comprado una membresia del gimnasio.",
        ['no_money_for_membership'] = "No tienes suficiente dinero para la membresia de este gimnasio.",

        ['selled_membership'] = "Se vendio una membresia del gimnasio.",
        ['customer_did_not_buy'] = "El cliente no compro la membresia del gimnasio.",

        ['out_of_breath'] = "Te falta el aliento.<br>Entrena tu condicion corriendo, en bicicleta o buceando.",
        ['place_taken'] = "Este lugar esta ocupado.",
        ['no_membership'] = "No tienes una membresia para este gimnasio.",
    },

    ['PT'] = {
        ["blip.gym"] = "Academia",

        ["action.open_jobmenu"] = "Pressione ~INPUT_CONTEXT~ para abrir o menu",

        ["action.open_buymembership"] = "Pressione ~INPUT_CONTEXT~ para aderir",

        ['action.bench'] = "Pressione ~INPUT_CONTEXT~ para se sentar no banco",
        ['action.pull-up'] = "Pressione ~INPUT_CONTEXT~ para fazer pull-ups",
        ['action.push-up'] = "Pressione ~INPUT_CONTEXT~ para fazer push-up",
        ['action.barbell'] = "Pressione ~INPUT_CONTEXT~ para agarrar a barra",
        ['action.dumbbells'] = "Pressione ~INPUT_CONTEXT~ para agarrar os halteres",
        ['action.treadmill'] = "Pressione ~INPUT_CONTEXT~ Para usar a esteira",

        ['progressbar.bench'] = "Você está no banco",
        ['progressbar.pull-up'] = "Você está a fazer pull-ups",
        ['progressbar.push-up'] = "Você está a fazer push-up",
        ['progressbar.barbell'] = "você está a levantar a barbell",
        ['progressbar.dumbbells'] = "você está a levantar os halteres",
        ['progressbar.treadmill'] = "Você está a corer na esteira",

        ['menu.title.job_menu'] = "Menu da Academia",
        ['menu.element.grant_membership'] = "Dar Adesão",
        ['menu.element.boss_menu'] = "Boss Menu",
        ['menu.title.select_player'] = 'Selecionar jogador',
        ['menu.element.grant_membership_to_player'] = "Dar adesão para %s", -- %s = Player ID
        ['menu.title.select_membership_time'] = 'Selecione o tempo de adesão',
        ['menu.element.membership_hours'] = "Membership for %s hour(s) - <span style='color:green'>$%s</span>",
        ['menu.element.membership'] = "Adesão para %s dia(s) - <span style='color:green'>$%s</span>",

        ['question.title.buy_membership'] = "Adesão",
        ['question.description.buy_membership'] = "Você quer aderir à academia por %s$ em %s dias?",
        ['question.description.buy_membership_hours'] = "Do you want to purchase a gym membership for %s$ on %s hours?",

        ['menu.title.buy_membership'] = "Adesão à academia",
        ['menu.element.accept_membership'] = "Aderir à academia por %s$ em %s dias",
        ['menu.element.accept_membership_hours'] = "Buy membership for %s$ on %s hours",
        ['menu.element.reject_membership'] = "Anular a adesão",

        ['no_players_around'] = 'Ninguém perto.',

        ['notify.title.gym'] = "Academia",
        ['notify.title.strenght'] = "FORÇA",
        ['notify.title.condition'] = "CONDIÇÃO",
        ['notify.title.driving'] = "CONDUÇÃO",
        ['notify.title.shooting'] = "DISPARO",
        ['notify.title.flying'] = "VOANDO",

        ['incrase_strenght'] = "+%s força.",
        ['incrase_condition'] = "+%s condição.",
        ['incrase_driving'] = "+%s condução.",
        ['incrase_shooting'] = "+%s disparo.",
        ['incrase_flying'] = "+%s voando.",

        ['decrease_strenght'] = "-%s força.",
        ['decrease_condition'] = "-%s condição.",
        ['decrease_driving'] = "-%s condução.",
        ['decrease_shooting'] = "-%s disparo.",
        ['decrease_flying'] = "+%s voando.",

        ['bought_membership'] = "Você subscreveu à academia.",
        ['no_money_for_membership'] = "Você não tem dinheiro suficiente para aderir à academia.",

        ['selled_membership'] = "Vendeu uma adesão à academia.",
        ['customer_did_not_buy'] = "O cliente não aderiu à academia.",

        ['out_of_breath'] = "Você está sem fôlego.<br>treine a sua condição correndo, biciclando ou nadando.",
        ['place_taken'] = "Este lugar é ocupado.",
        ['no_membership'] = "Você não tem a adesão para esta academia.",
    },

    ['PL'] = {
        ["blip.gym"] = "Siłownia",

        ["action.open_jobmenu"] = "~INPUT_CONTEXT~ - Menu pracy",

        ["action.open_buymembership"] = "~INPUT_CONTEXT~ kup karnet",

        ['action.bench'] = "~INPUT_CONTEXT~ - Ławka",
        ['action.pull-up'] = "~INPUT_CONTEXT~ - Podciąganie",
        ['action.push-up'] = "~INPUT_CONTEXT~ - Pompki",
        ['action.barbell'] = "~INPUT_CONTEXT~ - Wolne ciężary",
        ['action.dumbbells'] = "~INPUT_CONTEXT~ - Hantle",
        ['action.treadmill'] = "~INPUT_CONTEXT~ - Bieżnia",

        ['progressbar.bench'] = "Wyciskasz na ławce",
        ['progressbar.pull-up'] = "Podciągasz się",
        ['progressbar.push-up'] = "Robisz pompkę",
        ['progressbar.barbell'] = "Podnosisz sztangę",
        ['progressbar.dumbbells'] = "Podnosisz hantle",
        ['progressbar.treadmill'] = "Biegniesz",

        ['menu.title.job_menu'] = "Menu siłowni",
        ['menu.element.grant_membership'] = "Nadaj karnet",
        ['menu.element.boss_menu'] = "Menu szefa",
        ['menu.title.select_player'] = "Wybierz gracza",
        ['menu.element.grant_membership_to_player'] = "Nadaj karnet dla %s", -- %s = Player ID
        ['menu.title.select_membership_time'] = "Wybierz pakiet karnetu",
        ['menu.element.membership_hours'] = "Karnet na %s godzin(y) - <span style='color:green'>$%s</span>",
        ['menu.element.membership'] = "Karnet na %s dni - <span style='color:green'>$%s</span>",

        ['question.title.buy_membership'] = "Karnet na siłownię",
        ['question.description.buy_membership'] = "Czy chcesz zakupić karnet na siłownię za %s$ na %s dni?",
        ['question.description.buy_membership_hours'] = "Czy chcesz zakupić karnet na siłownię za %s$ na %s godzin?",

        ['menu.title.buy_membership'] = "Karnet na siłownię",
        ['menu.element.accept_membership'] = "Kup karnet za %s$ na %s dni",
        ['menu.element.accept_membership_hours'] = "Kup karnet za %s$ na %s godzin",
        ['menu.element.reject_membership'] = "Odrzuć zakup",

        ['no_players_around'] = "Brak graczy w pobliżu.",

        ['notify.title.gym'] = "SIŁOWNIA",
        ['notify.title.strenght'] = "SIŁA",
        ['notify.title.condition'] = "KONDYCJA",
        ['notify.title.driving'] = "PROWADZENIE",
        ['notify.title.shooting'] = "STRZELANIE",
        ['notify.title.flying'] = "LATANIE",

        ['incrase_strenght'] = "+%s siły.",
        ['incrase_condition'] = "+%s kondycji.",
        ['incrase_driving'] = "+%s prowadzenia pojazdu.",
        ['incrase_shooting'] = "+%s strzelania.",
        ['incrase_flying'] = "+%s latanie.",

        ['decrease_strenght'] = "-%s siły.",
        ['decrease_condition'] = "-%s kondycji.",
        ['decrease_driving'] = "-%s prowadzenia pojazdu.",
        ['decrease_shooting'] = "-%s strzelania.",
        ['decrease_flying'] = "+%s latanie.",

        ['bought_membership'] = "Zakupiłeś karnet na siłownię",
        ['no_money_for_membership'] = "Nie masz wystarczająco pieniędzy na karnet.",

        ['selled_membership'] = "Sprzedano karnet na siłownię.",
        ['customer_did_not_buy'] = "Klient nie zakupił karnetu.",

        ['out_of_breath'] = "Brakuje ci tchu.<br>Trenuj kondycję biegając, jeżdżąc na rowerze lub pływając.",
        ['place_taken'] = "To miejsce jest zajęte.",
        ['no_membership'] = "Nie masz karnetu na tę siłownię.",
    },
}