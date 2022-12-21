local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('randol_burgershot:server:makeBleeder', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-lettuce", 1)
    Player.Functions.RemoveItem("burger-raw", 1)
    Player.Functions.RemoveItem("burger-bun", 1)
    Player.Functions.RemoveItem("burger-tomato", 1)
    Player.Functions.AddItem("burger-bleeder", 3)
end)

RegisterNetEvent('randol_burgershot:server:makeMoneyshot', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-lettuce", 1)
    Player.Functions.RemoveItem("burger-raw", 1)
    Player.Functions.RemoveItem("burger-bun", 1)
    Player.Functions.RemoveItem("burger-tomato", 1)
    Player.Functions.AddItem("burger-moneyshot", 3)
end)

RegisterNetEvent('randol_burgershot:server:makeTorpedo', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-raw", 1)
    Player.Functions.RemoveItem("burger-bun", 1)
    Player.Functions.AddItem("burger-torpedo", 3)
end)

RegisterNetEvent('randol_burgershot:server:makeHeartstopper', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-lettuce", 1)
    Player.Functions.RemoveItem("burger-raw", 1)
    Player.Functions.RemoveItem("burger-bun", 1)
    Player.Functions.RemoveItem("burger-tomato", 1)
    Player.Functions.AddItem("burger-heartstopper", 3)
end)

RegisterNetEvent('randol_burgershot:server:makeMeatfree', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-lettuce", 1)
    Player.Functions.RemoveItem("burger-bun", 1)
    Player.Functions.RemoveItem("burger-tomato", 1)
    Player.Functions.AddItem("burger-meatfree", 3)
end)

RegisterNetEvent('randol_burgershot:server:makeFries', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-potato", 2)
    Player.Functions.AddItem("burger-fries", 4)
end)

RegisterNetEvent('randol_burgershot:server:makeSoda', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-sodasyrup", 1)
    Player.Functions.AddItem("burger-softdrink", 1)
end)

RegisterNetEvent('randol_burgershot:server:makeShake', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("burger-mshakeformula", 1)
    Player.Functions.AddItem("burger-mshake", 1)
end)

QBCore.Functions.CreateUseableItem("burger-softdrink", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-mshake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-bleeder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-moneyshot", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-torpedo", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-heartstopper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-meatfree", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-fries", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("randol_burgershot:client:Eat", source, item.name)
    end
end)

RegisterNetEvent("randol_burgershot:server:billPlayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'burgershot' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                billed.Functions.RemoveMoney('bank', amount)
                TriggerClientEvent('QBCore:Notify', source, 'You charged a customer.', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You have been charged $'..amount..' for your order at Burgershot.')
                exports['qb-management']:AddMoney('burgershot', amount)
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must be a valid amount above 0.', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You cannot bill yourself.', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player not online', 'error')
        end
    end
end)
