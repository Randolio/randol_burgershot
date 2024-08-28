if GetResourceState('qbx_core') ~= 'started' then return end

local Config = lib.require('config')

local PlayerData = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = exports.qbx_core:GetPlayerData()
    createJobZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    table.wipe(PlayerData)
    removeJobZones()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

AddEventHandler('onResourceStart', function(res)
    if GetCurrentResourceName() ~= res or not LocalPlayer.state.isLoggedIn then return end
    PlayerData = exports.qbx_core:GetPlayerData()
    createJobZones()
end)

function hasPlyLoaded()
    return LocalPlayer.state.isLoggedIn
end

function DoNotification(text, nType)
    exports.qbx_core:Notify(text, nType)
end

function handleStatus(status, item)
    if status == 'hunger' then
        TriggerServerEvent('consumables:server:addHunger', PlayerData.metadata[status] + Config.HungerFill[item].amt)
    else
        TriggerServerEvent('consumables:server:addThirst', PlayerData.metadata[status] + Config.ThirstFill[item].amt)
    end
end