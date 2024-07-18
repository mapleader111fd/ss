async function objectDialog(type) {
	return new Promise(async function(resolve, reject) {
		switch(type) {
			case "item": {
				resolve( await itemsDialog() );
	
				break;
			}
	
			case "account": {
				resolve( await accountsDialog() );

				break;
			}
	
			case "weapon": {
				resolve( await weaponsDialog() );

				break;
			}
		}
	});
}

function getDefaultMarkerCustomization() {
	return {
		type: 1,
		scale: {
			x: 1.5,
			y: 1.5,
			z: 0.5
		},
		color: {
			red: 150,
			green: 100,
			blue: 0,
			opacity: 200
		},
		rotation: {
			x: 0.0,
			y: 0.0,
			z: 0.0
		},
		followCamera: false,
		bounce: false,
		rotate: false
	}
}

async function markerDialog(currentMarkerData) {
	return new Promise((resolve, reject) => {
		let markerModal = $("#marker-customization-dialog-modal");

		if(!currentMarkerData) {
			currentMarkerData = getDefaultMarkerCustomization()
		}

		$("#marker-type").val(currentMarkerData.type);
		$("#marker-size-x").val(currentMarkerData.scale.x);
		$("#marker-size-y").val(currentMarkerData.scale.y);
		$("#marker-size-z").val(currentMarkerData.scale.z);
		$("#marker-color-red").val(currentMarkerData.color.red);
		$("#marker-color-green").val(currentMarkerData.color.green);
		$("#marker-color-blue").val(currentMarkerData.color.blue);
		$("#marker-color-opacity").val(currentMarkerData.color.opacity);
		$("#marker-rotation-x").val(currentMarkerData.rotation.x);
		$("#marker-rotation-y").val(currentMarkerData.rotation.y);
		$("#marker-rotation-z").val(currentMarkerData.rotation.z);
		$("#marker-follow-camera").prop("checked", currentMarkerData.followCamera);
		$("#marker-bounce").prop("checked", currentMarkerData.bounce);
		$("#marker-rotate").prop("checked", currentMarkerData.rotate);

		$("#marker-customization-form").unbind().submit(function(event) {
			if(isThereAnyErrorInForm(event)) return;

			let markerData = {
				type: parseInt( $("#marker-type").val() ),
				scale: {
					x: parseFloat( $("#marker-size-x").val() ),
					y: parseFloat( $("#marker-size-y").val() ),
					z: parseFloat( $("#marker-size-z").val() )
				},
				color: {
					red: parseInt( $("#marker-color-red").val() ),
					green: parseInt( $("#marker-color-green").val() ),
					blue: parseInt( $("#marker-color-blue").val() ),
					opacity: parseInt( $("#marker-color-opacity").val() )
				},
				rotation: {
					x: parseFloat( $("#marker-rotation-x").val() ),
					y: parseFloat( $("#marker-rotation-y").val() ),
					z: parseFloat( $("#marker-rotation-z").val() )
				},
				followCamera: $("#marker-follow-camera").prop("checked"),
				bounce: $("#marker-bounce").prop("checked"),
				rotate: $("#marker-rotate").prop("checked")
			}

			markerModal.modal("hide");

			resolve(markerData);
		})

		markerModal.modal("show");
	});
}

function getDefaultBlipCustomization() {
	return {
		isEnabled: true,
		sprite: 1,
		label: "Default",
		scale: "0.5",
		color: 1,
		display: 5,
	}
}

async function blipDialog(currentBlipData) {
	return new Promise((resolve, reject) => {
		let blipModal = $("#blip-customization-dialog-modal");

		if(!currentBlipData) {
			currentBlipData = getDefaultBlipCustomization()
		}

		$("#blip-enabled").prop("checked", currentBlipData.isEnabled).change();
		$("#blip-sprite").val(currentBlipData.sprite);
		$("#blip-name").val(currentBlipData.label);
		$("#blip-color").val(currentBlipData.color);
		$("#blip-display").val(currentBlipData.display);
		$("#blip-scale").val(currentBlipData.scale);

		$("#blip-customization-form").unbind().submit(function(event) {
			if(isThereAnyErrorInForm(event)) return;

			let blipData = {
				isEnabled: $("#blip-enabled").prop("checked"),
				sprite: parseInt( $("#blip-sprite").val() ),
				label: $("#blip-name").val(),
				scale: parseFloat( $("#blip-scale").val() ),
				color: parseInt( $("#blip-color").val() ),
				display: parseInt( $("#blip-display").val() ),
			}

			blipModal.modal("hide");

			resolve(blipData);
		})

		blipModal.modal("show");
	});
}

