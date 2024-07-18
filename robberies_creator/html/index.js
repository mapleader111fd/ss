const resName = GetParentResourceName();
let hasDoorsCreator = null; // editing this is useless, don't do it

/* Utils */

async function placeObjectAndReturnCoords(object) {
	$("html").hide();
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/placeObjectAndReturnCoords`, JSON.stringify({object: object}), function(coords) {
			$("html").show();
			resolve(coords);
		})
	})
}

async function placeGasPoints() {
	$("html").hide();
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/placeGasPoints`, JSON.stringify(), function(gasPoints) {
			$("html").show();
			resolve(gasPoints);
		})
	})
}

// Open/Close menu
function openMenu(version, fullConfig) {
	$("#robbery-creator-version").text(version);

	loadSettings(fullConfig);
	loadHeists();
	loadCargoRobberies();
	loadPlannings();

    $("#robbery-creator").show()
}

function closeMenu() {
	// Resets current active tab
	$("#robbery-creator").find(".nav-link, .tab-pane").each(function() {
		if($(this).data("isDefault") == "1") {
			$(this).addClass(["active", "show"])
		} else {
			$(this).removeClass(["active", "show"])
		}
	})
	
    $("#robbery-creator").hide();

    $.post(`https://${resName}/close`, {})
}
$("#close-main-btn").click(closeMenu);

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	switch(action) {

		case "openMenu": {
			openMenu(data.version, data.fullConfig);

			break;
		}

		case "hasDoorsCreator": {
			hasDoorsCreator = data.hasDoorsCreator;

			break;
		}
	}
})

function loadSettings(fullConfig) {

	// Generic
	setTomSelectValue("#settings_locale", fullConfig.locale)
	$("#settings_acePermission").val(fullConfig.acePermission);
	$("#settings_can_always_carry").prop("checked", fullConfig.canAlwaysCarryItem);
	$("#settings_can_receive_multiple_same_item").prop("checked", fullConfig.canReceiveMultipleTimesTheSameItem);
	$("#settings-global-timeout").val(fullConfig.globalMinutesTimeout);

	// Targeting
	setTomSelectValue("#settings-targeting-script", fullConfig.targetingScript)

	// Help notification
	setTomSelectValue("#settings-help-notification-script", fullConfig.helpNotification)	

	// NPC Mugging - Shared
	$("#enable-npc-mugging").prop("checked", fullConfig.isNpcMuggingEnabled).change();
	$("#seconds-to-mug").val(fullConfig.secondsToMug);

	// NPC Mugging - Client
	$("#can-make-npc-to-follow").prop("checked", fullConfig.clNpcMugging.canMakeFollow);
	$("#npc-mugging-cooldown-on-mugging").val(fullConfig.clNpcMugging.cooldownOnMugging);

	// NPC Mugging - Keys
	$("#npc-mugging-key-to-mug").val(fullConfig.npcMuggingKeys.keyToMug);
	$("#npc-mugging-key-to-follow").val(fullConfig.npcMuggingKeys.keyToFollow);
	$("#npc-mugging-key-to-go-away").val(fullConfig.npcMuggingKeys.keyToGoAway);

	// NPC Mugging - Server
	setNpcMuggingRobbableObjects(fullConfig.svNpcMugging.robbableObjects)
	$("#npc-mugging-minimum-police").val(fullConfig.svNpcMugging.minimumPolice)
	$("#npc-mugging-probability-police-alert").val(fullConfig.svNpcMugging.probabilityPoliceAlert)
	$("#npc-mugging-minimum-objects-amount").val(fullConfig.svNpcMugging.minimumObjectsAmount)
	$("#npc-mugging-maximum-objects-amount").val(fullConfig.svNpcMugging.maximumObjectsAmount)
	$("#minutes-before-automatically-run-away").val(fullConfig.svNpcMugging.minutesAfterAutomaticallyRunAway);
	$("#npc-mugging-max-npcs-following").val(fullConfig.svNpcMugging.maxNPCsFollowing);

	// Gas mask
	$("#gas-mask-item-name").val(fullConfig.gasMask.name);
	$("#gas-mask-item-duration").val(fullConfig.gasMask.duration);
	$("#gas-mask-lose-on-use").prop("checked", fullConfig.gasMask.loseOnUse);
	$("#gas-mask-cloth-id").val(fullConfig.gasMaskClothId);

	// Drill
	$("#drill-required-for-cargo-robbery").prop("checked", fullConfig.drill.requiredForCargoRobbery);
	$("#drill-item-name").val(fullConfig.drill.name);
	$("#drill-lose-on-use").prop("checked", fullConfig.drill.loseOnUse);

	// Cargo robbery
	$("#cargo-robbery-minutes-delete-after-robbed").val(fullConfig.cargoRobbery.minutesBeforeDeleteAfterRobbed);
	$("#cargo-robbery-minutes-delete-after-arrived").val(fullConfig.cargoRobbery.minutesBeforeDeleteAfterArrived);
	$("#cargo-robbery-max-minutes-difference-from-defined-date").val(fullConfig.cargoRobbery.maxMinutesDifferenceFromDefinedDate);
	$("#cargo-robbery-probability-police-alert").val(fullConfig.cargoRobbery.probabilityPoliceAlert);

	// Discord logs
	$("#settings_isDiscordLogActive").prop("checked", fullConfig.areDiscordLogsActive);
	toggleDiscordLogsInSettings(fullConfig.areDiscordLogsActive);

	$("#settings_discordWebhook").val(fullConfig.mainDiscordWebhook);

	for(const[logType, webhook] of Object.entries(fullConfig.specificWebhooks)) {
		$("#settings_specific_webhooks").find(`[data-log-type="${logType}"]`).val(webhook);
	}
}


/* Discord logs */
function toggleDiscordLogsInSettings(enable) {
	$("#settings_discordWebhook").prop("disabled", !enable);
	$("#settings_discordWebhook").prop("required", enable);
	
	$("#settings_specific_webhooks").find(`.form-control`).prop("disabled", !enable);
}

$("#settings_isDiscordLogActive").change(function() {
	let enabled = $(this).prop("checked");

	toggleDiscordLogsInSettings(enabled);
})

function getSeparatedDiscordWebhooks() {
	let webhooks = {};

	$("#settings_specific_webhooks").find(".form-control").each(function(index, element) {
		let logType = $(element).data("logType");
		let webhook = $(element).val();

		if(webhook) {
			webhooks[logType] = webhook;
		}
	});

	return webhooks;
}
/* Discord logs END */

$("#settings").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		gasMaskClothId: parseInt( $("#gas-mask-cloth-id").val() ),
		targetingScript:$("#settings-targeting-script").val(),
		helpNotification: $("#settings-help-notification-script").val(),

		// NPC Mugging - Keys
		npcMuggingKeys: {
			keyToMug: parseInt($("#npc-mugging-key-to-mug").val()),
			keyToFollow: parseInt($("#npc-mugging-key-to-follow").val()),
			keyToGoAway: parseInt($("#npc-mugging-key-to-go-away").val()),
		}
	}

	let sharedSettings = {
		locale: $("#settings_locale").val(),
	}

	let serverSettings = {
		
		// Generic
		canAlwaysCarryItem: $("#settings_can_always_carry").prop("checked"),
		canReceiveMultipleTimesTheSameItem: $("#settings_can_receive_multiple_same_item").prop("checked"),
		acePermission: $("#settings_acePermission").val(),
		globalMinutesTimeout: parseInt( $("#settings-global-timeout").val() ),

		gasMask: {
			name: $("#gas-mask-item-name").val(),
			duration: parseInt( $("#gas-mask-item-duration").val() ),
			loseOnUse: $("#gas-mask-lose-on-use").prop("checked"),
		},

		drill: {
			requiredForCargoRobbery: $("#drill-required-for-cargo-robbery").prop("checked"),
			name: $("#drill-item-name").val(),
			loseOnUse: $("#drill-lose-on-use").prop("checked")
		},
		
		cargoRobbery: {
			minutesBeforeDeleteAfterRobbed: parseInt( $("#cargo-robbery-minutes-delete-after-robbed").val() ),
			minutesBeforeDeleteAfterArrived: parseInt( $("#cargo-robbery-minutes-delete-after-arrived").val() ),
			maxMinutesDifferenceFromDefinedDate: parseInt( $("#cargo-robbery-max-minutes-difference-from-defined-date").val() ),
			probabilityPoliceAlert: parseInt( $("#cargo-robbery-probability-police-alert").val() ),
		},

		// Discord logs
		areDiscordLogsActive: $("#settings_isDiscordLogActive").prop("checked"),
		mainDiscordWebhook: $("#settings_discordWebhook").val(),
		specificWebhooks: getSeparatedDiscordWebhooks(),
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: clientSettings,
		sharedSettings: sharedSettings,
		serverSettings: serverSettings,
	}));

	showServerResponse(response)

	refreshTranslations(sharedSettings.locale);
});

/*
██   ██ ███████ ██ ███████ ████████ ███████ 
██   ██ ██      ██ ██         ██    ██      
███████ █████   ██ ███████    ██    ███████ 
██   ██ ██      ██      ██    ██         ██ 
██   ██ ███████ ██ ███████    ██    ███████ 
*/

let heistsDatatable = $("#heists-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editHeist(id);
		})
	},
});

let heists = {};

function loadHeists() {
	$.post(`https://${resName}/getAllHeists`, {}, async function(rawHeists) {

		// Manually create the table to avoid incompatibilities due table indexing
		heists = {};

		for(const[k, heistData] of Object.entries(rawHeists)) {
			heists[heistData.id] = heistData;
		}

		heistsDatatable.clear();

		for(const[id, heistData] of Object.entries(heists)) {
			heistsDatatable.row.add([
				id,
				heistData.label,
				heistData.stages.length
			]);
		}

		heistsDatatable.draw();
	})
}

function setDefaultDataOfHeistModal() {
	$("#heist-label").val("Default");
	$("#heist-minimum-police").val(0);
	$("#heist-timeout").val(120);
	$("#heist-reset").val(60);
	$("#heist-time-limit-minutes").val(0);

	$("#heist-stages").empty();
}

$("#new-heist-btn").click(function() {
	let heistModal = $("#heist-modal");

	// Converts from edit modal to create modal
	heistModal.data("action", "create");
	
	$("#delete-heist-btn").hide();
	$("#save-heist-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfHeistModal();

	heistModal.modal("show");
})

function editHeist(id) {
	let heistData = heists[id];

	let heistModal = $("#heist-modal");

	heistModal.data("action", "edit");
	heistModal.data("heistId", id);
	
	$("#delete-heist-btn").show();
	$("#save-heist-btn").text( getLocalizedText("menu:save") );

	$("#heist-label").val(heistData.label);
	$("#heist-minimum-police").val(heistData.minimumPolice);
	$("#heist-timeout").val(heistData.timeoutMinutes);
	$("#heist-reset").val(heistData.minutesBeforeReset);
	$("#heist-time-limit-minutes").val(heistData.timeLimitMinutes);


	$("#heist-stages").empty();
	heistData.stages.forEach(stage => {
		addHeistStage(stage);
	})

	heistModal.modal("show");
}

/*
██████   ██████  ██████  ██████   █████  ██████  ██      ███████      ██████  ██████       ██ ███████  ██████ ████████ ███████ 
██   ██ ██    ██ ██   ██ ██   ██ ██   ██ ██   ██ ██      ██          ██    ██ ██   ██      ██ ██      ██         ██    ██      
██████  ██    ██ ██████  ██████  ███████ ██████  ██      █████       ██    ██ ██████       ██ █████   ██         ██    ███████ 
██   ██ ██    ██ ██   ██ ██   ██ ██   ██ ██   ██ ██      ██          ██    ██ ██   ██ ██   ██ ██      ██         ██         ██ 
██   ██  ██████  ██████  ██████  ██   ██ ██████  ███████ ███████      ██████  ██████   █████  ███████  ██████    ██    ███████ 
*/

function getAllRobbableObjectsFromStageDiv(stageDiv) {
	let robbableObjects = [];
	const stepMethod = "ROBBABLE_OBJECT"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let robbableObjectDiv = $(this);

		let robbableObject = {
			method: stepMethod,
			type: robbableObjectDiv.find(".object-type").val(),
			coords: {
				x: parseFloat( robbableObjectDiv.find(".coords-x").val() ),
				y: parseFloat( robbableObjectDiv.find(".coords-y").val() ),
				z: parseFloat( robbableObjectDiv.find(".coords-z").val() ),
			},
			heading: parseFloat( robbableObjectDiv.find(".heading").val() ),	
			blipData : robbableObjectDiv.data("blipData") || getDefaultBlipCustomization(),
			item: {
				type: robbableObjectDiv.find(".item-type").val(),
				name: robbableObjectDiv.find(".item-name").val(),
				minQuantity: parseInt( robbableObjectDiv.find(".item-min-quantity").val() ),
				maxQuantity: parseInt( robbableObjectDiv.find(".item-max-quantity").val() ),
			},
			isOptional: robbableObjectDiv.find(".is-optional-checkbox").prop("checked"),
			isInvisible: robbableObjectDiv.find(".is-invisible-checkbox").prop("checked"),
		}

		robbableObjects.push(robbableObject);
	});

	return robbableObjects
}

