if Config.EnablePauseMenu then
    local pauseMenu = false

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

    function whilePauseMenu()
        pauseMenu = true
        CreateThread(function()
            while pauseMenu do
                    BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
                    ScaleformMovieMethodAddParamBool(true)
                    EndScaleformMovieMethod()
                    BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
                    ScaleformMovieMethodAddParamTextureNameString(setFont("~r~Server Name!", 30))
                    ScaleformMovieMethodAddParamBool(true)
                    ScaleformMovieMethodAddParamTextureNameString(setFont("Description of your server"))
                    EndScaleformMovieMethod()
                Wait(0)
            end
        end)
    end

    CreateThread(function()
        AddFontTextEntry("PM_SCR_MAP", "MAP")
        AddFontTextEntry("PM_SCR_STA", "STATUS")
        AddFontTextEntry("PM_SCR_GAM", "GAME")
        AddFontTextEntry("PM_SCR_INF", "INFO")
        AddFontTextEntry("PM_SCR_SET", "SETTINGS")
        AddFontTextEntry("PM_SCR_GAL", "GALLERY")
        AddFontTextEntry("PM_SCR_RPL", "R* EDITOR")
        AddFontTextEntry("PM_PANE_LEAVE", "LEAVE")
        AddFontTextEntry("PM_PANE_QUIT", "ALT + F4")
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
        AddFontTextEntry("PM_PANE_FEE", "Notifications")
        AddFontTextEntry("PM_PANE_HLP", "Help")
        AddFontTextEntry("PM_PANE_BRI", "Dialogue")
        AddFontTextEntry("PM_PANE_MIS", "Mission")
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
        AddFontTextEntry("SANCHIA", "San Chianski Mountain Range")
        AddFontTextEntry("OCEANA", "Pacific Ocean")
    end)

    function AddFontTextEntry(entry, text)
        AddTextEntry(entry, setFont(text, 10))
    end

    function setFont(text, size)
        if not size then
            return "<font face='Fire Sans'> " .. text .. " </font>"
        else
            return '<font face="Fire Sans" size="'.. size ..'">' .. text .. ' </font>'
        end
    end
end

if not Config.EnablePauseMenu then
    print("PauseMenu feature disabled")
end