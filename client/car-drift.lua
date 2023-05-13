local vehicleClassWhitelist = { 0, 1, 2, 3, 4, 5, 6, 7, 9 }

local handleMods = {
	{ "fInitialDragCoeff",         90.22 },
	{ "fDriveInertia",             .31 },
	{ "fSteeringLock",             22 },
	{ "fTractionCurveMax",         -1.1 },
	{ "fTractionCurveMin",         -.4 },
	{ "fTractionCurveLateral",     2.5 },
	{ "fLowSpeedTractionLossMult", -.57 }
}

local ped, vehicle
local driftMode = false

Citizen.CreateThread(function()
	while true do
		Wait(1)
		ped = GetPlayerPed( -1)

		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if (GetPedInVehicleSeat(vehicle, -1) == ped) then
				if GetVehicleHandlingFloat(vehicle, "CHandlingData", "fDriveBiasFront") ~= 1 and IsVehicleOnAllWheels(vehicle) and IsControlJustReleased(0, 21) and IsVehicleClassWhitelisted(GetVehicleClass(vehicle)) then
					ToggleDrift(vehicle)
				end
				if GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDragCoeff") < 90 then
					SetVehicleEnginePowerMultiplier(vehicle, 0.0)
				else
					if GetVehicleHandlingFloat(vehicle, "CHandlingData", "fDriveBiasFront") == 0.0 then
						SetVehicleEnginePowerMultiplier(vehicle, 190.0)
					else
						SetVehicleEnginePowerMultiplier(vehicle, 100.0)
					end
				end
			end
		end
	end
end)

function ToggleDrift(vehicle)
	local modifier = 1

	if GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDragCoeff") > 90 then
		driftMode = true
	else
		driftMode = false
	end

	if driftMode then
		modifier = -1
	end

	for index, value in ipairs(handleMods) do
		SetVehicleHandlingFloat(vehicle, "CHandlingData", value[1], GetVehicleHandlingFloat(vehicle, "CHandlingData", value[1]) + value[2] * modifier)
	end

	if driftMode then
		exports['okokNotify']:Alert("Interakce", "TCS, ABS, ESP je ON! (Vozidlo je ve standartním módu)", 5000, 'info')
	else
		exports['okokNotify']:Alert("Interakce", "TCS, ABS, ESP je OFF! (Vozidlo je ve DRIFT módu)", 5000, 'info')
	end
end

function PrintDebugInfo(mode)
	ped = GetPlayerPed( -1)
	local vehicle = GetVehiclePedIsIn(ped, false)
	print(mode)
	for index, value in ipairs(handleMods) do
		print(GetVehicleHandlingFloat(vehicle, "CHandlingData", value[1]))
	end
end

function IsVehicleClassWhitelisted(vehicleClass)
	for index, value in ipairs(vehicleClassWhitelist) do
		if value == vehicleClass then
			return true
		end
	end

	return false
end
