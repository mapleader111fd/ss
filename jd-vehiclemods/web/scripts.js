/* HTML Elements */
const contentEl = document.getElementById("content");
const resource = window.GetParentResourceName
			? window.GetParentResourceName()
			: "nui-frame-app";

/* Variables */
let current_menu, lastmenu;
let current_veh_properties;
let mods_available;
let selected_mod;
let neon_menu;
let available_wheels;
let selected_wheel;
let wheelindex;
let isMotorcycle;
let wheel_type;
let wheels_info = { type: undefined, index: undefined };
let isPayMenuOpen = false;

let showRecommended = false;

let UISound = true;

let pointsAndCameras = {};
let currentCamIndex = -1;
let freecam = false;

let defaultTuning = {};
let upgadeVehicleStats = {};

let repairPrice = 0;

let vehExtrasOGState = {};

let hideMods = {};

let paints = ["Classic", "Metallic", "Matte", "Metals"];

let neons = {
  list: ["LeftNeon", "RightNeon", "FrontNeon", "BackNeon"],
  selected: {
    neon: undefined,
    index: undefined,
  },
};

let neon_state = {};

let tire_states = {
  modBulletProofTires: undefined,
  modSmokeEnabled: undefined,
  modCustomTiresF: undefined,
};

let wheel_selection = {
  type: undefined,
  index: undefined,
  getPrice: () => {
    let wheel = available_wheels.find((x) => x.name === wheel_selection.type);
    let wheel_price = wheel.mods.find(
      (x) => x.id === wheel_selection.index
    ).price;
    return wheel_price;
  },
};

let resprayOptions = {
  get: () =>
    resprayOptions.full.find((x) => x.id === SelectedResprayDetails.target),
  list: [
    "PrimaryColor",
    "SecondaryColor",
    "pearlescent",
    "dashboard",
    "interior",
  ],
  full: [
    { id: "PrimaryColor", label: "PrimaryColor" },
    { id: "SecondaryColor", label: "SecondaryColor" },
    { id: "pearlescent", label: "PearlescentColor" },
    { id: "dashboard", label: "DashboardColor" },
    { id: "interior", label: "InteriorColor" },
  ],
  motorcycle: [
    { id: "PrimaryColor", label: "PrimaryColor" },
    { id: "SecondaryColor", label: "SecondaryColor" },
    { id: "pearlescent", label: "PearlescentColor" },
  ],
};

let SelectedResprayDetails = {
  target: undefined, // resprayOptions.list
  paint_category: undefined,
  paint_index: undefined,
};

let wheel_categories = ["WheelType", "WheelColor", "Tires"];
let tire_categories = ["TireDesign", "TireEnhancements", "TireSmoke"];

// Mods with multiple pages
let multiPageMods = ["wheels", "respray", "neons"];

/* Scroll Positions */
let main_menu_scroll;

/* Created Classes */
let pricer;

/* Functions */

function ToggleMenu(show) {
  let tires = [];
  
  tire_categories.forEach(category => {
    if (!hideMods[category]) {
      tires.push(category);
    }
  });
  tire_categories = tires;

  let wheels = [];
  
  wheel_categories.forEach(category => {
    if (!hideMods[category]) {
      wheels.push(category);
    }
  });
  wheel_categories = wheels;

  if (show) {
    menux.ToggleVisibility(true);
  } else {
    $(".btn-inspect").remove();
    $(".modal-container") ? $(".modal-container").fadeOut(200).remove() : null;
    $("#payments").fadeOut(200);
    menux.ToggleVisibility(false);
    $(".freecamtext").fadeOut();
  }
}
// Curreny Formatter
function currency(value) {
  if (typeof value !== "number") return "not a number";
  let locale = config.Currency.locale;
  let currency_ = config.Currency.currency;
  return new Intl.NumberFormat(locale, {
    style: "currency",
    currency: currency_,
    maximumFractionDigits: 0,
  }).format(value);
}

