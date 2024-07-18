const isEnvBrowser = () => !window.invokeNative;
const nui = {
	send: async (event, data = {}) => {
		// return await new Promise(resolve => setTimeout(resolve, 100));
		const resource = window.GetParentResourceName
			? window.GetParentResourceName()
			: "nui-frame-app";
		return await fetch(`https://${resource}/${event}`, {
			method: "post",
			headers: {
				"Content-type": "application/json; charset=UTF-8",
			},
			body: JSON.stringify(data),
		});
	},
};

let config, locales;

function Locale(id) {
	return locales[id] || id;
}

let wheel_img;
function GetConfigAndLocales() {
	nui
		.send("GetConfig")
		.then((resp) => resp.json())
		.then((resp) => {
			config = resp.config;
			wheel_img = config.ExtraStuff.images.wheels;
			locales = resp.locales;
			document.documentElement.style.setProperty(
				"--selected",
				`"${Locale("Selected")}"`
			);
			document.documentElement.style.setProperty(
				"--equipped",
				`"${Locale("Equipped")}"`
			);
			document.documentElement.style.setProperty(
				"--remove",
				`"${Locale("Remove")}"`
			);
			$(".freecamtext").html(`
				${Locale("freecam_text").first_part} <span class="keyb">${config.FreecamKey}</span> ${Locale("freecam_text").second_part}
			`);
			$(".total").html(Locale("Total"));
			$("#removeall").html(Locale("RemoveAll"));
			$("#pay").html(Locale("Pay"));
			$(".engine_stats").html(Locale("Engine"));
			$(".transmission_stats").html(Locale("Transmission"));
			$(".suspension_stats").html(Locale("Suspension"));
			$(".brakes_stats").html(Locale("Brakes"));
			$(".armor_stats").html(Locale("Armor"));
			$(".turbo_stats").html(Locale("Turbo"));
		})
		.catch((e) => {
			console.log("error getting config and locales", e);
		});
}

function capitalize(s) {
	return s[0].toUpperCase() + s.slice(1);
}

GetConfigAndLocales();

function clickSound() {
	new Audio("select.wav").play();
}

/* convert hex to rgb */
function hexToRgb(hex) {
	let r = parseInt(hex.slice(1, 3), 16);
	let g = parseInt(hex.slice(3, 5), 16);
	let b = parseInt(hex.slice(5, 7), 16);
	return { r, g, b };
}

function rgbToHex(r, g, b) {
	return "#" + ((1 << 24) | (r << 16) | (g << 8) | b).toString(16).slice(1);
}

let selectedItem;
function MoveMenuWithArrows(key) {
	let containerEl = document.querySelector(".content");
	let items = containerEl.querySelectorAll(".option");
	selectedItem ? "" : (selectedItem = items[0]);

	if (key === "up") {
		const indexBelow = [...items].indexOf(selectedItem) - 3; // assuming 3 columns
		if (items[indexBelow] && indexBelow < items.length) {
			selectedItem = items[indexBelow];
		}
	} else if (key === "down") {
		const indexBelow = [...items].indexOf(selectedItem) + 3; // assuming 3 columns
		if (items[indexBelow] && indexBelow < items.length) {
			selectedItem = items[indexBelow];
		}
	} else if (key === "left") {
		const indexLeft = [...items].indexOf(selectedItem) - 1; // assuming 3 columns
		if (items[indexLeft]) {
			// check for valid index and not at the left edge
			selectedItem = items[indexLeft];
		}
	} else if (key === "right") {
		const indexRight = [...items].indexOf(selectedItem) + 1; // assuming 3 columns
		if (items[indexRight]) {
			// check for valid index and not at the right edge
			selectedItem = items[indexRight];
		}
	}

	selectedItem &&
		selectedItem.scrollIntoView({ behavior: "smooth", block: "center" });
	$(".focused").removeClass("focused");
	selectedItem.classList.add("focused");
}

function handleKeypress(event) {
	if (event.key === "Escape" || event.key === "Backspace") EscapeHandler();
	if (event.key === config.FreecamKey) ChangeCameraType();

	/* Move beteween menus with arrow */
	if (event.key === "ArrowUp") {
		event.preventDefault();
		MoveMenuWithArrows("up");
	} else if (event.key === "ArrowDown") {
		event.preventDefault();
		MoveMenuWithArrows("down");
	} else if (event.key === "ArrowLeft") {
		event.preventDefault();
		MoveMenuWithArrows("left");
	} else if (event.key === "ArrowRight") {
		event.preventDefault();
		MoveMenuWithArrows("right");
	}

	/* if press enter */
	if (event.key === "Enter") {
		if (selectedItem) {
			selectedItem.click();
		}
	}
}