async function addRobbableObjectHeist(stageDiv, robbableObject) {
	let robbableObjectDiv = $(`
		<div class="mb-5" data-step-method="ROBBABLE_OBJECT">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:robbable_object")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">

				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<select class="form-select object-type" style="width: auto;">
					<option selected value="cash_1">${ getLocalizedText("menu:cash_1") }</option>
					<option value="cash_2">${ getLocalizedText("menu:cash_2") }</option>
					<option value="cash_3">${ getLocalizedText("menu:cash_3") }</option>
					<option value="gold_1">${ getLocalizedText("menu:gold_1") }</option>
					<option value="gold_2">${ getLocalizedText("menu:gold_2") }</option>
					<option value="gold_3">${ getLocalizedText("menu:gold_3") }</option>
					<option value="diamond_1">${ getLocalizedText("menu:diamond_1") }</option>
					<option value="diamond_2">${ getLocalizedText("menu:diamond_2") }</option>
				</select>

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>
				
				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control heading" placeholder="Heading" required>
					<label>${ getLocalizedText("menu:heading") }</label>
				</div>		

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-invisible-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_invisible")}</label>
				</div>
			</div>

			<div class="row g-2 row-cols-auto align-items-center text-body my-2 robbable-item justify-content-center">
				<select class="form-select item-type" style="width: auto;">
					<option selected value="item">${getLocalizedText("menu:item")}</option>
					<option value="account">${getLocalizedText("menu:account")}</option>
					${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
				</select>
				
				<div class="form-floating">
					<input type="text" class="form-control item-name" placeholder="Name" required>
					<label>${ getLocalizedText("menu:object_name") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-robbable-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

				<div class="form-floating">
					<input type="number" min=0 class="form-control item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
					<label>${getLocalizedText("menu:min_quantity")}</label>
				</div>

				<div class="form-floating">
					<input type="number"  class="form-control item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
					<label>${getLocalizedText("menu:max_quantity")}</label>
				</div>
			</div>

			<hr>
		</div>
	`);

	robbableObjectDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let objectType = robbableObjectDiv.find(".object-type").val();

		let data = await placeObjectAndReturnCoords(objectType);

		if(data) {
			robbableObjectDiv.find(".coords-x").val(data.coords.x);
			robbableObjectDiv.find(".coords-y").val(data.coords.y);
			robbableObjectDiv.find(".coords-z").val(data.coords.z);
			robbableObjectDiv.find(".heading").val(data.heading);
		}
	}).tooltip();

	robbableObjectDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = robbableObjectDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		robbableObjectDiv.data("blipData", blipData);
	})

	robbableObjectDiv.find(".delete-step-btn").click(function() {
		robbableObjectDiv.remove();
	})

	robbableObjectDiv.find(".choose-robbable-item-btn").click(async function() {
		let objectType = robbableObjectDiv.find(".robbable-item").find(".item-type").val();

		let objectName = await objectDialog(objectType);

		robbableObjectDiv.find(".item-name").val(objectName);
	}).tooltip();

	// Sets value if the object is not new
	if(robbableObject) {
		robbableObjectDiv.find(".object-type").val(robbableObject.type);
		robbableObjectDiv.find(".coords-x").val(robbableObject.coords.x);
		robbableObjectDiv.find(".coords-y").val(robbableObject.coords.y);
		robbableObjectDiv.find(".coords-z").val(robbableObject.coords.z);
		robbableObjectDiv.find(".heading").val(robbableObject.heading);
		robbableObjectDiv.data("blipData", robbableObject.blipData);
		robbableObjectDiv.find(".item-type").val(robbableObject.item.type);
		robbableObjectDiv.find(".item-name").val(robbableObject.item.name);
		robbableObjectDiv.find(".item-min-quantity").val(robbableObject.item.minQuantity);
		robbableObjectDiv.find(".item-max-quantity").val(robbableObject.item.maxQuantity);
		robbableObjectDiv.find(".is-optional-checkbox").prop("checked", robbableObject.isOptional);
		robbableObjectDiv.find(".is-invisible-checkbox").prop("checked", robbableObject.isInvisible);
	}

	stageDiv.find(".steps-list").append(robbableObjectDiv);
}

/*
██████   █████  ██ ███    ██ ████████ ██ ███    ██  ██████  ███████ 
██   ██ ██   ██ ██ ████   ██    ██    ██ ████   ██ ██       ██      
██████  ███████ ██ ██ ██  ██    ██    ██ ██ ██  ██ ██   ███ ███████ 
██      ██   ██ ██ ██  ██ ██    ██    ██ ██  ██ ██ ██    ██      ██ 
██      ██   ██ ██ ██   ████    ██    ██ ██   ████  ██████  ███████ 
*/

function getAllPaintingsFromStageDiv(stageDiv) {
	let paintings = [];
	const stepMethod = "PAINTING"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let paintingDiv = $(this);

		let painting = {
			method: stepMethod,
			type: paintingDiv.find(".object-type").val(),
			coords: {
				x: parseFloat( paintingDiv.find(".coords-x").val() ),
				y: parseFloat( paintingDiv.find(".coords-y").val() ),
				z: parseFloat( paintingDiv.find(".coords-z").val() ),
			},
			heading: parseFloat( paintingDiv.find(".heading").val() ),	
			blipData : paintingDiv.data("blipData") || getDefaultBlipCustomization(),
			item: {
				type: paintingDiv.find(".item-type").val(),
				name: paintingDiv.find(".item-name").val(),
				minQuantity: parseInt( paintingDiv.find(".item-min-quantity").val() ),
				maxQuantity: parseInt( paintingDiv.find(".item-max-quantity").val() ),
			},
			isOptional: paintingDiv.find(".is-optional-checkbox").prop("checked"),
			isInvisible: paintingDiv.find(".is-invisible-checkbox").prop("checked"),
		}

		paintings.push(painting);
	});

	return paintings
}

async function addPaintingHeist(stageDiv, painting) {
	let paintingDiv = $(`
		<div class="mb-5" data-step-method="PAINTING">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:painting")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">

				<button type="button" class="btn btn-danger delete-robbable-object-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<select class="form-select object-type" style="width: auto;">
					<option selected value="painting_1">${ getLocalizedText("menu:painting") } 1</option>
					<option value="painting_2">${ getLocalizedText("menu:painting") } 2</option>
					<option value="painting_3">${ getLocalizedText("menu:painting") } 3</option>
					<option value="painting_4">${ getLocalizedText("menu:painting") } 4</option>
					<option value="painting_5">${ getLocalizedText("menu:painting") } 5</option>
					<option value="painting_6">${ getLocalizedText("menu:painting") } 6</option>
					<option value="painting_7">${ getLocalizedText("menu:painting") } 7</option>
					<option value="painting_8">${ getLocalizedText("menu:painting") } 8</option>
					<option value="painting_9">${ getLocalizedText("menu:painting") } 9</option>
					<option value="painting_10">${ getLocalizedText("menu:painting") } 10</option>
				</select>

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>
				
				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control heading" placeholder="Heading" required>
					<label>${ getLocalizedText("menu:heading") }</label>
				</div>		

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-invisible-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_invisible")}</label>
				</div>
			</div>

			<div class="row g-2 row-cols-auto align-items-center text-body my-2 robbable-item justify-content-center">
				<select class="form-select item-type" style="width: auto;">
					<option selected value="item">${getLocalizedText("menu:item")}</option>
					<option value="account">${getLocalizedText("menu:account")}</option>
					${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
				</select>
				
				<div class="form-floating">
					<input type="text" class="form-control item-name" placeholder="Name" required>
					<label>${ getLocalizedText("menu:object_name") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-robbable-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

				<div class="form-floating">
					<input type="number" min=0 class="form-control item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
					<label>${getLocalizedText("menu:min_quantity")}</label>
				</div>

				<div class="form-floating">
					<input type="number"  class="form-control item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
					<label>${getLocalizedText("menu:max_quantity")}</label>
				</div>
			</div>

			<hr>
		</div>
	`);

	paintingDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let objectType = paintingDiv.find(".object-type").val();

		let data = await placeObjectAndReturnCoords(objectType);

		if(data) {
			paintingDiv.find(".coords-x").val(data.coords.x);
			paintingDiv.find(".coords-y").val(data.coords.y);
			paintingDiv.find(".coords-z").val(data.coords.z);
			paintingDiv.find(".heading").val(data.heading);
		}
	}).tooltip();

	paintingDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = paintingDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		paintingDiv.data("blipData", blipData);
	})

	paintingDiv.find(".delete-robbable-object-btn").click(function() {
		paintingDiv.remove();
	})

	paintingDiv.find(".choose-robbable-item-btn").click(async function() {
		let objectType = paintingDiv.find(".robbable-item").find(".item-type").val();

		let objectName = await objectDialog(objectType);

		paintingDiv.find(".item-name").val(objectName);
	}).tooltip();

	// Sets value if the object is not new
	if(painting) {
		paintingDiv.find(".object-type").val(painting.type);
		paintingDiv.find(".coords-x").val(painting.coords.x);
		paintingDiv.find(".coords-y").val(painting.coords.y);
		paintingDiv.find(".coords-z").val(painting.coords.z);
		paintingDiv.find(".heading").val(painting.heading);
		paintingDiv.data("blipData", painting.blipData);
		paintingDiv.find(".item-type").val(painting.item.type);
		paintingDiv.find(".item-name").val(painting.item.name);
		paintingDiv.find(".item-min-quantity").val(painting.item.minQuantity);
		paintingDiv.find(".item-max-quantity").val(painting.item.maxQuantity);
		paintingDiv.find(".is-optional-checkbox").prop("checked", painting.isOptional);
		paintingDiv.find(".is-invisible-checkbox").prop("checked", painting.isInvisible);
	}

	stageDiv.find(".steps-list").append(paintingDiv);
}

/*
 ██████  ██       █████  ███████ ███████     ██████  ██ ███████ ██████  ██       █████  ██    ██ ███████ 
██       ██      ██   ██ ██      ██          ██   ██ ██ ██      ██   ██ ██      ██   ██  ██  ██  ██      
██   ███ ██      ███████ ███████ ███████     ██   ██ ██ ███████ ██████  ██      ███████   ████   ███████ 
██    ██ ██      ██   ██      ██      ██     ██   ██ ██      ██ ██      ██      ██   ██    ██         ██ 
 ██████  ███████ ██   ██ ███████ ███████     ██████  ██ ███████ ██      ███████ ██   ██    ██    ███████ 
*/

function getAllGlassDisplaysFromStageDiv(stageDiv) {
	let glassDisplays = [];
	const stepMethod = "GLASS_DISPLAY"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let glassDisplayDiv = $(this);

		let glassDisplay = {
			method: stepMethod,
			type: glassDisplayDiv.find(".object-type").val(),
			coords: {
				x: parseFloat( glassDisplayDiv.find(".coords-x").val() ),
				y: parseFloat( glassDisplayDiv.find(".coords-y").val() ),
				z: parseFloat( glassDisplayDiv.find(".coords-z").val() ),
			},
			heading: parseFloat( glassDisplayDiv.find(".heading").val() ),	
			blipData : glassDisplayDiv.data("blipData") || getDefaultBlipCustomization(),
			isOptional: glassDisplayDiv.find(".is-optional-checkbox").prop("checked"),
			requiredItem: getRequiredItemFromDiv(glassDisplayDiv),
			item: {
				type: glassDisplayDiv.find(".item-type").val(),
				name: glassDisplayDiv.find(".item-name").val(),
				minQuantity: parseInt( glassDisplayDiv.find(".item-min-quantity").val() ),
				maxQuantity: parseInt( glassDisplayDiv.find(".item-max-quantity").val() ),
			},
		}

		glassDisplays.push(glassDisplay);
	});

	return glassDisplays
}

async function addGlassDisplayHeist(stageDiv, glassDisplay) {
	let stepDiv = $(`
		<div class="mb-5" data-step-method="GLASS_DISPLAY">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:glass_display")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">

				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<select class="form-select object-type" style="width: auto;">
					<option selected value="diamond">${ getLocalizedText("menu:diamond") }</option>
					<option value="art">${ getLocalizedText("menu:art") }</option>
					<option value="necklace">${ getLocalizedText("menu:necklace") }</option>
					<option value="bottle_1">${ getLocalizedText("menu:bottle") } 1</option>
					<option value="bottle_2">${ getLocalizedText("menu:bottle") } 2</option>
					<option value="bottle_3">${ getLocalizedText("menu:bottle") } 3</option>
				</select>

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>
				
				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control heading" placeholder="Heading" required>
					<label>${ getLocalizedText("menu:heading") }</label>
				</div>		

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>
			</div>

			<div class="required-item-div row g-2 row-cols-auto align-items-center justify-content-center mt-3">
				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox requires-an-item-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:requires_an_item")}</label>
				</div>

				<div class="row g-2 row-cols-auto align-items-center">
					<div class="form-floating text-body">
						<input type="text" class="form-control required-item-name" placeholder="Item name">
						<label>${ getLocalizedText("menu:item_name") }</label>
					</div>

					<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

					<div class="form-floating text-body">
						<input type="text" class="form-control required-item-quantity" placeholder="Quantity">
						<label>${ getLocalizedText("menu:quantity") }</label>
					</div>

					<div class="form-check my-auto ms-1">
						<input class="form-check-input is-optional-checkbox required-item-lose-on-use-checkbox" type="checkbox" value="">
						<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
					</div>
				</div>
			</div>

			<div class="row g-2 row-cols-auto align-items-center text-body my-2 robbable-item justify-content-center">
				<select class="form-select item-type" style="width: auto;">
					<option selected value="item">${getLocalizedText("menu:item")}</option>
					<option value="account">${getLocalizedText("menu:account")}</option>
					${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
				</select>
				
				<div class="form-floating">
					<input type="text" class="form-control item-name" placeholder="Name" required>
					<label>${ getLocalizedText("menu:object_name") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-robbable-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

				<div class="form-floating">
					<input type="number" min=0 class="form-control item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
					<label>${getLocalizedText("menu:min_quantity")}</label>
				</div>

				<div class="form-floating">
					<input type="number"  class="form-control item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
					<label>${getLocalizedText("menu:max_quantity")}</label>
				</div>
			</div>

			<hr>
		</div>
	`);

	stepDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let objectType = stepDiv.find(".object-type").val();

		let data = await placeObjectAndReturnCoords(objectType);

		if(data) {
			stepDiv.find(".coords-x").val(data.coords.x);
			stepDiv.find(".coords-y").val(data.coords.y);
			stepDiv.find(".coords-z").val(data.coords.z);
			stepDiv.find(".heading").val(data.heading);
		}
	}).tooltip();

	stepDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = stepDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		stepDiv.data("blipData", blipData);
	})

	stepDiv.find(".delete-step-btn").click(function() {
		stepDiv.remove();
	})

	stepDiv.find(".choose-robbable-item-btn").click(async function() {
		let objectType = stepDiv.find(".robbable-item").find(".item-type").val();

		let objectName = await objectDialog(objectType);

		stepDiv.find(".item-name").val(objectName);
	}).tooltip();

	stepDiv.find(".choose-item-btn").click(async function() {
		let itemName = await itemsDialog();

		stepDiv.find(".required-item-name").val(itemName);
	})

	stepDiv.find(".requires-an-item-checkbox").change(function() {
		toggleRequiredItem(stepDiv.find(".required-item-div"));
	});

	// Sets value if the object is not new
	if(glassDisplay) {
		stepDiv.find(".object-type").val(glassDisplay.type);
		stepDiv.find(".coords-x").val(glassDisplay.coords.x);
		stepDiv.find(".coords-y").val(glassDisplay.coords.y);
		stepDiv.find(".coords-z").val(glassDisplay.coords.z);
		stepDiv.find(".heading").val(glassDisplay.heading);
		stepDiv.data("blipData", glassDisplay.blipData);
		stepDiv.find(".is-optional-checkbox").prop("checked", glassDisplay.isOptional);

		if(glassDisplay.requiredItem) {
			stepDiv.find(".required-item-name").val(glassDisplay.requiredItem.name);
			stepDiv.find(".required-item-quantity").val(glassDisplay.requiredItem.quantity);
			stepDiv.find(".required-item-lose-on-use-checkbox").prop("checked", glassDisplay.requiredItem.loseOnUse);
		}

		stepDiv.find(".item-type").val(glassDisplay.item.type);
		stepDiv.find(".item-name").val(glassDisplay.item.name);
		stepDiv.find(".item-min-quantity").val(glassDisplay.item.minQuantity);
		stepDiv.find(".item-max-quantity").val(glassDisplay.item.maxQuantity);
	}

	stepDiv.find(".requires-an-item-checkbox").prop("checked", glassDisplay?.requiredItem ? true : false).change();

	stageDiv.find(".steps-list").append(stepDiv);
}

