require "/stats/effects/fu_armoreffects/setbonuses_common.lua"


weaponBonus={
	{stat = "powerMultiplier", effectiveMultiplier = 1.25}
}

armorBonus={
	{stat = "breathProtection", amount = 1},
	{stat = "poisonStatusImmunity", amount = 1},
{stat = "ffextremecoldImmunity", amount = 1},
{stat = "biomecoldImmunity", amount = 1},
{stat = "liquidnitrogenImmunity", amount = 1},
{stat = "sulphuricImmunity", amount = 1},
{stat = "blacktarImmunity", amount = 1},
{stat = "biomeheatImmunity", amount = 1},
{stat = "ffextremeheatImmunity", amount = 1},
{stat = "biomeradiationImmunity", amount = 1},
{stat = "radiationburnImmunity", amount = 1}
}

setName="fu_heavypeacekeeperset"

function init()
	setSEBonusInit(setName)
	effectHandlerList.weaponBonusHandle=effect.addStatModifierGroup({})
	checkWeapons()
	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		checkWeapons()
	end
end

function checkWeapons()
	local weapons=weaponCheck({"spear","rocketlauncher"})
	if weapons["either"] then
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,weaponBonus)
	else
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,{})
	end
end