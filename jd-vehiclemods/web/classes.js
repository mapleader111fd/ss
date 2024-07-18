class Pricing {
  constructor() {
    this.prices = config.ModPricing;
    this.upgrades = {};
    this.total = 0;
    this.cart = {};
    this.RefreshTotal();
  }
  // Updates price total
  RefreshTotal() {
    this.total = 0;
    Object.values(this.cart).forEach((price) => (this.total += price));
    this.total = Math.round(this.total);

    document.getElementById("totalamount").innerHTML = currency(this.total);

    let gobackBtn = document.getElementById("pay");

    if (gobackBtn && this.total > 0) {
      gobackBtn.removeAttribute("disabled");
    } else if (gobackBtn && this.total === 0) {
      gobackBtn.setAttribute("disabled", true);
    }
  }
  AddToCart(mod, index) {
    if (
      typeof mod !== "string" ||
      (typeof index !== "number" && typeof index !== "boolean")
    ) {
      return;
    }

    /* Tires */
    if (mod === "modBulletProofTires") {
      let label = Locale("BulletProofTires");
      if (index) {
        this.cart[label] = config.ExtraStuff.BulletProofTyresPrice;
      } else {
        this.cart[label] = 0;
      }
      this.RefreshTotal();
      return;
    } else if (mod === "modSmokeEnabled") {
      let label = Locale("SmokeEnabled");
      if (index) {
        this.cart[label] = config.ExtraStuff.TyreSmokePrice;
      } else {
        this.cart[label] = 0;
      }
      this.RefreshTotal();
      return;
    } else if (mod === "CustomTires") {
      let label = Locale("CustomTires");
      if (index) {
        this.cart[label] = config.ExtraStuff.CustomTiresPrice;
      } else {
        this.cart[label] = 0;
      }
      this.RefreshTotal();
      return;
    } else if (mod === "modWheels") {
      let label;
      if (isMotorcycle) {
        if (wheelindex === 23) {
          label = Locale("FrontWheels");
        } else {
          label = Locale("RearWheels");
        }
      } else {
        label = Locale("Wheels");
      }

      this.cart[label] = index;
      this.RefreshTotal();
      return;
    }

    this.upgrades[mod] = index;
    let upgrades = mods_available.upgrades;
    let cosmetics = mods_available.cosmetics;

    /* Find Price */

    if (mod === "neons") {
      let label = Locale(neons.selected.neon);
      if (
        !current_veh_properties.neonEnabled[neons.selected.index - 1] &&
        index
      ) {
        this.cart[label] = config.ExtraStuff.NeonLightsPrice;
      } else if (!index) {
        this.cart[label] = 0;
      }
      this.RefreshTotal();
      return;
    }

    /* Add price to cart */
    if (mod === "respray") {
      this.cart[Locale(SelectedResprayDetails.target)] = config.ExtraStuff.Paints[index].price;
      this.cart[Locale("Chameleon")] = 0;
    } else if (mod === "chameleon") {
      this.cart[Locale("Chameleon")] = config.ExtraStuff.ChameleonPaintsPrice;
      this.cart[Locale(SelectedResprayDetails.target)] = 0;
      this.cart[Locale("PrimaryColorCustom")] = 0;
      this.cart[Locale("SecondaryColorCustom")] = 0;
      this.cart[Locale("SecondaryColor")] = 0;
    } else if (mod === "extras") {
      if (vehExtrasOGState[index] === false) {
        // if extra is already on, dont add to cart
        let label = "extra" + index;
        this.cart[label] = config.ExtraStuff.Extras.price;
      }
    } else {
      let mod_price_category =
        upgrades.find((modz) => modz.mod === mod) ||
        cosmetics.find((modz) => modz.mod === mod);

      let mod_price_info = mod_price_category.mods.find((mod_info) => {
        return mod_info.id === index;
      });

      let mod_label = mod_price_category.category;

      if (current_veh_properties[mod] === index) {
        this.cart[mod_label] = 0;
      } else {
        this.cart[mod_label] = mod_price_info.price;
      }
    }

    /* Update Total */

    this.RefreshTotal();
  }
  AddToCartCustom(mod, price) {
    this.cart[mod] = price;
    this.RefreshTotal();
  }

  RemoveFromCart(mod, index) {
    if (mod === "extras") {
      let label = "extra" + index;
      this.cart[label] = 0;
    }
    this.RefreshTotal();
  }
}

class MenuMaker {
  constructor() {
    this.contentEl = document.getElementById("content");
    this.titleEl = document.getElementById("menu-title");
    this.menuEl = document.getElementById("menu");
  }
  ToggleVisibility(bool) {
    if (bool) {
      $("#menu").fadeIn(200);
    } else {
      $("#menu").fadeOut(200);
    }
  }
  Clear() {
    this.contentEl.innerHTML = "";
  }
  Title(title) {
    this.titleEl.innerHTML = title;
  }
  /* Divider */
  CreateDivider(label) {
    this.contentEl.innerHTML += `<div class="option-divider">${label}</div>`;
  }
  /* Category */
  CreateCategory(attributes, imgsrc, label) {
    selectedItem = undefined;
    this.contentEl.innerHTML += `
								<option-content class="option" ${attributes}>
								<div class="option-figure">
									<img alt="img" src=${imgsrc}	class='option-img'	draggable="false" />
								</div>
								<option-label class="option-label">${label}</option-label>`;
  }
  /* Option */
  CreateOption(attributes, imgsrc, label, pricex, extraClass) {
    let price = 0;
    if (typeof pricex === "number") {
      price = currency(Number(pricex));
    }
    selectedItem = undefined;
    this.contentEl.innerHTML += `
								<option-content class="option ${extraClass || ""}" ${attributes}>
								<div class="upgrade-info">
								<div class="upgrade-img-container">
									<img alt="img" src=${imgsrc} class='option-img'	draggable="false" />
								</div>
									<div class='upgrade-label' data-name="${label}">
									<span>${label}</span>
							</div>
								</div>
								<option-label class="option-label">${price}</option-label>`;
  }

  /* Color Picker */
  CreateColorPickerOption(price) {
    this.contentEl.innerHTML += `
										<option-content class="option" id="color-changer">
										<div class="upgrade-info">
										<div class="upgrade-img-container">
										<svg viewBox="0 0 100 100" style="width: 100%; height: 100%;">
											<circle cx="50" cy="50" r="45" fill="blue" id="circle-color" />
										</svg>
										<input id="color-picker" class="colorpicker" type="color" oninput="ColorChanger()" />
										</div>
											<div class='upgrade-label' data-name="Color">
											<span>Color</span>
									</div>
										</div>
										<option-label class="option-label">${currency(Number(price))}</option-label>`;
    if (
      lastColorsPicked.hasOwnProperty(selected_mod) ||
      lastColorsPicked.hasOwnProperty(SelectedResprayDetails?.target)
    ) {
      const circle = document.getElementById("circle-color");
      let color;
      if (selected_mod === "respray") {
        const target = SelectedResprayDetails.target;
        color = lastColorsPicked[target];
      } else {
        color = lastColorsPicked[selected_mod];
      }
      document.getElementById("color-picker").value = color;
      circle.setAttribute("fill", color);
    }
  }
}