/*
██       █████  ███████ ███████ ██████      ██████  ██████  ██ ██      ██      ███████ 
██      ██   ██ ██      ██      ██   ██     ██   ██ ██   ██ ██ ██      ██      ██      
██      ███████ ███████ █████   ██████      ██   ██ ██████  ██ ██      ██      ███████ 
██      ██   ██      ██ ██      ██   ██     ██   ██ ██   ██ ██ ██      ██           ██ 
███████ ██   ██ ███████ ███████ ██   ██     ██████  ██   ██ ██ ███████ ███████ ███████ 
*/

function getAllLaserDrillsFromStageDiv(stageDiv) {
	let laserDrills = [];
	const stepMethod = "LASER_DRILL"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let laserDrillDiv = $(this);

		let stepData = {
			type: "laser_drill", // for the object model
			method: stepMethod,

			coords: {
				x: parseFloat( laserDrillDiv.find(".coords-x").val() ),
				y: parseFloat( laserDrillDiv.find(".coords-y").val() ),
				z: parseFloat( laserDrillDiv.find(".coords-z").val() ),
			},
			blipData : laserDrillDiv.data("blipData") || getDefaultBlipCustomization(),
			isOptional: laserDrillDiv.find(".is-optional-checkbox").prop("checked"),
			duration: parseInt( laserDrillDiv.find(".duration").val() ),

			requiredItem: getRequiredItemFromDiv( laserDrillDiv ),

			minObjectsAmount: parseInt( laserDrillDiv.find(".min-objects-amount").val() ),
			maxObjectsAmount: parseInt( laserDrillDiv.find(".max-objects-amount").val() ),
			items: getAllItemsFromDiv(laserDrillDiv),
		}

		laserDrills.push(stepData);
	});

	return laserDrills
}

async function addLaserDrillHeist(stageDiv, laserDrill) {
	let stepDiv = $(`
		<div class="mb-5" data-step-method="LASER_DRILL">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:laser_drill")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">

				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>
	
				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>

				<div class="form-floating text-body ms-2">
					<input type="number" min="1" class="form-control duration" placeholder="Duration" required>
					<label>${ getLocalizedText("menu:duration") }</label>
				</div>
			</div>

			<div class="required-item-div row g-2 row-cols-auto align-items-center justify-content-center mt-3">
				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox requires-an-item-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:requires_an_item")}</label>
				</div>

				<div class="row g-2 row-cols-auto align-items-center">
					<div class="form-floating text-body">
						<input type="text" class="form-control required-item-name" placeholder="Item name">
						<label>${ getLocalizedText("menu:item_name") }</label>
					</div>

					<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

					<div class="form-floating text-body">
						<input type="text" class="form-control required-item-quantity" placeholder="Quantity">
						<label>${ getLocalizedText("menu:quantity") }</label>
					</div>

					<div class="form-check my-auto ms-1">
						<input class="form-check-input is-optional-checkbox required-item-lose-on-use-checkbox" type="checkbox" value="">
						<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
					</div>
				</div>
			</div>

			<div class="my-4 row g-2 row-cols-auto align-items-center justify-content-center">
				<p class="text-center fs-4 my-auto me-3">${ getLocalizedText("menu:amount_of_objects") }</p>

				<div class="form-floating text-body col-3">
					<input type="number" min="1" class="form-control min-objects-amount" placeholder="Minimum" required>
					<label>${ getLocalizedText("menu:min_quantity") }</label>
				</div>

				<div class="form-floating text-body col-3">
					<input type="number" min="1" class="form-control max-objects-amount" placeholder="Maximum" required>
					<label>${ getLocalizedText("menu:max_quantity") }</label>
				</div>
			</div>

			<div class="items-list">

			</div>

			<div class="d-inline-block col-12 my-2">
				<button type="button" class="btn btn-primary ms-3 add-item-btn float-end">${ getLocalizedText("menu:add_item") }</button>
			</div>

			<hr>
		</div>
	`);

	stepDiv.find(".delete-step-btn").click(function() { stepDiv.remove(); })

	stepDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let objectType = stepDiv.find(".object-type").val();

		let data = await placeObjectAndReturnCoords(objectType);

		if(data) {
			stepDiv.find(".coords-x").val(data.coords.x);
			stepDiv.find(".coords-y").val(data.coords.y);
			stepDiv.find(".coords-z").val(data.coords.z);
			stepDiv.find(".heading").val(data.heading);
		}
	}).tooltip();

	stepDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = stepDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		stepDiv.data("blipData", blipData);
	})

	stepDiv.find(".requires-an-item-checkbox").change(function() {
		toggleRequiredItem(stepDiv.find(".required-item-div"));
	});

	stepDiv.find(".choose-item-btn").click(async function() {
		let itemName = await itemsDialog();

		stepDiv.find(".required-item-name").val(itemName);
	})

	stepDiv.find(".add-item-btn").click(function() {
		addItemInStep(stepDiv);
	})

	// Sets value if the object is not new
	if(laserDrill) {
		stepDiv.find(".coords-x").val(laserDrill.coords.x);
		stepDiv.find(".coords-y").val(laserDrill.coords.y);
		stepDiv.find(".coords-z").val(laserDrill.coords.z);
		stepDiv.data("blipData", laserDrill.blipData);
		stepDiv.find(".is-optional-checkbox").prop("checked", laserDrill.isOptional);
		stepDiv.find(".duration").val(laserDrill.duration);

		if(laserDrill.requiredItem) {
			stepDiv.find(".required-item-name").val(laserDrill.requiredItem.name);
			stepDiv.find(".required-item-quantity").val(laserDrill.requiredItem.quantity);
			stepDiv.find(".required-item-lose-on-use-checkbox").prop("checked", laserDrill.requiredItem.loseOnUse);
		}

		stepDiv.find(".min-objects-amount").val(laserDrill.minObjectsAmount);
		stepDiv.find(".max-objects-amount").val(laserDrill.maxObjectsAmount);

		if(laserDrill.items) {
			laserDrill.items.forEach(item => {
				addItemInStep(stepDiv, item);
			});
		}
	} else {
		stepDiv.find(".min-objects-amount").val(1);
		stepDiv.find(".max-objects-amount").val(1);
		addItemInStep(stepDiv);
	}

	stepDiv.find(".requires-an-item-checkbox").prop("checked", laserDrill?.requiredItem ? true : false).change();

	stageDiv.find(".steps-list").append(stepDiv);
}

/*
 ██████  ██    ██  █████  ██████  ██████  ███████ 
██       ██    ██ ██   ██ ██   ██ ██   ██ ██      
██   ███ ██    ██ ███████ ██████  ██   ██ ███████ 
██    ██ ██    ██ ██   ██ ██   ██ ██   ██      ██ 
 ██████   ██████  ██   ██ ██   ██ ██████  ███████ 
*/

function getGuardsFromGuardsDiv(guardsDiv) {
	let guards = [];

	guardsDiv.find(".guard").each(function() {
		let guardDiv = $(this);

		let guard = {
			model: guardDiv.find(".guard-model").val(),
			weapon: guardDiv.find(".guard-weapon").val(),
			coords: {
				x: parseFloat( guardDiv.find(".coords-x").val() ),
				y: parseFloat( guardDiv.find(".coords-y").val() ),
				z: parseFloat( guardDiv.find(".coords-z").val() ),
			},
			heading: parseFloat( guardDiv.find(".heading").val() ),
		}

		guards.push(guard);
	});

	return guards;
}

function getAllGuardsFromStageDiv(stageDiv) {
	let guards = [];
	const stepMethod = "GUARDS"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let guardsDiv = $(this);

		let currentGuards = {
			method: stepMethod,
			difficulty: parseInt( guardsDiv.find(".difficulty").val() ),
			headshotOneshot: guardsDiv.find(".headshot-oneshot-checkbox").prop("checked"),
			guardsList: getGuardsFromGuardsDiv(guardsDiv),
		}

		guards.push(currentGuards);
	});

	return guards
}

