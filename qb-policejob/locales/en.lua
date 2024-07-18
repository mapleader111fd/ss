local Translations = {
    error = {
        license_already = 'Player already has a license',
        error_license = 'Player doesn\'t have that license',
        no_camera = 'Camera doesn\'t exist',
        blood_not_cleared = 'Blood NOT cleared',
        bullet_casing_not_removed = 'Bullet Casings NOT Removed',
        none_nearby = 'No one nearby!',
        canceled = 'Canceled..',
        time_higher = 'Time must be higher than 0',
        amount_higher = 'Amount must be higher than 0',
        vehicle_cuff = 'You can\'t cuff someone in a vehicle',
        vehicle_tie = 'You can\'t tie someone in a vehicle',
        no_cuff = 'You don\'t have handcuffs on you',
        no_ziptie = 'You don\'t have ziptie on you',
        no_knife = 'You don\'t have knife on you',
        no_cutter = 'You don\'t have a cutter on you',
        no_impound = 'There are no impounded vehicles',
        no_spikestripe = 'Cannot place anymore spike strips',
        error_license_type = 'Invalid license type',
        rank_license = 'You are not a high enough rank to grant a license',
        revoked_license = 'You\'ve had a license revoked',
        rank_revoke = 'You are not a high enough rank to revoke a license',
        on_duty_police_only = 'For on-duty police only',
        vehicle_not_flag = 'Vehicle not flagged',
        not_towdriver = 'Not a tow truck driver',
        not_lawyer = 'Person is not a lawyer',
        no_anklet = 'This person doesn\'t have an anklet on.',
        have_evidence_bag = 'You must have an empty evidence bag with you',
        no_driver_license = 'No drivers license',
        not_cuffed_dead = 'Civilian isn\'t cuffed or dead',
        fine_yourself = 'You Cannot Fine Yourself',
        not_online = 'This person is not online',
        clearspawnpoint = 'The spawn location is blocked, clear the spawnpoint!',
        alradyhaveheli = 'You already have a helicopter!',
        already_cuffed = 'The player is already cuffed!',
        where_looking = 'Where are you looking at ? Stay on the right side!',
        cant_cut = 'You can\'t open the item with this!',
        not_enough_money = 'You don\'t have enough money on you!',
        break_out = 'The suspect have broken out from cuffing !',
        dont_have_evidence_bag = 'You don\'t have evidence bag',
        ondutyonly = "For onduty police only!",
        stationbusy = 'Repair guy is busy at the moment..',
        no_weapon_hand = 'You don\'t have a weapon in hand',
        weapon_not_damaged = 'Your weapon is not damaged!',
        not_your_weapon = 'This weapon doesn\'t belong to you!',
        while_incar = 'You can\'t do that while in car!',
        alreadyinstall = '%{value} already installed',
        extradeactive = 'Extra %{value} has been deactivated',
        cantusemenu = 'You can\'t use this menu..',
        cantcuffcooldown = 'You can\'t use cuff while in cooldown'
    },
    success = {
        uncuffed = 'You have been uncuffed',
        untied = 'You have been untied',
        granted_license = 'You have been granted a license',
        grant_license = 'You granted a license',
        revoke_license = 'You revoked a license',
        tow_paid = 'You were paid $500',
        blood_clear = 'Blood Cleared',
        bullet_casing_removed = 'Bullet Casings Removed...',
        anklet_taken_off = 'Your ankle tracker is taken off.',
        took_anklet_from = 'You took off %{firstname} %{lastname} tracker',
        put_anklet = 'You put on an ankle tracker.',
        put_anklet_on = 'You put on an ankle tracker on %{firstname} %{lastname}',
        vehicle_flagged = 'Vehicle %{plate} has been flagged for %{reason}',
        impound_vehicle_removed = 'Vehicle taken out of impound!',
        impounded = 'Vehicle impounded',
        beingonduty = 'You\'re on duty',
        beingoffduty = 'You\'re off duty',
        cuffed_player = 'You have succesfully cuffed the citizen',
        extraactive = 'Extra %{value} has been activated',
        purchased = 'You purchased police vehicle and can store it in garage.'
    },
    info = {
        mr = 'Mr.',
        mrs = 'Mrs.',
        impound_price = 'Price the player pays to get vehicle out of impound (can be 0)',
        plate_number = 'License Plate Number',
        flag_reason = 'Reason for flagging vehicle',
        camera_id = 'Camera ID',
        callsign_name = 'Name of your callsign',
        poobject_object = 'Object type to spawn or \'delete\' to delete',
        player_id = 'ID of Player',
        citizen_id = 'Citizen ID of Player',
        dna_sample = 'DNA Sample',
        jail_time = 'Time they have to be in jail',
        jail_time_no = 'Jail time needs to be higher than 0',
        license_type = 'License Type (driver/weapon/hunting)',
        ankle_location = 'Ankle Tracker Location',
        cuff = 'You are cuffed!',
        tied = 'You are tied!',
        cuffed_walk = 'You are cuffed, but you can walk',
        vehicle_flagged = 'Vehicle %{vehicle} is flagged for: %{reason}',
        unflag_vehicle = 'Vehicle %{vehicle} is unflagged',
        tow_driver_paid = 'You paid the tow truck driver',
        paid_lawyer = 'You paid a lawyer',
        vehicle_taken_depot = 'Vehicle taken into depot for $%{price}',
        vehicle_seized = 'Vehicle seized into impound for $%{price}',
        stolen_money = 'You have stolen $%{stolen}',
        cash_robbed = 'You have been robbed of $%{money}',
        driving_license_confiscated = 'Your driving license has been confiscated',
        cash_confiscated = 'Your cash was confiscated',
        being_searched = 'You are being searched',
        cash_found = 'Found $%{cash} on the civilian',
        sent_jail_for = 'You sent the person to prison for %{time} months',
        fine_received = 'You received a fine of $%{fine}',
        blip_text = 'Police Alert - %{value}',
        jail_time_input = 'Jail time',
        submit = 'Submit',
        time_months = 'Time in Months',
        bill = 'Bill',
        amount = 'Amount',
        police_plate = 'LSPD', --Should only be 4 characters long
        heli_plate = 'ZULU', --Should only be 4 characters long
        vehicle_info = 'Bill: $%{billvalue}<br>Engine: %{value} % | Fuel: %{value2} %',
        evidence_stash = 'Evidence Stash | %{value}',
        slot = 'Slot no (1,2,3)',
        current_evidence = 'Stash #%{value} | Drawer #%{value2}',
        general_current_evidence = 'General Evidence Stash | #%{value}',
        on_duty = '[E] - Go on duty',
        off_duty = '[E] - Go off duty',
        onoff_duty = '~g~On~s~/~r~Off~s~ Duty',
        stash = 'Stash %{value}',
        delete_spike = '[~r~E~s~] Delete Spike Strip',
        close_camera = 'Close Camera',
        bullet_casing = '[~g~G~s~] Bullet Casing %{value}',
        casing = 'Bullet Casing',
        blood = 'Blood',
        blood_text = '[~g~G~s~] Blood %{value}',
        fingerprint_text = '[G] Fingerprint',
        fingerprint = 'Fingerprint',
        store_heli = '[E] Store Helicopter',
        take_heli = '[E] Take Helicopter',
        impound_veh = '[E] - Impound Vehicle',
        store_veh = '[E] - Store Vehicle',
        take_veh = '[E] - Take Vehicle',
        armory = 'Armory',
        enter_armory = '[E] Armory',
        finger_scan = 'Fingerprint Scanning',
        scan_fingerprint = '[E] Scan Fingerprint',
        trash = 'Trash',
        trash_enter = '[E] Trash Bin',
        stash_enter = '[E] Enter Locker',
        target_location = 'The location of %{firstname} %{lastname} is marked on your map',
        anklet_location = 'Anklet location',
        new_call = 'New Call',
        officer_down = 'Officer %{lastname} | %{callsign} Down',
        fine_issued = 'Fine has been issued to offender succesfully',
        received_fine = 'State Debt Recovery has automatically recovered the fines owed...',
        unknown = 'Unknown',
        tow_vehicle = 'Tow vehicle',
        select_for_examine_b = 'Street: %{street}<br>Label: %{label}<br>Slot: %{slot}',
        input_impound_price = 'Tow price',
        place_cancel = '[E] - Place Prop / [G] - Cancel',
        place_object = ''
    },
    evidence = {
        red_hands = 'Red hands',
        wide_pupils = 'Wide Pupils',
        red_eyes = 'Red Eyes',
        weed_smell = 'Smells like weed',
        gunpowder = 'Gunpowder in clothing',
        chemicals = 'smells chemical',
        heavy_breathing = 'Breathes heavily',
        sweat = 'Sweats a lot',
        handbleed = 'Blood on hands',
        confused = 'Confused',
        alcohol = 'Smells like alcohol',
        heavy_alcohol = 'Smells very much like alcohol',
        agitated = 'Agitated - Signs of Meth Use',
        serial_not_visible = 'Serial number not visible...',
        examine_menu_blood_h = 'Blood',
        examine_menu_blood_b = 'By examining the blood you can find out the person\'s dna code and blood group',
        examine_menu_casing_h = 'Casing',
        examine_menu_casing_b = 'By examining the bullet casing you can determine the model and serial number of the weapon',
        examine_menu_fingerprint_b = 'Fingerprint',
        examine_menu_fingerprint_h = 'By examining the evidence and identifying the person\'s fingerprint id'
    },
    menu = {
        garage_title = 'Police Vehicles',
        close = '⬅ Close Menu',
        close_x = 'Close the menu',
        impound = 'Impounded Vehicles',
        pol_impound = 'Police Impound',
        pol_garage = 'Police Garage',
        pol_armory = 'Police Armory',
        evd_drawer_h = 'Evidence Drawer',
        evd_drawer_b = 'You can access the drawer by entering an evidence number',
        evd_stash_h = 'General Evidence Stash',
        evd_stash_b = 'The stash of evidence you can use in general',
        dty_onduty = 'On Duty',
        dty_offduty = 'Off Duty',
        dty_beonduty = 'Sign to on duty',
        dty_beoffduty = 'Sign to off duty',
        spawn_heli = 'Spawn Helicopter',
        remove_heli = 'Remove Helicopter',
        evd_research = 'Research the evidence',
        tow_menu_header_b = 'Vehicle: %{vehicle} <br>Plate:%{plate}',
        tow_menu_depot_h = 'Depot',
        tow_menu_depot_b = 'You can send the car to impound garages and can write a ticket',
        tow_menu_impound_h = 'Impound',
        tow_menu_impound_b = 'You can send the vehicle to the impound garages in the police building and can write a ticket',
        gps_offline = 'GPS is offline',
        gps_online = 'GPS is online',
        activate_gps = 'Activate GPS',
        deactivate_gps = 'Deactivate GPS',
        carprice = 'Price : $%{value}',
        carfree = 'Price : Free',
        confirm = 'Confirm',
        returncar = 'Return %{vehicle}',
        takeout = 'Take out %{vehicle}',
        takeoutfor = 'Take out for %{price}',
        vehmenu = '%{vehicle} Menu',
        vehmenudesc = 'Take out or return your vehicle',
        dutystatus = 'Your duty status: %{value}',
        stashname = 'Police Locker %{value}',
        changelivery = 'Change livery to %{value}',
        liveryhead = 'Choose your livery',
        vehexthead = 'Extra %{value}',
        vehextdesc = 'Change extra option %{value}',
        extrasmenu = 'Extras Menu',
        extrasmenudesc = 'Change your vehicle extras',
        livhead = 'Change Liveries',
        livheaddesc = 'Change your vehicle liveries',
        exthead = 'Change Extras',
        extheaddesc = 'Change your vehicle extras',
        livmenuhead = 'Livery Menu',
        write = 'Write',
        evidencehead = '%{value} evidences',
    },
    objmenu = {
        obj_header = 'Object Spawner',
        spawn_cone = 'Spawn Cone',
        spawn_barrier = 'Spawn Barrier',
        spawn_roadsign = 'Spawn Roadsign',
        spawn_tent = 'Spawn Tent',
        spawn_light = 'Spawn Light',
        remove_object = 'Remove Object'
    },
    email = {
        sender = 'Central Judicial Collection Agency',
        subject = 'Debt collection',
        message = 'Dear %{value}. %{value2}, <br /><br />The Central Judicial Collection Agency (CJCA) charged the fines you received from the police.<br />There is <strong>$%{value3}</strong> withdrawn from your account.<br /><br />Kind regards,<br />Mr. I.K. Graai',
    },
    commands = {
        place_spike = 'Place Spike Strip (Police Only)',
        license_grant = 'Grant a license to someone',
        license_revoke = 'Revoke a license from someone',
        place_object = 'Place/Delete An Object (Police Only)',
        cuff_player = 'Cuff Player (Police Only)',
        escort = 'Escort Player',
        callsign = 'Give Yourself A Callsign',
        clear_casign = 'Clear Area of Casings (Police Only)',
        jail_player = 'Jail Player (Police Only)',
        unjail_player = 'Unjail Player (Police Only)',
        clearblood = 'Clear The Area of Blood (Police Only)',
        seizecash = 'Seize Cash (Police Only)',
        softcuff = 'Soft Cuff (Police Only)',
        camera = 'View Security Camera (Police Only)',
        flagplate = 'Flag A Plate (Police Only)',
        unflagplate = 'Unflag A Plate (Police Only)',
        plateinfo = 'Run A Plate (Police Only)',
        depot = 'Impound With Price (Police Only)',
        impound = 'Impound A Vehicle (Police Only)',
        paytow = 'Pay Tow Driver (Police Only)',
        paylawyer = 'Pay Lawyer (Police, Judge Only)',
        anklet = 'Attach Tracking Anklet (Police Only)',
        ankletlocation = 'Get the location of a persons anklet',
        removeanklet = 'Remove Tracking Anklet (Police Only)',
        drivinglicense = 'Seize Drivers License (Police Only)',
        takedna = 'Take a DNA sample from a person (empty evidence bag needed) (Police Only)',
        police_report = 'Police Report',
        message_sent = 'Message to be sent',
        civilian_call = 'Civilian Call',
        emergency_call = 'New 911 Call',
        fine = 'Fine A Person'
    },
    progressbar = {
        blood_clear = 'Clearing Blood...',
        bullet_casing = 'Removing bullet casings..',
        robbing = 'Robbing Person...',
        place_object = 'Placing object..',
        remove_object = 'Removing object..',
        impound = 'Impounding Vehicle..',
        researchevidence = 'Inspecting evidence',
        examining = 'Examining %{label}',
        repairing = 'Repairing weapon..',
        cuttingcuff = 'Cutting cuffs...',
    },
    target = {
        duty = 'Change Duty',
        stash = 'Open Personal Stash',
        trash = 'Open Trash',
        fingerprint = 'Open Fingerprint',
        armoury = 'Open Armory',
        quickequip = 'Quick Equip',
        evidence = 'Open Evidence',
        pickup = 'Pick Up',
        repairweapon = 'Repair Weapon',
        takeback = "Take Weapon Back",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