/* Vehicle Stats */
function ShowVehicleStats(data) {
  const veh_details = data.stats;
  $("#stats-title").html(Locale("VehicleStats"));
  let stats = [
    { name: Locale("Vehicle"), value: veh_details.vehicle },
    { name: Locale("Engine"), value: veh_details.engine },
    { name: Locale("Transmission"), value: veh_details.transmission },
    { name: Locale("Suspension"), value: veh_details.suspension },
    { name: Locale("Brakes"), value: veh_details.brakes },
    { name: Locale("Armor"), value: veh_details.armor },
    { name: Locale("Turbo"), value: veh_details.turbo },
  ];

  $("#stats-list").empty();
  let statsListEl = document.getElementById("stats-list");
  stats.forEach((stat) => {
    statsListEl.innerHTML += `<div class="stat-container">
			<span id="stats-vehicle">${stat.name}</span>
			<span id="stats-name">${stat.value}</span>
		</div>`;
  });
  $("#stats-menu").fadeIn(200);
  current_menu = "stats";
}

/* Return a string with data attributes */
function DataAttributes(option) {
  let attr = "";
  if (option.index) attr += `data-index="${option.index}" `;
  if (option.data) attr += `data-type="${option.data}" `;
  if (option.id) attr += `id="${option.id}"`;
  return attr;
}

function CloseMenu() {
  nui
    .send("CloseMenu")
    .then((resp) => resp.json())
    .then((resp) => {
      if (resp) {
      } else {
      }
    });
  ToggleMenu(false);
  toggleTuningMenu(false);
  $(".vehicle_stats").fadeOut(200);
  $("#stats-menu").fadeOut(200);
}

function ClosePaymentMenu() {
  $("#payment-modal").modal("hide");
  setTimeout(() => {
    if($('#payment-modal').hasClass('show')){
      $("#payment-modal").modal("hide");
    }
  }, 500);
  current_menu = lastmenu || "main";
}

function toggleTuningMenu(mode) {
  nui.send("toggleTuningMenu", mode);
}
function StringToBoolean(string) {
  if (string === "true") return true;
  if (string === "false") return false;
  return undefined;
}

