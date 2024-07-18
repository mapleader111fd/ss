const resName = GetParentResourceName();

// Utils

function showNotification(message, duration=false) {
    var notification = $("#notification");
    
    if(duration) {
        notification.toast({
            autohide: true,
            delay: duration
        })
    } else {
        notification.toast({
            autohide: false,
        })
    }

    $("#notification-message").text(message)

    notification.toast("show")
}

async function buildingsDialog() {
	let inputBuildingModal = $("#input-building-dialog-modal")
	inputBuildingModal.modal("show");

	$("#input-building-search").val("");

	const buildings = await $.post(`https://${resName}/getAllBuildings`);
	let buildingsListDiv = $("#buildings-list");

	buildingsListDiv.empty();

	return new Promise(resolve => {
		for(const[_, buildingData] of Object.entries(buildings)) {
			let buildingDiv = $(`
				<li class="list-group-item list-group-item-action clickable">${buildingData.id} - ${buildingData.label}</li>
			`);
	
			buildingDiv.click(function() {
				inputBuildingModal.modal("hide");
				resolve(buildingData.id);
			});
	
			buildingsListDiv.append(buildingDiv);
		}	
	})
}
$("#input-building-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#buildings-list li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

async function playersListDialog(cb) {
	// Get players list
	let playersList = await $.get(`https://${resName}/getPlayersList`);

	let modal = $("#players-dialog-modal");

	$("#input-players-search").val("");

	let playerListDiv = $("#players-list")

	playerListDiv.empty();

	for(const playerData of playersList) {
		let playerDiv = $(`
			<li class="list-group-item list-group-item-action clickable"}>${playerData.playerName}</li>
		`);

		playerDiv.click(function() {
			modal.modal("hide");
			cb(playerData.identifier);
		});

		playerListDiv.append(playerDiv);
	}

	modal.modal("show");
}
$("#input-players-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#players-list li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

/* DOORS */
function changeLockIconButton(row, newState) {
	const lockedIcon = `<i class="bi bi-lock"></i>`;
	const unlockedIcon = `<i class="bi bi-unlock"></i>`;

	const btnDiv = $(row).find(".toggle-lock-btn");

	if(newState) {
		btnDiv.html(lockedIcon);
		btnDiv.removeClass("btn-success");
		btnDiv.addClass("btn-danger");
	} else {
		btnDiv.html(unlockedIcon);
		btnDiv.removeClass("btn-danger");
		btnDiv.addClass("btn-success");
	}
}

let doorsDatatable = $("#doors-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"columnDefs": [
        { 
            "targets": -1, // Ultima colonna
            "data": null,
			"className": "col-1",
            "defaultContent": `
			<div class="d-inline-flex gap-3">
				<button class='btn btn-danger py-0 px-2 toggle-lock-btn'><i class=\"bi bi-lock\"></i></button>
				<button class='btn py-0 px-2 teleport-to-door-btn' style="background-color: #706fd3" data-bs-toggle="tooltip" data-bs-placement="top" title="TP"><i class=\"bi-geo-fill\"></i></button>
			</div>
			`
        }
    ],
	"createdRow": async function ( row, data, index ) {
		const doorsData = data[data.length - 1]; 

		$(row).addClass("clickable");

		$(row).click(function() {
			editDoor(doorsData.id);
		});

		$(row).find(".toggle-lock-btn").click(async function(event) {
			event.stopPropagation();

			const newState = await $.post(`https://${resName}/toggleLock`, JSON.stringify({doorsId: doorsData.id}));
			if(newState < 0) return;

			changeLockIconButton(row, newState);
		});

		$(row).find(".teleport-to-door-btn").click(async function(event) {
			event.stopPropagation();

			$.post(`https://${resName}/teleportToDoor`, JSON.stringify({doorsId: doorsData.id}));

			$(this).tooltip("hide");
		}).tooltip();

		const currentLockState = await $.post(`https://${resName}/getLockState`, JSON.stringify({doorsId: doorsData.id}));
		if(currentLockState < 0) return;

		changeLockIconButton(row, currentLockState);
	},
} );

let doors = {};

function loadDoors() {
    $.post(`https://${resName}/getAllDoors`, {}, async function(rawDoors) {
		// Manually create the table to avoid incompatibilities due table indexing

		doors = {};

		for(const[k, doorsData] of Object.entries(rawDoors)) {
			doors[doorsData.id] = doorsData;
		}

		doorsDatatable.clear();

		for(const[doorsId, doorsData] of Object.entries(doors)) {
			doorsDatatable.row.add([
				doorsData.distance,
				doorsId,
                doorsData.label,
                doorsData.doors ? Object.entries(doorsData.doors).length : 0,
				doorsData.parentBuilding ? buildings[doorsData.parentBuilding].label : getLocalizedText("menu:none"),
				doorsData // Will be the last element of the data parameter in the createdRow callback
			])
		}

		doorsDatatable.draw()
	})
}

function setDoorsModalType(type) {
	$("#door-modal").data("type", type);

	switch(type) {
		case "building": {
			$("#used-doors-div").hide();
			$("#maximum-distance-div").hide().find("input").prop("required", false);
			$("#icon-coordinates-div").hide().find("input").prop("required", false);
			$("#use-building-rules-div").hide();
			$("#sliding-door-div").hide();
			$("#display-door-icon-div").hide();
			$("#can-be-lockpicked-div").hide();
			$("#vault-door-div").hide();
			$("#sound-data-div").hide();

			showBuildingOptions();

			break;
		}

		case "door": {
			$("#used-doors-div").show();
			$("#maximum-distance-div").show().find("input").prop("required", true);
			$("#icon-coordinates-div").show().find("input").prop("required", true);
			$("#use-building-rules-div").show();
			$("#sliding-door-div").show();
			$("#display-door-icon-div").show();
			$("#can-be-lockpicked-div").show();
			$("#vault-door-div").show();
			$("#sound-data-div").show();

			break;
		}
	}
}

