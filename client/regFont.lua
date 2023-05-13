Citizen.CreateThread(function()
    Citizen.Wait(500)
    RegisterFontFile('RobotoCondensed') -- název soubory gfx bez koncovky gfx
    fontId = RegisterFontId('Roboto Condensed') -- nazev ktery jsme dávali do in.xml
end)
Citizen.CreateThread(function()
    Citizen.Wait(500)
    RegisterFontFile('firasans') -- název soubory gfx bez koncovky gfx
    fontId = RegisterFontId('Fira Sans') -- nazev ktery jsme dávali do in.xml
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
    RegisterFontFile('russoone') -- název soubory gfx bez koncovky gfx
    fontId = RegisterFontId('Russo One') -- nazev ktery jsme dávali do in.xml
end)


