let menux = new MenuMaker();

function GoBackButtonMaker() {
  let paybtn = document.getElementById("pay");
  if (paybtn) {
    paybtn.innerHTML = Locale("GoBack");
    paybtn.removeAttribute("disabled");
    paybtn.setAttribute("id", "goback");
  }
}

function createPoints() {
  for (let i = 0; i < pointsAndCameras.length; i++) {
    if (pointsAndCameras[i].inScreen && pointsAndCameras[i].showButton && !freecam) {
      let span = document.createElement("span");
      span.setAttribute("id", `btn-inspect-${i}`);
      span.setAttribute("class", "btn-inspect");
      span.setAttribute("onclick", `InspectVehiclePressed(${i})`);
      document.body.appendChild(span);

      // Add a pop up that has a blue background with round corners over the button (set position over the button) when hovering over it
      $(`#btn-inspect-${i}`).hover(
        function () {
          $(`#btn-inspect-${i}`).append(
            `<div class="popup" id="popup-${i}"></div>`
          );
          // Add the text to the popup
          $(`#popup-${i}`).append(``);
          $(`#popup-${i}`).html(`${pointsAndCameras[i].name}`);

          // Add the css with the position of the popup and colors

          $(`#popup-${i}`).css({
            bottom: "170%",
            transform: "translateX(calc(-50% + 0.75rem / 2))",
            "z-index": "1",
            "background-color": "rgba(31, 94, 255, 0.8)",
            "border-radius": "0.625rem",
            padding: "0.625rem",
            position: "absolute",
            color: "white",
            "font-size": "1.25rem",
            "font-family": "Tajawal, sans-serif",
            height: "2.8rem",
            "font-weight": "500",
            "white-space": "nowrap",
            "line-height": "1",
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
          });

          // Fade in the popup with animation
          $(`#popup-${i}`).fadeIn(300);
        },
        function () {
          $(`#popup-${i}`).remove();
        }
      );

      $(`#btn-inspect-${i}`).css({
        left: `${pointsAndCameras[i].screenCoords.x * 100}%`,
        top: `${pointsAndCameras[i].screenCoords.y * 100}%`,
      });
    }
  }
}

function InspectVehiclePressed(index, category) {
  if (category != undefined) {
    // console.log(category);
    // do a for loop for pointsAndCameras and find the index that has the category in a mods table
    for (let i = 0; i < pointsAndCameras.length; i++) {
      // do a loop for the mods table
      for (let j = 0; j < pointsAndCameras[i].mods.length; j++) {
        // if the category is found in the mods table
        if (pointsAndCameras[i].mods[j] == category) {
          // set the index to the index of the pointAndCameras
          index = i;
          break;
        }
      }
    }
  }

  if (index != currentCamIndex && index != undefined) {
    currentCamIndex = index;
    let currentPoint = pointsAndCameras[index];
    $(".btn-inspect").remove();
    $.post(`https://${resource}/SetCameraPosition`, JSON.stringify({
      currentPoint,
      index,
		}));
  }
  
  if(index != undefined){
    openDoors(index);
  }
}

function openDoors(index) {
  let currentPoint = pointsAndCameras[index];
  if(currentPoint.openDoors[0] != undefined){
    $.post(`https://${resource}/opendoors`, JSON.stringify({
      currentPoint,
      index,
		}));
  }
  
}

function SetTuningStatus() {
  if (upgadeVehicleStats == {}) {
    upgadeVehicleStats = defaultTuning;
  }

  updateStatBar(
    upgadeVehicleStats.engine,
    defaultTuning.engine,
    "--engine-value",
    "--engine-delta",
    ".progress-engine"
  );
  updateStatBar(
    upgadeVehicleStats.transmission,
    defaultTuning.transmission,
    "--transmission-value",
    "--transmission-delta",
    ".progress-transmission"
  );
  updateStatBar(
    upgadeVehicleStats.suspension,
    defaultTuning.suspension,
    "--suspension-value",
    "--suspension-delta",
    ".progress-suspension"
  );
  updateStatBar(
    upgadeVehicleStats.brakesMod,
    defaultTuning.brakesMod,
    "--brakesMod-value",
    "--brakesMod-delta",
    ".progress-brakesMod"
  );
  updateStatBar(
    upgadeVehicleStats.armor,
    defaultTuning.armor,
    "--armor-value",
    "--armor-delta",
    ".progress-armor"
  );
  updateStatBar(
    upgadeVehicleStats.turbo,
    defaultTuning.turbo,
    "--turbo-value",
    "--turbo-delta",
    ".progress-turbo"
  );

  $(".vehicle_stats").fadeIn();
}

