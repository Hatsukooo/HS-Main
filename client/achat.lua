ESX = exports["es_extended"]:getSharedObject()

local UserGroup
local group


RegisterNetEvent('reply:setGroup')
AddEventHandler('reply:setGroup', function(g)
    print('group setted ' .. g)
    group = g
end)

-- ADMIN CHAT
RegisterNetEvent('sendMessageAdmin')
AddEventHandler('sendMessageAdmin', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)

    ESX.TriggerServerCallback('esx_chatforadmin:GetGroup', function(Group)
        UserGroup = Group
        if adminchat then
            TriggerEvent('chat:addMessage', {
                template =
                    '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.9); border-radius: 3px; border-right: 0px solid rgb(209, 0, 167);"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #25aa3b; border-radius: 5px; font-size: 15px;"> <b><i class="fas fa-shield-alt"></i>Admin Team</b></font>   <font style="background-color:rgba(0, 0, 0, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>'
                    ..
                    name ..
                    ' |</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '
                    .. message .. '</font></div>',
                args = { name, message }
            })
        elseif UserGroup ~= 'user' and pid ~= myId then
            TriggerEvent('chat:addMessage', {
                template =
                    '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.9); border-radius: 3px; border-right: 0px solid rgb(209, 0, 167);"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #25aa3b; border-radius: 5px; font-size: 15px;"> <b><i class="fas fa-shield-alt"></i>Admin Team</b></font>   <font style="background-color:rgba(0, 0, 0, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>'
                    ..
                    name ..
                    ' |</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '
                    .. message .. '</font></div>',
                args = { name, message }
            })
            TriggerServerEvent('toDiscord', '```\n[' .. id .. ' | ' .. name .. ']\n[Message] ' .. message .. '```\n',
                Config.Hook)
        end
    end)
end)


RegisterNetEvent("textmsg")
AddEventHandler('textmsg', function(source, textmsg, names2, names3)
    TriggerEvent('chatMessage', "", { 205, 205, 0 }, "  A-TEAM " .. names3 .. "  " .. "^0: " .. textmsg)
end)