function setupDefaultModalValues() {
	let doorModal = $("#door-modal");

	doorModal.find(".form-control").val("");

	$("#door-label").val( getLocalizedText("menu:default") );

	$(`input[name="doors-default-state"][value="0"]`).prop("checked", true);

	$("#used-doors-table").empty();
	$("#maximum-distance").val(4.0);

	$("#requires-job").prop("checked", false).change();
	$("#requires-item").prop("checked", false).change();
	$("#requires-code").prop("checked", false).change();
	$("#auto-closure-switch").prop("checked", false).change();
	$("#can-be-lockpicked").prop("checked", true).change();
	$("#alert-police-on-lockpick").prop("checked", false).change();
	$("#is-sliding-door").prop("checked", true).change();
	$("#display-door-icon").prop("checked", true).change();

	$("#requires-identifier").prop("checked", false).change();
	$("#allowed-identifiers").empty();

	$("#is-vault-door").prop("checked", false).change();
}

$("#register-bulk-doors-btn").click(async function() {
	let doorModal = $("#door-modal");

	$("html").hide();

	setDoorsModalType("door");

	// Converts from edit modal to create modal
	doorModal.data("action", "create");

	$("#delete-door-btn").hide();
	$("#save-door-btn").text( getLocalizedText("menu:create") );

	// Resets fields (only for the first door in bulk list)
	setupDefaultModalValues();

	// Gets the bulk doors list
	let mergedDoors = await $.get(`https://${resName}/getMergedDoors`);

	if(!mergedDoors || mergedDoors.length == 0) {
		$("html").show();
		return;
	}

	let finalDoorsObjectUsed = {};

	for(let i=0; i < mergedDoors.length; i++) {
		$("html").hide();

		let data = await $.post(`https://${resName}/bulkRegisterDoorsGroup`, JSON.stringify({
			doorsGroup: mergedDoors[i],
			finalDoorsObjectUsed: finalDoorsObjectUsed
		}));

		$("html").show();
		if(!data.doorsData) continue;

		doorModal.modal("show");

		// merge the final doors object used
		finalDoorsObjectUsed = Object.assign(finalDoorsObjectUsed, data.finalDoorsObjectUsed);
		let doorsData = data.doorsData;

		setUsedDoors(doorsData.doors);
		$("#icon-coords-x").val(doorsData.iconCoords.x).change();
		$("#icon-coords-y").val(doorsData.iconCoords.y).change();
		$("#icon-coords-z").val(doorsData.iconCoords.z).change();

		// Wait till the modal is closed
		await new Promise(resolve => {
			doorModal.one("hidden.bs.modal", function() {
				resolve();
			})
		})
	}
})

$("#new-door-btn").click(function() {
	let doorModal = $("#door-modal");

	setDoorsModalType("door");

	// Converts from create modal to edit modal
	doorModal.data("action", "create");
	
	$("#delete-door-btn").hide();
	$("#save-door-btn").text( getLocalizedText("menu:create") );
	
	// Resets fields
	setupDefaultModalValues();

	setParentBuilding(null);

	doorModal.modal("show");
})

function setUsedDoors(doors = {}) {
	let usedDoorsTable = $("#used-doors-table");

	usedDoorsTable.empty();

	for(const[doorObject, doorData] of Object.entries(doors)) {
		let x = (doorData.coords.x).toFixed(2);
		let y = (doorData.coords.y).toFixed(2);
		let z = (doorData.coords.z).toFixed(2);

		let newRow = $(`
			<tr class="used-door">
				<td class="x-coord">${x}</td>
				<td class="y-coord">${y}</td>
				<td class="z-coord">${z}</td>
				<td class="model">${doorData.model}</td>
			</tr>
		`)

		newRow.data("doorObject", doorObject);

		usedDoorsTable.append(newRow);
	}
}

$("#select-doors-btn").click(function() {
	closeMenu();
	let doorModal = $("#door-modal");
	doorModal.modal("hide");

	let action = doorModal.data("action");
	if(action === "edit") {
		var doorsId = doorModal.data("doorsId");
	}
	
	$.post(`https://${resName}/selectDoors`, JSON.stringify({doorsId: doorsId}), function(doors) {
		if(doors) {
			setUsedDoors(doors);
		}

		$("#doors_creator").show();
		doorModal.modal("show");
	})
})

$("#choose-icon-coords-btn").click(function() {
	closeMenu();
	let doorModal = $("#door-modal");
	doorModal.modal("hide");

	$.post(`https://${resName}/chooseIconCoords`, JSON.stringify({usedDoors: getUsedDoors()}), function(coords) {
		if(coords) {
			$("#icon-coords-x").val(coords.x).change();
			$("#icon-coords-y").val(coords.y).change();
			$("#icon-coords-z").val(coords.z).change();
		}
		
		$("#doors_creator").show();
		doorModal.modal("show");
	})
})