function updateStatBar(
  upgradedValue,
  defaultValue,
  valueVar,
  deltaVar,
  barClass
) {
  const bar = document.querySelector(barClass);
  let delta = upgradedValue - defaultValue;

  bar.classList.remove("negative", "positive");
  bar.classList.add(delta < 0 ? "negative" : "positive");
  if (delta.toString() == "NaN") {
    delta = 0;
  }

  bar.style.setProperty(
    valueVar,
    `${delta < 0 ? defaultValue + delta : defaultValue}%`
  );
  bar.style.setProperty(deltaVar, `${Math.abs(delta)}%`);

  if (delta != 0) {
    var styleElem = document.head.appendChild(document.createElement("style"));

    styleElem.innerHTML =
      barClass +
      "::before {width: var(" +
      valueVar +
      "); background: #1f5eff; border-top-right-radius: 0; border-bottom-right-radius: 0;}";
  } else {
    var styleElem = document.head.appendChild(document.createElement("style"));

    setTimeout(() => {
      styleElem.innerHTML =
        barClass +
        "::before {width: var(" +
        valueVar +
        "); background: #1f5eff; border-top-right-radius: 0.625rem; border-bottom-right-radius: 0.625rem;}";
    }, 300);
  }

  return;
}

function MainMenu() {
  pricer = new Pricing();
  neon_state = {};
  CreateMenu(mods_available);
  createPoints();
  SetTuningStatus();
  /* get wheels */
  nui
    .send("GetVehicleWheels")
    .then((resp) => resp.json())
    .then((resp) => (available_wheels = resp));
}

/* Main Menu */
function CreateMenu(menu, defaultImg) {
  if (typeof menu !== "object") return;
  current_menu = "main";
  /* Elements */

  menux.Title(Locale("CustomizeVehicle"));
  menux.Clear();

  // Upgrades
  menu.upgrades.length > 0 && menux.CreateDivider(Locale("Upgrades"));
  menu.upgrades.forEach((mod) => {
    mod.menuCategory = Locale("Upgrades");
    let label = mod.category;
    let modType = mod.mod;
    let imgsrc = mod.img || "img/cosmetics/plate.svg";
    let attributes = `mod="${modType}"`;
    menux.CreateCategory(attributes, imgsrc, label);
  });
  // Cosmetics
  menu.cosmetics.length > 0 && menux.CreateDivider(Locale("Cosmetics"));
  menu.cosmetics.forEach((mod) => {
    mod.menuCategory = Locale("Cosmetics");
    let label = mod.category;
    let modType = mod.mod;
    let imgsrc = mod.img || "img/cosmetics/plate.svg";
    let attributes = `mod="${modType}"`;
    menux.CreateCategory(attributes, imgsrc, label);
  });

  if (main_menu_scroll) {
    document.querySelector(".content").scrollTop = main_menu_scroll;
  }

  let removeallEl = document.getElementById("removeall");

  if (removeallEl && Object.keys(pricer.cart).length > 0) {
    removeallEl.removeAttribute("disabled");
  } else if (removeallEl) {
    removeallEl.setAttribute("disabled", "true");
  }

  let gobackBtn = document.getElementById("goback");
  if (gobackBtn) {
    gobackBtn.innerHTML = Locale("Pay");
    if (Object.keys(pricer.cart).length > 0) {
      gobackBtn.removeAttribute("disabled");
    } else {
      gobackBtn.setAttribute("disabled", "true");
    }

    gobackBtn.setAttribute("id", "pay");
  }
  menux.ToggleVisibility(true);
  if(!freecam){
    $(".freecamtext").fadeIn();
  }

  let scrollBar =
    document.querySelector(".content").scrollHeight >
    document.querySelector(".content").clientHeight;
  if (scrollBar) {
    document.getElementById("content").style.paddingRight = "0.4375rem";
  } else {
    document.getElementById("content").style.paddingRight = "0.6875rem";
  }
}

