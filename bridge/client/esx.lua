if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()
local Config = lib.require('config')

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    ESX.PlayerLoaded = true
    createJobZones()
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    table.wipe(PlayerData)
    removeJobZones()
    ESX.PlayerLoaded = false
end)

AddEventHandler('onResourceStart', function(res)
    if GetCurrentResourceName() ~= res or not ESX.PlayerLoaded then return end

    PlayerData = ESX.PlayerData
    createJobZones()
end)

AddEventHandler('esx:setPlayerData', function(key, value)
	PlayerData[key] = value
end)

function hasPlyLoaded()
    return ESX.PlayerLoaded
end

function DoNotification(text, nType)
    ESX.ShowNotification(text, nType)
end

function handleStatus(status, item)
    local statusVal = status == 'thirst' and Config.ThirstFill[item].amt or Config.HungerFill[item].amt
    local newVal = statusVal * 10000 -- is that how it works? fuck knows.
    TriggerEvent("esx_status:add", status, newVal)
end