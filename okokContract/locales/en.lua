Locales['en'] = {
    
    -- Success notifications
    ['success_solding_vehicle'] = {
        title = 'VEHICLE',
        text = 'You successfully sold the vehicle <b>${model}</b> with the plate number <b>${plate}</b>',
        type = 'success',
        time = 5000,
    },
    ['success_buying'] = {
        title = 'VEHICLE',
        text = 'You successfully bought the vehicle <b>${model}</b> with the plate number <b>${plate}</b>',
        type = 'success',
        time = 5000,
    },

    -- Error notifications
    ['near_error'] = {
        title = 'VEHICLE',
        text = 'No one nearby',
        type = 'error',
        time = 5000,
    },
    ['dont_own_vehicle'] = {
        title = 'VEHICLE',
        text = 'You do not own this vehicle',
        type = 'error',
        time = 5000,
    },
    ['cant_sell_vehicle'] = {
        title = 'VEHICLE',
        text = 'You can\'t sell this vehicle',
        type = 'error',
        time = 5000,
    },
    ['must_be_near_vehicle'] = {
        title = 'VEHICLE',
        text = 'You need to be near a vehicle in order to do that',
        type = 'error',
        time = 5000,
    },
    ['player_not_enough_money'] = {
        title = 'VEHICLE',
        text = '${player} doesn\'t have enough money to buy your vehicle',
        type = 'error',
        time = 5000,
    },
    ['not_enough_money'] = {
        title = 'VEHICLE',
        text = 'You don\'t have enough money to buy ${player}\'s vehicle',
        type = 'error',
        time = 5000,
    },
    ['not_yours'] = {
        title = 'VEHICLE',
        text = 'The vehicle with the plate number <b>${plate}</b> isn\'t yours',
        type = 'error',
        time = 5000,
    },
    ['doesnt_own_vehicle'] = {
        title = 'VEHICLE',
        text = '${player} tried to sell you a vehicle he doesn\'t own',
        type = 'error',
        time = 5000,
    },

    -- UI translations
    ['txt_contract_info'] = 'Contract Info',
    ['txt_vehicle'] = 'Vehicle',
    ['txt_contract1'] = 'This is a contract made between <span id="source_name"></span> (the Seller), and <span id="target_name"></span> (the Buyer), for the sale of Seller\'s <span id="vehicle_model"></span>, with the plate <span id="plate_number"></span>.',
    ['txt_plate'] = 'Plate',
    ['txt_price'] = 'Price (<span id="currency"></span>)',
    ['txt_buyer'] = 'Buyer',
    ['txt_send'] = 'SEND',
    ['txt_paper_title'] = 'Car Purchase and Sale Agreement',
    ['txt_contract2'] = 'The date of sale is <span id="date"></span>. Buyer agrees to pay to Seller the purchase price of <span id="price"></span> to be paid in <span class="pm">Bank Transfer</span>.',
    ['txt_contract3'] = 'The car is sold "AS IS" and the Seller makes no warranties about the condition of the car. Seller will provide the Buyer with all the vehicle documents.',
    ['txt_seller_signature'] = 'Seller\'s Signature',
    ['txt_buyer_signature'] = 'Buyer\'s Signature',
    ['txt_sign'] = 'SIGN CONTRACT',
    ['buy_vehicle'] = 'BUY VEHICLE',
    ['confirm_buy_vehicle'] = 'Do you want to buy this vehicle?',
}