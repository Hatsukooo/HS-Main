DensityMultiplier = 0.2
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
        SetPedDensityMultiplierThisFrame(DensityMultiplier)
        SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
        SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
        SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
    end
end)