function HandleCategory(element) {
  if (!element || !selected_mod) return;
  let id = element.getAttribute("id");
  let paint = element.getAttribute("paint");
  let paintID = element.getAttribute("paint_id");
  let wheeltype = element.getAttribute("wheeltype");
  let tiresmoke = element.getAttribute("tiresmoke");
  let bulletproof = element.getAttribute("bulletproof");
  let customtires = element.getAttribute("customtires");
  let wheelID = element.getAttribute("wheelid");
  let menu_wheelindex = element.getAttribute("wheelindex"); // this only shows for motorcycles
  // Convert string to boolean or number
  InspectVehiclePressed(undefined, id);
  //current selection
  let current_selected_element = document.querySelector(".selected");

  let index = id === "true" ? true : id === "false" ? false : parseInt(id);

  if (id !== "color-changer") {
    if (current_selected_element)
      current_selected_element.classList.remove("selected");
    element.classList.add("selected");
  }

  if (selected_mod === "neons") {
    neon_state[neons.selected.index] = index;
  }

  if (
    (typeof index === "number" && !isNaN(index)) ||
    typeof index === "boolean"
  ) {
    ApplyMod({
      mod: selected_mod,
      value: index,
      wheelindex,
      neon_index: neons.selected.index,
      respray_type: SelectedResprayDetails.target,
    });
    return; // ends the function
  }

  if (neons.list.includes(id)) {
    neons.selected.neon = id;
    CreateNeonTogglerMenu();
  } else if (id === "chameleon") {
    CreateChameleonColorMenu(Locale("PrimaryColor"));
  } else if (id === "rgb" && SelectedResprayDetails.target === "PrimaryColor") {
    CreatePrimaryRGBColorMenu(Locale("PrimaryColor"));
  } else if (resprayOptions.list.includes(id)) {
    SelectedResprayDetails.target = id;
    if (id === resprayOptions.list[0] || id === resprayOptions.list[1]) {
      if(SelectedResprayDetails.target === "SecondaryColor") {
        CreatePrimaryRGBColorMenu(Locale("SecondaryColor"));
      } else {
        CreatePrimarySecondaryColorMenu(Locale("PrimaryColor"));
      }
    } else {
      let info = resprayOptions.get();
      let img = config.ExtraStuff.images.respray;
      CreateFixedColorCategories({ label: Locale(info.label), img });
    }
  } else if (wheel_categories.includes(id)) {
    handleWheelCategories(id);
  } else if (tire_categories.includes(id)) {
    handleTiresCategories(id);
  } else if (wheeltype) {
    wheel_selection.type = wheeltype;
    CreateWheelTypeOptions(wheeltype);
  } else if (menu_wheelindex === "23" || menu_wheelindex === "24") {
    wheelindex = parseInt(menu_wheelindex);
    CreateWheelTypeCategoryMenu("wheeltype");
  } else if (wheelID) {
    let wheel = parseInt(wheelID);
    if (isNaN(wheel)) return;
    wheel_selection.index = wheel;
    wheels_info.index = wheelID;
    pricer.AddToCart("modWheels", wheel_selection.getPrice());
    ApplyMod({ mod: "modWheels", value: wheels_info, wheelindex: wheelindex });
    return;
  }

  if (paint) {
    // Paint is the name of the paint type, Classic, Metallic, Matte, Metals
    let img =
      selected_mod === "wheels"
        ? config.ExtraStuff.images.wheels
        : config.ExtraStuff.images.respray;
    SelectedResprayDetails.paint_category = paint;
    CreateFixedColorCategoryOptions({
      label: Locale(capitalize(paint)),
      menu: paint,
      img,
    });
  } else if (paintID) {
    // PaintID is the ID of the paint

    SelectedResprayDetails.paint_index = paintID;
    let target;
    let paint_category = SelectedResprayDetails.paint_category;
    let paint_price;
    if (selected_mod === "wheels") {
      // Wheel color
      target = "wheelcolor";
      paint_price =
        config.ExtraStuff.OtherPaints["wheels"].prices[paint_category];
      pricer.AddToCartCustom(Locale("WheelColor"), paint_price);
    } else {
      // dashboard,interior,pearlescent
      target = SelectedResprayDetails.target;
      let label;
      paint_price =
        config.ExtraStuff.OtherPaints[SelectedResprayDetails.target].prices[
          paint_category
        ];
      if (target === "pearlescent") {
        label = Locale("PearlescentColor");
      } else if (target === "interior") {
        label = Locale("InteriorColor");
      } else if (target === "dashboard") {
        label = Locale("DashboardColor");
      }
      pricer.AddToCartCustom(label, paint_price);
    }

    SetPaintType({
      paint_type: target,
      paint: Number(paintID),
    });
  }
  if (tiresmoke) {
    let bool = StringToBoolean(tiresmoke);
    if (typeof bool !== "boolean") return;
    tire_states.modSmokeEnabled = bool;
    ApplyMod({ mod: "modSmokeEnabled", value: bool });
  }
  if (bulletproof) {
    let bool = StringToBoolean(bulletproof);
    if (typeof bool !== "boolean") return;
    tire_states.modBulletProofTires = bool;
    ApplyMod({ mod: "modBulletProofTires", value: bool });
  }
  if (customtires) {
    let bool = StringToBoolean(customtires);
    if (typeof bool !== "boolean") return;
    tire_states.modCustomTiresF = bool;
    ApplyMod({ mod: "CustomTires", value: bool });
  }
}

function HandleVehicleExtras(optionEl, extra) {
  extra = Number(extra);

  if (current_veh_properties.extras[extra]) {
    /* Remove The remove lable and show price */
    optionEl.classList.remove("removetoggle");
    pricer.RemoveFromCart("extras", extra);
    current_veh_properties.extras[extra] = false;
    ApplyMod({ mod: "extras", value: extra });
  } else {
    /* Enable Extra and show remove lable */
    optionEl.classList.add("removetoggle");
    pricer.AddToCart("extras", extra);
    ApplyMod({ mod: "extras", value: extra });
    current_veh_properties.extras[extra] = true;
  }
}

