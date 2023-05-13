Config = {}
Config.Locale = 'cs'
Config.EnableTH = true

Config.EnableCarry             = true 

Config.EnableRag               = true
Config.EnableShuff             = true

Config.EnableCrouch            = true 
Config.EnableCrouchCMD         = true 
Config.CrouchButton            = 36
Config.EnableLuxVehControl     = true 
Config.EnableHandsUP           = true 
Config.HandsUPButton           = 323 
Config.EnableVehiclePush       = true
Config.DamageNeeded            = 100.0
Config.MaxWidth                = 5.0 
Config.MaxHeight               = 5.0
Config.MaxLength               = 5.0
Config.RestrictEmer            = true 
Config.EnableRealVehDamage     = true
ConfigVehDamage                = {
	deformationMultiplier = -1, 
	deformationExponent = 0.8, 
	collisionDamageExponent = 0.9,

	damageFactorEngine = 5.0,
	damageFactorBody = 5.0, 
	damageFactorPetrolTank = 43.0,
	engineDamageExponent = 0.8, 
	weaponsDamageMultiplier = 2.0,
	cascadingFailureSpeedFactor = 8.0, 

	degradingFailureThreshold = 800.0,
	cascadingFailureThreshold = 360.0,
	engineSafeGuard = 200.0, 

	torqueMultiplierEnabled = true,

	limpMode = false,
	limpModeMultiplier = 0.19, 

	preventVehicleFlip = false, 

	sundayDriver = false,
	sundayDriverAcceleratorCurve = 7.5,
	sundayDriverBrakeCurve = 5.0, 
	compatibilityMode = false,
	randomTireBurstInterval = 0,
	
	classDamageMultiplier = {
		[0] = 0.25,
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25, 
		0.25 
	}
}
Config.EnableTireKnife         = true

Config.PedList = {

	{
		model = `a_m_m_og_boss_01`,
		coords = vector4(307.1509, -216.4348, 54.2199, 340.9537),
		gender = 'male'
	},
}

