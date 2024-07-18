function ApplyMod({ mod, value, wheelindex, neon_index, respray_type }) {
  nui.send("ModDemo", { mod, value }); // This will trigger a camera animation
  nui
    .send("SetVehicleMod", {
      mod,
      value,
      wheelindex,
      neon_index,
      respray_type,
    })
    .then((resp) => resp.json())
    .then((resp) => {
      if (resp) {
        pricer.AddToCart(mod, value);
      }
    });
}

/* Used by primary, secondary, neon and xenon */
let lastColorsPicked = {};

function ColorChanger() {
  let mod = selected_mod;
  let colorEl = document.getElementById("color-picker");
  let circle = document.getElementById("circle-color");
  circle.setAttribute("fill", colorEl.value);
  if (selected_mod === "respray") {
    const target = SelectedResprayDetails.target;
    lastColorsPicked[target] = colorEl.value;
  } else {
    lastColorsPicked[mod] = colorEl.value;
  }
  let rgb = hexToRgb(colorEl.value);
  nui.send("SetCustomColor", {
    mod,
    rgb,
    respray_target: SelectedResprayDetails.target,
  });

  if (mod === "respray") {
    pricer.AddToCartCustom(
      SelectedResprayDetails.target === "PrimaryColor"
        ? Locale("PrimaryColorCustom")
        : Locale("SecondaryColorCustom"),
      config.ExtraStuff.ColorPickerPrices.BodyPaint
    );
  } else if (mod === "modXenon") {
    pricer.AddToCartCustom(
      Locale("XenonColor"),
      config.ExtraStuff.ColorPickerPrices.Xenons
    );
  } else if (mod === "neons") {
    pricer.AddToCartCustom(
      Locale("NeonColor"),
      config.ExtraStuff.ColorPickerPrices.NeonColor
    );
  } else if (mod === "wheels") {
    pricer.AddToCartCustom(
      Locale("TireSmokeColor"),
      config.ExtraStuff.ColorPickerPrices.TyreSmokeColor
    );
  }
}

function SetPaintType(data) {
  nui.send("SetPaintType", {
    paint_type: data.paint_type,
    paint: data.paint,
  });
}