function addGuardToGuardsDiv(guardsDiv, guard) {
	let guardDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center justify-content-center mb-2 guard">
			<button type="button" class="btn-close delete-guard-btn me-3" ></button>	

			<div class="form-floating text-body col-2" >
				<input type="text" class="form-control guard-model" placeholder="Guard model" required value="cs_casey">
				<label>${ getLocalizedText("menu:guard_model") }</label>
			</div>

			<div class="form-floating text-body col-2" >
				<input type="text" class="form-control guard-weapon" placeholder="Guard weapon" required value="weapon_pistol">
				<label>${ getLocalizedText("menu:guard_weapon") }</label>
			</div>

			<!-- Coords and heading -->
			<div class="form-floating text-body col-1 ms-4">
				<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
				<label>${ getLocalizedText("menu:x") }</label>
			</div>

			<div class="form-floating text-body col-1">
				<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
				<label>${ getLocalizedText("menu:y") }</label>
			</div>

			<div class="form-floating text-body col-1">
				<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
				<label>${ getLocalizedText("menu:z") }</label>
			</div>
			
			<div class="form-floating text-body col-1">
				<input type="number" step="0.01" class="form-control heading" placeholder="Heading" required>
				<label>${ getLocalizedText("menu:heading") }</label>
			</div>	

			<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	
		</div>
	`);
	
	guardDiv.find(".delete-guard-btn").click(function() {
		guardDiv.remove();
	});

	guardDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let data = await placeObjectAndReturnCoords();

		if(data) {
			guardDiv.find(".coords-x").val(data.coords.x);
			guardDiv.find(".coords-y").val(data.coords.y);
			guardDiv.find(".coords-z").val(data.coords.z);
			guardDiv.find(".heading").val(data.heading);
		}
	}).tooltip();

	if(guard) {
		guardDiv.find(".guard-model").val(guard.model);
		guardDiv.find(".guard-weapon").val(guard.weapon);
		guardDiv.find(".coords-x").val(guard.coords.x);
		guardDiv.find(".coords-y").val(guard.coords.y);
		guardDiv.find(".coords-z").val(guard.coords.z);
		guardDiv.find(".heading").val(guard.heading);
	}

	guardsDiv.find(".guards-list").append(guardDiv);
}

async function addGuardsHeist(stageDiv, guards) {
	let guardsDiv = $(`
		<div class="mb-5" data-step-method="GUARDS">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:guards")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<div class="form-floating text-body col-3" >
					<input type="number" class="form-control difficulty" placeholder="Difficulty" required min="1" max="5" data-bs-toggle="tooltip" data-bs-placement="top" title="1-5">
					<label>${ getLocalizedText("menu:difficulty") }</label>
				</div>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input headshot-oneshot-checkbox" type="checkbox" value="" checked>
					<label class="form-check-label">${getLocalizedText("menu:headshot_will_oneshot")}</label>
				</div>
			</div>

			<p class="text-center fs-5 mt-3">${ getLocalizedText("menu:guards_list") }</p>

			<div class="guards-list">

			</div>

			<div class="d-inline-block col-12 my-2">
				<button type="button" class="btn btn-primary ms-3 add-guard-btn float-end">${ getLocalizedText("menu:add_guard") }</button>
			</div>

			<hr>
		</div>
	`);

	guardsDiv.find(".difficulty").tooltip();

	guardsDiv.find(".delete-step-btn").click(function() {
		guardsDiv.remove();
	});

	guardsDiv.find(".add-guard-btn").click(function() {
		addGuardToGuardsDiv(guardsDiv);
	});

	if(guards) {
		guardsDiv.find(".difficulty").val(guards.difficulty);
		guardsDiv.find(".headshot-oneshot-checkbox").prop("checked", guards.headshotOneshot);

		if(guards.guardsList) {
			guards.guardsList.forEach(guard => {
				addGuardToGuardsDiv(guardsDiv, guard);
			});
		}
	}

	stageDiv.find(".steps-list").append(guardsDiv);
}

/*
███████  █████  ███████ ███████ ███████ 
██      ██   ██ ██      ██      ██      
███████ ███████ █████   █████   ███████ 
     ██ ██   ██ ██      ██           ██ 
███████ ██   ██ ██      ███████ ███████ 
*/

function getAllSafesFromStageDiv(stageDiv) {
	let safes = [];
	const stepMethod = "SAFE"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let safeDiv = $(this);

		let safe = {
			method: stepMethod,
			type: safeDiv.find(".object-type").val(),
			coords: {
				x: parseFloat( safeDiv.find(".coords-x").val() ),
				y: parseFloat( safeDiv.find(".coords-y").val() ),
				z: parseFloat( safeDiv.find(".coords-z").val() ),
			},
			heading: parseFloat( safeDiv.find(".heading").val() ),	
			blipData : safeDiv.data("blipData") || getDefaultBlipCustomization(),
			items: getAllItemsFromDiv(safeDiv),
			difficulty: parseInt( safeDiv.find(".difficulty").val() ),
			minObjectsAmount: parseInt( safeDiv.find(".min-objects-amount").val() ),
			maxObjectsAmount: parseInt( safeDiv.find(".max-objects-amount").val() ),
			isOptional: safeDiv.find(".is-optional-checkbox").prop("checked"),
			isInvisible: safeDiv.find(".is-invisible-checkbox").prop("checked"),
			requiredItem: getRequiredItemFromDiv( safeDiv ),
			alarms: safeDiv.data("alarms")
		}

		safes.push(safe);
	});

	return safes
}

function addSafeHeist(stageDiv, safe) {
	let safeDiv = $(`
		<div class="mb-5" data-step-method="SAFE">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:safe")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">

				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<select class="form-select object-type" style="width: auto;">
					<option value="safe_big" selected>${ getLocalizedText("menu:safe_big") }</option>
					<option value="safe_little">${ getLocalizedText("menu:safe_little") }</option>
				</select>

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>
				
				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control heading" placeholder="Heading" required>
					<label>${ getLocalizedText("menu:heading") }</label>
				</div>		

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-floating text-body col-1 ms-4">
					<input type="number" min=1 class="form-control difficulty" placeholder="Difficulty" required>
					<label>${ getLocalizedText("menu:difficulty") }</label>
				</div>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>
			</div>

			<div class="required-item-div row g-2 row-cols-auto align-items-center justify-content-center mt-3">
				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox requires-an-item-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:requires_an_item")}</label>
				</div>

				<div class="row g-2 row-cols-auto align-items-center">
					<div class="form-floating text-body col-3">
						<input type="text" class="form-control required-item-name" placeholder="Item name">
						<label>${ getLocalizedText("menu:item_name") }</label>
					</div>

					<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

					<div class="form-floating text-body col-2">
						<input type="text" class="form-control required-item-quantity" placeholder="Quantity">
						<label>${ getLocalizedText("menu:quantity") }</label>
					</div>

					<div class="form-check my-auto ms-1">
						<input class="form-check-input is-optional-checkbox required-item-lose-on-use-checkbox" type="checkbox" value="">
						<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
					</div>

					<button type="button" class="btn btn-secondary col-auto ms-5 setup-alarm-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:setup_alarms") }"><i class="bi bi-bell"></i></button>	
					
					<div class="form-check my-auto ms-3">
						<input class="form-check-input is-invisible-checkbox" type="checkbox" value="">
						<label class="form-check-label">${getLocalizedText("menu:is_invisible")}</label>
					</div>
				</div>
			</div>

			<div class="my-4 row g-2 row-cols-auto align-items-center justify-content-center">
				<p class="text-center fs-4 my-auto me-3">${ getLocalizedText("menu:amount_of_objects_from_the_safe") }</p>

				<div class="form-floating text-body col-3">
					<input type="number" min="1" class="form-control min-objects-amount" placeholder="Minimum" required>
					<label>${ getLocalizedText("menu:min_quantity") }</label>
				</div>

				<div class="form-floating text-body col-3">
					<input type="number" min="1" class="form-control max-objects-amount" placeholder="Maximum" required>
					<label>${ getLocalizedText("menu:max_quantity") }</label>
				</div>
			</div>

			<div class="items-list">

			</div>

			<div class="d-inline-block col-12 my-2">
				<button type="button" class="btn btn-primary ms-3 add-item-btn float-end">${ getLocalizedText("menu:add_item") }</button>
			</div>

			<hr>
		</div>
	`);

	safeDiv.find(".setup-alarm-btn").click(async function() {
		let currentAlarms = safeDiv.data("alarms");

		let alarms = await alarmsDialog(currentAlarms);
		
		safeDiv.data("alarms", alarms);
	}).tooltip();

	safeDiv.find(".requires-an-item-checkbox").change(function() {
		toggleRequiredItem(safeDiv.find(".required-item-div"));
	});

	safeDiv.find(".choose-item-btn").click(async function() {
		let itemName = await itemsDialog();

		safeDiv.find(".required-item-name").val(itemName);
	})

	safeDiv.find(".add-item-btn").click(function() {
		addItemInStep(safeDiv);
	})

	safeDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let objectType = safeDiv.find(".object-type").val();

		let data = await placeObjectAndReturnCoords(objectType);

		if(data) {
			safeDiv.find(".coords-x").val(data.coords.x);
			safeDiv.find(".coords-y").val(data.coords.y);
			safeDiv.find(".coords-z").val(data.coords.z);
			safeDiv.find(".heading").val(data.heading);
		}
	}).tooltip();

	safeDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = safeDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		safeDiv.data("blipData", blipData);
	})

	safeDiv.find(".delete-step-btn").click(function() {
		safeDiv.remove();
	})

	// Sets value if the object is not new
	if(safe) {
		safeDiv.find(".object-type").val(safe.type);
		safeDiv.find(".coords-x").val(safe.coords.x);
		safeDiv.find(".coords-y").val(safe.coords.y);
		safeDiv.find(".coords-z").val(safe.coords.z);
		safeDiv.find(".heading").val(safe.heading);
		safeDiv.find(".difficulty").val(safe.difficulty);
		safeDiv.find(".min-objects-amount").val(safe.minObjectsAmount);
		safeDiv.find(".max-objects-amount").val(safe.maxObjectsAmount);
		safeDiv.find(".is-optional-checkbox").prop("checked", safe.isOptional);
		safeDiv.find(".is-invisible-checkbox").prop("checked", safe.isInvisible);
		safeDiv.data("blipData", safe.blipData);
		safeDiv.data("alarms", safe.alarms);

		safe.items.forEach(item => {
			addItemInStep(safeDiv, item);
		})

		if(safe.requiredItem) {
			safeDiv.find(".required-item-name").val(safe.requiredItem.name);
			safeDiv.find(".required-item-quantity").val(safe.requiredItem.quantity);
			safeDiv.find(".required-item-lose-on-use-checkbox").prop("checked", safe.requiredItem.loseOnUse);
		}

	} else {
		// If safe didn't exist, it will also add 1 empty item to it
		addItemInStep(safeDiv);
	}

	safeDiv.find(".requires-an-item-checkbox").prop("checked", safe?.requiredItem ? true : false).change();

	stageDiv.find(".steps-list").append(safeDiv);
}

/*
██   ██  █████   ██████ ██   ██  █████  ██████  ██      ███████     ██████   █████  ███    ██ ███████ ██      ███████ 
██   ██ ██   ██ ██      ██  ██  ██   ██ ██   ██ ██      ██          ██   ██ ██   ██ ████   ██ ██      ██      ██      
███████ ███████ ██      █████   ███████ ██████  ██      █████       ██████  ███████ ██ ██  ██ █████   ██      ███████ 
██   ██ ██   ██ ██      ██  ██  ██   ██ ██   ██ ██      ██          ██      ██   ██ ██  ██ ██ ██      ██           ██ 
██   ██ ██   ██  ██████ ██   ██ ██   ██ ██████  ███████ ███████     ██      ██   ██ ██   ████ ███████ ███████ ███████ 
*/

function getAllHackablePanelsFromStageDiv(stageDiv) {
	let hackablePanels = [];
	const stepMethod = "HACKABLE_PANEL"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let hackablePanelDiv = $(this);

		let hackablePanel = {
			type: "hackable_panel", // for the object model
			method: stepMethod,
			coords: {
				x: parseFloat( hackablePanelDiv.find(".coords-x").val() ),
				y: parseFloat( hackablePanelDiv.find(".coords-y").val() ),
				z: parseFloat( hackablePanelDiv.find(".coords-z").val() ),
			},
			heading: parseFloat( hackablePanelDiv.find(".heading").val() ),	
			blipData : hackablePanelDiv.data("blipData") || getDefaultBlipCustomization(),
			isOptional: hackablePanelDiv.find(".is-optional-checkbox").prop("checked"),
			difficulty: parseInt( hackablePanelDiv.find(".difficulty").val() ),
			isInvisible: hackablePanelDiv.find(".is-invisible-checkbox").prop("checked"),
			doorsToOpen: hackablePanelDiv.data("doorsToOpen"),
			alarms: hackablePanelDiv.data("alarms"),
			requiredItem: getRequiredItemFromDiv( hackablePanelDiv ),
			minigameToUse: hackablePanelDiv.find(".minigame-to-use").val()
		}

		hackablePanels.push(hackablePanel);
	});

	return hackablePanels
}

function addHackablePanelHeist(stageDiv, hackablePanel) {
	let hackablePanelDiv = $(`
		<div class="mb-5" data-step-method="HACKABLE_PANEL">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:hackable_panel")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>
				
				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control heading" placeholder="Heading" required>
					<label>${ getLocalizedText("menu:heading") }</label>
				</div>		

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-floating text-body col-1 ms-4">
					<input type="number" min="1" max="5" class="form-control difficulty" placeholder="Difficulty" required data-bs-toggle="tooltip" data-bs-placement="top" title="1-5">
					<label>${ getLocalizedText("menu:difficulty") }</label>
				</div>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-invisible-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_invisible")}</label>
				</div>
			</div>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center mt-3">
				<button type="button" class="btn btn-secondary choose-doors-btn">${getLocalizedText("menu:choose_doors")}</button>

				<div class="required-item-div row g-2 row-cols-auto align-items-center justify-content-center ms-3">
					<div class="form-check my-auto ms-3">
						<input class="form-check-input is-optional-checkbox requires-an-item-checkbox" type="checkbox" value="">
						<label class="form-check-label">${getLocalizedText("menu:requires_an_item")}</label>
					</div>

					<div class="row g-2 row-cols-auto align-items-center">
						<div class="form-floating text-body col-3">
							<input type="text" class="form-control required-item-name" placeholder="Item name">
							<label>${ getLocalizedText("menu:item_name") }</label>
						</div>

						<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

						<div class="form-floating text-body col-2">
							<input type="text" class="form-control required-item-quantity" placeholder="Quantity">
							<label>${ getLocalizedText("menu:quantity") }</label>
						</div>

						<div class="form-check my-auto ms-1">
							<input class="form-check-input is-optional-checkbox required-item-lose-on-use-checkbox" type="checkbox" value="">
							<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
						</div>

						<button type="button" class="btn btn-secondary col-auto ms-5 setup-alarm-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:setup_alarms") }"><i class="bi bi-bell"></i></button>	

						<select class="form-select minigame-to-use ms-4" style="width: auto;">
							<option selected value="bruteforce">${getLocalizedText("menu:bruteforce")}</option>
							<option value="datacrack">${getLocalizedText("menu:datacrack")}</option>
							<option value="fingerprint">${getLocalizedText("menu:fingerprint")}</option>
							<option value="memory-game">${getLocalizedText("menu:memory_game")}</option>
						</select>
	
					</div>

				</div>

			</div>

			<hr>
		</div>
	`);

	hackablePanelDiv.find(".delete-step-btn").click(function() {
		hackablePanelDiv.remove();
	})

	hackablePanelDiv.find(".difficulty").tooltip();

	hackablePanelDiv.find(".requires-an-item-checkbox").change(function() {
		toggleRequiredItem(hackablePanelDiv.find(".required-item-div"));
	});

	hackablePanelDiv.find(".choose-item-btn").click(async function() {
		let itemName = await itemsDialog();

		hackablePanelDiv.find(".required-item-name").val(itemName);
	})

	hackablePanelDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let data = await placeObjectAndReturnCoords("hackable_panel");

		if(data) {
			hackablePanelDiv.find(".coords-x").val(data.coords.x);
			hackablePanelDiv.find(".coords-y").val(data.coords.y);
			hackablePanelDiv.find(".coords-z").val(data.coords.z);
			hackablePanelDiv.find(".heading").val(data.heading);
		}
	}).tooltip();

	hackablePanelDiv.find(".setup-alarm-btn").click(async function() {
		let currentAlarms = hackablePanelDiv.data("alarms");

		let alarms = await alarmsDialog(currentAlarms);
		
		hackablePanelDiv.data("alarms", alarms);
	}).tooltip();

	hackablePanelDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = hackablePanelDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		hackablePanelDiv.data("blipData", blipData);
	})

	hackablePanelDiv.find(".choose-doors-btn").click(async function() {
		let doors = await doorsDialog( hackablePanelDiv.data("doorsToOpen") );

		hackablePanelDiv.data("doorsToOpen", doors);
	})

	// Sets value if the object is not new
	if(hackablePanel) {
		hackablePanelDiv.find(".coords-x").val(hackablePanel.coords.x);
		hackablePanelDiv.find(".coords-y").val(hackablePanel.coords.y);
		hackablePanelDiv.find(".coords-z").val(hackablePanel.coords.z);
		hackablePanelDiv.find(".heading").val(hackablePanel.heading);
		hackablePanelDiv.find(".difficulty").val(hackablePanel.difficulty);
		hackablePanelDiv.find(".is-optional-checkbox").prop("checked", hackablePanel.isOptional);
		hackablePanelDiv.find(".is-invisible-checkbox").prop("checked", hackablePanel.isInvisible);
		hackablePanelDiv.data("blipData", hackablePanel.blipData);
		hackablePanelDiv.data("doorsToOpen", hackablePanel.doorsToOpen);
		hackablePanelDiv.data("alarms", hackablePanel.alarms);
		hackablePanelDiv.find(".minigame-to-use").val(hackablePanel.minigameToUse || "bruteforce");

		if(hackablePanel.requiredItem) {
			hackablePanelDiv.find(".required-item-name").val(hackablePanel.requiredItem.name);
			hackablePanelDiv.find(".required-item-quantity").val(hackablePanel.requiredItem.quantity);
			hackablePanelDiv.find(".required-item-lose-on-use-checkbox").prop("checked", hackablePanel.requiredItem.loseOnUse);
		}
	}

	hackablePanelDiv.find(".requires-an-item-checkbox").prop("checked", hackablePanel?.requiredItem ? true : false).change();

	stageDiv.find(".steps-list").append(hackablePanelDiv);
}

/*
████████ ██   ██ ███████ ██████  ███    ███  █████  ██           ██████ ██   ██  █████  ██████   ██████  ███████ ███████ 
   ██    ██   ██ ██      ██   ██ ████  ████ ██   ██ ██          ██      ██   ██ ██   ██ ██   ██ ██       ██      ██      
   ██    ███████ █████   ██████  ██ ████ ██ ███████ ██          ██      ███████ ███████ ██████  ██   ███ █████   ███████ 
   ██    ██   ██ ██      ██   ██ ██  ██  ██ ██   ██ ██          ██      ██   ██ ██   ██ ██   ██ ██    ██ ██           ██ 
   ██    ██   ██ ███████ ██   ██ ██      ██ ██   ██ ███████      ██████ ██   ██ ██   ██ ██   ██  ██████  ███████ ███████ 
*/

function getAllThermalChargesFromStageDiv(stageDiv) {
	let thermalCharges = [];
	const stepMethod = "THERMAL_CHARGE"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let thermalChargeDiv = $(this);

		let thermalCharge = {
			type: "thermal_charge", // for the object model
			method: stepMethod,
			coords: {
				x: parseFloat( thermalChargeDiv.find(".coords-x").val() ),
				y: parseFloat( thermalChargeDiv.find(".coords-y").val() ),
				z: parseFloat( thermalChargeDiv.find(".coords-z").val() ),
			},
			blipData : thermalChargeDiv.data("blipData") || getDefaultBlipCustomization(),
			isOptional: thermalChargeDiv.find(".is-optional-checkbox").prop("checked"),
			doorsToOpen: thermalChargeDiv.data("doorsToOpen"),
			duration: parseInt( thermalChargeDiv.find(".duration").val() ),
			requiredItem: getRequiredItemFromDiv(thermalChargeDiv),
			alarms: thermalChargeDiv.data("alarms"),
		}

		thermalCharges.push(thermalCharge);
	});

	return thermalCharges
}

function addThermalChargeHeist(stageDiv, thermalCharge) {
	let thermalChargeHeistDiv = $(`
		<div class="mb-5" data-step-method="THERMAL_CHARGE">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:thermal_charge")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>

				<div class="form-floating text-body ms-2">
					<input type="number" min="1" class="form-control duration" placeholder="Duration" required>
					<label>${ getLocalizedText("menu:duration") }</label>
				</div>

			</div>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center mt-3">
				<button type="button" class="btn btn-secondary choose-doors-btn">${getLocalizedText("menu:choose_doors")}</button>

				<div class="required-item-div row g-2 row-cols-auto align-items-center justify-content-center ms-3">
					<div class="form-check my-auto ms-3">
						<input class="form-check-input is-optional-checkbox requires-an-item-checkbox" type="checkbox" value="">
						<label class="form-check-label">${getLocalizedText("menu:requires_an_item")}</label>
					</div>

					<div class="row g-2 row-cols-auto align-items-center">
						<div class="form-floating text-body col-3">
							<input type="text" class="form-control required-item-name" placeholder="Item name">
							<label>${ getLocalizedText("menu:item_name") }</label>
						</div>

						<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

						<div class="form-floating text-body col-2">
							<input type="text" class="form-control required-item-quantity" placeholder="Quantity">
							<label>${ getLocalizedText("menu:quantity") }</label>
						</div>

						<div class="form-check my-auto ms-1">
							<input class="form-check-input is-optional-checkbox required-item-lose-on-use-checkbox" type="checkbox" value="">
							<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
						</div>

						<button type="button" class="btn btn-secondary col-auto ms-5 setup-alarm-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:setup_alarms") }"><i class="bi bi-bell"></i></button>	

					</div>
				</div>

			</div>

			<hr>
		</div>
	`);

	thermalChargeHeistDiv.find(".setup-alarm-btn").click(async function() {
		let currentAlarms = thermalChargeHeistDiv.data("alarms");

		let alarms = await alarmsDialog(currentAlarms);
		
		thermalChargeHeistDiv.data("alarms", alarms);
	}).tooltip();

	thermalChargeHeistDiv.find(".requires-an-item-checkbox").change(function() {
		toggleRequiredItem(thermalChargeHeistDiv.find(".required-item-div"));
	});

	thermalChargeHeistDiv.find(".choose-item-btn").click(async function() {
		let itemName = await itemsDialog();

		thermalChargeHeistDiv.find(".required-item-name").val(itemName);
	})

	thermalChargeHeistDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let data = await placeObjectAndReturnCoords("thermal_charge");

		if(data) {
			thermalChargeHeistDiv.find(".coords-x").val(data.coords.x);
			thermalChargeHeistDiv.find(".coords-y").val(data.coords.y);
			thermalChargeHeistDiv.find(".coords-z").val(data.coords.z);
		}
	}).tooltip();

	thermalChargeHeistDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = thermalChargeHeistDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData);

		thermalChargeHeistDiv.data("blipData", blipData);
	});

	thermalChargeHeistDiv.find(".choose-doors-btn").click(async function() {
		let doors = await doorsDialog( thermalChargeHeistDiv.data("doorsToOpen") );

		thermalChargeHeistDiv.data("doorsToOpen", doors);
	});

	thermalChargeHeistDiv.find(".delete-step-btn").click(function() {
		thermalChargeHeistDiv.remove();
	});

	if(thermalCharge) {
		thermalChargeHeistDiv.find(".coords-x").val(thermalCharge.coords.x);
		thermalChargeHeistDiv.find(".coords-y").val(thermalCharge.coords.y);
		thermalChargeHeistDiv.find(".coords-z").val(thermalCharge.coords.z);
		thermalChargeHeistDiv.find(".is-optional-checkbox").prop("checked", thermalCharge.isOptional);
		thermalChargeHeistDiv.find(".duration").val(thermalCharge.duration);
		thermalChargeHeistDiv.data("blipData", thermalCharge.blipData);
		thermalChargeHeistDiv.data("doorsToOpen", thermalCharge.doorsToOpen);
		thermalChargeHeistDiv.data("alarms", thermalCharge.alarms);
		
		if(thermalCharge.requiredItem) {
			thermalChargeHeistDiv.find(".required-item-name").val(thermalCharge.requiredItem.name);
			thermalChargeHeistDiv.find(".required-item-quantity").val(thermalCharge.requiredItem.quantity);
			thermalChargeHeistDiv.find(".required-item-lose-on-use-checkbox").prop("checked", thermalCharge.requiredItem.loseOnUse);
		}
	}

	thermalChargeHeistDiv.find(".requires-an-item-checkbox").prop("checked", thermalCharge?.requiredItem ? true : false).change();

	stageDiv.find(".steps-list").append(thermalChargeHeistDiv);
}

/*
██       ██████   ██████ ██   ██ ██████  ██  ██████ ██   ██  █████  ██████  ██      ███████     ██████   ██████   ██████  ██████  ███████ 
██      ██    ██ ██      ██  ██  ██   ██ ██ ██      ██  ██  ██   ██ ██   ██ ██      ██          ██   ██ ██    ██ ██    ██ ██   ██ ██      
██      ██    ██ ██      █████   ██████  ██ ██      █████   ███████ ██████  ██      █████       ██   ██ ██    ██ ██    ██ ██████  ███████ 
██      ██    ██ ██      ██  ██  ██      ██ ██      ██  ██  ██   ██ ██   ██ ██      ██          ██   ██ ██    ██ ██    ██ ██   ██      ██ 
███████  ██████   ██████ ██   ██ ██      ██  ██████ ██   ██ ██   ██ ██████  ███████ ███████     ██████   ██████   ██████  ██   ██ ███████ 
*/

function getAllLockpickableDoorsFromStageDiv(stageDiv) {
	let lockpickableDoors = [];
	const stepMethod = "LOCKPICKABLE_DOOR"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let lockpickableDoorDiv = $(this);

		let lockpickableDoor = {
			type: "lockpickable_door", // for the object model
			method: stepMethod,
			coords: {
				x: parseFloat( lockpickableDoorDiv.find(".coords-x").val() ),
				y: parseFloat( lockpickableDoorDiv.find(".coords-y").val() ),
				z: parseFloat( lockpickableDoorDiv.find(".coords-z").val() ),
			},
			blipData : lockpickableDoorDiv.data("blipData") || getDefaultBlipCustomization(),
			isOptional: lockpickableDoorDiv.find(".is-optional-checkbox").prop("checked"),
			doorsToOpen: lockpickableDoorDiv.data("doorsToOpen"),
			difficulty: parseInt( lockpickableDoorDiv.find(".difficulty").val() ),
			requiredItem: getRequiredItemFromDiv(lockpickableDoorDiv),
			alarms: lockpickableDoorDiv.data("alarms"),
		}

		lockpickableDoors.push(lockpickableDoor);
	});

	return lockpickableDoors
}

function addLockpickableDoorHeist(stageDiv, lockpickableDoor) {
	let lockpickableDoorHeistDiv = $(`
		<div class="mb-5" data-step-method="LOCKPICKABLE_DOOR">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:lockpickable_door")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<!-- Coords and heading -->
				<div class="form-floating text-body col-1 ms-4">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-1">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	

				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>

				<div class="form-floating text-body col-1 ms-4">
					<input type="number" min=1 class="form-control difficulty" placeholder="Difficulty" required>
					<label>${ getLocalizedText("menu:difficulty") }</label>
				</div>


			</div>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center mt-3">
				<button type="button" class="btn btn-secondary choose-doors-btn">${getLocalizedText("menu:choose_doors")}</button>

				<div class="required-item-div row g-2 row-cols-auto align-items-center justify-content-center ms-3">
					<div class="form-check my-auto ms-3">
						<input class="form-check-input is-optional-checkbox requires-an-item-checkbox" type="checkbox" value="">
						<label class="form-check-label">${getLocalizedText("menu:requires_an_item")}</label>
					</div>

					<div class="row g-2 row-cols-auto align-items-center">
						<div class="form-floating text-body col-3">
							<input type="text" class="form-control required-item-name" placeholder="Item name">
							<label>${ getLocalizedText("menu:item_name") }</label>
						</div>

						<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

						<div class="form-floating text-body col-2">
							<input type="text" class="form-control required-item-quantity" placeholder="Quantity">
							<label>${ getLocalizedText("menu:quantity") }</label>
						</div>

						<div class="form-check my-auto ms-1">
							<input class="form-check-input is-optional-checkbox required-item-lose-on-use-checkbox" type="checkbox" value="">
							<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
						</div>

						<button type="button" class="btn btn-secondary col-auto ms-5 setup-alarm-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:setup_alarms") }"><i class="bi bi-bell"></i></button>	

					</div>
				</div>

			</div>

			<hr>
		</div>
	`);

	lockpickableDoorHeistDiv.find(".setup-alarm-btn").click(async function() {
		let currentAlarms = lockpickableDoorHeistDiv.data("alarms");

		let alarms = await alarmsDialog(currentAlarms);
		
		lockpickableDoorHeistDiv.data("alarms", alarms);
	}).tooltip();

	lockpickableDoorHeistDiv.find(".requires-an-item-checkbox").change(function() {
		toggleRequiredItem(lockpickableDoorHeistDiv.find(".required-item-div"));
	});

	lockpickableDoorHeistDiv.find(".choose-item-btn").click(async function() {
		let itemName = await itemsDialog();

		lockpickableDoorHeistDiv.find(".required-item-name").val(itemName);
	})

	lockpickableDoorHeistDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let data = await placeObjectAndReturnCoords();

		if(data) {
			lockpickableDoorHeistDiv.find(".coords-x").val(data.coords.x);
			lockpickableDoorHeistDiv.find(".coords-y").val(data.coords.y);
			lockpickableDoorHeistDiv.find(".coords-z").val(data.coords.z);
		}
	}).tooltip();

	lockpickableDoorHeistDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = lockpickableDoorHeistDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		lockpickableDoorHeistDiv.data("blipData", blipData);
	});

	lockpickableDoorHeistDiv.find(".choose-doors-btn").click(async function() {
		let doors = await doorsDialog( lockpickableDoorHeistDiv.data("doorsToOpen") );

		lockpickableDoorHeistDiv.data("doorsToOpen", doors);
	});

	lockpickableDoorHeistDiv.find(".delete-step-btn").click(function() {
		lockpickableDoorHeistDiv.remove();
	});

	if(lockpickableDoor) {
		lockpickableDoorHeistDiv.find(".coords-x").val(lockpickableDoor.coords.x);
		lockpickableDoorHeistDiv.find(".coords-y").val(lockpickableDoor.coords.y);
		lockpickableDoorHeistDiv.find(".coords-z").val(lockpickableDoor.coords.z);
		lockpickableDoorHeistDiv.find(".is-optional-checkbox").prop("checked", lockpickableDoor.isOptional);
		lockpickableDoorHeistDiv.find(".difficulty").val(lockpickableDoor.difficulty);
		lockpickableDoorHeistDiv.data("blipData", lockpickableDoor.blipData);
		lockpickableDoorHeistDiv.data("doorsToOpen", lockpickableDoor.doorsToOpen);
		lockpickableDoorHeistDiv.data("alarms", lockpickableDoor.alarms);
		
		if(lockpickableDoor.requiredItem) {
			lockpickableDoorHeistDiv.find(".required-item-name").val(lockpickableDoor.requiredItem.name);
			lockpickableDoorHeistDiv.find(".required-item-quantity").val(lockpickableDoor.requiredItem.quantity);
			lockpickableDoorHeistDiv.find(".required-item-lose-on-use-checkbox").prop("checked", lockpickableDoor.requiredItem.loseOnUse);
		}
	}

	lockpickableDoorHeistDiv.find(".requires-an-item-checkbox").prop("checked", lockpickableDoor?.requiredItem ? true : false).change();

	stageDiv.find(".steps-list").append(lockpickableDoorHeistDiv);
}

/*
██      ███████ ████████ ██   ██  █████  ██           ██████   █████  ███████ ███████ ███████ ███████ 
██      ██         ██    ██   ██ ██   ██ ██          ██       ██   ██ ██      ██      ██      ██      
██      █████      ██    ███████ ███████ ██          ██   ███ ███████ ███████ ███████ █████   ███████ 
██      ██         ██    ██   ██ ██   ██ ██          ██    ██ ██   ██      ██      ██ ██           ██ 
███████ ███████    ██    ██   ██ ██   ██ ███████      ██████  ██   ██ ███████ ███████ ███████ ███████ 
*/

function getAllLethalGassesFromStageDiv(stageDiv) {
	let lethalGases = [];
	const stepMethod = "LETHAL_GAS"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let lethalGasDiv = $(this);

		let lethalGas = {
			type: "lethal_gas", // for the object model
			method: stepMethod,
			gasPoints: lethalGasDiv.data("gasPoints"),
			duration: parseInt( lethalGasDiv.find(".duration").val() ),
			damage: parseInt( lethalGasDiv.find(".damage").val() ),
			secondsBeforeStart: parseInt( lethalGasDiv.find(".seconds-before-start").val() ),
			color: hexToRgb( lethalGasDiv.find(".gas-color").val() ),
		}

		lethalGases.push(lethalGas);
	});

	return lethalGases
}

function addLethalGasHeist(stageDiv, lethalGas) {
	let lethalGasHeistDiv = $(`
		<div class="mb-5" data-step-method="LETHAL_GAS">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:lethal_gas")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<button type="button" class="btn btn-secondary col-auto choose-gas-points" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_gas_points") }"><i class="bi bi-arrow-down-square"></i></button>	

				<div class="form-floating text-body col-3 ms-2">
					<input type="number" min=0 class="form-control seconds-before-start" placeholder="Seconds before start" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:second_to_wait_after_stage_start") }" required>
					<label>${ getLocalizedText("menu:second_to_wait") }</label>
				</div>

				<div class="form-floating text-body col-3 ms-2">
					<input type="number" min=1 class="form-control duration" placeholder="Duration" required>
					<label>${ getLocalizedText("menu:duration") }</label>
				</div>

				<div class="form-floating text-body col-3 ms-2">
					<input type="number" min=0 class="form-control damage" placeholder="Damage" required>
					<label>${ getLocalizedText("menu:damage") }</label>
				</div>

				<input type="color" class="form-control form-control-color ms-3 gas-color" value="#ff0000" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:gas_color")}">
			</div>

			<hr>
		</div>
	`);

	lethalGasHeistDiv.find(".seconds-before-start").tooltip()
	lethalGasHeistDiv.find(".gas-color").tooltip()

	lethalGasHeistDiv.find(".choose-gas-points").click(async function() {
		let gasPoints = await placeGasPoints();

		lethalGasHeistDiv.data("gasPoints", gasPoints);
	}).tooltip();

	lethalGasHeistDiv.find(".delete-step-btn").click(function() {
		lethalGasHeistDiv.remove();
	});

	if(lethalGas) {
		lethalGasHeistDiv.find(".duration").val(lethalGas.duration);
		lethalGasHeistDiv.data("gasPoints", lethalGas.gasPoints);
		lethalGasHeistDiv.find(".damage").val(lethalGas.damage);
		lethalGasHeistDiv.find(".seconds-before-start").val(lethalGas.secondsBeforeStart);
		lethalGasHeistDiv.find(".gas-color").val( rgbToHex(lethalGas.color.r, lethalGas.color.g, lethalGas.color.b) );
	}

	stageDiv.find(".steps-list").append(lethalGasHeistDiv);
}

/*
███████ ███████  █████  ██████   ██████ ██   ██ 
██      ██      ██   ██ ██   ██ ██      ██   ██ 
███████ █████   ███████ ██████  ██      ███████ 
     ██ ██      ██   ██ ██   ██ ██      ██   ██ 
███████ ███████ ██   ██ ██   ██  ██████ ██   ██ 
*/

function getPossiblePointsFromSearchPointsDiv(searchPointsDiv) {
	let possiblePoints = [];

	searchPointsDiv.find(".point").each(function() {
		let pointDiv = $(this);

		let possiblePoint = {
			coords: {
				x: parseFloat( pointDiv.find(".coords-x").val() ),
				y: parseFloat( pointDiv.find(".coords-y").val() ),
				z: parseFloat( pointDiv.find(".coords-z").val() ),
			},
		}

		possiblePoints.push(possiblePoint);
	});

	return possiblePoints;

}

function getAllSearchPointsFromStageDiv(stageDiv) {
	let searchPoints = [];
	const stepMethod = "SEARCH_POINTS"

	stageDiv.find(`.steps-list > [data-step-method='${stepMethod}']`).each(function() {
		let searchPointslDiv = $(this);

		let stepData = {
			type: "search_points", // for the object model
			method: stepMethod,

			possiblePoints: getPossiblePointsFromSearchPointsDiv(searchPointslDiv),

			blipData : searchPointslDiv.data("blipData") || getDefaultBlipCustomization(),
			isOptional: searchPointslDiv.find(".is-optional-checkbox").prop("checked"),

			minObjectsAmount: parseInt( searchPointslDiv.find(".min-objects-amount").val() ),
			maxObjectsAmount: parseInt( searchPointslDiv.find(".max-objects-amount").val() ),
			items: getAllItemsFromDiv(searchPointslDiv),
		}

		searchPoints.push(stepData);
	});

	return searchPoints
}

function addPossiblePointToSearchPointsDiv(searchPointsDiv, possiblePoint) {
	let possiblePointDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center justify-content-center mb-2 point">
			<button type="button" class="btn-close delete-point-btn me-3" ></button>	

			<div class="form-floating text-body col">
				<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
				<label>${ getLocalizedText("menu:x") }</label>
			</div>

			<div class="form-floating text-body col">
				<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
				<label>${ getLocalizedText("menu:y") }</label>
			</div>

			<div class="form-floating text-body col">
				<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
				<label>${ getLocalizedText("menu:z") }</label>
			</div>
			
			<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>	
		</div>
	`);
	
	possiblePointDiv.find(".delete-point-btn").click(function() {
		possiblePointDiv.remove();
	});

	possiblePointDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let coords = await chooseCoords();

		if(coords) {
			possiblePointDiv.find(".coords-x").val(coords.x);
			possiblePointDiv.find(".coords-y").val(coords.y);
			possiblePointDiv.find(".coords-z").val(coords.z);
		}
	}).tooltip();

	if(possiblePoint) {
		possiblePointDiv.find(".coords-x").val(possiblePoint.coords.x);
		possiblePointDiv.find(".coords-y").val(possiblePoint.coords.y);
		possiblePointDiv.find(".coords-z").val(possiblePoint.coords.z);
	}

	searchPointsDiv.find(".possible-points-list").append(possiblePointDiv);
}