function getUsedDoors() {
	let doorsTable = $("#used-doors-table");
	let usedDoors = {};
	
	let isThereAtLeastOneDoor = false;

	doorsTable.find(".used-door").each(function() {
		isThereAtLeastOneDoor = true;

		let doorObject = $(this).data("doorObject");

		let model = parseInt( $(this).find(".model").text() );

		let x = parseFloat( $(this).find(".x-coord").text() );
		let y = parseFloat( $(this).find(".y-coord").text() );
		let z = parseFloat( $(this).find(".z-coord").text() );

		usedDoors[doorObject] = {
			coords: {
				x: x,
				y: y,
				z: z
			},

			model: model
		}
	});

	return isThereAtLeastOneDoor && usedDoors || null;
}

$("#choose-maximum-distance-btn").click(function() {
	let doors = getUsedDoors();
	if(!doors) return swal("ERROR", getLocalizedText("menu:no_doors_selected"), "error");;

	closeMenu();
	let doorModal = $("#door-modal");
	doorModal.modal("hide");

	let currentDistance = parseFloat( $("#maximum-distance").val() );
	$.post(`https://${resName}/chooseMaximumDistance`, JSON.stringify({doors: doors, distance: currentDistance}), function(maxDistance) {
		if(maxDistance) {
			$("#maximum-distance").val(maxDistance);
		}

		$("#doors_creator").show();
		doorModal.modal("show");
	})
})

async function getGangLabel(gangName) {
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/getGangLabel`, JSON.stringify({gangName: gangName}), function(gangLabel) {
			resolve(gangLabel);
		})
	})
}

async function setRequiredJob(requiresJob, allowedJobs) {
	$("#requires-job").prop("checked", requiresJob).change();

	let allowedJobsDiv = $("#allowed-jobs");

	allowedJobsDiv.val("");

	if(allowedJobs) {
		allowedJobsDiv.data("allowedJobs", allowedJobs);

		let text = "";

		let isTheFirst = true;

		for(const[jobName, _] of Object.entries(allowedJobs)) {
			if(isTheFirst) {
				text = await getJobLabel(jobName);

				isTheFirst = false;
			} else {
				text += `, ${await getJobLabel(jobName)}`;
			}
		}

		allowedJobsDiv.val(text);
	} else {
		allowedJobsDiv.data("allowedJobs", null);
	}
}

async function setRequiredGang(requiresGang, allowedGangs) {
	$("#requires-gang").prop("checked", requiresGang).change();

	let allowedGangsDiv = $("#allowed-gangs");

	allowedGangsDiv.val("");

	if(allowedGangs) {
		allowedGangsDiv.data("allowedGangs", allowedGangs);

		let text = "";

		let isTheFirst = true;

		for(const[gangName, _] of Object.entries(allowedGangs)) {
			if(isTheFirst) {
				text = await getGangLabel(gangName);

				isTheFirst = false;
			} else {
				text += `, ${await getGangLabel(gangName)}`;
			}
		}

		allowedGangsDiv.val(text);
	} else {
		allowedGangsDiv.data("allowedGangs", null);
	}
}

async function setRequiredItem(requiresItem, requiredItem) {
	$("#requires-item").prop("checked", requiresItem).change();

	let requiredItemDiv = $("#required-item");

	requiredItemDiv.val(requiredItem);
}

$("#requires-code").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#required-code").prop("disabled", !isEnabled).prop("required", isEnabled);;
})

function setRequiredCode(requiredCode) {
	$("#requires-code").prop("checked", requiredCode != undefined).change();
	
	$("#required-code").val(requiredCode);
}

function hideBuildingOptions() {
	$("#requires-job-div").hide();
	$("#requires-item-div").hide();
	$("#requires-code-div").hide();
	$("#auto-closure-div").hide();
	$("#default-doors-state-div").hide();
	$("#requires-identifier-div").hide();
}

function showBuildingOptions() {
	$("#requires-job-div").show();
	$("#requires-item-div").show();
	$("#requires-code-div").show();
	$("#auto-closure-div").show();
	$("#default-doors-state-div").show();
	$("#requires-identifier-div").show();
}

function setParentBuilding(buildingId) {
	if(buildingId != undefined) {
		$("#use-building-rules").prop("checked", true).change();
		$("#parent-building").data("buildingId", buildingId).val(buildings[buildingId].label);
	} else {
		$("#use-building-rules").prop("checked", false).change();
		$("#parent-building").data("buildingId", null).val("");
	}
}

async function editDoor(doorsId) {
	setDoorsModalType("door");

	let doorModal = $("#door-modal");

	doorModal.find("input .form-control").val("");

	doorModal.data("doorsId", doorsId);

	// Converts from create modal to edit modal
	doorModal.data("action", "edit");
	
	$("#delete-door-btn").show();
	$("#save-door-btn").text( getLocalizedText("menu:save") );
	
	let doorsData = doors[doorsId];

	$("#door-label").val(doorsData.label);

	setUsedDoors(doorsData.doors);

	$(`input[name="doors-default-state"][value="${doorsData.defaultState}"]`).prop("checked", true);

	$("#maximum-distance").val(doorsData.maxDistance);

	setRequiredJob(doorsData.allowedJobs ? true : false, doorsData.allowedJobs);
	
	if(await getFramework() == "QB-core") {
		setRequiredGang(doorsData.allowedGangs ? true : false, doorsData.allowedGangs);
	}

	setRequiredItem(doorsData.requiredItem ? true : false, doorsData.requiredItem);
	setRequiredCode(doorsData.requiredCode);

	setAutoClosure(doorsData.autoClosureSeconds);

	setParentBuilding(doorsData.parentBuilding);

	$("#requires-job-and-item").prop("checked", doorsData.requiresJobAndItem);

	$("#is-sliding-door").prop("checked", doorsData.isSliding);
	$("#display-door-icon").prop("checked", doorsData.displayIcon);
	$("#can-be-lockpicked").prop("checked", doorsData.canBeLockpicked);
	$("#alert-police-on-lockpick").prop("checked", doorsData.alertPoliceOnLockpick);

	// Requires identifier
	$("#requires-identifier").prop("checked", doorsData.requiresIdentifier).change();

	// Add identifiers
	$("#allowed-identifiers").empty();
	if(doorsData.allowedIdentifiers) {
		for(const [identifier, _] of Object.entries(doorsData.allowedIdentifiers)) {
			addIdentifierToList(identifier);
		}
	}

	setVaultData(doorsData.vault);
	setSoundsData(doorsData.soundsData);

	$("#icon-coords-x").val(doorsData.iconCoords.x).change();
	$("#icon-coords-y").val(doorsData.iconCoords.y).change();
	$("#icon-coords-z").val(doorsData.iconCoords.z).change();

	doorModal.modal("show");
}

function submitDoor() {
	let doorModal = $("#door-modal");

	let action = doorModal.data("action");

	let doorData = {
		label: $("#door-label").val(),
		defaultState: parseInt( $("input[name='doors-default-state']:checked").val() ),
		maxDistance: parseFloat( $("#maximum-distance").val() ),

		iconCoords: {
			x: parseFloat( $("#icon-coords-x").val() ),
			y: parseFloat( $("#icon-coords-y").val() ),
			z: parseFloat( $("#icon-coords-z").val() )
		},

		doors: getUsedDoors(),

		allowedJobs: $("#requires-job").prop("checked") ? $("#allowed-jobs").data("allowedJobs") : null,
		allowedGangs: $("#requires-gang").prop("checked") ? $("#allowed-gangs").data("allowedGangs") : null,
		requiredItem: $("#requires-item").prop("checked") ? $("#required-item").val() : null,

		requiresJobAndItem: $("#requires-job-and-item").prop("checked"),

		requiredCode: $("#requires-code").prop("checked") ? $("#required-code").val() : null,

		autoClosureSeconds: $("#auto-closure-switch").prop("checked") ? parseInt( $("#auto-closure").val() ) : null,

		parentBuilding: $("#use-building-rules").prop("checked") ? $("#parent-building").data("buildingId") : null,

		isSliding: $("#is-sliding-door").prop("checked"),
		displayIcon: $("#display-door-icon").prop("checked"),

		requiresIdentifier: $("#requires-identifier").prop("checked"),
		allowedIdentifiers: getAllowedIdentifiers(),

		vault: getVaultData(),

		canBeLockpicked: $("#can-be-lockpicked").prop("checked"),
		alertPoliceOnLockpick: $("#alert-police-on-lockpick").prop("checked"),

		soundsData: getSoundsData()
	}

	switch(action) {
		case "create": {
			$.post(`https://${resName}/createDoor`, JSON.stringify(doorData), function(isSuccessful) {
				if(isSuccessful) {
					loadDoors();
					doorModal.modal("hide");
				}
			});

			break;
		}

		case "edit": {
			let doorsId = doorModal.data("doorsId");

			$.post(`https://${resName}/updateDoor`, JSON.stringify({doorsId: doorsId, doorData: doorData}), function(isSuccessful) {
				if(isSuccessful) {
					loadDoors();
					doorModal.modal("hide");
				}
			});

			break;
		}
	}
}

