if Config.EnableDiscordRP then
Citizen.CreateThread(function()
	while true do
		SetDiscordAppId() -- Discord ID

		local player = PlayerId()
		local id = GetPlayerServerId(player)
		local players = GetActivePlayers()

		SetRichPresence("Hráči: " .. #players .. "/64 | ID: " .. id)

		SetDiscordRichPresenceAsset("") -- Big Picture
		SetDiscordRichPresenceAssetText(".gg/") -- Text on Big Picture

		SetDiscordRichPresenceAssetSmall('') -- Small Picture
		SetDiscordRichPresenceAssetSmallText(".gg/") -- Text on small picture

		SetDiscordRichPresenceAction(0, "Button 1", "https://discord.gg/")
		SetDiscordRichPresenceAction(1, "Button 2", "https://discord.gg/")
		Citizen.Wait(10000)
	end
end)
end

if not Config.EnableDiscordRP then
    print("DiscordRP feature disabled")
end