async function addSearchPointsHeist(stageDiv, searchPoints) {
	let stepDiv = $(`
		<div class="mb-5" data-step-method="SEARCH_POINTS">
			<p class="text-center text-success fs-4">${getLocalizedText("menu:search_points")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<button type="button" class="btn btn-danger delete-step-btn me-3" ><i class="bi bi-trash-fill"></i></button>	
	
				<button type="button" class="btn btn-secondary ms-3 customize-blip-btn">${getLocalizedText("menu:customize_blip")}</button>

				<div class="form-check my-auto ms-3">
					<input class="form-check-input is-optional-checkbox" type="checkbox" value="">
					<label class="form-check-label">${getLocalizedText("menu:is_optional")}</label>
				</div>
			</div>

			<div class="my-4 row g-2 row-cols-auto align-items-center justify-content-center">
				<p class="text-center fs-4 my-auto me-3">${ getLocalizedText("menu:amount_of_objects") }</p>

				<div class="form-floating text-body col-3">
					<input type="number" min="1" class="form-control min-objects-amount" placeholder="Minimum" required>
					<label>${ getLocalizedText("menu:min_quantity") }</label>
				</div>

				<div class="form-floating text-body col-3">
					<input type="number" min="1" class="form-control max-objects-amount" placeholder="Maximum" required>
					<label>${ getLocalizedText("menu:max_quantity") }</label>
				</div>
			</div>

			<div>
				<div class="items-list">

				</div>

				<div class="d-inline-block col-12 my-2">
					<button type="button" class="btn btn-primary ms-3 add-item-btn float-end">${ getLocalizedText("menu:add_item") }</button>
				</div>
			</div>

			<p class="text-center fs-5">${getLocalizedText("menu:possible_points")}</p>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center mt-3 possible-points-list">

			</div>

			<div class="d-inline-block col-12 my-2">
				<button type="button" class="btn btn-primary ms-3 add-point-btn float-end">${ getLocalizedText("menu:add_point") }</button>
			</div>

			<hr>
		</div>
	`);

	stepDiv.find(".delete-step-btn").click(function() { stepDiv.remove(); })

	stepDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let objectType = stepDiv.find(".object-type").val();

		let data = await placeObjectAndReturnCoords(objectType);

		if(data) {
			stepDiv.find(".coords-x").val(data.coords.x);
			stepDiv.find(".coords-y").val(data.coords.y);
			stepDiv.find(".coords-z").val(data.coords.z);
		}
	}).tooltip();

	stepDiv.find(".customize-blip-btn").click(async function() {
		let oldBlipData = stepDiv.data("blipData");
		let blipData = await blipDialog(oldBlipData)

		stepDiv.data("blipData", blipData);
	})


	stepDiv.find(".add-item-btn").click(function() {
		addItemInStep(stepDiv);
	})

	stepDiv.find(".add-point-btn").click(function() {
		addPossiblePointToSearchPointsDiv(stepDiv);
	})

	// Sets value if the object is not new
	if(searchPoints) {
		stepDiv.data("blipData", searchPoints.blipData);
		stepDiv.find(".is-optional-checkbox").prop("checked", searchPoints.isOptional);

		stepDiv.find(".min-objects-amount").val(searchPoints.minObjectsAmount);
		stepDiv.find(".max-objects-amount").val(searchPoints.maxObjectsAmount);

		if(searchPoints.items) {
			searchPoints.items.forEach(item => {
				addItemInStep(stepDiv, item);
			});
		}

		if(searchPoints.possiblePoints) {
			searchPoints.possiblePoints.forEach(possiblePoint => {
				addPossiblePointToSearchPointsDiv(stepDiv, possiblePoint);
			});
		}
	} else {
		stepDiv.find(".min-objects-amount").val(1);
		stepDiv.find(".max-objects-amount").val(1);
		addItemInStep(stepDiv);
		addPossiblePointToSearchPointsDiv(stepDiv);
	}

	stageDiv.find(".steps-list").append(stepDiv);
}