function submitBuilding() {
	let buildingModal = $("#door-modal");

	let action = buildingModal.data("action");

	let buildingData = {
		label: $("#door-label").val(),
		defaultState: parseInt( $("input[name='doors-default-state']:checked").val() ),

		allowedJobs: $("#requires-job").prop("checked") ? $("#allowed-jobs").data("allowedJobs") : null,
		allowedGangs: $("#requires-gang").prop("checked") ? $("#allowed-gangs").data("allowedGangs") : null,
		requiredItem: $("#requires-item").prop("checked") ? $("#required-item").val() : null,

		requiresJobAndItem: $("#requires-job-and-item").prop("checked"),

		requiredCode: $("#requires-code").prop("checked") ? $("#required-code").val() : null,

		autoClosureSeconds: $("#auto-closure-switch").prop("checked") ? parseInt( $("#auto-closure").val() ) : null,

		requiresIdentifier: $("#requires-identifier").prop("checked"),
		allowedIdentifiers: getAllowedIdentifiers()

	}

	switch(action) {
		case "create": {
			$.post(`https://${resName}/createBuilding`, JSON.stringify(buildingData), function(isSuccessful) {
				if(isSuccessful) {
					loadBuildings();
					buildingModal.modal("hide");
				}
			});

			break;
		}

		case "edit": {
			let buildingId = buildingModal.data("buildingId");

			$.post(`https://${resName}/updateBuilding`, JSON.stringify({buildingId: buildingId, buildingData: buildingData}), function(isSuccessful) {
				if(isSuccessful) {
					loadBuildings();
					buildingModal.modal("hide");
				}
			});
			
			break;
		}
	}
}

$("#door-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let type = $("#door-modal").data("type");

	if(type == "door") {
		submitDoor();
	} else if(type == "building") {
		submitBuilding();
	}
})

$("#delete-door-btn").click(function() {
	let doorModal = $("#door-modal");

	let type = doorModal.data("type");

	switch(type) {
		case "door": {
			let doorsId = doorModal.data("doorsId");

			$.post(`https://${resName}/deleteDoor`, JSON.stringify({doorsId: doorsId}), function(isSuccessful) {
				if(isSuccessful) {
					loadDoors();
					doorModal.modal("hide");
				}
			});

			break;
		}

		case "building": {
			let buildingId = doorModal.data("buildingId");

			$.post(`https://${resName}/deleteBuilding`, JSON.stringify({buildingId: buildingId}), function(isSuccessful) {
				if(isSuccessful) {
					loadBuildings();
					doorModal.modal("hide");
				}
			});

			break;
		}
	}
});