function hasClass(element, className) {
  return (" " + element.className + " ").indexOf(" " + className + " ") > -1;
}

function SelectModOption(dataAttribue) {
  if (!document.querySelector(dataAttribue)) return;
  let item_selected = document.querySelector(".item_selected");
  let btn_selected = document.querySelector(".btn_selected");
  if (item_selected) {
    item_selected.classList.remove("item_selected");
  }
  if (btn_selected) {
    btn_selected.classList.remove("btn_selected");
  }

  /* Select current Mod */
  let target_childsEl = document.querySelector(dataAttribue).childNodes;
  target_childsEl.forEach((el) => {
    hasClass(el, "item") ? el.classList.add("item_selected") : "";
    hasClass(el, "btn_add") ? el.classList.add("btn_selected") : "";
  });
}

function RemoveAllMods() {
  upgadeVehicleStats = defaultTuning;
  SetTuningStatus();
  nui
    .send("RemoveAllMods")
    .then((resp) => resp.json())
    .then((resp) => {
      current_veh_properties = resp;
      pricer = new Pricing();
      pricer.AddToCartCustom(Locale("RepairCost"), repairPrice);
      document.getElementById("removeall").toggleAttribute("disabled");
      ResetTireState();
    })
    .catch((e) => console.log("error removing all mods", e));
}

function ResetTireState() {
  tire_states.modBulletProofTires = current_veh_properties.modBulletProofTires;
  tire_states.modSmokeEnabled = current_veh_properties.modSmokeEnabled;
  tire_states.CustomTires = current_veh_properties.CustomTires;
}

function Pay() {
  $(".modal").modal("hide");
  nui
    .send("paytotal", { total: pricer.total, cart: pricer.cart })
    .then((resp) => resp.json())
    .then((resp) => {
      if (typeof resp !== "object") return;

      if (resp.type === "showplayers") {
        /* players = closePlayers, total = total, cart = cart	*/
        let { players } = resp;
        /* Create Nearby Players Menu */
        CreatePlayerSelection(players);
      } else if (resp.type === true) {
        $("#payments").fadeOut(200);
        isPayMenuOpen = false;
        CloseMenu();
      } else if (resp.type === false) {
        // console.log("Purchase Failed");
      }
    });
}

function buttonClicks(btnEl) {
  let btn_id = btnEl.getAttribute("id");
  switch (btn_id) {
    case "removeall":
      RemoveAllMods();
      break;
    case "goback":
      EscapeHandler();
      break;
    case "repair-vehicle":
      RepairVehicle();
      break;
    case "pay":
      PaySummary();
      break;
    case "paytotal":
      Pay();
      break;
    case "closemenu-confirm":
      CloseMenu();
      break;
    case "closemenu-deny":
      break;
    case "closemenu-repair":
      closeRepairModal();
      break;
    case "closemenu-repair-cross":
      closeRepairModal();
      break;
  }
}

function closeRepairMenu() {
  closeRepairModal();
}

function RepairVehicle() {
  nui
    .send("RepairVehicle")
    .then((resp) => resp.json())
    .then((resp) => {
      if (resp) {
        $(".modal-container").fadeOut(200);
        setTimeout(() => {
          $(".modal-container") ? $(".modal-container").remove() : null;
        }, 200);
        MainMenu();
        pricer.AddToCartCustom(Locale("RepairCost"), repairPrice);
      }
    });
}

function closeRepairModal() {
  $(".modal").modal("hide");
  setTimeout(() => {
    nui.send("toggleTuningMenu", false);
  }, 200);
}

function goBack(menu) {
  if (!menu) {
    CreateMenu(mods_available);
  } else if (menu === "neon") {
    document.getElementById("menu").innerHTML = neon_menu;
  }
}