/*
██   ██ ███████ ██ ███████ ████████ ███████     ███    ███ ██ ███████  ██████ 
██   ██ ██      ██ ██         ██    ██          ████  ████ ██ ██      ██      
███████ █████   ██ ███████    ██    ███████     ██ ████ ██ ██ ███████ ██      
██   ██ ██      ██      ██    ██         ██     ██  ██  ██ ██      ██ ██      
██   ██ ███████ ██ ███████    ██    ███████     ██      ██ ██ ███████  ██████ 
*/

function getAllItemsFromDiv(stepDiv) {
	let items = [];

	stepDiv.find(".item").each(function() {
		let itemDiv = $(this);

		let item = {
			type: itemDiv.find(".item-type").val(),
			name: itemDiv.find(".item-name").val(),
			minQuantity: parseInt( itemDiv.find(".item-min-quantity").val() ),
			maxQuantity: parseInt( itemDiv.find(".item-max-quantity").val() ),
			chances: parseInt( itemDiv.find(".item-chances").val() ),
		}

		items.push(item);
	});

	return items
}

function getRequiredItemFromDiv(stepDiv) {
	const requiredItemDiv = stepDiv.find(".required-item-div");
	let requiresItem = requiredItemDiv.find(".requires-an-item-checkbox").prop("checked");
	
	if(requiresItem) {
		return {
			name: requiredItemDiv.find(".required-item-name").val(),
			quantity: parseInt( requiredItemDiv.find(".required-item-quantity").val() ),
			loseOnUse: requiredItemDiv.find(".required-item-lose-on-use-checkbox").prop("checked"),
		}
	} else {
		return null;
	}
}

function getHeistStages() {
	let stages = [];

	$("#heist-stages").find(".stage").each(function(index) {
		let stageDiv = $(this);

		let stage = {
			steps: [
				...getAllRobbableObjectsFromStageDiv(stageDiv),
				...getAllSafesFromStageDiv(stageDiv),
				...getAllPaintingsFromStageDiv(stageDiv),
				...getAllGlassDisplaysFromStageDiv(stageDiv),
				...getAllLaserDrillsFromStageDiv(stageDiv),
				...getAllGuardsFromStageDiv(stageDiv),
				...getAllHackablePanelsFromStageDiv(stageDiv),
				...getAllThermalChargesFromStageDiv(stageDiv),
				...getAllLockpickableDoorsFromStageDiv(stageDiv),
				...getAllLethalGassesFromStageDiv(stageDiv),
				...getAllSearchPointsFromStageDiv(stageDiv),
			],
		}

		stages.push(stage);
	})

	return stages
}

$("#heist-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let heistModal = $("#heist-modal");
	let action = heistModal.data("action");

	let heistData = {
		label: $("#heist-label").val(),
		minimumPolice: parseInt( $("#heist-minimum-police").val() ),
		timeoutMinutes: parseInt( $("#heist-timeout").val() ),
		minutesBeforeReset: parseInt( $("#heist-reset").val() ),
		timeLimitMinutes: parseInt( $("#heist-time-limit-minutes").val() ),

		stages: getHeistStages()
	}

	switch(action) {
		case "create": {
			const response = await $.post(`https://${resName}/createHeist`, JSON.stringify(heistData));
			
			showServerResponse(response)

			if(response === true) {
				heistModal.modal("hide");
				loadHeists();
			}

			break;
		}

		case "edit": {
			const response = await $.post(`https://${resName}/updateHeist`, JSON.stringify({heistId: heistModal.data("heistId"), heistData: heistData}));

			showServerResponse(response)

			if(response === true) {
				heistModal.modal("hide");
				loadHeists();
			}

			break;
		}
	}

});

$("#delete-heist-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let heistModal = $("#heist-modal");
	let heistId = heistModal.data("heistId");

	const response = await $.post(`https://${resName}/deleteHeist`, JSON.stringify({heistId: heistId}));

	showServerResponse(response);

	if(response === true) {
		heistModal.modal("hide");
		loadHeists();
	}
})