/* DOORS - Jobs */
$("#requires-job").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#choose-jobs-btn").prop("disabled", !isEnabled);
});

$("#choose-jobs-btn").click(async function() {
	const oldJobs =  $("#allowed-jobs").data("allowedJobs");
	
	let allowedJobs = await jobsDialog(oldJobs);

	setRequiredJob(allowedJobs ? true : false, allowedJobs);
});

/* DOORS - Gangs QBCore */
$("#requires-gang").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#choose-gangs-btn").prop("disabled", !isEnabled);
});

$("#choose-gangs-btn").click(async function() {
	const oldGangs =  $("#allowed-gangs").data("allowedGangs");
	
	let allowedGangs = await gangsDialog(oldGangs);

	setRequiredGang(allowedGangs ? true : false, allowedGangs);
});

/* DOORS - Item */
$("#requires-item").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#choose-item-btn").prop("disabled", !isEnabled);
	$("#required-item").prop("disabled", !isEnabled);
	$("#required-item").prop("required", isEnabled);
});

$("#choose-item-btn").click(async function() {
	const itemName = await itemsDialog();
	if(!itemName) return;

	$("#required-item").val(itemName);
});

/* DOORS - Item & Job */
function requiresBothJobAndItem() {
	let requiresItem = $("#requires-item").prop("checked");
	let requiresJob = $("#requires-job").prop("checked");

	let requiresBoth = requiresItem && requiresJob;

	$("#requires-job-and-item-div").toggle(requiresBoth);

	if(!requiresBoth) {
		$("#requires-job-and-item").prop("checked", false);
	}
}
$("#requires-item, #requires-job").change(requiresBothJobAndItem);

/* DOORS - Auto closure */
$("#auto-closure-switch").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#auto-closure").prop("disabled", !isEnabled);
})

function setAutoClosure(seconds) {
	$("#auto-closure-switch").prop("checked", seconds ? true : false).change();
	$("#auto-closure").val(seconds ? seconds : null);
}

/* BUILDINGS */
let buildingsDatatable = $("#buildings-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"columnDefs": [
        { 
            "targets": -1, // Ultima colonna
            "data": null,
			"className": "col-1",
            "defaultContent": `
			<div class="d-inline-flex gap-3">
				<div class="btn-group" role="group">
					<button class='btn btn-success py-0 px-2 unlock-building-btn'><i class=\"bi bi-unlock\"></i></button>
					<button class='btn btn-danger py-0 px-2 lock-building-btn'><i class=\"bi bi-lock\"></i></button>
				</div>
			</div>
			`
        }
    ],
	"createdRow": async function ( row, data, index ) {
		const buildingData = data[data.length - 1]; 

		$(row).addClass("clickable");

		$(row).click(function() {
			editBuilding(buildingData.id);
		})
		
		$(row).find(".unlock-building-btn").click(function(event) {
			event.stopPropagation();

			$.post(`https://${resName}/setBuildingLockState`, JSON.stringify({buildingId: buildingData.id, newState: 0}));
		});

		$(row).find(".lock-building-btn").click(function(event) {
			event.stopPropagation();

			$.post(`https://${resName}/setBuildingLockState`, JSON.stringify({buildingId: buildingData.id, newState: 1}));
		});
	},
} );

let buildings = {};

function loadBuildings() {
    $.post(`https://${resName}/getAllBuildings`, {}, async function(rawBuildings) {
		// Manually create the table to avoid incompatibilities due table indexing

		buildings = {};

		for(const[k, buildingData] of Object.entries(rawBuildings)) {
			buildings[buildingData.id] = buildingData;
		}

		buildingsDatatable.clear();

		for(const[buildingId, buildingData] of Object.entries(buildings)) {
			buildingsDatatable.row.add([
				buildingId,
                buildingData.label,
                buildingData.defaultState === 0 ? getLocalizedText("menu:unlocked") : getLocalizedText("menu:locked"),
				buildingData
			])
		}

		buildingsDatatable.draw()
	})
}

$("#new-building-btn").click(function() {
	let buildingModal = $("#door-modal");

	setDoorsModalType("building");
	setupDefaultModalValues();

	buildingModal.data("action", "create");

	buildingModal.modal("show");
});

function editBuilding(buildingId) {
	let buildingData = buildings[buildingId];

	setDoorsModalType("building");

	let buildingModal = $("#door-modal");

	buildingModal.data("action", "edit");
	
	buildingModal.find("input .form-control").val("");
	buildingModal.data("buildingId", buildingId);

	// Converts from create modal to edit modal
	buildingModal.data("action", "edit");
	
	$("#delete-door-btn").show();
	$("#save-door-btn").text( getLocalizedText("menu:save") );
	
	$("#door-label").val(buildingData.label);

	$(`input[name="doors-default-state"][value="${buildingData.defaultState}"]`).prop("checked", true);

	setRequiredJob(buildingData.allowedJobs ? true : false, buildingData.allowedJobs);
	setRequiredGang(buildingData.allowedGangs ? true : false, buildingData.allowedGangs);
	setRequiredItem(buildingData.requiredItem ? true : false, buildingData.requiredItem);
	setRequiredCode(buildingData.requiredCode);

	setAutoClosure(buildingData.autoClosureSeconds);

	$("#requires-job-and-item").prop("checked", buildingData.requiresJobAndItem);

	// Requires identifier
	$("#requires-identifier").prop("checked", buildingData.requiresIdentifier).change();

	// Add identifiers
	$("#allowed-identifiers").empty();
	if(buildingData.allowedIdentifiers) {
		for(const [identifier, _] of Object.entries(buildingData.allowedIdentifiers)) {
			addIdentifierToList(identifier);
		}
	}

	buildingModal.modal("show");
}

