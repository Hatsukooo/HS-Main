ESX = exports["es_extended"]:getSharedObject()

zamknut = false
spoutan = false

local GetPlayerFromEntity = function(target)
    if not IsPedAPlayer(target) then return end
    local player = NetworkGetPlayerIndexFromPed(target)
    if not player or player == -1 then return end
    return player
end
Citizen.CreateThread(function()
    -- exports['qtarget']:Player({
    --     options = {
    --         {
    --             icon = "fas fa-search",
    --             label = "Prohledat",
    --             action = function(target)
    --                 if spoutan then
    --                     ExecuteCommand('me Prohledává osobu')

    --                     ExecuteCommand('doc 2')
    --                     exports.ox_inventory:openNearbyInventory()
    --                 else
    --                     exports['okokNotify']:Alert("Interakce", "Hráč není spoután", 5000, 'error')
    --                 end
    --             end
    --         },
    --         {
    --             icon = "fas fa-people-carry",
    --             label = "Na Ramena",
    --             action = function(target)
    --                 ExecuteCommand('carry')
    --             end
    --         },
    --         {
    --             icon = "fas fa-hands-bound",
    --             label = "Spoutat/Odpoutat",
    --             event = "target:Spoutat"
    --         },
    --         {
    --             icon = "fas fa-car-side",
    --             label = "Dát do vozidla",
    --             action = function(target)
    --                 if spoutan then
    --                     ExecuteCommand('me Dává osobu do vozidla')

    --                     TriggerServerEvent('qs_legaljobs:putInVehicle', GetPlayerFromEntity)

    --
    --                 else
    --                     exports['okokNotify']:Alert("Interakce", "Hráč není spoután", 5000,
    --                         'error')
    --                 end
    --             end
    --         }
    --     },
    --     distance = 1.5
    -- })
    local optveh = {
        {
            name = 'ox:1',
            event = 'target:zamek',
            icon = 'fa-solid fa-car',
            label = 'Zamknout vozidlo',
            canInteract = function()
                return not zamknut
            end
        },
        {
            name = 'ox:2',
            event = 'target:ImpoundCar',
            icon = 'fa-solid fa-car',
            label = 'Odtáhnout Vozidlo',
            canInteract = function()
                return not zamknut
            end
        },
        {
            name = 'ox:3',
            event = 'target:zauta',
            icon = 'fa-solid fa-car',
            label = 'Vyndat z vozidla',
            canInteract = function()
                return not zamknut
            end
        },
        {
            name = 'ox:1',
            event = 'target:zamek',
            icon = 'fa-solid fa-car',
            label = 'Odemknout vozidlo',
            canInteract = function()
                return zamknut
            end
        },
    }

    local optnpc = {
        {
            name = 'ox:1',
            event = 'target:prodatnpc',
            icon = 'fa-solid fa-pills',
            label = 'Prodat drogy!',
        },
        {
            name = 'ox:2',
            event = 'target:okrastNPC',
            icon = 'fa-solid fa-gun',
            label = 'Okrást NPC (Musíte mít Zbraň)',
        },
    }

    local opt = {
        {
            name = 'ox:1',
            event = 'target:odpoutat',
            icon = 'fa-solid fa-user-lock',
            label = 'Odpoutat osobu',
            canInteract = function()
                return spoutan
            end
        },
        {
            name = 'ox:2',
            event = 'target:prohledat',
            icon = 'fas fa-user-magnifying-glass',
            label = 'Prohledat osobu',
            canInteract = function()
                return spoutan
            end
        },
        {
            name = 'ox:3',
            event = 'target:doauta',
            icon = 'fas fa-car-side',
            label = 'Dát do vozidla',
            canInteract = function()
                return spoutan
            end
        },
        {
            name = 'ox:4',
            event = 'target:spoutat',
            icon = 'fa-solid fa-user-lock',
            label = 'Spoutat osobu',
            canInteract = function()
                return not spoutan
            end
        },
        {
            name = 'ox:5',
            event = 'target:carry',
            icon = 'fa-solid fa-user',
            label = 'Vzít osobu',
        },
    }

    exports.ox_target:addGlobalPlayer(opt)

    -- exports.ox_target:addGlobalPed(optnpc)

    exports.ox_target:addGlobalVehicle(optveh)
end)
spoutan = false
AddEventHandler("target:spoutat", function(target)
    ESX.TriggerServerCallback('qs_ambjob:getItemAmount', function(quantity)
        if quantity == 1 then
            spoutan = true
            ExecuteCommand('me Bere zipties a poutá osobu')

            ExecuteCommand('doc 3')

            TriggerServerEvent('qs_legaljobs:handcuff', GetPlayerFromEntity)
        else
            exports['okokNotify']:Alert("Interakce", "Nemáš zipties aby jsi mohl spoutat hráče",
                5000,
                'error')
        end
    end, 'zipties')
end)