// Create specific categories available mods
function CreateCategoryMenu(category_modlist) {
  current_menu = "category";
  menux.Title(category_modlist.category);
  menux.Clear();
  if (
    category_modlist.menuCategory.toString() != "undefined" &&
    category_modlist.menuCategory.toString() != "null" &&
    category_modlist.menuCategory.toString() != ""
  ) {
    menux.CreateDivider(category_modlist.menuCategory.toString());
  }
  let mods = category_modlist.mods;
  let default_img = category_modlist.img || "img/cosmetics/plate.svg";
  if (!mods) return;

  GoBackButtonMaker();
  /* Neons */
  if (category_modlist.category === "Neons") {
    mods.forEach((option) => {
      if (option.id === "neon-color") {
        /* neon color */

        menux.CreateColorPickerOption(
          config.ExtraStuff.ColorPickerPrices.NeonColor
        );
      } else {
        /* Neon options */
        menux.CreateOption(
          `id="${option.id}" data-neon="${option.name}"`,
          default_img,
          option.name,
          `${option.price || 0}`
        );
      }
    });
    return;
  }

  if (category_modlist.category === "Extras") {
    mods.forEach((option) => {
      let ExtraEnabled = current_veh_properties.extras[Number(option.id)];
      menux.CreateOption(
        `id="${option.id}" data-extra="${option.id}"`,
        default_img,
        option.name,
        option.price,
        ExtraEnabled ? "removetoggle" : "" // if extra is on, add class to remove it
      );
    });
    return;
  }

  mods.forEach((option) => {
    /* Xenon Color */
    if (option.id === "xenon-color") {
      menux.CreateColorPickerOption(config.ExtraStuff.ColorPickerPrices.Xenons);
    } else if (option.id === "tyresmoke") {
      /* Tyre Smoke */
      menux.CreateOption(
        `id="${option.id}"`,
        default_img,
        option.name,
        option.price
      );
    } else {
      /* General */
      menux.CreateOption(
        `id="${option.id}"`,
        default_img,
        option.name,
        option.price
      );
    }
  });
  //let selected = document.getElementById(current_veh_properties[selected_mod]);
  let current = document.getElementById(current_veh_properties[selected_mod]);
  if (current) {
    current.classList.add("current");
  }

  let upgrade = pricer.upgrades[selected_mod];

  if (typeof upgrade !== "undefined") {
    let selected = document.getElementById(pricer.upgrades[selected_mod]);
    selected.classList.add("selected");
  }

  let scrollBar =
    document.querySelector(".content").scrollHeight >
    document.querySelector(".content").clientHeight;
  if (scrollBar) {
    document.getElementById("content").style.paddingRight = "0.4375rem";
  } else {
    document.getElementById("content").style.paddingRight = "0.6875rem";
  }
}

/* Create Fixed Color Categories Menu */
/* Classic, metalic, matte, metals */
function CreateFixedColorCategories({ label, img }) {
  current_menu = "FixedColorCategories";
  const paints = config.GtaColors;

  menux.Title(label);
  menux.Clear();
  GoBackButtonMaker();
  /* Add divider */
  menux.CreateDivider(Locale("Cosmetics"));
  /* Create Categories */
  paints.forEach((type) => {
    menux.CreateCategory(`paint="${type.category}"`, img, type.label);
  });
}

async function CreateFixedColorCategoryOptions({ label, img }) {
  const paint_category = SelectedResprayDetails.paint_category;

  const paints = config.GtaColors;
  const selected_paint = await paints.find(
    (paint) => paint.category == paint_category
  );
  if (!selected_paint) return;
  let price = 0;
  if (selected_mod === "wheels") {
    price = config.ExtraStuff.OtherPaints[selected_mod].prices[paint_category];
  } else if (selected_mod === "respray") {
    if (SelectedResprayDetails.target === "pearlescent") {
      price = config.ExtraStuff.OtherPaints.pearlescent.prices[paint_category];
    } else if (SelectedResprayDetails.target === "dashboard") {
      price = config.ExtraStuff.OtherPaints.dashboard.prices[paint_category];
    } else if (SelectedResprayDetails.target === "interior") {
      price = config.ExtraStuff.OtherPaints.interior.prices[paint_category];
    }
  }

  current_menu = "FixedColorCategoryOptions";

  menux.Title(label);
  menux.Clear();
  GoBackButtonMaker();
  let paybtn = document.getElementById("pay");
  if (paybtn) {
    paybtn.innerHTML = Locale("GoBack");
    paybtn.removeAttribute("disabled");
    paybtn.setAttribute("id", "goback");
  }

  menux.CreateDivider(Locale("Cosmetics"));

  /* Create Categories */
  selected_paint.colors.forEach((type) => {
    menux.CreateOption(`paint_id="${type.id}"`, img, type.name, price);
  });
}

