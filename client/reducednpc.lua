if Config.EnableReduceNPC then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetVehicleDensityMultiplierThisFrame(0.6)
            SetPedDensityMultiplierThisFrame(0.6)
            SetRandomVehicleDensityMultiplierThisFrame(0.6)
            SetParkedVehicleDensityMultiplierThisFrame(0.6)
            SetScenarioPedDensityMultiplierThisFrame(0.6, 0.6)
        end
    end)
end

if not Config.EnableReduceNPC then
    print("NPC reduce feature is disabled")
end