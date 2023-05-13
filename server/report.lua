webhookURL = ''


RegisterCommand("report", function(source, args, rawCommand)
	msg = ""
	local message = ""
	msg = msg .. "" .. GetPlayerName(source) .. " (" .. source .. ")"
	message = message .. ""
	for i = 1, #args do
		message = message .. args[i] .. ' '
	end
	if tonumber(source) ~= nil then
		-- it's a number
		TriggerClientEvent("Reports:CHP:C", -1, msg, false)
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(24, 26, 32, 0.9); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw;background-color: rgb(255, 0, 0); border-radius: 8px; font-size: 15px;"> <b>REPORT</b></font></i> | Report byl úspěšně odeslán! <font style="background-color:rgba(0, 0, 0, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;""></div>',
			args = { toSay }
		})

		local ids = ExtractIdentifiers(source);
		local steam = ids.steam:gsub("steam:", "");
		local steamDec = tostring(tonumber(steam, 16));
		steam = "https://steamcommunity.com/profiles/" .. steamDec;
		local gameLicense = ids.license;
		local discord = ids.discord;
		sendToDisc("NEW REPORT: _[" .. tostring(source) .. "] " .. GetPlayerName(source) .. "_",
			'Reason: **' .. message ..
			'**\n' ..
			'Steam: **' .. steam .. '**\n' ..
			'GameLicense: **' .. gameLicense .. '**\n' ..
			'Discord Tag: **<@' .. discord:gsub('discord:', '') .. '>**\n' ..
			'Discord UID: **' .. discord:gsub('discord:', '') .. '**',
			"Reported by: [" .. source .. "] " .. GetPlayerName(source))
	end
end)



RegisterNetEvent("Reports:CHP")
AddEventHandler("Reports:CHP", function(msg, error)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "management" or xPlayer.getGroup() == "developer" or xPlayer.getGroup() == "headdev" then
		TriggerClientEvent('chat:addMessage', src, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(24, 26, 32, 0.9); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw;background-color: rgb(255, 0, 0); border-radius: 8px; font-size: 15px;"> <b>REPORT</b></font></i>' .. msg .. ' |  <font style="background-color:rgba(0, 0, 0, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;""></div>',
			args = { toSay }
		})
	end
end)

function ExtractIdentifiers(src)
	local identifiers = {
		steam = "",
		ip = "",
		discord = "",
		license = "",
		xbl = "",
		live = ""
	}

	--Loop over all identifiers
	for i = 0, GetNumPlayerIdentifiers(src) - 1 do
		local id = GetPlayerIdentifier(src, i)

		--Convert it to a nice table.
		if string.find(id, "steam") then
			identifiers.steam = id
		elseif string.find(id, "ip") then
			identifiers.ip = id
		elseif string.find(id, "discord") then
			identifiers.discord = id
		elseif string.find(id, "license") then
			identifiers.license = id
		elseif string.find(id, "xbl") then
			identifiers.xbl = id
		elseif string.find(id, "live") then
			identifiers.live = id
		end
	end

	return identifiers
end

function sendToDisc(title, message, footer)
	local embed = {}
	embed = {
		{
			["color"] = 16711680, -- GREEN = 65280 --- RED = 16711680
			["title"] = "**" .. title .. "**",
			["description"] = "" .. message .. "",
			["footer"] = {
				["text"] = footer,
			},
		}
	}
	-- Start
	-- TODO Input Webhook
	PerformHttpRequest(webhookURL,
		function(err, text, headers)
		end, 'POST', json.encode({ username = name, embeds = embed }), { ['Content-Type'] = 'application/json' })
	-- END
end