// Creates First Page Category menu for respray,neons and wheels
// These Have multi page options/categories
function HandleMultiPageMenu(mod) {
  selected_mod = mod;
  current_menu = "category";
  if (mod === "respray") {
    menux.Clear();
    menux.Title(Locale("ResprayOptions"));
    menux.CreateDivider(Locale("Cosmetics"));
    if (isMotorcycle) {
      // if motorcycle, only show primary, secondary, pearlescent
      resprayOptions.motorcycle.forEach((option) => {
        menux.CreateCategory(
          `id="${option.id}"`,
          config.ExtraStuff.images.respray,
          Locale(option.label)
        );
      });
      GoBackButtonMaker();
    } else {
      // if not motorcycle, show all
      resprayOptions.full.forEach((option) => {
        menux.CreateCategory(
          `id="${option.id}"`,
          config.ExtraStuff.images.respray,
          Locale(option.label)
        );
      });
      GoBackButtonMaker();
    }
  } else if (mod === "neons") {
    menux.Clear();
    menux.Title(Locale("Neons"));
    menux.CreateDivider(Locale("Cosmetics"));
    neons.list.forEach((neon) => {
      menux.CreateCategory(
        `id="${neon}"`,
        config.ExtraStuff.images.neons,
        Locale(neon)
      );
    });
    menux.CreateColorPickerOption(
      config.ExtraStuff.ColorPickerPrices.NeonColor
    );
    GoBackButtonMaker();
  } else if (mod === "wheels") {
    menux.Clear();
    menux.Title(Locale("Wheels"));
    menux.CreateDivider(Locale("Cosmetics"));
    wheel_categories.forEach((option) => {
      menux.CreateCategory(`id="${option}"`, wheel_img, Locale(option));
    });
    GoBackButtonMaker();
  }
  let scrollBar =
    document.querySelector(".content").scrollHeight >
    document.querySelector(".content").clientHeight;
  if (scrollBar) {
    document.getElementById("content").style.paddingRight = "0.4375rem";
  } else {
    document.getElementById("content").style.paddingRight = "0.6875rem";
  }
}
/* Disable & Enable Neon Options */
function CreateNeonTogglerMenu() {
  current_menu = "neon_toggler";
  menux.Clear();
  menux.Title(Locale(neons.selected.neon));
  menux.CreateDivider(Locale("Cosmetics"));
  menux.CreateOption(
    "id='false'",
    config.ExtraStuff.images.neons,
    Locale("DisableNeon"),
    0
  );
  menux.CreateOption(
    "id='1'",
    config.ExtraStuff.images.neons,
    Locale("EnableNeon"),
    config.ExtraStuff.NeonLightsPrice
  );
  // Set Current State
  let index = neons.list.indexOf(neons.selected.neon);
  neons.selected.index = index + 1;
  let state =
    typeof neon_state[neons.selected.index] === "undefined"
      ? current_veh_properties.neonEnabled[index]
      : neon_state[neons.selected.index];
  if (state) {
    document.getElementById("1").classList.add(`selected`);
  } else {
    document.getElementById("false").classList.add(`selected`);
  }
}

function CreatePaintSelectorMenu() {
  current_menu = "paintselector";
  menux.Clear();
  menux.Title(Locale("PaintSelector"));
  menux.CreateDivider(Locale("Cosmetics"));
  menux.CreateCategory(
    `id="primary"`,
    config.ExtraStuff.images.respray,
    Locale("Primary")
  );
}

// Create Primary and Secondary Options and Color picker
function CreatePrimarySecondaryColorMenu(color) {
  SelectedResprayDetails.paint_index = color;
  current_menu = "bodycolor";
  menux.Clear();
  menux.Title(color);
  menux.CreateDivider(Locale("Cosmetics"));
  menux.CreateCategory(
    `id="rgb"`,
    config.ExtraStuff.images.respray,
    Locale("RGB")
  );  
  menux.CreateCategory(
    `id="chameleon"`,
    config.ExtraStuff.images.respray,
    Locale("Chameleon")
  );
}