async function addItemInStep(stepDiv, item) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 item justify-content-center">
			<button type="button" class="btn-close delete-item-btn me-3"></button>	

			<select class="form-select item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-floating">
				<input type="number"  class="form-control item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
				<label>${getLocalizedText("menu:max_quantity")}</label>
			</div>

			<div class="form-floating">
				<input type="number"  class="form-control item-chances" placeholder="${getLocalizedText("menu:probability")}" required>
				<label>${getLocalizedText("menu:probability")}</label>
			</div>
		</div>
	`);

	itemDiv.find(".delete-item-btn").click(function() {
		itemDiv.remove();
	})

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".item-name").val(objectName);
	}).tooltip();

	if(item) {
		itemDiv.find(".item-type").val(item.type);
		itemDiv.find(".item-name").val(item.name);
		itemDiv.find(".item-min-quantity").val(item.minQuantity);
		itemDiv.find(".item-max-quantity").val(item.maxQuantity);
		itemDiv.find(".item-chances").val(item.chances);
	}

	stepDiv.find(".items-list").append(itemDiv);
}

function toggleRequiredItem(requiredItemDiv) {
	let enabled = requiredItemDiv.find(".requires-an-item-checkbox").prop("checked");

	requiredItemDiv.find(".required-item-name").prop("disabled", !enabled).prop("required", enabled);
	requiredItemDiv.find(".required-item-quantity").prop("disabled", !enabled).prop("required", enabled);
	requiredItemDiv.find(".choose-item-btn").prop("disabled", !enabled);
	requiredItemDiv.find(".required-item-lose-on-use-checkbox").prop("disabled", !enabled);

	if(!enabled) {
		requiredItemDiv.find(".required-item-lose-on-use-checkbox").prop("checked", false);
	}
}

function renameAllStagesByTheirOrder() {
	$("#heist-stages").find(".stage-title").each(function(index) {
		let stageNumber = index + 1;

		$(this).prop("innerHTML", `${ getLocalizedText("menu:stage") }  ${stageNumber}`)
	})

	$("#heist-stages").find(".delete-stage-btn").each(function(index) {
		let stageNumber = index + 1;

		$(this).prop("innerHTML", `${ getLocalizedText("menu:delete_stage") } - ${stageNumber}`)
	})
}

function setDoorsCreatorStatusOnStageDiv(stageDiv) {
	if(hasDoorsCreator) return;

	let stepsRequiringDoorsCreator = {
		"HACKABLE_PANEL": true,
		"THERMAL_CHARGE": true,
		"LOCKPICKABLE_DOOR": true,
	}

	stageDiv.find("[data-step-method]").each(function() {
		let stepMethod = $(this).data("stepMethod");

		if(stepsRequiringDoorsCreator[stepMethod]) {
			$(this)
				.addClass("disabled")
				.parent()
					.data("bs-toggle", "tooltip")
					.data("bs-placement", "top")
					.prop("title", getLocalizedText("menu:requires_doors_creator"))
					.tooltip();
		}
	});
}

// If it's the first stage, the steps guards and lethal gas won't be usable
function setAvailableStepsForEachStage() {
	$("#heist-stages").find(".stage").each(function() {
		let stageNumber = $(this).index() + 1;

		const isFirstStage = stageNumber == 1;

		const guardDiv = $(this).find(".steps-methods-list").find("[data-step-method='GUARDS']");
		const lethalGasDiv = $(this).find(".steps-methods-list").find("[data-step-method='LETHAL_GAS']");

		guardDiv.toggleClass("disabled", isFirstStage);
		lethalGasDiv.toggleClass("disabled", isFirstStage);

		// Enable tooltip only if it's first stage
		if(isFirstStage) {
			$(this).find(".not-first-stage-list-element").tooltip("enable");
		} else {
			$(this).find(".not-first-stage-list-element").tooltip("disable");
		}
	})
}

function addStepDiv(stepMethod, stageDiv, stepData) {
	switch(stepMethod) {
		case "ROBBABLE_OBJECT":
			addRobbableObjectHeist(stageDiv, stepData);
			break;
		case "SAFE":
			addSafeHeist(stageDiv, stepData);
			break;
		case "PAINTING":
			addPaintingHeist(stageDiv, stepData);
			break;
		case "GLASS_DISPLAY":
			addGlassDisplayHeist(stageDiv, stepData);
			break;
		case "LASER_DRILL":
			addLaserDrillHeist(stageDiv, stepData);
			break;
		case "GUARDS":
			addGuardsHeist(stageDiv, stepData);
			break;
		case "HACKABLE_PANEL":
			addHackablePanelHeist(stageDiv, stepData);
			break;
		case "THERMAL_CHARGE":
			addThermalChargeHeist(stageDiv, stepData);
			break;
		case "LOCKPICKABLE_DOOR":
			addLockpickableDoorHeist(stageDiv, stepData);
			break;
		case "LETHAL_GAS":
			addLethalGasHeist(stageDiv, stepData);
			break;
		case "SEARCH_POINTS": {
			addSearchPointsHeist(stageDiv, stepData);
			break;
		}
		default:
			console.log("Unknown step method: " + stepMethod);
			break;
	}
}

function addHeistStage(stage) {
	let stageDiv = $(`
		<div class="stage">

			<h3 class="text-center stage-title">${ getLocalizedText("menu:stage") }  ${$("#heist-stages").children(".stage").length + 1}</h3>

			<div class="steps-list my-3">

			</div>

			<div class="d-inline-block col-12 my-2">
				<div class="btn-group">
					<button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown">${ getLocalizedText("menu:add_step") }</button>

					<ul class="dropdown-menu steps-methods-list">
						<li><a class="dropdown-item" href="#" data-step-method="ROBBABLE_OBJECT">${getLocalizedText("menu:add_robbable_object")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="SAFE">${getLocalizedText("menu:add_safe")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="PAINTING">${getLocalizedText("menu:add_painting")}</a></li>
						<li class="not-first-stage-list-element" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:cant_be_in_first_stage") }"><a class="dropdown-item" href="#" data-step-method="GUARDS">${getLocalizedText("menu:add_guards")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="HACKABLE_PANEL">${getLocalizedText("menu:add_hackable_panel")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="THERMAL_CHARGE">${getLocalizedText("menu:add_thermal_charge")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="LOCKPICKABLE_DOOR">${getLocalizedText("menu:add_lockpickable_door")}</a></li>
						<li class="not-first-stage-list-element" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:cant_be_in_first_stage") }"><a class="dropdown-item" href="#" data-step-method="LETHAL_GAS">${getLocalizedText("menu:add_lethal_gas")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="GLASS_DISPLAY">${getLocalizedText("menu:add_glass_display")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="LASER_DRILL">${getLocalizedText("menu:add_laser_drill")}</a></li>
						<li><a class="dropdown-item" href="#" data-step-method="SEARCH_POINTS">${getLocalizedText("menu:add_search_points")}</a></li>
					</ul>
				</div>

				<button type="button" class="btn btn-warning ms-3 delete-stage-btn float-end fs">${ getLocalizedText("menu:delete_stage") } - ${$("#heist-stages").children(".stage").length + 1}</button>
			</div>

			<hr class="thick-hr">
		</div>
	`)

	stageDiv.find(".delete-stage-btn").click(function() {
		stageDiv.remove();
		renameAllStagesByTheirOrder();
		setAvailableStepsForEachStage();
	})

	stageDiv.find(".steps-methods-list a").click(function() {
		let stepMethod = $(this).data("stepMethod");

		addStepDiv(stepMethod, stageDiv);
	})
	
	if(stage) {
		stage.steps.forEach(stepData => {
			addStepDiv(stepData.method, stageDiv, stepData);
		});
	}

	setDoorsCreatorStatusOnStageDiv(stageDiv);

	$("#heist-stages").append(stageDiv);

	setAvailableStepsForEachStage();
}

$("#heist-add-stage-btn").click(function() {
	addHeistStage()
})

$("#heist-import-stages-from-heist-btn").click(async function() {
	let heistId = await heistsDialog()

	if(heistId) {
		heists[heistId].stages.forEach(stage => {
			addHeistStage(stage);
		})
	}
})

/*
 ██████  █████  ██████   ██████   ██████      ██████   ██████  ██████  ██████  ███████ ██████  ██ ███████ ███████ 
██      ██   ██ ██   ██ ██       ██    ██     ██   ██ ██    ██ ██   ██ ██   ██ ██      ██   ██ ██ ██      ██      
██      ███████ ██████  ██   ███ ██    ██     ██████  ██    ██ ██████  ██████  █████   ██████  ██ █████   ███████ 
██      ██   ██ ██   ██ ██    ██ ██    ██     ██   ██ ██    ██ ██   ██ ██   ██ ██      ██   ██ ██ ██           ██ 
 ██████ ██   ██ ██   ██  ██████   ██████      ██   ██  ██████  ██████  ██████  ███████ ██   ██ ██ ███████ ███████ 
*/

let cargoRobberiesDatatable = $("#cargo-robberies-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editCargoRobbery(id);
		})
	},
});

let cargoRobberies = {};

function loadCargoRobberies() {
	$.post(`https://${resName}/getAllCargoRobberies`, {}, async function(rawCargoRobberies) {

		// Manually create the table to avoid incompatibilities due table indexing
		cargoRobberies = {};

		for(const[k, heistData] of Object.entries(rawCargoRobberies)) {
			cargoRobberies[heistData.id] = heistData;
		}

		cargoRobberiesDatatable.clear();

		for(const[id, heistData] of Object.entries(cargoRobberies)) {
			cargoRobberiesDatatable.row.add([
				id,
				heistData.label,
			]);
		}

		cargoRobberiesDatatable.draw();
	})
}

function getDefaultBlipCargoRobbery() {
	return {
		isEnabled: true,
		sprite: 67,
		label: getLocalizedText("menu:armored_truck"),
		scale: 0.8,
		color: 1,
		display: 2,
	}
}

function setDefaultDataOfCargoRobberyModal() {
	$("#cargo-robbery-label").val("Default");
	$("#cargo-robbery-vehicle-model").val("stockade");
	$("#cargo-robbery-driver-model").val("mp_m_securoguard_01");
	$("#cargo-robbery-max-speed").val(50.0);
	$("#cargo-robbery-seconds-to-drill").val(20);

	$(`input[name=cargo-drive-type][value='stops']`).prop("checked", true).change();
	$("#cargo-robbery-random-drive-coords-x").val("");
	$("#cargo-robbery-random-drive-coords-y").val("");
	$("#cargo-robbery-random-drive-coords-z").val("");
	$("#cargo-robbery-random-drive-heading").val("");
	$("#cargo-robbery-random-drive-minutes-before-despawn").val(30);

	$("#cargo-robbery-min-objects-quantity").val(1);
	$("#cargo-robbery-max-objects-quantity").val(2);
	$("#cargo-items-list").empty();

	$("#cargo-robbery-stops").empty();
	$("#cargo-robbery-modal").data("blipData", getDefaultBlipCargoRobbery());
}

function renameAllStopsByTheirOrder() {
	$("#cargo-robbery-stops").find(".stop-title").each(function(index) {
		let stopNumber = index + 1;

		$(this).prop("innerHTML", `${ getLocalizedText("menu:stop") }  ${stopNumber}`)
	})

	$("#cargo-robbery-stops").find(".delete-stop-btn").each(function(index) {
		let stopNumber = index + 1;

		$(this).prop("innerHTML", `${ getLocalizedText("menu:delete_stop") } - ${stopNumber}`)
	})
}


$("#new-cargo-robbery-btn").click(function() {
	let cargoRobberyModal = $("#cargo-robbery-modal");

	// Converts from edit modal to create modal
	cargoRobberyModal.data("action", "create");
	
	$("#delete-cargo-robbery-btn").hide();
	$("#save-cargo-robbery-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfCargoRobberyModal();

	cargoRobberyModal.modal("show");
})


function editCargoRobbery(id) {
	let cargoRobberyData = cargoRobberies[id];

	let cargoRobberyModal = $("#cargo-robbery-modal");

	cargoRobberyModal.data("action", "edit");
	cargoRobberyModal.data("cargoRobberyId", id);
	cargoRobberyModal.data("blipData", cargoRobberyData.blipData);
	
	$("#delete-cargo-robbery-btn").show();
	$("#save-cargo-robbery-btn").text( getLocalizedText("menu:save") );

	$("#cargo-robbery-label").val(cargoRobberyData.label);
	$("#cargo-robbery-vehicle-model").val(cargoRobberyData.data.vehicleModel);
	$("#cargo-robbery-driver-model").val(cargoRobberyData.data.driverModel);
	$("#cargo-robbery-bulletproof-wheels-checkbox").prop("checked", cargoRobberyData.data.hasBulletproofTires);
	$("#cargo-robbery-max-speed").val(cargoRobberyData.data.maxSpeed);
	$("#cargo-robbery-seconds-to-drill").val(cargoRobberyData.data.secondsToDrill)

	$(`input[name=cargo-drive-type][value='${cargoRobberyData.data.driveType}']`).prop("checked", true).change();
	$("#cargo-robbery-random-drive-coords-x").val(cargoRobberyData.data.startCoords?.x);
	$("#cargo-robbery-random-drive-coords-y").val(cargoRobberyData.data.startCoords?.y);
	$("#cargo-robbery-random-drive-coords-z").val(cargoRobberyData.data.startCoords?.z);
	$("#cargo-robbery-random-drive-heading").val(cargoRobberyData.data.startCoords?.heading);
	$("#cargo-robbery-random-drive-minutes-before-despawn").val(cargoRobberyData.data.minutesBeforeDespawn);

	$("#cargo-robbery-min-objects-quantity").val(cargoRobberyData.data.minObjectsAmount);
	$("#cargo-robbery-max-objects-quantity").val(cargoRobberyData.data.maxObjectsAmount);
	$("#cargo-items-list").empty();

	if(cargoRobberyData.data.rewardObjects) {
		cargoRobberyData.data.rewardObjects.forEach(rewardObject => {
			addObjectInCargoRobbery(rewardObject);
		})	
	}

	$("#cargo-robbery-stops").empty();
	if(cargoRobberyData.data.stops) {
		cargoRobberyData.data.stops.forEach(stop => {
			addCargoRobberyStop(stop);
		})
	}

	cargoRobberyModal.modal("show");
}

function addCargoRobberyStop(stopData) {
	let stopIndex = $("#cargo-robbery-stops").children(".stop").length + 1;
	
	let stopDiv = $(`
		<div class="my-2 stop">
			<p class="text-center fs-4 fw-bold stop-title mb-3">${ getLocalizedText("menu:stop") } ${stopIndex}</p>
			
			<p class="fs-5 text-center fst-italic">${ getLocalizedText("menu:destination") }</p>
			
			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<div class="form-floating text-body col-2">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-2">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-2">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>

				<div class="form-floating text-body col-2">
					<input type="number" step="0.01" class="form-control heading" placeholder="Heading" required>
					<label>${ getLocalizedText("menu:heading") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto current-coords-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:current_coords") }"><i class="bi bi-arrow-down-square"></i></button>	
			
				<div class="form-floating text-body col-3">
					<input type="number" min=0 class="form-control minutes-to-wait" placeholder="Minutes to wait" value="0" required>
					<label>${ getLocalizedText("menu:minutes_to_wait_when_arrived") }</label>
				</div>
			</div>

			<div class="d-inline-block col-12 my-2">
				<button type="button" class="btn btn-warning ms-3 delete-stop-btn float-end fs">${ getLocalizedText("menu:delete_stop") } - ${stopIndex}</button>
			</div>

			<hr class="thick-hr">
		</div>
	`)
	
	stopDiv.find(".current-coords-btn").click(async function() {
		let data = await getCurrentCoordsAndHeading();

		stopDiv.find(".coords-x").val(data.coords.x);
		stopDiv.find(".coords-y").val(data.coords.y);
		stopDiv.find(".coords-z").val(data.coords.z);

		stopDiv.find(".heading").val(data.heading);
	}).tooltip();

	stopDiv.find(".delete-stop-btn").click(function() {
		stopDiv.remove();
		renameAllStopsByTheirOrder();
	});

	if(stopData) {
		stopDiv.find(".coords-x").val(stopData.coords.x);
		stopDiv.find(".coords-y").val(stopData.coords.y);
		stopDiv.find(".coords-z").val(stopData.coords.z);
		stopDiv.find(".heading").val(stopData.heading);
		stopDiv.find(".minutes-to-wait").val(stopData.minutesToWait);
	}

	$("#cargo-robbery-stops").append(stopDiv);
}

$("#cargo-robbery-add-stop-btn").click(function() {
	addCargoRobberyStop()
})

$('input[name=cargo-drive-type]').change(function() {
	let type = $(this).val();

	switch(type) {
		case "stops": {
			$("#cargo-robbery-stops-container").show().find(".form-control").prop("required", true);
			$("#cargo-robbery-random-drive-container").hide().find(".form-control").prop("required", false);

			break;
		}

		case "random": {
			$("#cargo-robbery-stops-container").hide().find(".form-control").prop("required", false);
			$("#cargo-robbery-random-drive-container").show().find(".form-control").prop("required", true);
		
			break;
		}
	}
});

$("#cargo-robbery-random-drive-current-coords-btn").click(async function() {
	let data = await getCurrentCoordsAndHeading();

	$("#cargo-robbery-random-drive-coords-x").val(data.coords.x);
	$("#cargo-robbery-random-drive-coords-y").val(data.coords.y);
	$("#cargo-robbery-random-drive-coords-z").val(data.coords.z);

	$("#cargo-robbery-random-drive-heading").val(data.heading);
})

function getCargoRobberyStops() {
	let stops = [];

	$("#cargo-robbery-stops").find(".stop").each(function() {
		let stop = {
			coords: {
				x: parseFloat( $(this).find(".coords-x").val() ),
				y: parseFloat( $(this).find(".coords-y").val() ),
				z: parseFloat( $(this).find(".coords-z").val() ),
			},

			heading: parseFloat( $(this).find(".heading").val() ),

			minutesToWait: parseInt( $(this).find(".minutes-to-wait").val() ),
		};

		stops.push(stop);
	});

	return stops;
}

function getCargoRobberyRewards() {
	let rewards = [];

	$("#cargo-items-list").find(".cargo-robbery-item").each(function() {
		let currentObject = $(this);

		let reward = {
			type: currentObject.find(".object-type").val(),
			name: currentObject.find(".object-name").val(),
			minQuantity: parseInt(currentObject.find(".min-quantity").val()),
			maxQuantity: parseInt(currentObject.find(".max-quantity").val()),
			chances: parseInt(currentObject.find(".chances").val())
		}

		rewards.push(reward);
	})
	
	return rewards;
}

$("#cargo-robbery-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let cargoRobberyModal = $("#cargo-robbery-modal");
	let action = cargoRobberyModal.data("action");

	let cargoRobberyData = {
		label: $("#cargo-robbery-label").val(),
		blipData: cargoRobberyModal.data("blipData"),
		data: {
			vehicleModel: $("#cargo-robbery-vehicle-model").val(),
			driverModel: $("#cargo-robbery-driver-model").val(),
			hasBulletproofTires: $("#cargo-robbery-bulletproof-wheels-checkbox").prop("checked"),	
			maxSpeed: parseFloat( $("#cargo-robbery-max-speed").val() ),
			secondsToDrill: parseInt( $("#cargo-robbery-seconds-to-drill").val() ),
			minObjectsAmount: parseInt( $("#cargo-robbery-min-objects-quantity").val() ),
			maxObjectsAmount: parseInt( $("#cargo-robbery-max-objects-quantity").val() ),
			rewardObjects: getCargoRobberyRewards(),

			stops: getCargoRobberyStops(),
			driveType: $('input[name=cargo-drive-type]:checked').val(),
			startCoords: {
				x: parseFloat( $("#cargo-robbery-random-drive-coords-x").val() ),
				y: parseFloat( $("#cargo-robbery-random-drive-coords-y").val() ),
				z: parseFloat( $("#cargo-robbery-random-drive-coords-z").val() ),
				heading: parseFloat(  $("#cargo-robbery-random-drive-heading").val() ),
			},
			minutesBeforeDespawn: parseInt( $("#cargo-robbery-random-drive-minutes-before-despawn").val() )
		}
	}
	
	switch(action) {
		case "create": {
			const response = await $.post(`https://${resName}/createCargoRobbery`, JSON.stringify(cargoRobberyData));
			
			showServerResponse(response);

			if(response === true) {
				cargoRobberyModal.modal("hide");
				loadCargoRobberies();
			}

			break;
		}

		case "edit": {
			const response = await $.post(`https://${resName}/updateCargoRobbery`, JSON.stringify({cargoRobberyId: cargoRobberyModal.data("cargoRobberyId"), cargoRobberyData: cargoRobberyData}));

			showServerResponse(response);

			if(response === true) {
				cargoRobberyModal.modal("hide");
				loadCargoRobberies();
			}

			break;
		}
	}
});

$("#delete-cargo-robbery-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let cargoRobberyModal = $("#cargo-robbery-modal");
	let cargoRobberyId = cargoRobberyModal.data("cargoRobberyId");

	const response = await $.post(`https://${resName}/deleteCargoRobbery`, JSON.stringify({cargoRobberyId: cargoRobberyId}));

	showServerResponse(response);

	if(response === true) {
		cargoRobberyModal.modal("hide");
		loadCargoRobberies();
	}
})

$("#cargo-robbery-customize-blip-btn").click(async function() {
	oldBlipData = $("#cargo-robbery-modal").data("blipData");
	let blipData = await blipDialog(oldBlipData)

	$("#cargo-robbery-modal").data("blipData", blipData);
});

async function addObjectInCargoRobbery(objectData) {
	let objectDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 cargo-robbery-item justify-content-center">
			<button type="button" class="btn-close delete-cargo-robbery-item-btn me-3" ></button>	

			<select class="form-select object-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control object-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-floating">
				<input type="number"  class="form-control max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
				<label>${getLocalizedText("menu:max_quantity")}</label>
			</div>

			<div class="form-floating">
				<input type="number"  class="form-control chances" placeholder="${getLocalizedText("menu:probability")}" required>
				<label>${getLocalizedText("menu:probability")}</label>
			</div>
		</div>
	`);

	objectDiv.find(".delete-cargo-robbery-item-btn").click(function() {
		objectDiv.remove();
	})

	objectDiv.find(".choose-item-btn").click(async function() {
		let objectType = objectDiv.find(".object-type").val();

		let objectName = await objectDialog(objectType);

		objectDiv.find(".object-name").val(objectName);
	}).tooltip();

	if(objectData) {
		objectDiv.find(".object-type").val(objectData.type);
		objectDiv.find(".object-name").val(objectData.name);
		objectDiv.find(".min-quantity").val(objectData.minQuantity);
		objectDiv.find(".max-quantity").val(objectData.maxQuantity);
		objectDiv.find(".chances").val(objectData.chances);
	}

	$("#cargo-items-list").append(objectDiv);
}

$("#cargo-robbery-add-item-btn").click(function() {
	addObjectInCargoRobbery();
});

/*
██████  ██       █████  ███    ██ ███    ██ ██ ███    ██  ██████  
██   ██ ██      ██   ██ ████   ██ ████   ██ ██ ████   ██ ██       
██████  ██      ███████ ██ ██  ██ ██ ██  ██ ██ ██ ██  ██ ██   ███ 
██      ██      ██   ██ ██  ██ ██ ██  ██ ██ ██ ██  ██ ██ ██    ██ 
██      ███████ ██   ██ ██   ████ ██   ████ ██ ██   ████  ██████ 
*/
let planningsDatatable = $("#plannings-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editPlanning(id);
		})
	},
});

let plannings = {};

function getRemainingTimeForPlannings() {
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/getRemainingTimeForPlannings`, function(remainingTimes) {
			resolve(remainingTimes)
		});
	})
}