AddEventHandler("target:odpoutat", function(target)
    ESX.TriggerServerCallback('qs_ambjob:getItemAmount', function(quantity)
        if quantity == 1 then
            spoutan = false
            ExecuteCommand('me Bere kleště a sundává zipties')

            ExecuteCommand('doc 3')

            TriggerServerEvent('qs_legaljobs:handcuff', GetPlayerFromEntity)
        else
            exports['okokNotify']:Alert("Interakce", "Nemáš kleště aby jsi mohl sundat hráči zipties",
                5000,
                'error')
        end
    end, 'kleste')
end)

AddEventHandler("target:ImpoundCar", function()
    if ESX.PlayerData.job.name == 'lsc' or ESX.PlayerData.job.name == 'bennys' or ESX.PlayerData.job.name == 'riders' or ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'sheriff' or ESX.PlayerData.job.name == 'fbi' then
        local vehicle = ESX.Game.GetVehicleInDirection()
        if not vehicle then return end
        local timeout = 2000
        NetworkRequestControlOfEntity(vehicle)
        while timeout > 0 and not NetworkHasControlOfEntity(vehicle) do
            Citizen.Wait(100)
            timeout = timeout - 100
        end
        TaskStartScenarioInPlace(ESX.PlayerData.ped, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
        exports['okokNotify']:Alert("Interakce", "Odtahuješ vozidlo", 5000, 'info')
        ExecuteCommand('me Volá odtahovou službu')
        Wait(1200)
        ExecuteCommand('do Odtahová služba přijíždí a odtahuje vozidlo')
        lib.progressCircle({
            duration = 10000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
        })
        ClearPedTasksImmediately(ESX.PlayerData.ped)
        ESX.Game.DeleteVehicle(vehicle)
        exports['okokNotify']:Alert("Interakce", "Vozidlo bylo úspěšně odtaženo", 5000, 'success')
    else
        exports['okokNotify']:Alert("Interakce",
            "Nemůžete odtahnout vozidlo, nepracujete ve firmě která by vlastnila Odtahovou Službu", 5000, 'error')
    end
end)

local useCarlockSound = true

zamknut = false
AddEventHandler('target:zamek', function()
    local dict = "anim@mp_player_intmenu@key_fob@"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local hasAlreadyLocked = false
    cars = ESX.Game.GetVehiclesInArea(coords, 30)
    local carstrie = {}
    local cars_dist = {}
    notowned = 0
    if #cars == 0 then
        exports['okokNotify']:Alert("Interakce", "Žádné vozidlo v okolí", 5000, 'error')
    else
        for j = 1, #cars, 1 do
            local coordscar = GetEntityCoords(cars[j])
            local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
            table.insert(cars_dist, { cars[j], distance })
        end
        for k = 1, #cars_dist, 1 do
            local z = -1
            local distance, car = 999
            for l = 1, #cars_dist, 1 do
                if cars_dist[l][2] < distance then
                    distance = cars_dist[l][2]
                    car = cars_dist[l][1]
                    z = l
                end
            end
            if z ~= -1 then
                table.remove(cars_dist, z)
                table.insert(carstrie, car)
            end
        end
        for i = 1, #carstrie, 1 do
            local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
            ESX.TriggerServerCallback('QS_CarLock:isVehicleOwner', function(owner)
                if owner and hasAlreadyLocked ~= true then
                    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
                    vehicleLabel = GetLabelText(vehicleLabel)
                    local lock = GetVehicleDoorLockStatus(carstrie[i])
                    if lock == 1 or lock == 0 then
                        zamknut = true
                        SetVehicleDoorShut(carstrie[i], 0, false)
                        SetVehicleDoorShut(carstrie[i], 1, false)
                        SetVehicleDoorShut(carstrie[i], 2, false)
                        SetVehicleDoorShut(carstrie[i], 3, false)
                        SetVehicleDoorsLocked(carstrie[i], 2)
                        PlayVehicleDoorCloseSound(carstrie[i], 1)
                        exports['okokNotify']:Alert("Interakce", "Uzamkl jsi vozidlo - " .. plate, 5000, 'success')
                        if not IsPedInAnyVehicle(PlayerPedId(), true) then
                            TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false,
                                false)
                        end
                        if useCarlockSound == true then
                            TriggerServerEvent("InteractSound_SV:PlayOnSource", "DejnZamek", 0.2)
                        end
                        SetVehicleLights(carstrie[i], 2)
                        Citizen.Wait(150)
                        SetVehicleLights(carstrie[i], 0)
                        Citizen.Wait(150)
                        SetVehicleLights(carstrie[i], 2)
                        Citizen.Wait(150)
                        SetVehicleLights(carstrie[i], 0)
                        hasAlreadyLocked = true
                    elseif lock == 2 then
                        zamknut = false
                        SetVehicleDoorsLocked(carstrie[i], 1)
                        PlayVehicleDoorOpenSound(carstrie[i], 0)
                        exports['okokNotify']:Alert("Interakce", "Odemkl jsi vozidlo - " .. plate, 5000, 'success')
                        if not IsPedInAnyVehicle(PlayerPedId(), true) then
                            TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false,
                                false)
                        end
                        if useCarlockSound == true then
                            TriggerServerEvent("InteractSound_SV:PlayOnSource", "DejnOdemknout", 0.2)
                        end
                        SetVehicleLights(carstrie[i], 2)
                        Citizen.Wait(150)
                        SetVehicleLights(carstrie[i], 0)
                        Citizen.Wait(150)
                        SetVehicleLights(carstrie[i], 2)
                        Citizen.Wait(150)
                        SetVehicleLights(carstrie[i], 0)
                        hasAlreadyLocked = true
                    end
                else
                    notowned = notowned + 1
                end
                if notowned == #carstrie then
                    exports['okokNotify']:Alert("Interakce", "Toto vozidlo ti nepatří!", 5000, 'error')
                end
            end, plate)
        end
    end
end)


AddEventHandler("target:doauta", function(target)
    ExecuteCommand('me Dává osobu do vozidla')

    TriggerServerEvent('qs_legaljobs:putInVehicle', GetPlayerFromEntity)
end)

AddEventHandler("target:zauta", function(target)
    if spoutan then
        ExecuteCommand('me Vytahuje osobu')

        TriggerServerEvent('qs_legaljobs:OutVehicle', GetPlayerFromEntity)
    else
        exports['okokNotify']:Alert("Interakce", "Žádný hráč ve vozidle není spoután", 5000,
            'error')
    end
end)

AddEventHandler("target:carry", function()
    ExecuteCommand("carry")
    exports['okokNotify']:Alert("Interakce", "Pokuď budeš brát osobu přes interakce, osoba se za 20 sekund pustí na zem",
        5000,
        'warning')
    Wait(20000)
    ExecuteCommand("carry")
end)

AddEventHandler("target:prohledat", function()
    ExecuteCommand('me Prohmatává osobě kapsy')

    ExecuteCommand('doc 3')

    lib.progressCircle({
        duration = 3000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
    })
    Wait(2)
    exports.ox_inventory:openNearbyInventory()
end)