function CreatePrimaryRGBColorMenu(color) {
  SelectedResprayDetails.paint_index = color;
  current_menu = "rgbbodycolor";
  selected_mod = "respray";
  menux.Clear();
  menux.Title(color);
  menux.CreateDivider(Locale("Cosmetics"));
  Object.values(config.ExtraStuff.Paints).forEach((type) => {
    menux.CreateOption(
      `id="${type.id}"`,
      config.ExtraStuff.images.respray,
      type.label,
      config.ExtraStuff.Paints[type.id].price
    );
  }); 
  menux.CreateColorPickerOption(config.ExtraStuff.ColorPickerPrices.BodyPaint);
}

function CreateChameleonColorMenu(color) {
  SelectedResprayDetails.paint_index = color;
  current_menu = "rgbbodycolor";
  selected_mod = "chameleon";
  menux.Clear();
  menux.Title(color);
  menux.CreateDivider(Locale("Cosmetics"));
  chameleonColorList.forEach((type) => {
    menux.CreateOption(
      `id="${type.id}"`,
      config.ExtraStuff.images.respray,
      type.name,
      config.ExtraStuff.ChameleonPaintsPrice
    );
  });
}

// Dashboard and Interior Color Options
function CreatePearlDashInteriorColorMenu(color) {
  SelectedResprayDetails.paint_index = color;
  current_menu = "bodycolor";
  menux.Clear();
  menux.Title(color);
  menux.CreateDivider(Locale("Cosmetics"));
  Object.values(config.ExtraStuff.Paints).forEach((type) => {
    menux.CreateOption(
      `id="${type.id}"`,
      config.ExtraStuff.images.respray,
      type.label,
      config.ExtraStuff.Paints[type.id].price
    );
  });
}

/* Wheels */

function CreateWheelTypeCategoryMenu(type) {
  menux.Clear();
  menux.Title(Locale("WheelType"));
  menux.CreateDivider(Locale("Cosmetics"));
  if (type === "wheelindex") {
    current_menu = "wheelindex";
    menux.CreateCategory(`wheelindex="23"`, wheel_img, "Front Wheel");
    menux.CreateCategory(`wheelindex="24"`, wheel_img, "Rear Wheel");
  } else if (type === "wheeltype") {
    current_menu = wheel_categories[0];
    available_wheels.forEach((option) => {
      menux.CreateCategory(
        `wheeltype="${option.name}"`,
        wheel_img,
        option.name
      );
    });
  }
  let scrollBar =
    document.querySelector(".content").scrollHeight >
    document.querySelector(".content").clientHeight;
  if (scrollBar) {
    document.getElementById("content").style.paddingRight = "0.4375rem";
  } else {
    document.getElementById("content").style.paddingRight = "0.6875rem";
  }
}

function CreateWheelTypeOptions(wheeltype) {
  let wheeloptions = available_wheels.find((wheel) => wheel.name == wheeltype);
  if (!wheeloptions) return;
  wheels_info.type = wheeloptions.id;
  current_menu = "wheelstype_submenu";
  menux.Clear();
  menux.Title(Locale("WheelType"));
  menux.CreateDivider(Locale("Cosmetics"));
  wheeloptions.mods.forEach((option) => {
    menux.CreateOption(
      `wheelID="${option.id}"`,
      wheel_img,
      option.name,
      option.price
    );
  });
  let scrollBar =
    document.querySelector(".content").scrollHeight >
    document.querySelector(".content").clientHeight;
  if (scrollBar) {
    document.getElementById("content").style.paddingRight = "0.4375rem";
  } else {
    document.getElementById("content").style.paddingRight = "0.6875rem";
  }
}

function CreateWheelTiresCategoryMenu(id) {
  current_menu = id;
  menux.Clear();
  menux.Title(Locale("Tires"));
  menux.CreateDivider(Locale("Cosmetics"));
  tire_categories.forEach((option, i) => {
    if (config.RemovableMods.BulletProofTires && i === 1) {
    } else {
      menux.CreateCategory(`id="${option}"`, wheel_img, Locale(option));
    }
  });
  let scrollBar =
    document.querySelector(".content").scrollHeight >
    document.querySelector(".content").clientHeight;
  if (scrollBar) {
    document.getElementById("content").style.paddingRight = "0.4375rem";
  } else {
    document.getElementById("content").style.paddingRight = "0.6875rem";
  }
}

/* Tires */

