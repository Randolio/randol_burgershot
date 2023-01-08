local QBCore = exports['qb-core']:GetCoreObject()   

RegisterNetEvent('randol_burgershot:client:Eat', function(itemName)
    if itemName == "burger-fries" then
        TriggerEvent('animations:client:EmoteCommandStart', {"fries"})
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    end
    QBCore.Functions.Progressbar("eat_something", "Munching..", 5000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)

RegisterNetEvent('randol_burgershot:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"bsdrink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)


-- PRODUCTION EVENTS --          

RegisterNetEvent('randol_burgershot:client:makeBleeder', function()
	local ingredients = QBCore.Functions.HasItem({'burger-bun', 'burger-raw', 'burger-lettuce', 'burger-tomato'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a Bleeder..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeBleeder")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-bun"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-raw"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-lettuce"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-tomato"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-bleeder"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeMoneyshot', function()
	local ingredients = QBCore.Functions.HasItem({"burger-bun", "burger-raw", "burger-lettuce", "burger-tomato"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a Moneyshot..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeMoneyshot")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-bun"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-raw"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-lettuce"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-tomato"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-moneyshot"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeHeartstopper', function()
	local ingredients = QBCore.Functions.HasItem({"burger-bun", "burger-raw", "burger-lettuce", "burger-tomato"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a Hearstopper..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeHeartstopper")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-bun"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-raw"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-lettuce"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-tomato"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-heartstopper"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeMeatfree', function()
	local ingredients = QBCore.Functions.HasItem({"burger-bun", "burger-lettuce", "burger-tomato"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a Meat free..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeMeatfree")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-bun"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-lettuce"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-tomato"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-meatfree"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeTorpedo', function()
	local ingredients = QBCore.Functions.HasItem({"burger-bun", "burger-raw"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a Torpedo..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeTorpedo")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-bun"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-raw"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-torpedo"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('randol_burgershot:client:cookBurgers')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeFries', function()
	local ingredients = QBCore.Functions.HasItem("burger-potato", 2)
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "deepfry", 0.02)
        QBCore.Functions.Progressbar("bs_stuff", "Making some crispy fries..", 10000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeFries")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-potato"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-fries"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You need 2 sacks of Potatos..', 'error')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeSoda', function()
	local ingredients = QBCore.Functions.HasItem("burger-sodasyrup")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("bs_stuff", "Making Drinks..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeSoda")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-sodasyrup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-softdrink"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any Soda Syrup.', 'error')
    end
end)

RegisterNetEvent('randol_burgershot:client:makeShake', function()
	local ingredients = QBCore.Functions.HasItem("burger-mshakeformula")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("bs_stuff", "Making Drinks..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("randol_burgershot:server:makeShake")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-mshakeformula"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-mshake"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
        end)
    else		
        QBCore.Functions.Notify('You don\'t have any milkshake formula.', 'error')
    end
end)

-- MENUS --     

RegisterNetEvent('randol_burgershot:closemenu', function()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent("qb-menu:closeMenu")
end)

RegisterNetEvent('randol_burgershot:client:cookBurgers', function()
    SetEntityCoords(PlayerPedId(), -1199.92, -900.49, 13.0)
    SetEntityHeading(PlayerPedId(), 125.3)
    exports['qb-menu']:openMenu({
        {
            header = "Burgershot Stove",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Bleeder Burger",
            txt = "Requires:</p>1x Bun | 1x Raw Patty | 1x Lettuce | 1x Tomato",
            icon = "fa-solid fa-burger",
            params = {
                event = "randol_burgershot:client:makeBleeder",
            }
        },
        {
            header = "Moneyshot Burger",
            txt = "Requires:</p>1x Bun | 1x Raw Patty | 1x Lettuce | 1x Tomato",
            icon = "fa-solid fa-burger",
            params = {
                event = "randol_burgershot:client:makeMoneyshot",
            }
        },
        {
            header = "Torpedo Burger",
            txt = "Requires:</p>1x Bun | 1x Raw Patty",
            icon = "fa-solid fa-burger",
            params = {
                event = "randol_burgershot:client:makeTorpedo",
            }
        },
        {
            header = "Heartstopper Burger",
            txt = "Requires:</p>1x Bun | 1x Raw Patty | 1x Lettuce | 1x Tomato",
            icon = "fa-solid fa-burger",
            params = {
                event = "randol_burgershot:client:makeHeartstopper",
            }
        },
        {
            header = "Meat-free Burger",
            txt = "Requires:</p>1x Bun | 1x Lettuce | 1x Tomato",
            icon = "fa-solid fa-burger",
            params = {
                event = "randol_burgershot:client:makeMeatfree",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "randol_burgershot:closemenu"
            }
        },
    })
end)

RegisterNetEvent('randol_burgershot:client:drinkStation', function()
    SetEntityCoords(PlayerPedId(), -1198.87, -895.38, 13.0)
    SetEntityHeading(PlayerPedId(), 125.79)
    exports['qb-menu']:openMenu({
        {
            header = "Drink Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Burgershot Soda",
            txt = "Requires:</p>1x Soda Syrup",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "randol_burgershot:client:makeSoda",
            }
        },
        {
            header = "Burgershot Milkshake",
            txt = "Requires:</p>1x Milkshake Formula",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "randol_burgershot:client:makeShake",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "randol_burgershot:closemenu"
            }
        },
    })
end)
