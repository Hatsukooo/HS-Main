if Config.EnableRemoveCopsAI then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local d = GetEntityCoords(GetPlayerPed(-1))
            ClearAreaOfCops(d.x, d.y, d.z, 400.0)
        end
    end)
end

if not Config.EnableRemoveCopsAI then
    print("Remove Cops Ai feature disabled")
end