if Config.EnableIDCommand then
    RegisterCommand('id', function(source, args)
      _source = source
      TriggerClientEvent('chat:addMessage', _source, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.5); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(122, 139, 239); border-radius: 8px; font-size: 15px;"> <b>ID</b></font>   <font style="background-color:rgba(0, 0, 0, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> Tvoje ID je: '
            .. _source .. '</font></div>',
        args = { title, message }
      })
    end, false)
end

if not Config.EnableIDCommand then
    print("ID command feature disabled")
end