$("#use-building-rules").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#choose-building-btn").prop("disabled", !isEnabled);

	if(isEnabled) {
		hideBuildingOptions();
	} else {
		showBuildingOptions();
	}
})

$("#choose-building-btn").click(async function() {
	const buildingId = await buildingsDialog();
	if(!buildingId) return;

	setParentBuilding(buildingId);
});

/* SETTINGS */
$("#settings_enableDoorlockAnimation").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#doorlock-animation-div").find("input").prop("disabled", !isEnabled).prop("required", isEnabled);
})

function setDoorlockAnimation(doorLockAnimation) {
	$("#settings_enableDoorlockAnimation").prop("checked", doorLockAnimation.isEnabled).change();
	
	$("#settings_doorlockAnimationDictionary").val(doorLockAnimation.dict);
	$("#settings_doorlockAnimationName").val(doorLockAnimation.name);
	$("#settings_doorlockAnimationDuration").val(doorLockAnimation.duration);
}

function getDoorlockAnimation() {
	if( $("#settings_enableDoorlockAnimation").prop("checked") ) {
		let doorLockAnimation = {
			dict: $("#settings_doorlockAnimationDictionary").val(),
			name: $("#settings_doorlockAnimationName").val(),
			duration: parseInt( $("#settings_doorlockAnimationDuration").val() ),
			isEnabled: true
		}

		return doorLockAnimation;
	} else {
		let doorLockAnimation = {
			isEnabled: false
		}

		return doorLockAnimation;
	}
}

$("#import-from-qb-doorlock-btn").click(async function() {
	if(!await confirmWarning(getLocalizedText("menu:backup_reccomended"))) return;

	const response = await $.post(`https://${resName}/importFromQbDoorlock`, JSON.stringify({}));

	if(response === true) {
		loadDoors();
	}

	showServerResponse(response);
});

$("#import-from-ox-doorlock-btn").click(async function() {
	if(!await confirmWarning(getLocalizedText("menu:backup_reccomended"))) return;

	const response = await $.post(`https://${resName}/importFromOxDoorlock`, JSON.stringify({}));

	if(response === true) {
		loadDoors();
	}

	showServerResponse(response);
});

function loadSettings(fullConfig) {
	setTomSelectValue("#settings_locale", fullConfig.locale);
	
	$("#settings_acePermission").val(fullConfig.acePermission);
	$("#settings_saveDoorStateAfterRestart").prop("checked", fullConfig.saveDoorStateAfterRestart);

	$("#settings_doorlockIconSize").val(fullConfig.doorLockIconSize);

	$("#settings_lockpickName").val(fullConfig.lockpickName);
	$("#settings_lockpickMinimumQuantity").val(fullConfig.lockpickMinimumQuantity);
	$("#settings_lockpickLoseOnUse").prop("checked", fullConfig.lockpickLoseOnUse);
	$("#settings_lockpickMinimumPolice").val(fullConfig.lockpickMinimumPolice);

	// Door icon
	$("#settings_use3dTextInsteadOfIcon").prop("checked", fullConfig.use3dTextInsteadOfIcon);
	$("#settings_exclusiveDoorIcon").prop("checked", fullConfig.exclusiveDoorIcon);

	setDoorlockAnimation(fullConfig.doorLockAnimation);

	// Targeting
	setTomSelectValue("settings-targeting-script", fullConfig.targetingScript);

	// Keys
	$("#settings-confirm-key").val(fullConfig.confirmKey);
	$("#settings-key-to-toggle-door-status").val(fullConfig.keyToToggleDoorStatus);
}

$("#settings").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		doorLockAnimation: getDoorlockAnimation(),
		doorLockIconSize: parseFloat( $("#settings_doorlockIconSize").val() ),
		use3dTextInsteadOfIcon: $("#settings_use3dTextInsteadOfIcon").prop("checked"),
		targetingScript:$("#settings-targeting-script").val(),
		confirmKey: parseInt( $("#settings-confirm-key").val() ),
		keyToToggleDoorStatus: parseInt( $("#settings-key-to-toggle-door-status").val() ),
		exclusiveDoorIcon: $("#settings_exclusiveDoorIcon").prop("checked"),
	}

	let sharedSettings = {
		locale: $("#settings_locale").val(),
		lockpickName: $("#settings_lockpickName").val(),
	}

	let serverSettings = {
		acePermission: $("#settings_acePermission").val(),
		saveDoorStateAfterRestart: $("#settings_saveDoorStateAfterRestart").prop("checked"),

		lockpickMinimumQuantity: parseInt( $("#settings_lockpickMinimumQuantity").val() ),
		lockpickLoseOnUse: $("#settings_lockpickLoseOnUse").prop("checked"),
		lockpickMinimumPolice: parseInt( $("#settings_lockpickMinimumPolice").val() )
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({ clientSettings, serverSettings, sharedSettings}));
	showServerResponse(response);

	refreshTranslations(sharedSettings.locale);
});

// Doors Identifiers 
$("#requires-identifier").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#identifiers-div").find("input, button").prop("disabled", !isEnabled);
});