function CreateTireDesignMenu() {
  menux.Clear();
  menux.Title(Locale("TireDesign"));
  menux.CreateDivider(Locale("Cosmetics"));
  if (isMotorcycle) {
    menux.CreateCategory('customtire_target="front"', wheel_img, "Front");
    menux.CreateCategory('customtire_target="back"', wheel_img, "Back");
  } else {
    menux.CreateOption('customTires="false"', wheel_img, Locale("Stock"), 0);
    menux.CreateOption(
      'customTires="true"',
      wheel_img,
      Locale("CustomTires"),
      config.ExtraStuff.CustomTiresPrice
    );
  }

  if (current_veh_properties.modCustomTiresF) {
    document.querySelector('[customTires="true"]').classList.add("current");
  } else {
    document.querySelector('[customTires="false"]').classList.add("current");
  }

  if (tire_states.modCustomTiresF) {
    document.querySelector('[customTires="true"]').classList.add("selected");
  } else {
    document.querySelector('[customTires="false"]').classList.add("selected");
  }
}

function CreateTireEnhancementsMenu() {
  menux.Clear();
  menux.Title(Locale("TireEnhancements"));
  menux.CreateDivider(Locale("Cosmetics"));
  menux.CreateOption('bulletproof="false"', wheel_img, Locale("Stock"), 0);
  menux.CreateOption(
    'bulletproof="true"',
    wheel_img,
    Locale("BulletProofTires"),
    config.ExtraStuff.BulletProofTyresPrice
  );
  if (current_veh_properties.modBulletProofTires) {
    document.querySelector('[bulletproof="true"]').classList.add("current");
  } else {
    document.querySelector('[bulletproof="false"]').classList.add("current");
  }
  if (tire_states.modBulletProofTires) {
    document.querySelector('[bulletproof="true"]').classList.add("selected");
  } else {
    document.querySelector('[bulletproof="false"]').classList.add("selected");
  }
}

function CreateTireSmokeMenu() {
  menux.Clear();
  menux.Title(Locale("TireSmoke"));
  menux.CreateDivider(Locale("Cosmetics"));
  menux.CreateOption("tiresmoke='false'", wheel_img, Locale("Disable"), 0);
  menux.CreateOption(
    "tiresmoke='true'",
    wheel_img,
    Locale("Enable"),
    config.ExtraStuff.TyreSmokePrice
  );
  menux.CreateColorPickerOption(
    config.ExtraStuff.ColorPickerPrices.TyreSmokeColor
  );

  if (current_veh_properties.modSmokeEnabled) {
    document.querySelector('[tiresmoke="true"]').classList.add("current");
  } else {
    document.querySelector('[tiresmoke="false"]').classList.add("current");
  }

  if (tire_states.modSmokeEnabled) {
    document.querySelector('[tiresmoke="true"]').classList.add("selected");
  } else {
    document.querySelector('[tiresmoke="false"]').classList.add("selected");
  }
}

/* Wheel Main Menu Handler */

function handleWheelCategories(id) {
  if (id === "WheelType") {
    /* Wheel Type */
    if (isMotorcycle) {
      CreateWheelTypeCategoryMenu("wheelindex");
    } else {
      wheelindex = 23;
      CreateWheelTypeCategoryMenu("wheeltype");
    }
  } else if (id === "WheelColor") {
    /* Wheel Color */

    CreateFixedColorCategories({ label: Locale("WheelColor"), img: wheel_img });

    if (isMotorcycle) {
      console.log("Motorcycle");
    } else console.log("Not Motorcycle");
  } else if (id === "Tires") {
    /* Tires */
    CreateWheelTiresCategoryMenu(id);
  }
}

// Tires Main Menu Handler
function handleTiresCategories(id) {
  if (id === "TireDesign") {
    /* Tire Design */
    current_menu = id;
    CreateTireDesignMenu();
  } else if (id === "TireEnhancements") {
    /* Tire Enhancements */
    current_menu = id;
    CreateTireEnhancementsMenu();
  } else if (id === "TireSmoke") {
    /* Tire Smoke */
    current_menu = id;
    CreateTireSmokeMenu();
  }
}
/*

main -> category-menu -> wheel_submenu -> tire_submenu
															...			-> wheel_options
															...			-> front_wheel -> wheel options
											-> wheelcolor_submenu -> wheelcolor_options

*/

/* Modals */

// detect if modal has been hidden

