local PlayerData, currentHint = {}, ""
local ESX = exports['es_extended']:getSharedObject()
local pauseMenu = false
local invPause = false

local hints = {
    "Doporučujeme zkontrolovat bindy! Pokud přecházíš z jiného serveru je možné, že něco nemusí fungovat.",
    "Přes 'B' zapínáš pásy v autě, takže si je nezapomeň při ukončení jízdy zase sundat přes 'B', jinak nevystoupíš! (Můžeš si je přebindovat!)",
    "Většinu bindů si můžeš přebindovat! Stačí jít do Settings -> Key Binds -> FiveM!",
    "Přes '+' a '-' na numerické klávesnici si můžeš zvyšovat a snižovat omezovač rychlosti!",
    "Většinu předmětů v inventáři použiješ pomocí dvojitého kliknutí levého tlačítka myši.",
    "Narazil jsi na nějaký bug? Prosím vyfoť konzoli F8 a podrobně popiš chybu na našem discordu -> #bugy",
}

CreateThread(function()

    while true do
        local menuState = IsPauseMenuActive()

        if menuState and not pauseMenu then
            whilePauseMenu()
        elseif not menuState and pauseMenu then
            pauseMenu = false
        end
        Wait(500)
    end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    PlayerData = xPlayer.charInfo
end)


