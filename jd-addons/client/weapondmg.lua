Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1000)
    -- PISTOLS
    SetWeaponDamageModifier(`WEAPON_CERAMICPISTOL`, 0.4) -- 11%
    SetWeaponDamageModifier(`WEAPON_COMBATPISTOL`, 0.5) -- 12%
    SetWeaponDamageModifier(`WEAPON_PISTOLXM3`, 0.4) -- 13%
    SetWeaponDamageModifier(`WEAPON_HEAVYPISTOL`, 0.38) -- 15%
    SetWeaponDamageModifier(`WEAPON_PISTOL_MK2`, 0.4) -- 15% - police
    SetWeaponDamageModifier(`WEAPON_PISTOL50`, 0.42) -- 20%

	-- AUTOMATIC
    SetWeaponDamageModifier(`WEAPON_TECPISTOL`, 0.35) -- 7%
    SetWeaponDamageModifier(`WEAPON_ASSAULTRIFLE`, 0.35) -- 9%
    SetWeaponDamageModifier(`WEAPON_ADVANCEDRIFLE`, 0.35) -- 10%
    SetWeaponDamageModifier(`WEAPON_CARBINERIFLE_MK2`, 0.40) -- 10%
    SetWeaponDamageModifier(`WEAPON_ASSAULTSMG`, 0.5) -- 10%
    SetWeaponDamageModifier(`WEAPON_CARBINERIFLE`, 0.40) -- 11% - police
    SetWeaponDamageModifier(`WEAPON_BULLPUPRIFLE_MK2`, 0.40) -- 11% - police
    SetWeaponDamageModifier(`WEAPON_COMPACTRIFLE`, 0.40) -- 12 %
    SetWeaponDamageModifier(`WEAPON_COMBATPDW`, 5.00) -- na boris admin orujieto che ne moe hitne
	-- HEAVY - 2

	-- SNIPERS - 1

	-- SHOTGUNS - 1

	-- MELLEE
    SetWeaponDamageModifier(`WEAPON_UNARMED`, 0.3) -- 6%
    SetWeaponDamageModifier(`WEAPON_BAT`, 0.2) -- 16%
    SetWeaponDamageModifier(`WEAPON_WRENCH`, 0.2) -- 16%
    SetWeaponDamageModifier(`WEAPON_FLASHLIGHT`, 0.25) --19% - police
    SetWeaponDamageModifier(`WEAPON_BAT`, 0.3) -- 22%
    SetWeaponDamageModifier(`WEAPON_NIGHTSTICK`, 0.3) -- 22% - police
    SetWeaponDamageModifier(`WEAPON_KNIFE`, 0.3) -- 24%
    SetWeaponDamageModifier(`WEAPON_HAMMER`, 0.32) -- 24%
    SetWeaponDamageModifier(`WEAPON_SWITCHBLADE`, 0.35) -- 26%
    SetWeaponDamageModifier(`WEAPON_MACHETE`, 0.35) -- 28%
    SetWeaponDamageModifier(`WEAPON_BATTLEAXE`, 0.38) -- 28%
    SetWeaponDamageModifier(`WEAPON_KATANA_2`, 0.3) -- 22%
    SetWeaponDamageModifier(`WEAPON_DRAGON_KATANA_RED`, 0.4) -- 30%
    SetWeaponDamageModifier(`WEAPON_DRAGON_KATANA_BLUE`, 0.4) -- 30%
    SetWeaponDamageModifier(`WEAPON_DRAGON_KATANA_GREEN`, 0.4) -- 30%
    SetWeaponDamageModifier(`WEAPON_DRAGON_KATANA_PURPLE`, 0.4) -- 30%
    SetWeaponDamageModifier(`WEAPON_DRAGON_KATANA_YELLOW`, 0.4) -- 30%

    -- Recoil
    SetWeaponRecoilShakeAmplitude(`WEAPON_COMBATPDW`, 0.00) -- na boris admin orujieto che ne moe hitne
    SetPedConfigFlag(PlayerPedId(), 438, true)
    end
end)

SetPlayerCanDoDriveBy(PlayerId(), false)