function CreateExitMenuModal() {
  $("#closemenu-info").html(
    ` <span class="modal-t">${Locale("CloseMenu")}</span>
			<hr class="mg070">
			<span class="close-button_modal" data-bs-dismiss="modal" ><i class="fas fa-times"></i></span>
			<div class="conf_fire text-center">${Locale("CloseMenuDesc")}</div>
			<div class="d-flex justify-content-center align-items-center mt-625 ">
					<button id="closemenu-deny" class="btn btn-dark w-50 modal-buttons me-3" data-bs-dismiss="modal">${Locale(
            "CloseMenuNo"
          )}</button>
					<button id="closemenu-confirm" class="btn btn-blue w-50 modal-buttons" data-bs-dismiss="modal">${Locale(
            "CloseMenuYes"
          )}</button>
			</div>`
  );

  $("#closemenu-modal").modal("show");
}

function CreateRepairModal(price) {
  current_menu = "repair";
  let message =
    price > 0
      ? Locale("RepairVehicleDesc") + ` ${currency(price)}?`
      : Locale("RepairVehicleDescFree");
  $("#repairmenu-info").html(
    ` <span class="modal-t">${Locale("RepairVehicle")}</span>
			<hr class="mg070">
			<span class="close-button_modal" data-bs-dismiss="modal" onClick="closeRepairMenu()"><i class="fas fa-times"></i></span>
			<div class="conf_fire text-center">${message}</div>
			<div class="d-flex justify-content-center align-items-center mt-625 ">
					<button id="closemenu-repair" class="btn btn-dark w-50 modal-buttons me-3" data-bs-dismiss="modal">${Locale(
            "CloseMenuNo"
          )}</button>
					<button id="repair-vehicle" class="btn btn-blue w-50 modal-buttons" data-bs-dismiss="modal">${Locale(
            "Repair"
          )}</button>
			</div>`
  );

  $("#repairmenu-modal").modal("show");

  $("#repairmenu-modal").on("hidden.bs.modal", function () {
    if (current_menu === "repair") {
      current_menu = "main";
      closeRepairModal();
    }
  });
}

function PaySummary() {
  lastmenu = current_menu;
  current_menu = "payment";
  let recommendedPrice = 0;
  let recommendedText = ``;
  let html = `
    <span class="modal-t mr06875">${Locale("Summary")}</span>
    <hr class="mg070 mr06875">
    <span class="close-button_modal" data-bs-dismiss="modal"><i class="fas fa-times"></i></span>
    `;

  if(Object.keys(pricer.cart).length < 11){
    html += `<div class="payment_scroll p00687500">`;
  }else{
    html += `<div class="payment_scroll p00437500">`;
  }

  Object.keys(pricer.cart).forEach((item) => {
    let [label, price] = [item, pricer.cart[item]];
    if (price >= 0) label = label.charAt(0).toUpperCase() + label.slice(1);
    html += `
    <div class="d-flex justify-content-between">
      <span class="item">${label}</span>
      <span class="price">${currency(price)}</span>
    </div>`;
  });
  if(config.ShowRecommendedInvoicePrice && showRecommended || config.ShowRecommendedInvoicePrice && showRecommended == undefined){
    recommendedPrice = pricer.total*(config.PercentageAbovePrice/100+1);
    recommendedText += `
    <div class="d-flex justify-content-between mr06875">
      <span class="total-recommended">${Locale("PayRecommendedTotal")}</span>
      <span class="price-recommended">${currency(recommendedPrice)}</span>
    </div>`;
  }

  html += `</div>
  <div class="d-flex justify-content-between mt-3 mr06875">
    <span class="total-text">${Locale("PayTotal")}</span>
    <span class="paymenttotal total-price">${currency(pricer.total)}</span>
  </div>
  ${recommendedText}
  <div class="mr06875">
    <button type="button" class="btn btn-blue pay" id="paytotal">Pay</button>
  </div>`;

  $("#payment-info").html(html);
  $("#payment-modal").modal("show");
  isPayMenuOpen = true;
}

/* Player Selection	*/

function CreatePlayerSelection(data) {
  current_menu = "playerselection";
  let listEl = document.getElementById("playerselection-players");
  listEl.innerHTML = "";

  data.forEach((player) => {
    listEl.innerHTML += `<player class='btn btn-blue' player_src="${player.source}">${player.name} (${player.source})</player>`;
  });
  $(".playerselection-bg").fadeIn(200);
}