function whilePauseMenu()
    if invPause then return end
    pauseMenu = true
    currentHint = hints[math.random(#hints)]

    CreateThread(function()

        ReplaceHudColourWithRgba(117, 25, 28, 37, 255)
        SetScriptVariableHudColour(82, 115, 161)
        while pauseMenu do

            if not invPause then
                BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
                ScaleformMovieMethodAddParamBool(true)
                EndScaleformMovieMethod()

                BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
                ScaleformMovieMethodAddParamTextureNameString(setFont("~v~Cukiho Dev Server!", 30))
                ScaleformMovieMethodAddParamBool(true)
                ScaleformMovieMethodAddParamTextureNameString(setFont(currentHint))
                EndScaleformMovieMethod()
            end
            Wait(0)
        end
    end)
end

CreateThread(function()
    -- Main
    AddFontTextEntry("PM_SCR_MAP", "MAPA")
    AddFontTextEntry("PM_SCR_STA", "STATUS")
    AddFontTextEntry("PM_SCR_GAM", "HRA")
    AddFontTextEntry("PM_SCR_INF", "INFORMACE")
    AddFontTextEntry("PM_SCR_SET", "NASTAVENÍ")
    AddFontTextEntry("PM_SCR_GAL", "GALERIE")
    AddFontTextEntry("PM_SCR_RPL", "R* EDITOR")

    -- Game
    AddFontTextEntry("PM_PANE_LEAVE", "ODPOJIT")
    AddFontTextEntry("PM_PANE_QUIT", "VYPNOUT HRU")
    -- Stats
    AddFontTextEntry("MP_STATS1", "Career")
    AddFontTextEntry("MP_STATS2", "Skills")
    AddFontTextEntry("MP_STATS3", "General")
    AddFontTextEntry("MP_STATS4", "Crimes")
    AddFontTextEntry("MP_STATS5", "Vehicles")
    AddFontTextEntry("MP_STATS6", "Cash")
    AddFontTextEntry("MP_STATS7", "Combat")
    AddFontTextEntry("PM_AWARDS", "Awards")
    AddFontTextEntry("PM_INF_UNLT", "Unlocks")
    AddFontTextEntry("PM_WEAPONS", "Weapons")
    -- Info
    AddFontTextEntry("PM_PANE_FEE", "Notifications")
    AddFontTextEntry("PM_PANE_HLP", "Help")
    AddFontTextEntry("PM_PANE_BRI", "Dialogue")
    AddFontTextEntry("PM_PANE_MIS", "Mission")

    -- Settings
    AddFontTextEntry("0x92320117", "Gamepad")
    AddFontTextEntry("PM_PANE_AUD", "Audio")
    AddFontTextEntry("PM_PANE_CAM", "Camera")
    AddFontTextEntry("PM_PANE_DIS", "Display")
    AddFontTextEntry("MO_VOUT", "Voice Chat")
    AddFontTextEntry("0xE782A771", "Rockstar Editor")
    AddFontTextEntry("0xFBB6E685", "Advanced Graphics")
    AddFontTextEntry("0xD3A0C438", "Graphics")
    AddFontTextEntry("0x82FBED04", "Key Bindings")
    AddFontTextEntry("0x0A0C22D4", "Keyboard / Mouse")
    AddFontTextEntry("GFX_VIDMEM", "Video Memory")
    AddFontTextEntry("0x51B058B3", "Output Monitor")
    AddFontTextEntry("0xA28A6F51", "FXAA")
    AddFontTextEntry("0x38111CA3", "MSAA")
    AddFontTextEntry("0xFB0E70C2", "V-Sync")
    AddFontTextEntry("0xC4FD3301", "Pause Game On Focus Loss")
    AddFontTextEntry("GFX_SCALING", "Render Resolution")
    AddFontTextEntry("GFX_BUDGET", "Extended Texture Budget")
    AddFontTextEntry("0x74F73ED3", "Shadow Quality")
    AddFontTextEntry("0x78F76ACC", "Texture Quality")
    AddFontTextEntry("0x11739C25", "Shader Quality")
    AddFontTextEntry("0xC43D3B9F", "Water Quality")
    AddFontTextEntry("0x544B440F", "Particles Quality")
    AddFontTextEntry("0x5CD4E15C", "Grass Quality")
    AddFontTextEntry("0xCD676AF6", "Reflection Quality")
    AddFontTextEntry("0x67117E6F", "Ignore Suggested Limits")
    AddFontTextEntry("0x87D30231", "DirectX Version")
    AddFontTextEntry("0xD627A8D5", "Population Density")
    AddFontTextEntry("0x74EFCDDE", "Population Variety")
    AddFontTextEntry("0xF84B169F", "Distance Scaling")
    AddFontTextEntry("0x30860474", "Reflection MSAA")
    AddFontTextEntry("0x73C258A0", "Soft Shadows")
    AddFontTextEntry("0x367DB5EF", "Post FX")
    AddFontTextEntry("0x1752894A", "Motion Blur Strength")
    AddFontTextEntry("MO_DOF", "In-Game Depth Of Field Effects")
    AddFontTextEntry("0x19C1AD65", "Anisotropic Filtering")
    AddFontTextEntry("0xE0306CDD", "Ambient Occlusion")
    AddFontTextEntry("0x0F986BB4", "Tessellation")
    AddFontTextEntry("MO_RDF", "Restore Defaults")
    AddFontTextEntry("MO_GFX_NORM", "Normal")
    AddFontTextEntry("MO_CS_HIGH", "High")
    AddFontTextEntry("MO_GFX_VHIGH", "Very High")
    AddFontTextEntry("MO_GFX_ULTRA", "Ultra")
    AddFontTextEntry("MO_GFX_X2", "X2")
    AddFontTextEntry("MO_GFX_X4", "X4")
    AddFontTextEntry("MO_GFX_X8", "X8")
    AddFontTextEntry("MO_GFX_X16", "X16")
    AddFontTextEntry("MO_OFF", "Off")
    AddFontTextEntry("MO_ON", "On")
    AddFontTextEntry("GFX_SHARP", "Sharp")
    AddFontTextEntry("GFX_SOFT", "Soft")
    AddFontTextEntry("GFX_SOFTER", "Softer")
    AddFontTextEntry("GFX_SOFTEST", "Softest")
    AddFontTextEntry("0xF390EF41", "AMD CHS")
    AddFontTextEntry("GFX_NVIDIA", "NVIDIA PCSS")

    -- MAP Locations
    AddFontTextEntry("SANCHIA", "San Chianski Mountain Range")
    AddFontTextEntry("OCEANA", "Pacific Ocean")
end)

function AddFontTextEntry(entry, text)
    AddTextEntry(entry, setFont(text, 10))
end

function setFont(text, size)
    if not size then
        return "<font face='Rubik'> " .. text .. " </font>"
    else
        return '<font face="Rubik" size="'.. size ..'">' .. text .. ' </font>'
    end
end