$("#is-vault-door").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#vault-door-options").toggle(isEnabled);

	$("#vault-speed").prop("required", isEnabled);

	if(isEnabled) {
		$(`input[name="vault-type"][value="heading"]`).prop("checked", true).change();
	} else {
		$("#vault-opened-angle").prop("required", false);
		$("#vault-closed-angle").prop("required", false);
	}
})

$(`input[name="vault-type"]`).change(function() {
	let type = $(this).val();

	if(type == "ratio") {
		$("#vault-opened-angle").attr('placeholder', "Usually 1.0 or -1.0").prop("required", false);
		$("#vault-closed-angle").attr('placeholder', "Usually 0.0").prop("required", false);
		$("#vault-get-opened-heading").hide();
		$("#vault-get-closed-heading").hide();
	} else {
		$("#vault-opened-angle").attr('placeholder', "0-360").prop("required", true);
		$("#vault-closed-angle").attr('placeholder', "0-360").prop("required", true);
		$("#vault-get-opened-heading").show();
		$("#vault-get-closed-heading").show();
	}
});

async function getHeadingOfFirstDoorObject() {
	return new Promise((resolve, reject) => {
		closeMenu();
		let doorModal = $("#door-modal");
		doorModal.modal("hide");
		
		const doorObject = $("#used-doors-table").find(".used-door").first().data("doorObject");

		$.post(`https://${resName}/getHeading`, JSON.stringify({doorObject: doorObject}), function(heading) {
			$("#doors_creator").show();
			doorModal.modal("show");

			resolve( Math.floor(heading) );
		});
	})
}

$("#vault-get-opened-heading").click(async function() {
	const heading = await getHeadingOfFirstDoorObject();
	$("#vault-opened-angle").val(heading);
})

$("#vault-get-closed-heading").click(async function() {
	const heading = await getHeadingOfFirstDoorObject();
	$("#vault-closed-angle").val(heading);
})

function addIdentifierToList(identifier) {
	let allowedIdentifiers = $("#allowed-identifiers");

	let identifierDiv = $(`
		<li class="list-group-item mt-1" data-identifier="${identifier}">${identifier} <span class="btn-close float-end clickable"></span></li>
	`)

	identifierDiv.find(".btn-close").click(function() {
		$(this).parent().remove();
	});

	allowedIdentifiers.append(identifierDiv);
}

$("#add-identifier-btn").click(function() {
	let identifierDiv = $("#identifier-to-add")
	let identifier = identifierDiv.val();

	if(identifier) {
		addIdentifierToList(identifier);
		identifierDiv.val("");
	}
})

$("#choose-player-btn").click(function() {
	playersListDialog(identifier => {
		$("#identifier-to-add").val(identifier);
	});
})

function getAllowedIdentifiers() {
	let identifiers = {};

	$("#allowed-identifiers").find("li").each(function() {
		identifiers[$(this).data("identifier")] = true;
	});

	return identifiers;
}

function getVaultData() {
	if(!$("#is-vault-door").prop("checked"))
		return null;

	let vaultData = {
		speed: parseFloat( $("#vault-speed").val() ),
		doorHeavy: $("#vault-make-door-extremely-heavy").prop("checked"),
		invertedDirection: $("#vault-inverted-direction").prop("checked"),
		openedAngle: parseFloat( $("#vault-opened-angle").val() ),
		closedAngle: parseFloat( $("#vault-closed-angle").val() ),
		type: $('input[name="vault-type"]:checked').val()
	}

	return vaultData
}

function setVaultData(vaultData) {
	if(vaultData) {
		$("#is-vault-door").prop("checked", true).change();
		$("#vault-speed").val(vaultData.speed);
		$("#vault-make-door-extremely-heavy").prop("checked", vaultData.doorHeavy);
		$("#vault-inverted-direction").prop("checked", vaultData.invertedDirection);
		$("#vault-opened-angle").val(vaultData.openedAngle);
		$("#vault-closed-angle").val(vaultData.closedAngle);
		$(`input[name="vault-type"][value=${vaultData.type || "ratio"}]`).prop("checked", true).change();
	} else {
		$("#is-vault-door").prop("checked", false).change();
	}
}

function getSoundsData() {
	let unlockSound = $("#unlock-sound").val();
	let lockSound = $("#lock-sound").val();

	return {
		unlockSound: unlockSound == "none" ? null : unlockSound,
		lockSound: lockSound == "none" ? null : lockSound
	}
}

function setSoundsData(data) {
	if(!data) {
		setTomSelectValue("#unlock-sound", "none");
		setTomSelectValue("#lock-sound", "none");

		return;
	};

	setTomSelectValue("#unlock-sound", data.unlockSound);
	setTomSelectValue("#lock-sound", data.lockSound);
}

function reloadAllData() {
	resetNexus();
	loadBuildings();
    loadDoors();
}

// Open/Close menu
async function openMenu(version, fullConfig) {
	$("#doors-creator-version").text(version);
    $("#doors_creator").show();

	reloadAllData();

	loadSettings(fullConfig);

	if(await getFramework() == "QB-core") {
		$("#requires-gang-div").show()
	}
}

function closeMenu() {
	// Resets current active tab
	$("#doors_creator").find(".nav-link, .tab-pane").each(function() {
		if($(this).data("isDefault") == "1") {
			$(this).addClass(["active", "show"])
		} else {
			$(this).removeClass(["active", "show"])
		}
	})
	
    $("#doors_creator").hide();

    $.post(`https://${resName}/close`, {})
}
$("#close-main-btn").click(closeMenu);

$("#input-div").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let input = $("#code-input").val();

	$.post(`https://${resName}/receiveInput`, JSON.stringify({input: input}));

	$("#code-input").val("");
})