Config.Weapons = {
	[`WEAPON_UNARMED`] = { model = `WEAPON_UNARMED`, modifier = 0.9, disableCritical = true },
	[`WEAPON_FLASHLIGHT`] = { model = `WEAPON_NIGHTSTICK`, modifier = 0.9, disableCritical = true },
	[`WEAPON_KNIFE`] = { model = `WEAPON_KNIFE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_CARBINERIFLE`] = { model = `WEAPON_CARBINERIFLE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_CARBINERIFLE_MK2`] = { model = `WEAPON_CARBINERIFLE_MK2`, modifier = 0.9, disableCritical = true },
	[`WEAPON_KNUCKLE`] = { model = `WEAPON_KNUCKLE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_NIGHTSTICK`] = { model = `WEAPON_NIGHTSTICK`, modifier = 0.9, disableCritical = true },
	[`WEAPON_HAMMER`] = { model = `WEAPON_HAMMER`, modifier = 0.9, disableCritical = true },
	[`WEAPON_BAT`] = { model = `WEAPON_BAT`, modifier = 0.9, disableCritical = true },
	[`WEAPON_GOLFCLUB`] = { model = `WEAPON_GOLFCLUB`, modifier = 0.9, disableCritical = true },
	[`WEAPON_CROWBAR`] = { model = `WEAPON_CROWBAR`, modifier = 0.9, disableCritical = true },
	[`WEAPON_BOTTLE`] = { model = `WEAPON_BOTTLE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_DAGGER`] = { model = `WEAPON_DAGGER`, modifier = 0.9, disableCritical = true },
	[`WEAPON_HATCHET`] = { model = `WEAPON_HATCHET`, modifier = 0.9, disableCritical = true },
	[`WEAPON_MACHETE`] = { model = `WEAPON_MACHETE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_SWITCHBLADE`] = { model = `WEAPON_SWITCHBLADE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_PROXMINE`] = { model = `WEAPON_PROXMINE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_BZGAS`] = { model = `WEAPON_BZGAS`, modifier = 0.9, disableCritical = true },
	[`WEAPON_SMOKEGRENADE`] = { model = `WEAPON_SMOKEGRENADE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_MOLOTOV`] = { model = `WEAPON_MOLOTOV`, modifier = 0.9, disableCritical = true },
	[`WEAPON_REVOLVER`] = { model = `WEAPON_REVOLVER`, modifier = 0.9, disableCritical = true },
	[`WEAPON_POOLCUE`] = { model = `WEAPON_POOLCUE`, modifier = 0.9, disableCritical = true },
	[`WEAPON_PIPEWRENCH`] = { model = `WEAPON_PIPEWRENCH`, modifier = 0.9, disableCritical = true },
	[`WEAPON_PISTOL`] = { model = `WEAPON_PISTOL`, modifier = 0.9, disableCritical = true },
	[`WEAPON_PISTOL_MK2`] = { model = `WEAPON_PISTOL_MK2`, modifier = 0.7, disableCritical = true },
	[`WEAPON_MACHINEPISTOL`] = { model = `WEAPON_MACHINEPISTOL`, modifier = 0.8, disableCritical = true },
	[`WEAPON_COMBATPISTOL`] = { model = `WEAPON_COMBATPISTOL`, modifier = 0.8, disableCritical = true },
	[`WEAPON_APPISTOL`] = { model = `WEAPON_APPISTOL`, modifier = 0.8, disableCritical = true },
	[`WEAPON_PISTOL50`] = { model = `WEAPON_PISTOL50`, modifier = 0.9, disableCritical = true },
	[`WEAPON_SNSPISTOL_MK2`] = { model = `WEAPON_SNSPISTOL_MK2`, modifier = 0.45, disableCritical = true },
	[`WEAPON_HEAVYPISTOL`] = { model = `WEAPON_HEAVYPISTOL`, modifier = 0.8, disableCritical = true },
	[`WEAPON_VINTAGEPISTOL`] = { model = `WEAPON_VINTAGEPISTOL`, modifier = 0.9, disableCritical = true },
	[`WEAPON_FLAREGUN`] = { model = `WEAPON_FLAREGUN`, modifier = 0.9, disableCritical = true },
	[`WEAPON_MARKSMANPISTOL`] = { model = `WEAPON_MARKSMANPISTOL`, modifier = 0.9, disableCritical = true },
	[`WEAPON_MICROSMG`] = { model = `WEAPON_MICROSMG`, modifier = 0.8, disableCritical = true },
	[`WEAPON_MINISMG`] = { model = `WEAPON_MINISMG`, modifier = 0.8, disableCritical = true },
	[`WEAPON_SMG`] = { model = `WEAPON_SMG`, modifier = 0.17, disableCritical = true },
	[`WEAPON_SMG_MK2`] = { model = `WEAPON_SMG_MK2`, modifier = 0.12, disableCritical = true },
	[`WEAPON_ASSAULTSMG`] = { model = `WEAPON_ASSAULTSMG`, modifier = 0.9, disableCritical = true },
	[`WEAPON_ASSAULTRIFLE`] = { model = `WEAPON_ASSAULTRIFLE`, modifier = 0.8, disableCritical = true },
	[`WEAPON_ASSAULTRIFLE_MK2`] = { model = `WEAPON_ASSAULTRIFLE_MK2`, modifier = 0.8, disableCritical = true },
	[`WEAPON_ASSAULTSHOTGUN`] = { model = `WEAPON_ASSAULTSHOTGUN`, modifier = 0.001, disableCritical = true },
	[`WEAPON_MG`] = { model = `WEAPON_MG`, modifier = 0.9, disableCritical = true },
	[`WEAPON_COMBATMG`] = { model = `WEAPON_COMBATMG`, modifier = 0.9, disableCritical = true },
	[`WEAPON_COMBATMG_MK2`] = { model = `WEAPON_COMBATMG_MK2`, modifier = 0.9, disableCritical = true },
	[`WEAPON_COMBATPDW`] = { model = `WEAPON_COMBATPDW`, modifier = 0.8, disableCritical = true },
	[`WEAPON_PUMPSHOTGUN`] = { model = `WEAPON_PUMPSHOTGUN`, modifier = 0.8, disableCritical = true },
	[`WEAPON_PUMPSHOTGUN_MK2`] = { model = `WEAPON_PUMPSHOTGUN_MK2`, modifier = 0.8, disableCritical = true },
	[`WEAPON_SAWNOFFSHOTGUN`] = { model = `WEAPON_SAWNOFFSHOTGUN`, modifier = 0.01, disableCritical = true },
	[`WEAPON_HEAVYSHOTGUN`] = { model = `WEAPON_HEAVYSHOTGUN`, modifier = 0.8, disableCritical = true },
	[`WEAPON_SPECIALCARBINE`] = { model = `WEAPON_SPECIALCARBINE`, modifier = 0.1, disableCritical = true },
	[`WEAPON_SPECIALCARBINE_MK2`] = { model = `WEAPON_SPECIALCARBINE_MK2`, modifier = 0.9, disableCritical = true },
}

Config.AdminChatLog = "https://discord.com/api/webhooks/1031574166882746539/PT_IYjqpxHV4-OFKfiB553XUxmeb31W5Sx4fxrEUGJ-DyATjFbDWdqKO6gEPmkYyWwgU"

