local Config = lib.require('config')
local BurgershotFood = {
    ['burger-bleeder'] = {
        event = 'randol_burgershot:client:makeFood',
        remove = { {ing = 'burger-lettuce', amount = 1}, {ing = 'burger-raw', amount = 1}, {ing = 'burger-bun', amount = 1}, {ing = 'burger-tomato', amount = 1}, }
    },
    ['burger-moneyshot'] = {
        event = 'randol_burgershot:client:makeFood',
        remove = { {ing = 'burger-lettuce', amount = 1}, {ing = 'burger-raw', amount = 1}, {ing = 'burger-bun', amount = 1}, {ing = 'burger-tomato', amount = 1}, }
    },
    ['burger-torpedo'] = {
        event = 'randol_burgershot:client:makeFood',
        remove = { {ing = 'burger-raw', amount = 1}, {ing = 'burger-bun', amount = 1}, }
    },
    ['burger-heartstopper'] = {
        event = 'randol_burgershot:client:makeFood',
        remove = { {ing = 'burger-lettuce', amount = 1}, {ing = 'burger-raw', amount = 1}, {ing = 'burger-bun', amount = 1}, {ing = 'burger-tomato', amount = 1}, }
    },
    ['burger-meatfree'] = {
        event = 'randol_burgershot:client:makeFood',
        remove = { {ing = 'burger-lettuce', amount = 1}, {ing = 'burger-bun', amount = 1}, {ing = 'burger-tomato', amount = 1}, }
    },
    ['burger-fries'] = {
        event = 'randol_burgershot:client:makeFries',
        remove = { {ing = 'burger-potato', amount = 2},}
    },
    ['burger-softdrink'] = {
        event = 'randol_burgershot:client:makeDrink',
        remove = { {ing = 'burger-sodasyrup', amount = 1},}
    },
    ['burger-mshake'] = {
        event = 'randol_burgershot:client:makeDrink',
        remove = { {ing = 'burger-mshakeformula', amount = 1},}
    },
}

lib.callback.register('randol_burgershot:server:handleFood', function(source, itemName)
    local src = source
    local Player = GetPlayer(src)

    local food = BurgershotFood[itemName]
    if not food or not isBurgerShot(Player) then return end

    local canMake = true
    for _, ingredient in pairs(food.remove) do
        if not itemCount(Player, ingredient.ing, ingredient.amount) then
            canMake = false
            break
        end
    end

    if not canMake then
        return DoNotification(src, 'You don\'t have all the required ingredients.', 'error')
    end

    for _, ingredient in pairs(food.remove) do
        RemoveItem(Player, ingredient.ing, ingredient.amount)
    end
    TriggerClientEvent(food.event, src)
    SetTimeout(Config.CookDuration, function() AddItem(Player, itemName, 1) end)
end)

lib.callback.register('randol_burgershot:server:removeConsumable', function(source, item, slot)
    local src = source
    local Player = GetPlayer(src)
    RemoveItemFromSlot(Player, item, 1, slot)
end)