$("#blip-enabled").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#blip-customization-form").find("input, select").not( $(this) )
		.prop("disabled", !isEnabled)
		.prop("required", isEnabled);
})

async function heistsDialog() {
	return new Promise((resolve, reject) => {
		let inputHeistsModal = $("#input-heists-dialog-modal")
		inputHeistsModal.modal("show");
	
		$("#input-heist-search").val("");
		
		$.post(`https://${resName}/getAllHeists`, JSON.stringify({}), function (heists) {
			let inputHeistsList = $("#heists-list");
	
			inputHeistsList.empty();
	
			for(const[_, heistData] of Object.entries(heists)) {
				let heistDiv = $(`
					<li class="list-group-item list-group-item-action" value=${heistData.id}>${heistData.label}</li>
				`);
	
				heistDiv.click(function() {
					inputHeistsModal.modal("hide");
					resolve(heistData.id);
				});
	
				inputHeistsList.append(heistDiv);
			}
		});
	})
}

$("#input-heist-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#heists-list li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

async function doorsDialog(alreadySelectedDoors = {}) {
	return new Promise((resolve, reject) => {
		let inputDoorsModal = $("#input-doors-dialog-modal")
		inputDoorsModal.modal("show");
	
		$("#input-door-search").val("");
		
		$.post(`https://${resName}/getAllDoors`, JSON.stringify({}), function (doors) {
			let inputDoorsList = $("#doors-list");
	
			inputDoorsList.empty();
	
			for(const[buildingId, data] of Object.entries(doors)) {	
				let buildingDiv = $(`
					<div class="form-check fs-3 mb-2">
						<p class="fw-bold mb-0">${data.label}</p>
						
						<div class="doors-list">

						</div>
					</div>
				`);

				for(let [doorsId, doorsData] of Object.entries(data.doors)) {
					let doorDiv = $(`
						<div class="door-div mx-auto">
							<input class="form-check-input" type="checkbox" data-doors-id=${doorsData.id}>
							<label class="form-check-label">
								${doorsData.id} - ${doorsData.label}
							</label>
						</div>
					`);

					buildingDiv.find(".doors-list").append(doorDiv);
				}
				
				inputDoorsList.append(buildingDiv);
			}

			for(let [doorsId, _] of Object.entries(alreadySelectedDoors) ) {
				$(`input[data-doors-id=${doorsId}]`).prop("checked", true);
			}

			// Unbinds the button and rebinds it to callback the selected doors
			$("#input-doors-confirm-btn").unbind().click(function() {
				let selectedDoors = {};
		
				inputDoorsList.find("input:checked").each(function() {	
					let doorsId = parseInt( $(this).data("doorsId") )
						
					selectedDoors[doorsId] = true;
				});
	
				inputDoorsModal.modal("hide");
	
				resolve(selectedDoors);
			})
		});
	})
}

$("#input-door-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#doors-list .form-check").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

function createAlarmDiv(alarm = {}) {
	let alarmDiv = $(`
		<div class="mb-3 mt-1 alarm">
			<div class="row g-2 row-cols-auto align-items-center justify-content-center">
				<button type="button" class="btn btn-danger delete-alarm-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

				<div class="form-floating text-body col-2">
					<input type="number" step="0.01" class="form-control coords-x" placeholder="X" required value="${alarm.coords?.x || ""}">
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating text-body col-2">
					<input type="number" step="0.01" class="form-control coords-y" placeholder="Y" required value="${alarm.coords?.y || ""}">
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating text-body col-2">
					<input type="number" step="0.01" class="form-control coords-z" placeholder="Z" required value="${alarm.coords?.z || ""}">
					<label>${ getLocalizedText("menu:z") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-coords-and-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:place_object") }"><i class="bi bi-arrow-down-square"></i></button>				
			</div>

			<div class="row g-2 row-cols-auto align-items-center justify-content-center mt-2">
				<div class="form-floating text-body ms-2">
					<input type="number" min=1 class="form-control duration" placeholder="Duration" required value="${alarm.duration || 30}">
					<label>${ getLocalizedText("menu:duration") }</label>
				</div>

				<select class="form-select alarm-type" style="width: auto">
					<option value="police_and_alarm_bell">${ getLocalizedText("menu:police_and_alarm_bell") }</option>
					<option value="police_only">${ getLocalizedText("menu:police_only") }</option>
					<option value="alarm_bell_only">${ getLocalizedText("menu:alarm_bell_only") }</option>
				</select>
			</div>

			<hr>

		</div>
	`);

	alarmDiv.find(".delete-alarm-btn").click(function() {
		alarmDiv.remove();
	});

	alarmDiv.find(".choose-coords-and-heading-btn").click(async function() {
		let data = await placeObjectAndReturnCoords();

		if(data) {
			alarmDiv.find(".coords-x").val(data.coords.x);
			alarmDiv.find(".coords-y").val(data.coords.y);
			alarmDiv.find(".coords-z").val(data.coords.z);
		}
	}).tooltip();

	alarmDiv.find(".alarm-type").val(alarm.type || "police_and_alarm_bell");

	$("#alarms-list").append(alarmDiv);
}

async function alarmsDialog(alarms = []) {
	return new Promise((resolve, reject) => {
		let inputAlarmsModal = $("#input-alarms-dialog-modal");

		$("#alarms-list").empty();

		inputAlarmsModal.modal("show");

		alarms.forEach(alarm => {
			createAlarmDiv(alarm);
		});

		$("#input-alarms-form").unbind().submit(function(event) {
			if(isThereAnyErrorInForm(event)) return;
		
			let alarms = [];
			
			$("#alarms-list").find(".alarm").each(function() {
				let alarm = {
					coords: {
						x: parseFloat( $(this).find(".coords-x").val() ),
						y: parseFloat( $(this).find(".coords-y").val() ),
						z: parseFloat( $(this).find(".coords-z").val() )
					},
					duration: parseInt( $(this).find(".duration").val() ),
					type: $(this).find(".alarm-type").val()
				}

				alarms.push(alarm);
			});

			inputAlarmsModal.modal("hide");
			resolve(alarms);
		})
	})
}

$("#input-alarms-new-alarm-btn").click(function() {
	createAlarmDiv();
})

async function cargoRobberiesDialog() {
	return new Promise((resolve, reject) => {
		let inputHeistsModal = $("#input-cargo-robberies-dialog-modal")
		inputHeistsModal.modal("show");
	
		$("#input-cargo-robbery-search").val("");
		
		$.post(`https://${resName}/getAllCargoRobberies`, JSON.stringify({}), function (cargoRobberies) {
			let inputHeistsList = $("#cargo-robberies-list");
	
			inputHeistsList.empty();
	
			for(const[_, robberyData] of Object.entries(cargoRobberies)) {
				let robberyDiv = $(`
					<li class="list-group-item list-group-item-action clickable" value=${robberyData.id}>${robberyData.label}</li>
				`);
	
				robberyDiv.click(function() {
					inputHeistsModal.modal("hide");
					resolve(robberyData.id);
				});
	
				inputHeistsList.append(robberyDiv);
			}
		});
	})
}

$("#input-cargo-robbery-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#cargo-robberies-list li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

function toggleCursor(enabled) {
	if (enabled) {
		$.post(`https://${resName}/enableCursor`, JSON.stringify({}));
	} else {
		$.post(`https://${resName}/disableCursor`, JSON.stringify({}));
	}
}

function loadDialog(dialogName) {
	var script = document.createElement('script');

	console.log(`../utils/dialogs/${dialogName}/${dialogName}.js`)
	script.setAttribute('src',`../utils/dialogs/${dialogName}/${dialogName}.js`);

	document.head.appendChild(script);
}

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	switch(action) {
		case "loadDialog": {
			var script = document.createElement('script');
			script.setAttribute('src',`../utils/dialogs/${data.dialogName}/${data.dialogName}.js`);
			document.head.appendChild(script);
			break;
		}
	}
})

$.post(`https://${resName}/nuiReady`, JSON.stringify({}));