local actionkey = 21 --Lshift (or whatever your sprint key is bound to)
local allowshuffle = false
local playerped = nil
local currentvehicle = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        playerped = PlayerPedId()
        currentvehicle = GetVehiclePedIsIn(playerped, false)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if IsPedInAnyVehicle(playerped, false) and allowshuffle == false then
            SetPedConfigFlag(playerped, 184, true)
            if GetIsTaskActive(playerped, 165) then
                seat = 0
                if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
                    seat = -1
                end
                SetPedIntoVehicle(playerped, currentvehicle, seat)
            end
        elseif IsPedInAnyVehicle(playerped, false) and allowshuffle == true then
            SetPedConfigFlag(playerped, 184, false)
        end
    end
end)


RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
    if IsPedInAnyVehicle(playerped, false) then
        seat = 0
        if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
            seat = -1
        end
        if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
            TaskShuffleToNextVehicleSeat(playerped, currentvehicle)
        end
        allowshuffle = true
        while GetPedInVehicleSeat(currentvehicle, seat) == playerped do
            Citizen.Wait(0)
        end
        allowshuffle = false
    else
        allowshuffle = false
        CancelEvent('SeatShuffle')
    end
end)

if Config.EnableShuff then
    RegisterCommand("shuff", function(source, args, raw) --change command here
        TriggerEvent("SeatShuffle")
    end, false)
end

if not Config.EnableShuff then
    print("Shuff feature disabled")
end