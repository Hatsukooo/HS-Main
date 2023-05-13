Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		if IsPedArmed(PlayerPedId(), 4 | 2) and IsControlPressed(0, 25) or IsPedArmed(PlayerPedId(), 4 | 2) and IsControlPressed(0, 24) then
		else
			ShakeGameplayCam("DRUNK_SHAKE", 0.4)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
	end
end)
