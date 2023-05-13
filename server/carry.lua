local carrying = {}

local carried = {}

RegisterServerEvent("CarryPeople:sync")
AddEventHandler("CarryPeople:sync", function(targetSrc)
	local source = source
	local sourcePed = GetPlayerPed(source)
   	local sourceCoords = GetEntityCoords(sourcePed)
	local targetPed = GetPlayerPed(targetSrc)
        local targetCoords = GetEntityCoords(targetPed)
	if #(sourceCoords - targetCoords) <= 3.0 then 
		TriggerClientEvent("CarryPeople:syncTarget", targetSrc, source)
		carrying[source] = targetSrc
		carried[targetSrc] = source
	end
end)

RegisterServerEvent("CarryPeople:stop")
AddEventHandler("CarryPeople:stop", function(targetSrc)
	local source = source

	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", targetSrc)
		carrying[source] = nil
		carried[targetSrc] = nil
	elseif carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])			
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)

AddEventHandler('playerDropped', function(reason)
	local source = source
	
	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carrying[source])
		carried[carrying[source]] = nil
		carrying[source] = nil
	end

	if carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)
 

local safezones = {}


function AddSafezone(name, x, y, z, radius)
    table.insert(safezones, {name = name, x = x, y = y, z = z, radius = radius})
end


function IsPlayerInSafezone(playerId)
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)

    for i, safezone in ipairs(safezones) do
        local dist = Vdist(playerPos.x, playerPos.y, playerPos.z, safezone.x, safezone.y, safezone.z)

        if dist <= safezone.radius then
            return true, safezone.name
        end
    end

    return false, ""
end


exports('AddSafezone', AddSafezone)
exports('IsPlayerInSafezone', IsPlayerInSafezone)