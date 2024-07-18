const resource = window.GetParentResourceName ? window.GetParentResourceName() : "nui-frame-app";

var targetNameSeller = ""
var ownercitizenid = ""
var vehicleModel = ""
var plateNumber = ""
var description = ""
var vehicleName = ""
var sourceName = ""
var targetName = ""
var date = ""

var selectedWindow = "none"

var sourceID = 0
var targetID = 0
var price = 0

var closePlayers = []
var locales = []
var Config = []

var okokVehicleSalesToSell = false
var okokvehicleowned = false

function GetConfigAndLocales() {
    fetch(`https://${resource}/GetConfig`, {
        method: "post",
        headers: {
            "Content-type": "application/json; charset=UTF-8",
        },
    })
    .then((resp) => resp.json())
    .then((resp) => {
        Config = resp.config;
        locales = resp.locales;
		
        $("#txt_contract_info").html(locales["txt_contract_info"]);
        $("#txt_vehicle").html(locales["txt_vehicle"]);
        $("#txt_contract1").html(locales["txt_contract1"]);
        $("#txt_plate").html(locales["txt_plate"]);
        $("#txt_price").html(locales["txt_price"]);
        $("#txt_buyer").html(locales["txt_buyer"]);
        $(".txt_send").html(locales["txt_send"]);
        $("#txt_paper_title").html(locales["txt_paper_title"]);
        $("#txt_contract2").html(locales["txt_contract2"]);
        $("#txt_contract3").html(locales["txt_contract3"]);
        $("#txt_seller_signature").html(locales["txt_seller_signature"]);
        $("#txt_buyer_signature").html(locales["txt_buyer_signature"]);
    })
    .catch((e) => {
        console.log("Error getting config and locales", e);
    });
}


GetConfigAndLocales();

window.addEventListener('message', function(event) {
	switch (event.data.action) {
		case 'openContractSeller':
			var priceText = event.data.price;
			if (Config.CurrencyOnLeft) {
				priceText = Config.Currency + priceText;
			} else {
				priceText = priceText + Config.Currency;
			}
			$("#buy-sell-button").html('');
			$("#buy-sell-button").html(`<button type="button" id="signContract1" class="btn btn-blue txt_sign"></button>`);
			$(".txt_sign").html(locales["txt_sign"]);
			$("#source_name").html(event.data.source_playername);
			$("#target_name").html(event.data.target_playername);
			$("#vehicle_model").html(event.data.model);
			$("#plate_number").html(event.data.plate);
			$("#date").html(event.data.date);
			$("#description").html(event.data.description);
			$("#price").html(priceText);
			sourceID = event.data.sourceID;
			targetID = event.data.targetID;
			sourceName = event.data.source_playername;
			targetName = event.data.target_playername;
			vehicleModel = event.data.model;
			plateNumber = event.data.plate;
			date = event.data.date;
			description = event.data.description;
			price = event.data.price;
			okokvehicleowned = event.data.okokvehicleowned;
			ownercitizenid = event.data.ownercitizenid;
			requireItem = event.data.requireItem;
			itemName = event.data.itemName;
			okokVehicleSalesToSell = event.data.okokVehicleSalesToSell;

			$("#sign1").html("");
			$("#sign2").html("");
			$("#signContract1").attr("disabled", false);

			$("#signContract1").removeClass('d-none');
			$("#signContract2").addClass('d-none');

			$(".contract_menu").fadeIn();

			selectedWindow = "openContractSeller"
			break
		case 'openContractInfo':
			closePlayers = event.data.closePlayers;
			document.getElementById('submitContractInfo').disabled = true;
			$("#vehicle_name").html(event.data.model);
			$("#vehicle_plate").html(event.data.plate);
			$("#currency").html(Config.Currency);
			
			var player_dropdown = document.getElementById("player_dropdown");
			var length = player_dropdown.options.length;
			for (i = length-1; i >= 0; i--) {
				player_dropdown.options[i] = null;
			}

			var option = document.createElement("option");
			option.text = "Select a player";
			option.value = "0";
			player_dropdown.add(option);
			for (var i = 0; i < closePlayers.length; i++) {
				var option = document.createElement("option");
				option.text = closePlayers[i].name;
				option.value = closePlayers[i].id;
				player_dropdown.add(option);
			}

			$(".vehicleinfo_menu").fadeIn();

			selectedWindow = "openContractInfo"
			break
		case 'openContractOnBuyer':
			var priceText = event.data.price;
			if (Config.CurrencyOnLeft) {
				priceText = Config.Currency + priceText;
			} else {
				priceText = priceText + Config.Currency;
			}
			$("#buy-sell-button").html('');
			$("#buy-sell-button").html(`<button type="button" id="signContract2" class="btn btn-blue txt_sign2"></button>`);
			$(".txt_sign2").html(locales["txt_sign"]);
			$("#source_name").html(event.data.source_playername);
			$("#target_name").html(event.data.target_playername);
			$("#vehicle_model").html(event.data.model);
			$("#plate_number").html(event.data.plate);
			$("#date").html(event.data.date);
			$("#description").html(event.data.description);
			$("#price").html(priceText);
			sourceNameSeller = event.data.source_playername;
			targetNameSeller = event.data.target_playername;
			targetIDSeller = event.data.targetID;
			sourceIDSeller = event.data.sourceID;
			plateNumberSeller = event.data.plate;
			modelSeller = event.data.model;
			vehicle_price = event.data.price;
			okokvehicleowned = event.data.okokvehicleowned;
			ownercitizenid = event.data.ownercitizenid;
			vehicleName = event.data.vehicleName;
			okokVehicleSalesToSell = event.data.okokVehicleSalesToSell;

			$("#sign1").html("");
			$("#sign2").html("");
			$("#signContract2").attr("disabled", false);

			var sellerSignatureP = new Vara("#sign1","SatisfySL.json", [{
				text: event.data.source_playername,
				fontSize: 20, 
				strokeWidth: 2,
				color: "#000",
				id: "",
				duration: 0,
				textAlign: "center",
				x: 0,
				y: 0, 
				fromCurrentPosition:{ 
					x: true,
					y: true,
				},
				autoAnimation: true,
				queued: true,
				delay: 0,
				letterSpacing: 0
			}]);

			$("#signContract1").addClass('d-none');
			$("#signContract2").removeClass('d-none');

			$(".contract_menu").fadeIn();

			selectedWindow = "openContractOnBuyer"
			break
	}
});

