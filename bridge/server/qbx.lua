if GetResourceState('qbx_core') ~= 'started' then return end

local Config = lib.require('config')

function GetPlayer(id)
    return exports.qbx_core:GetPlayer(id)
end

function DoNotification(src, text, nType)
    exports.qbx_core:Notify(src, text, nType)
end

function GetPlyIdentifier(Player)
    return Player.PlayerData.citizenid
end

function GetCharacterName(Player)
    return Player.PlayerData.charinfo.firstname.. ' ' ..Player.PlayerData.charinfo.lastname
end

function itemCount(Player, item, amount)
    return exports.ox_inventory:GetItemCount(Player.PlayerData.source, item) >= amount
end

function AddItem(Player, item, amount)
    exports.ox_inventory:AddItem(Player.PlayerData.source, item, amount)
end

function RemoveItem(Player, item, amount)
    exports.ox_inventory:RemoveItem(Player.PlayerData.source, item, amount)
end

function RemoveItemFromSlot(Player, item, amount, slot)
    exports.ox_inventory:RemoveItem(Player.PlayerData.source, item, amount, nil, slot)
end

function isBurgerShot(Player)
    return Player.PlayerData.job.name == 'burgershot'
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