local burgerZones = {}
local Config = lib.require('config')
local ox_inv = GetResourceState('ox_inventory') == 'started'
local emoteProp

local bs_blip = AddBlipForCoord(Config.BlipCoords)
SetBlipSprite(bs_blip, 106)
SetBlipDisplay(bs_blip, 4)
SetBlipScale(bs_blip, 0.5)
SetBlipAsShortRange(bs_blip, true)
SetBlipColour(bs_blip, 75)
BeginTextCommandSetBlipName('STRING')
AddTextComponentSubstringPlayerName('Burgershot')
EndTextCommandSetBlipName(bs_blip)

local function toggleEmotes(bool, emote)
    if bool then
        local doEmote = Config.Emotes[emote]
        lib.requestAnimDict(doEmote.dict, 2000)
        lib.requestModel(doEmote.prop, 2000)
        if doEmote.prop then
            emoteProp = CreateObject(doEmote.prop, 0.0, 0.0, 0.0, true, true, false)
            AttachEntityToEntity(emoteProp, cache.ped, GetPedBoneIndex(cache.ped, doEmote.bone), doEmote.coords.x, doEmote.coords.y, doEmote.coords.z, doEmote.rot.x, doEmote.rot.y, doEmote.rot.z, true, true, false, true, 1, true)
        end
        TaskPlayAnim(cache.ped, doEmote.dict, doEmote.anim, 8.0, 8.0, -1, 49, 0, 0, 0, 0)
        SetModelAsNoLongerNeeded(doEmote.prop)
    else
        ClearPedTasks(cache.ped)
        if emoteProp and DoesEntityExist(emoteProp) then 
            DetachEntity(emoteProp, true, false) 
            DeleteEntity(emoteProp)
            emoteProp = nil
        end
    end
end

function createJobZones()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:AddCircleZone('burgerShotZone'..k, v.coords, v.radius,{ 
            name= 'burgerShotZone'..k, 
            debugPoly = false, 
            useZ=true, 
        }, {
            options = {
                { event = v.event, icon = v.icon, label = v.label, job = v.job, },
            },
            distance = 1.5
        })
        burgerZones[#burgerZones+1] = 'burgerShotZone'..k
    end
end

function removeJobZones()
    for i = 1, #burgerZones do
        exports['qb-target']:RemoveZone(burgerZones[i])
    end
    table.wipe(burgerZones)
end
    
AddEventHandler('randol_burgershot:client:frontTray', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Front_Tray_1'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Front_Tray_1')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Front_Tray_1', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)

AddEventHandler('randol_burgershot:client:frontTray2', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Front_Tray_2'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Front_Tray_2')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Front_Tray_2', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)

AddEventHandler('randol_burgershot:client:passThrough', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Big_Tray'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Big_Tray')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Big_Tray', {
            maxweight = 150000,
            slots = 20,
        })
    end
end)

AddEventHandler('randol_burgershot:client:ingredientStore', function()
    if ox_inv then
        exports.ox_inventory:openInventory('shop', { id = 1, type = 'Ingredients - Burgershot'})
    else
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'burgershot', Config.Items)
    end
end)

RegisterNetEvent('randol_burgershot:client:Eat', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Munching..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('hunger', itemName)
        lib.callback.await('randol_burgershot:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('randol_burgershot:client:Drink', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Drinking..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('thirst', itemName)
        lib.callback.await('randol_burgershot:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('randol_burgershot:client:makeFood', function()
    if GetInvokingResource() then return end
    toggleEmotes(true, 'bbqf')
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making food..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('randol_burgershot:client:cookBurgers')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeFries', function()
    if GetInvokingResource() then return end
    toggleEmotes(true, 'bbqf')
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making some crispy fries..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('randol_burgershot:client:friesStation')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeDrink', function()
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making Drinks..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        TriggerEvent('randol_burgershot:client:drinkStation')
    end
end)

AddEventHandler('randol_burgershot:client:cookBurgers', function()
    local burgerShot = 'bs_info'
    local bsMenu = {
        id = burgerShot,
        title = 'Burger Station',
        options = {
            {
                title = 'Bleeder Burger',
                description = 'Requires: 1x Bun | 1x Raw Patty | 1x Lettuce | 1x Tomato',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-bleeder')
                end,
            },
            {
                title = 'Moneyshot Burger',
                description = 'Requires: 1x Bun | 1x Raw Patty | 1x Lettuce | 1x Tomato',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-moneyshot')
                end,
            },
            {
                title = 'Torpedo Burger',
                description = 'Requires: 1x Bun | 1x Raw Patty',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-torpedo')
                end,
            },
            {
                title = 'Heartstopper Burger',
                description = 'Requires: 1x Bun | 1x Raw Patty | 1x Lettuce | 1x Tomato',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-heartstopper')
                end,
            },
            {
                title = 'Meat-free Burger',
                description = 'Requires: 1x Bun | 1x Lettuce | 1x Tomato',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-meatfree')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(burgerShot)
end)

AddEventHandler('randol_burgershot:client:drinkStation', function()
    local burgerShot = 'bs_info'
    local bsMenu = {
        id = burgerShot,
        title = 'Drink Station',
        options = {
            {
                title = 'Burgershot Soda',
                description = 'Requires: 1x Soda Syrup',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-softdrink')
                end,
            },
            {
                title = 'Burgershot Milkshake',
                description = 'Requires: 1x Milkshake Formula',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-mshake')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(burgerShot)
end)

AddEventHandler('randol_burgershot:client:friesStation', function()
    local burgerShot = 'bs_info'
    local bsMenu = {
        id = burgerShot,
        title = 'Fries Station',
        options = {
            {
                title = 'Fries',
                description = 'Requires: 2x Potato',
                icon = 'fa-solid fa-fire-burner',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'burger-fries')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(burgerShot)
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        removeJobZones()
    end 
end)