function getModOptions(modName) {
  let mods = mods_available.upgrades.find((mod) => mod.mod === modName);
  if (!mods) {
    mods = mods_available.cosmetics.find((mod) => mod.mod === modName);
    if (!mods) return false; // check if mod exists
  }
  return mods;
}

/* Events Listner Handlers */

function handleNuiMessages(info) {
  let action = info.data.action;
  let data = info.data.data;
  if (action === "toggleTuningMenu") {
    /* reset */
    available_wheels = undefined;
    neon_menu = undefined;
    selected_mod = undefined;
    main_menu_scroll = undefined;
    if (data && data.mods) {
      // show nui

      current_veh_properties = data.current_state; // gets vehicle properties
      mods_available = data.mods;
      hideMods = data.hideMods;
      isMotorcycle = data.ismoto;
      needsRepair = data.repair;
      repairPrice = data.repair_price;
      vehExtrasOGState = structuredClone(current_veh_properties).extras;
      pointsAndCameras = data.pointsList;
      currentCamIndex = -1;
      UISound = data.UISounds;
      defaultTuning = data.defaultTuning;
      showRecommended = data.showRecommended;
      upgadeVehicleStats = {};

      if (needsRepair && config.RepairMenu) {
        CreateRepairModal(repairPrice);
        return;
      } else {
        repairPrice = 0;
        ToggleMenu(true);
        MainMenu();
        ResetTireState();
      }

      // repair Checker
    } else {
      // hide nui
      ToggleMenu(false);
      closeRepairModal();
      $(".vehicle_stats").fadeOut(200);
      setTimeout(() => {
        $(".modal").modal("hide");
      }, 500);
    }
  } else if (action === "showNewButtons") {
    pointsAndCameras = data.pointsList;
    if(data.hasCursor){
      freecam = false;
      createPoints();
      $(".freecamtext").fadeIn();
    }
  } else if (action === "hideNewButtons") {
    freecam = true;
    $(".freecamtext").fadeOut();
  } else if (action === "showstats") {
    ShowVehicleStats(data);
  } else if (action === "openPlayerSelection") {
    CreatePlayerSelection(data);
  } else if (action === "dblcheck") {
    nui.send("DoubleCheckConfirm", {
      total: pricer.total,
      cart: pricer.cart,
      code: data.code,
    });
  } else if (action === "upgadeVehicleStats") {
    upgadeVehicleStats = data.newTuning;
    SetTuningStatus();
  }
}

function handleClick(event) {
  /* if event.target is button */
  let tag = event.target.tagName;
  let id = event.target.getAttribute("id");
  
  if (current_menu === "main") {
    const menu = document.querySelector(".content");
    if (menu) {
      main_menu_scroll = menu.scrollTop;
    }
  }
  
  if (tag === "BUTTON") {
    if (
      UISound &&
      id != "goback" &&
      id != "pay" &&
      id != "paytotal" &&
      id != "repair-vehicle"
    ) {
      clickSound();
    }

    buttonClicks(event.target);
    return;
  }

  if (current_menu === "playerselection" && tag !== "PLAYER") {
    $(".playerselection-bg").fadeOut(200);
    current_menu = "main";
    return;
  } else if (current_menu === "playerselection" && tag === "PLAYER") {
    let playerSource = event.target.getAttribute("player_src");
    nui.send("createbill", { player_src: Number(playerSource) });
    $(".playerselection-bg").fadeOut(200);

    current_menu = "main";

    CloseMenu();
  }

  let optionEl = event.target.closest(".option");
  if (!optionEl) return; // check if exists
  if (UISound) {
    clickSound();
  }

  let mod = optionEl.getAttribute("mod");
  let extra = optionEl.getAttribute("data-extra");
  InspectVehiclePressed(undefined, mod);
  if (extra && Number(extra)) {
    HandleVehicleExtras(optionEl, Number(extra));
    return;
  }
  
  if (mod) {
    selected_mod = mod; // Set selected mod
    if (multiPageMods.includes(mod)) {
      HandleMultiPageMenu(mod);
      document.querySelector(".content").scrollTop = 0;
      return;
    }
  } else {
    // if option doesnt have mod attribute then its a option or category-menu-option
    HandleCategory(optionEl);
    const wheelIndex = optionEl.getAttribute("wheelindex")
    if(isMotorcycle){
      if(wheelIndex === "23"){
        InspectVehiclePressed(undefined, "frontWheel");
      } else if(wheelIndex === "24"){
        InspectVehiclePressed(undefined, "backWheel");
      }
    }
    return;
  }

  mod_options = getModOptions(selected_mod); // Get mod options
  if (!mod_options) return; // check if mod option exists
  CreateCategoryMenu(mod_options);
  document.querySelector(".content").scrollTop = 0;
}

