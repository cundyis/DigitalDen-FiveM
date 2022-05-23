ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local pos = {{x = -656.67, y = -857.37, z = 24.49}}



function DigitalDen()
    local main = RageUI.CreateMenu("DigitalDen", "DigitalDen")
    RageUI.Visible(main, true)
    while main do
        Citizen.Wait(0)
        RageUI.IsVisible(main, function()
            for k, v in pairs(Config.DigitalDen) do
                RageUI.Button(v.Name, nil, {RightLabel = ("~g~%s$"):format(v.Price)}, true,{
                    onSelected = function()
                        TriggerServerEvent("ServerSide:digital", v.Value, v.Price)
                    end
                })
            end
        end)
        if not RageUI.Visible(main) then
            main = RMenu:DeleteType("main", true)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k in pairs(pos) do

                local coords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(coords.x, coords.y, coords.z, pos[k].x, pos[k].y, pos[k].z)
                if dist <= 5.0 then
                    wait = 0
                    DrawMarker(6, -656.67, -857.37, 23.49, 0.0, 0.0, 0.0, -90.0,0.0,0.0, 1.1, 1.5, 1.1, 133, 0, 169 , 50, false, false, p19, false)
                    if dist <= 1.0 then
                        wait = 0
                        ESX.ShowHelpNotification("Appuyez sur [~o~E~s~] pour accéder au ~p~Shop")
                        if IsControlJustPressed(1,51) then
					        DigitalDen()
                        end
                    end
                end
            end
        Citizen.Wait(wait)
        end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_solomon")
    
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_solomon", -656.77, -858.75, 23.454, 4.46, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)
