if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()
local Config = lib.require('config')

function GetPlayer(id)
    return ESX.GetPlayerFromId(id)
end

function DoNotification(src, text, nType)
    TriggerClientEvent('esx:showNotification', src, text, nType)
end

function GetPlyIdentifier(xPlayer)
    return xPlayer.identifier
end

function GetCharacterName(xPlayer)
    return xPlayer.getName()
end

function itemCount(xPlayer, item, amount)
    local count = exports.ox_inventory:GetItemCount(xPlayer.source, item)
    return count >= amount
end

function AddItem(xPlayer, item, amount)
    exports.ox_inventory:AddItem(xPlayer.source, item, amount)
end

function RemoveItem(xPlayer, item, amount)
    exports.ox_inventory:RemoveItem(xPlayer.source, item, amount)
end

function RemoveItemFromSlot(xPlayer, item, amount, slot)
    exports.ox_inventory:RemoveItem(xPlayer.source, item, amount, nil, slot)
end

function isBurgerShot(xPlayer)
    return xPlayer.job.name == 'burgershot'
end

for i = 1, #Config.Zones do
    local v = Config.Zones[i]
    if v.type == 'stash' then
        exports.ox_inventory:RegisterStash(v.stashLabel, v.stashLabel, v.slots, v.weight, false)
    elseif v.type == 'shop' then
        exports.ox_inventory:RegisterShop('Ingredients - Burgershot', {
            name = 'Ingredients - Burgershot',
            inventory = {
                { name = 'burger-bun', price = 0 },
                { name = 'burger-raw', price = 0 },
                { name = 'burger-lettuce', price = 0 },
                { name = 'burger-tomato', price = 0 },
                { name = 'burger-potato', price = 0 },
                { name = 'burger-mshakeformula', price = 0 },
                { name = 'burger-sodasyrup', price = 0 },
            },
        })
    end
end

for k,v in pairs(Config.HungerFill) do
    exports(k, function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            TriggerClientEvent('randol_burgershot:client:Eat', inventory.id, k, slot, v.emote)
        end
    end)
end

for k,v in pairs(Config.ThirstFill) do
    exports(k, function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            TriggerClientEvent('randol_burgershot:client:Drink', inventory.id, k, slot, v.emote)
        end
    end)
end