$("#code-input-cancel-btn").click(function() {
	$.post(`https://${resName}/cancelInput`, JSON.stringify({}));
})

// [[ NEXUS ]]
const voteInstanceRater = raterJs({
	starSize: 35,
	element: document.querySelector("#vote-instance-rater"),
	rateCallback: async function rateCallback(rating, done) {
		const instanceId = $("#nexus-modal").data("instance").id;
		const success = await $.post(`https://${resName}/nexus/rateInstance`, JSON.stringify({rating, instanceId}));
		if(success) voteInstanceRater.setRating(rating);

		done();
	}
});

const averageInstanceVotes = raterJs({
	starSize: 20,
	readOnly: true,
	element: document.querySelector("#nexus-modal-instance-average-rating"),
});

$("#nexus-import-instance-btn").click(async function() {
	const instance = $("#nexus-modal").data("instance");
	const id = instance.id;

	const response = await $.post(`https://${resName}/nexus/importInstance`, JSON.stringify({id}));
	$("#nexus-modal").modal("hide");

	if(response === true) reloadAllData();

	showServerResponse(response);
});

let nexusDataTable = $("#nexus-table").DataTable({
	"lengthMenu": [5, 10, 15, 20],
	"pageLength": 5,
	"order": [[4, 'desc'], [5, 'desc']],
	"createdRow": function (row, data, index) {
		$(row).addClass("clickable");
		$(row).click(function () {
			const instance = $(this).data("instance");
			showInstance(instance);
			$("#nexus-modal").modal("show");
		});
	},
	"columnDefs": [{ "defaultContent": "???", "targets": "_all" }]
});
  
function showInstance(instance) {
	$("#nexus-modal").data("instance", instance);

	$("#nexus-modal-instance-listing-label").text(instance.label);
	$("#nexus-modal-instance-description").text(instance.description || getLocalizedText("menu:nexus:no_description"));
	$("#nexus-modal-instance-author").text(instance.author);
	$("#nexus-instance-building-name").text(instance.content.building.label);

	// Content names and labels

	$("#nexus-modal-instance-content").empty();
	instance.content.doors.forEach(content => {
		$("#nexus-modal-instance-content").append(`
			<li class="list-group-item">${content.label || content.name}</li>
		`);
	});

	// Votes
	if(instance?.votes?.total > 0) {
		averageInstanceVotes.setRating(instance?.votes.averageRating);
	} else {
		averageInstanceVotes.setRating(0);
	}

	$("#nexus-modal-instance-total-votes").text(instance.votes?.total || 0);

	// This server vote
	voteInstanceRater.setRating(0);
}

$("#upload-to-nexus-btn").click(async function() {
	const buildingId = await buildingsDialog();
	if(!buildingId) return;

	$("#nexus-modal-upload").data("buildingId", buildingId);

	$("#nexus-upload-label").val("");
	$("#nexus-upload-description").val("");

	$("#nexus-upload-accept-tos").prop("checked", false);
	
	$("#nexus-modal-upload").modal("show");
});

$("#nexus-upload-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	const dataToUpload = {
		buildingId: $("#nexus-modal-upload").data("buildingId"),
		label: $("#nexus-upload-label").val(),
		description: $("#nexus-upload-description").val(),
	}

	const result = await $.post(`https://${resName}/nexus/uploadData`, JSON.stringify(dataToUpload));

	if(result == true) {
		swal("Success", getLocalizedText("menu:nexus:upload_success"), "success");
		resetNexus();
	} else {
		swal("Error", result, "error");
	}

	$("#nexus-modal-upload").modal("hide");
});

$("#enter-in-nexus-btn").click(async function() {
	$("#nexus-login").find(".spinner-border").show();
	$("#enter-in-nexus-label").text("...");

	const sharedData = await $.get(`https://${resName}/nexus/getSharedData`);
	if(!sharedData) {
		swal("Error", getLocalizedText("menu:nexus:not_available"), "error");
		resetNexus();
		return;
	} 
	
	nexusDataTable.clear()

	Object.values(sharedData).forEach(instance => {
		const roundedAverageRating = instance?.votes?.averageRating ? Math.round(instance.votes.averageRating) : 0;
		const ratingStars = instance?.votes?.total ? "⭐".repeat(roundedAverageRating) : getLocalizedText("menu:nexus:not_rated");
		const limitedDescription = instance.description?.length > 30 ? instance.description.substring(0, 30) + "..." : instance.description;
		const doorsCount = instance.content.doors.length;

		const rawRow = nexusDataTable.row.add( [instance.label, limitedDescription, doorsCount, ratingStars, instance.votes?.total || 0, instance.author] );

		const rowDiv = $(rawRow.node());
		$(rowDiv).data("instance", instance);
	})

	nexusDataTable.draw();

	$("#nexus-login").hide();
	$("#nexus-container").show();
})

function resetNexus() {
	$("#nexus-login").show();
	$("#nexus-login").find(".spinner-border").hide();
	$("#enter-in-nexus-label").text("Enter in Nexus");

	$("#nexus-container").hide();
}


// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

    switch (action) {
		case 'openMenu':
			openMenu(data.version, data.fullConfig);
			break;
		case 'notification':
			showNotification(data.message, data.duration);
			break;
		case 'getInput':
			$("#input-div").show();
			$("#code-input").focus().val("");
			break;
		case 'hideInput':
			$("#input-div").hide();
			break;
		case "sound":
			const sound = document.createElement("audio");
			sound.src = `../audio/${data.soundId}`;
			sound.volume = data.calculatedVolume;
			sound.play();
			break;
	}	
})