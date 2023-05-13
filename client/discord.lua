Citizen.CreateThread(function()
	while true do
		SetDiscordAppId() -- Discord ID

		local player = PlayerId()
		local id = GetPlayerServerId(player)
		local players = GetActivePlayers()

		SetRichPresence("Hráči: " .. #players .. "/64 | ID: " .. id)

		SetDiscordRichPresenceAsset("") -- Velký obrázek
		SetDiscordRichPresenceAssetText(".gg/") -- Text na velkém obrázku

		SetDiscordRichPresenceAssetSmall('') -- Malý obrázek
		SetDiscordRichPresenceAssetSmallText(".gg/") -- Text na malém obrázku

		SetDiscordRichPresenceAction(0, "👉|Discord|👉", "https://discord.gg/")
		SetDiscordRichPresenceAction(1, "💻|Fivem Connect|💻", "https://discord.gg/")
		Citizen.Wait(10000)
	end
end)
