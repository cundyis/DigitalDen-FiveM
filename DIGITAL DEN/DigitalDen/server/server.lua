ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("ServerSide:digital")
AddEventHandler("ServerSide:digital", function(Name, Value, Price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

        if xPlayer.getMoney() >= Price then
            xPlayer.removeMoney(Price)
            xPlayer.addInventoryItem(Value, 1)
            xPlayer.showNotification(("Vous venez d'acheter : %s"):format(Name))
        else
            xPlayer.showNotification("Vous n'avez pas assez d'argents")
        end
end)