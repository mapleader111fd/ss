let Config = {};

Config.RadioItem = 'radio';
Config.DisableRadioUnderwater = true; // Whether to disconnect players when they try to talk underwater (they can still listen to others);
Config.WetRadios = true; // Whether radios break if players try to talk underwater (REQUIRES Config.DisableRadioUnderwater)
Config.BrokenRadioItem = 'radio_broken' // Set to false if you don't want players to receive items

Config.DefaultKeybinds = { // The default preset keybinds (each player can configure them personally in Settings > Keybinds > FiveM)
    SwitchChannel: { // Switch between primary (P1) and secondary (P2) channel
        description: 'Switch Radio Channel',
        deviceType: 'keyboard', // https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
        keybind: 'H' // All the keyboard keys can be found here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    },
    MainChannel: {
        description: 'Switch To Primary Channel', // Force switch to main channel
        deviceType: 'keyboard', // https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
        keybind: 'J' // All the keyboard keys can be found here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    },
    ChannelUp: {
        description: 'Switch To The Next Channel', // Force switch to main channel
        deviceType: 'keyboard', // https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
        keybind: 'F5' // All the keyboard keys can be found here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    },
    ChannelDown: {
        description: 'Switch To The Previous Channel', // Force switch to main channel
        deviceType: 'keyboard', // https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
        keybind: 'F6' // All the keyboard keys can be found here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    },
}

Config.RestrictedChannels = [
    // {
    //     frequency: 1,
    //     type: 'job', // job or gang;
    //     jobname: 'police', // name of job (not required if "jobtype" is set);
    //     jobtype: 'leo', // type of job (not required if "jobname" is set);
    //     jobgrade: 0 // Minimum job grade required to connect to the channel;
    // },
    // {
    //     frequency: 111,
    //     type: 'gang', // job or gang;
    //     gangname: 'lostmc', // name of gang;
    //     ganggrade: 0, // Minimum gang grade required to connect to the channel
    // },
]

Config.PoliceJob = {
    type: 'leo', // Type of all police jobs
    accessRestrictedChannels: false, // Allows on-duty police to connect to restricted channels
    minGrade: 0 // Minimum required grade to join restricted channels
}

Config.Battery = {
    enabled: true,
    item: 'radio_battery',
    progressBarDuration: 7000, // In milliseconds
    rate: {
        interval: 10, // In minutes
        percentage: 2 // What percentage to deduct
    }
}

Config.RadioScanner = true // Radio scanner integration (REQUIRES vfs-radioscanner)