local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

CreateThread(function()
    BurgerShot = AddBlipForCoord(-1197.32, -897.655, 13.995)
    SetBlipSprite (BurgerShot, 106)
    SetBlipDisplay(BurgerShot, 4)
    SetBlipScale  (BurgerShot, 0.5)
    SetBlipAsShortRange(BurgerShot, true)
    SetBlipColour(BurgerShot, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("BurgerShot")
    EndTextCommandSetBlipName(BurgerShot)
end) 

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        BurgerZones()
    end
end)

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.Zones) do
            exports['qb-target']:RemoveZone("burgershot"..k)
        end
	end 
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    BurgerZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:RemoveZone("burgershot"..k)
    end
end)


function BurgerZones()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:AddCircleZone("burgershot"..k, v.coords, v.radius, {
            name = "burgershot"..k,
            debugPoly = false,
            useZ=true,
        }, {
            options = {
                {
                    type = "client",
                    event = v.event,
                    icon = v.icon,
                    label = v.label,
                    job = v.job,
                },
            },
            distance = 1.5
        })
    end
end
    
RegisterNetEvent("randol_burgershot:client:frontTray", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsfoodtray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsfoodtray", {
        maxweight = 30000,
        slots = 12,
    })
end)

RegisterNetEvent("randol_burgershot:client:frontTray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsfoodtray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsfoodtray2", {
        maxweight = 30000,
        slots = 12,
    })
end)

RegisterNetEvent("randol_burgershot:client:passThrough", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsBigTray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsBigTray", {
        maxweight = 300000,
        slots = 15,
    })
end)

RegisterNetEvent("randol_burgershot:client:jobFridge", function()
    TriggerEvent("inventory:client:SetCurrentStash", "bsFridge")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bsFridge", {
        maxweight = 3000000,
        slots = 30,
    })
end)

RegisterNetEvent("randol_burgershot:client:ingredientStore", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.Items)
end)

RegisterNetEvent('randol_burgershot:clientToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("randol_burgershot:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", 
                type = "text", 
                isRequired = true --
            },
            {
                text = "   Bill Price ($)",
                name = "billprice", 
                type = "number",
                isRequired = false
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("randol_burgershot:server:billPlayer", bill.citizenid, bill.billprice)
    end
end)