async function loadPlannings() {
	let remainingTimes = await getRemainingTimeForPlannings();

	$.post(`https://${resName}/getAllPlannings`, {}, async function(rawPlannings) {

		// Manually create the table to avoid incompatibilities due table indexing
		plannings = {};

		for(const[k, planningData] of Object.entries(rawPlannings)) {
			plannings[planningData.id] = planningData;
		}

		planningsDatatable.clear();

		for(const[id, planningData] of Object.entries(plannings)) {
			planningsDatatable.row.add([
				id,
				planningData.label,
				cargoRobberies[planningData.cargoRobberyId]?.label || "None",
				remainingTimes[id] || "?",
			]);
		}

		planningsDatatable.draw();
	})
}

function planningSetTargetRobbery(robberyId = null) {
	let planningModal = $("#planning-modal");

	planningModal.data("cargoRobberyId", robberyId);

	if(robberyId) {
		let robberyLabel = cargoRobberies[robberyId].label;

		$("#planning-target-robbery").val( robberyLabel );
	} else {
		$("#planning-target-robbery").val( getLocalizedText("menu:none") );
	}
}

function setDefaultDataOfPlanningModal() {
	$("#planning-label").val("Default");
	$("#planning-min-police").val(0);

	planningSetTargetRobbery(null);

	$("#planning-date-type").val("now").change();
}

$("#new-planning-btn").click(function() {
	let planningModal = $("#planning-modal");

	// Converts from edit modal to create modal
	planningModal.data("action", "create");
	
	$("#delete-planning-btn").hide();
	$("#save-planning-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfPlanningModal();

	planningModal.modal("show");
})


$("#planning-choose-robbery-btn").click(async function() {
	let robberyId = await cargoRobberiesDialog();

	planningSetTargetRobbery(robberyId);
});

function togglePlanningDateType() {
	let val = $("#planning-date-type").val();

	if(val == "date") {
		$("#planning-date").show().prop("required", true);
	} else {
		$("#planning-date").hide().prop("required", false);
	}

	if(val == "interval") {
		$("#planning-interval-div").show();
		$("#planning-interval").prop("required", true);
	} else {
		$("#planning-interval-div").hide();
		$("#planning-interval").prop("required", false);
	}
}

$("#planning-date-type").change(togglePlanningDateType);

function getUnixFromDate(date) {
	return Math.floor(new Date(date).getTime() / 1000 )
}

function getDateFromUnix(unix) {
	const padL = (nr, len = 2, chr = `0`) => `${nr}`.padStart(2, chr);

	let date = new Date(unix * 1000)

	let formatted = `${
		date.getFullYear()}-${
		padL(date.getMonth()+1)}-${
		padL(date.getDate())}T${
		padL(date.getHours())}:${
		padL(date.getMinutes())}`

	return formatted;
}

$("#planning-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let planningModal = $("#planning-modal");
	let action = planningModal.data("action");

	let planningData = {
		label: $("#planning-label").val(),
		minimumPolice: parseInt($("#planning-min-police").val()),
		cargoRobberyId: parseInt(planningModal.data("cargoRobberyId")),
		data: {
			dateType: $("#planning-date-type").val(),
			date: getUnixFromDate( $("#planning-date").val() ),
			interval: parseInt( $("#planning-interval").val() ),
		}
	}
	
	switch(action) {
		case "create": {
			const response = await $.post(`https://${resName}/createPlanning`, JSON.stringify(planningData));
			showServerResponse(response);

			if(response === true) {
				planningModal.modal("hide");
				loadPlannings();
			}

			break;
		}

		case "edit": {
			const response = await $.post(`https://${resName}/updatePlanning`, JSON.stringify({planningId: planningModal.data("planningId"), planningData: planningData}));
			showServerResponse(response);

			if(response === true) {
				planningModal.modal("hide");
				loadPlannings();
			}

			break;
		}
	}
})

function editPlanning(id) {
	let planningData = plannings[id];

	let planningsModal = $("#planning-modal");

	planningsModal.data("action", "edit");
	planningsModal.data("planningId", id);
	
	$("#delete-planning-btn").show();
	$("#save-planning-btn").text( getLocalizedText("menu:save") );

	$("#planning-label").val(planningData.label);
	$("#planning-min-police").val(planningData.minimumPolice);

	planningSetTargetRobbery(planningData.cargoRobberyId);

	$("#planning-date-type").val(planningData.data.dateType).change();
	$("#planning-date").val( getDateFromUnix(planningData.data.date) );
	$("#planning-interval").val(planningData.data.interval);

	planningsModal.modal("show");
}

$("#delete-planning-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let planningModal = $("#planning-modal");
	let planningId = planningModal.data("planningId");

	const response = await $.post(`https://${resName}/deletePlanning`, JSON.stringify({planningId: planningId}));
	showServerResponse(response);

	if(response === true) {
		planningModal.modal("hide");
		loadPlannings();
	}
})

/*
███    ██ ██████   ██████     ███    ███ ██    ██  ██████   ██████  ██ ███    ██  ██████  
████   ██ ██   ██ ██          ████  ████ ██    ██ ██       ██       ██ ████   ██ ██       
██ ██  ██ ██████  ██          ██ ████ ██ ██    ██ ██   ███ ██   ███ ██ ██ ██  ██ ██   ███ 
██  ██ ██ ██      ██          ██  ██  ██ ██    ██ ██    ██ ██    ██ ██ ██  ██ ██ ██    ██ 
██   ████ ██       ██████     ██      ██  ██████   ██████   ██████  ██ ██   ████  ██████  
*/
function toggleNpcMugging() {
	let enableNpcMuggingDiv = $("#enable-npc-mugging")
	let enable = enableNpcMuggingDiv.prop("checked");

	$("#npc-mugging-options").find("input, button").not(enableNpcMuggingDiv).prop("disabled", !enable);
}
$("#enable-npc-mugging").change(toggleNpcMugging);

async function addRobbableObjectNpcMugging(object) {
	let robbableObjectDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center justify-content-center text-body my-2 robbable-object">

			<select class="form-select object-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control object-name" placeholder="Name" required>
				<label>${getLocalizedText("menu:object_name")}</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-floating">
				<input type="number"  class="form-control max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
				<label>${getLocalizedText("menu:max_quantity")}</label>
			</div>

			<div class="form-floating">
				<input type="number"  class="form-control chances" placeholder="${getLocalizedText("menu:probability")}" required>
				<label>${getLocalizedText("menu:probability")}</label>
			</div>

			<button type="button" class="btn-close btn-close-white remove-btn ms-2"></button>
		</div>
	`)

	robbableObjectDiv.find(".choose-btn").click(async function() {
		let objectType = robbableObjectDiv.find(".object-type").val();

		let objectName = await objectDialog(objectType);

		robbableObjectDiv.find(".object-name").val(objectName);
	}).tooltip();


	robbableObjectDiv.find(".remove-btn").click(function() {
		robbableObjectDiv.remove();
	})

	// Sets the object property if exist

	if(object) {
		robbableObjectDiv.find(".object-type").val(object.type);
		robbableObjectDiv.find(".object-name").val(object.name);
		robbableObjectDiv.find(".min-quantity").val(object.minQuantity);
		robbableObjectDiv.find(".max-quantity").val(object.maxQuantity);
		robbableObjectDiv.find(".chances").val(object.chances);
	}

	$("#npc-mugging-robbable-items").append(robbableObjectDiv);
}
$("#npc-mugging-add-object").click(function() {
	addRobbableObjectNpcMugging();
});

function getNpcMuggingRobbableObjects() {
	let robbableObjects = [];

	$("#npc-mugging-robbable-items").find(".robbable-object").each(function() {
		let currentObject = $(this);

		let object = {
			type: currentObject.find(".object-type").val(),
			name: currentObject.find(".object-name").val(),
			minQuantity: parseInt(currentObject.find(".min-quantity").val()),
			maxQuantity: parseInt(currentObject.find(".max-quantity").val()),
			chances: parseInt(currentObject.find(".chances").val())
		}

		robbableObjects.push(object);
	})

	return robbableObjects;
}

function setNpcMuggingRobbableObjects(objects) {
	$("#npc-mugging-robbable-items").empty();

	objects.forEach(object => {
		addRobbableObjectNpcMugging(object);
	});
}

$("#npc-mugging").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		clNpcMugging: {
			canMakeFollow: $("#can-make-npc-to-follow").prop("checked"),
			cooldownOnMugging: parseInt( $("#npc-mugging-cooldown-on-mugging").val() )
		}
	}

	let sharedSettings = {
		isNpcMuggingEnabled: $("#enable-npc-mugging").prop("checked"),
		secondsToMug: parseInt( $("#seconds-to-mug").val() )
	}

	let serverSettings = {
		svNpcMugging: {
			robbableObjects: getNpcMuggingRobbableObjects(),
			minimumPolice: parseInt( $("#npc-mugging-minimum-police").val() ),
			probabilityPoliceAlert: parseInt( $("#npc-mugging-probability-police-alert").val() ),
			minimumObjectsAmount: parseInt( $("#npc-mugging-minimum-objects-amount").val() ),
			maximumObjectsAmount: parseInt( $("#npc-mugging-maximum-objects-amount").val() ),
			minutesAfterAutomaticallyRunAway: parseInt( $("#minutes-before-automatically-run-away").val() ),
			maxNPCsFollowing: parseInt( $("#npc-mugging-max-npcs-following").val() )
		}
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: clientSettings,
		sharedSettings: sharedSettings,
		serverSettings: serverSettings,
	}));

	showServerResponse(response);
});