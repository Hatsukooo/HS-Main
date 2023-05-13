local Vehicles = {
   {label = 'SRT Charger', spawnName = 'heat2'},
   {label = 'Chevrolet', spawnName = 'code3cap'},
   {label = 'Bmw-motorka', spawnName = 'code3bmw'},
   {label = 'Dodge suv', spawnName = 'code3durang'},
   {label = 'Ram', spawnName = 'code3ram'},
   {label = 'Porsche 911 TurboS Spider', spawnName = '992t'},
   {label = 'Ford Crown Victoria 2008', spawnName = 'cvpileg'},
   {label = 'SubUrban Unmarked', spawnName = 'sspres'},
   {label = 'Ford Explorer 2022', spawnName = 'fpiuleg3'},
   {label = 'Ford Taurus', spawnName = 'capleg'},
   {label = 'Dodge Charger 2018', spawnName = 'chargleg4'},
   {label = 'Ford Raptor F150', spawnName = 'umf150'},
   {label = 'Toyota Rav4 Prime XSE', spawnName = 'umrav4'},
   {label = 'Subaru WRX Unmarked', spawnName = 'umwrx'},
   {label = 'Chevrolet Impala', spawnName = 'umimpala'},
   {label = 'Kawasaki Ninja', spawnName = 'nh2r'},
   {label = 'Mercedes G900 2020', spawnName = '2020g900'},
   {label = 'Lamborghini Averntador SVJ', spawnName = 'avent700'},
   {label = 'Koenigsegg Jesko', spawnName = 'jesko'},
   {label = 'Chevrolet Caprice', spawnName = 'capleg'},
   {label = 'Audi RS8', spawnName = 'r820'},
   {label = 'Range Rover', spawnName = 'overdose'},
   {label = 'Lamborghini Huracán Performante', spawnName = '18performante'},
   {label = 'Mercedes G63 6x6', spawnName = 'g63amg6x6'},
   {label = '2021 Porsche 911 Turbo S', spawnName = 'pts21'},
   {label = 'Dodge Ram 2021 TRX [UNM]', spawnName = '21ramtrx'},
   {label = 'EMS Speedo - Sanitka', spawnName = 'emsnspeedo'},
   {label = 'EMS Charger 2018', spawnName = '18charger'},

}

Citizen.CreateThread(function()
    for num,vehicle in ipairs(Vehicles) do
        AddTextEntryByHash(GetHashKey(vehicle.spawnName), vehicle.label)
    end
end)