function EscapeHandler() {
  if (current_menu === "main") {
    CreateExitMenuModal();
  } else if (current_menu === "stats") {
    current_menu = "main";
    $("#stats-menu").fadeOut(200);
    nui.send("closenui");
  } else if (current_menu === "category") {
    CreateMenu(mods_available);
  } else if (current_menu === "FixedColorCategories") {
    if (selected_mod === "wheels") {
      HandleMultiPageMenu("wheels");
    } else if (selected_mod === "respray") {
      HandleMultiPageMenu("respray");
    }
  } else if (current_menu === "FixedColorCategoryOptions") {
    let label, img;
    if (selected_mod === "wheels") {
      label = "WheelColor";
      img = config.ExtraStuff.images.wheels;
    } else {
      let info = resprayOptions.get();
      label = info.label;
      img = config.ExtraStuff.images.respray;
    }
    CreateFixedColorCategories({ label: Locale(label), img });
  } else if (current_menu === "neon_toggler") {
    HandleMultiPageMenu("neons");
    neons.selected.index = undefined;
  } else if (current_menu === "playerselection") {
    $(".playerselection-bg").fadeOut(200);
  } else if (current_menu === "bodycolor") {
    HandleMultiPageMenu("respray");
    SelectedResprayDetails.target = undefined;
  } else if (current_menu === "rgbbodycolor") {
    if(SelectedResprayDetails.target === "SecondaryColor") {
      HandleMultiPageMenu("respray");
    } else {
      CreatePrimarySecondaryColorMenu(Locale("PrimaryColor"));
    }
  } else if (current_menu === "payment") {
    ClosePaymentMenu();
  } else if (wheel_categories.includes(current_menu)) {
    if (isMotorcycle && current_menu === wheel_categories[0]) {
      CreateWheelTypeCategoryMenu("wheelindex");
    } else {
      HandleMultiPageMenu("wheels");
    }
  } else if (tire_categories.includes(current_menu)) {
    CreateWheelTiresCategoryMenu(current_menu);
  } else if (current_menu === "wheelindex") {
    HandleMultiPageMenu("wheels");
  } else if (current_menu === "wheelstype_submenu") {
    CreateWheelTypeCategoryMenu("wheeltype");
  } else if (current_menu === "repair") {
    closeRepairModal();
  }
  $.post(`https://${resource}/closedoors`, JSON.stringify({}));
  if(current_menu !== "main"){
    document.querySelector(".content").scrollTop = 0;
  }
  if (current_menu === "TireDesign" || current_menu === "TireEnhancements" || current_menu === "TireSmoke") {
    current_menu = "Tires";
  }
}

function ChangeCameraType() {
  $(".btn-inspect").remove();
  currentCamIndex = -1;
  $.post(`https://${resource}/ChangeCamera`, JSON.stringify({
  }));
}

document.addEventListener("change", function (event) {
  if (event.target.id === "color-picker" && selected_mod === "wheels") {
    nui.send("ModDemo", { mod: "modSmokeEnabled", value: "" }); // This will trigger a camera animation
  }
});

/* Event Listners */
window.addEventListener("message", handleNuiMessages);
window.addEventListener("keydown", handleKeypress);
document.addEventListener("click", handleClick);