// Button Actions
$(document).on('click', '#submitContractInfo', function() {
	var vehicle_price = $("#price_input").val();
	var player_dropdown = $("#player_dropdown").val();
	var vehicle_plate = document.getElementById("vehicle_plate").textContent;
	var vehicle_model = document.getElementById("vehicle_name").textContent;

	if(!vehicle_price || player_dropdown == 0 && vehicle_price >= 0) {
		$.post(`https://${resource}/action`, JSON.stringify({
			action: "missingInfo",
		}));
	} else {
		$(".vehicleinfo_menu").fadeOut();
		$.post(`https://${resource}/action`, JSON.stringify({
			action: "submitContractInfo",
			vehicle_price: vehicle_price,
			player_id: player_dropdown,
			vehicle_plate: vehicle_plate,
			vehicle_model: vehicle_model,
		}));

		setTimeout(function() {
			$("#price_input").val("");
		}, 400);
	}
})

$(document).on('click', "#signContract1", function() {
	var sellerSignature = new Vara("#sign1","SatisfySL.json", [{
		text: sourceName,
		fontSize: 20, 
		strokeWidth: 2,
		color: "#000",
		id: "",
		duration: 3000,
		textAlign: "center",
		x: 0,
		y: 0, 
		fromCurrentPosition:{ 
			x: true,
			y: true,
		},
		autoAnimation: true,
		queued: true,
		delay: 0,
		letterSpacing: 0
	}]);

	$("#signContract1").attr("disabled", true);

	setTimeout(function(){
		$.post(`https://${resource}/action`, JSON.stringify({
			action: "signContract1",
			sourceID: sourceID,
			targetID: targetID,
			sourceName: sourceName,
			targetName: targetName,
			vehicleModel: vehicleModel,
			plateNumber: plateNumber,
			date: date,
			description: description,
			price: price,
			okokvehicleowned: okokvehicleowned,
			ownercitizenid: ownercitizenid,
			vehicleName: vehicleName,
			okokVehicleSalesToSell: okokVehicleSalesToSell,
		}));
		$(".contract_menu").fadeOut();
	}, 6000);
});

$(document).on('click', "#signContract2", function() {
	var buyerSignature = new Vara("#sign2","SatisfySL.json", [{
		text: targetNameSeller,
		fontSize: 20, 
		strokeWidth: 2,
		color: "#000",
		id: "",
		duration: 3000,
		textAlign: "center",
		x: 0,
		y: 0, 
		fromCurrentPosition:{ 
			x: true,
			y: true,
		},
		autoAnimation: true,
		queued: true,
		delay: 0,
		letterSpacing: 0
	}]);

	$("#signContract2").attr("disabled", true);

	setTimeout(function(){
		$.post(`https://${resource}/action`, JSON.stringify({
			action: "signContract2",
			targetIDSeller: targetIDSeller,
			plateNumberSeller: plateNumberSeller,
			sourceIDSeller: sourceIDSeller,
			modelSeller: modelSeller,
			sourceNameSeller: sourceNameSeller,
			targetNameSeller: targetNameSeller,
			vehicle_price: vehicle_price,
			okokvehicleowned: okokvehicleowned,
			ownercitizenid: ownercitizenid,
			vehicleName: vehicleName,
			okokVehicleSalesToSell: okokVehicleSalesToSell,
		}));
		$(".contract_menu").fadeOut();
	}, 6000);
});

$(document).on('click', "#closevehicleinfo_menu", function() {
	$(".vehicleinfo_menu").fadeOut();

	setTimeout(function() {
		$("#vehicle_description").val("");
		$("#price_input").val("");

		$.post(`https://${resource}/action`, JSON.stringify({
			action: "close",
		}));
	}, 400);
});

// Close ESC Key
$(document).ready(function() {
	document.onkeyup = function(data) {
		if (data.which == 27) {
			switch (selectedWindow) {
				case 'openContractSeller':
					$(".contract_menu").fadeOut();

					$.post(`https://${resource}/action`, JSON.stringify({
						action: "close",
					}));
					break
				case 'openContractInfo':
					$(".vehicleinfo_menu").fadeOut();

					setTimeout(function() {
						$("#vehicle_description").val("");
						$("#price_input").val("");
					}, 400);

					$.post(`https://${resource}/action`, JSON.stringify({
						action: "close",
					}));
					break
				case 'openContractOnBuyer':
					$(".contract_menu").fadeOut();

				    $.post(`https://${resource}/action`, JSON.stringify({
				        action: "close",
				    }));
					break
			}
		}
	};
});

function checkIfEmpty() {
	if (document.getElementById("price_input").value != 0 && document.getElementById("player_dropdown").value != 0) {
		document.getElementById('submitContractInfo').disabled = false;
	} else {
		document.getElementById('submitContractInfo').disabled = true;
	}
}