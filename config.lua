return {
    CookDuration = 10000,
    BlipCoords = vec3(-1194.66, -894.56, 14.0),
    HungerFill = { -- How much they fill your hunger
        ['burger-bleeder'] = {emote = 'burger', amt = math.random(48, 54)},
        ['burger-moneyshot'] = {emote = 'burger', amt = math.random(48, 54)},
        ['burger-torpedo'] = {emote = 'burger', amt = math.random(48, 54)},
        ['burger-heartstopper'] = {emote = 'burger', amt = math.random(48, 54)},
        ['burger-meatfree'] = {emote = 'burger', amt = math.random(48, 54)},
        ['burger-fries'] = {emote = 'fries', amt = math.random(48, 54)},
    },
    ThirstFill = { -- How much they fill your thirst.
        ['burger-softdrink'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['burger-mshake'] = {emote = 'bsdrink', amt = math.random(48, 54)},
    },
    Zones = {
        { coords = vec3(-1193.87, -894.41, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'randol_burgershot:client:frontTray', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_1', slots = 10, weight = 75000}, 
        { coords = vec3(-1199.22, -895.91, 14.0), radius = 0.9, icon = 'fa-solid fa-beer-mug-empty', event = 'randol_burgershot:client:drinkStation', label = 'Make Drinks', job = 'burgershot' }, 
        { coords = vec3(-1200.46, -900.94, 14.0), radius = 0.9, icon = 'fa-solid fa-burger', event = 'randol_burgershot:client:cookBurgers', label = 'Make Burgers', job = 'burgershot' }, 
        { coords = vec3(-1201.6, -899.1, 14.0), radius = 0.7, icon = 'fa-solid fa-fire-burner', event = 'randol_burgershot:client:friesStation', label = 'Make Fries', job = 'burgershot' },
        { coords = vec3(-1205.19, -893.75, 14.0), radius = 0.7, icon = 'fa-solid fa-box-open', event = 'randol_burgershot:client:ingredientStore', label = 'Ingredients', job = 'burgershot', type = 'shop' },
        { coords = vec3(-1197.56, -894.29, 14.0), radius = 0.7, icon = 'far fa-clipboard', event = 'randol_burgershot:client:passThrough', label = 'Big Tray', job = 'burgershot', type = 'stash', stashLabel = 'BS_Big_Tray', slots = 20, weight = 150000 },
        { coords = vec3(-1195.36, -892.37, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'randol_burgershot:client:frontTray2', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_2', slots = 10, weight = 75000},
    },
    Items = { -- qb-inventory, ew
    label = 'Shop',
        slots = 7,
        items = {
            [1] = { name = 'burger-bun', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            [2] = { name = 'burger-raw', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            [3] = { name = 'burger-tomato', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            [4] = { name = 'burger-lettuce', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            [5] = { name = 'burger-potato', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
            [6] = { name = 'burger-mshakeformula', price = 0, amount = 500, info = {}, type = 'item', slot = 6, },
            [7] = { name = 'burger-sodasyrup', price = 0, amount = 500, info = {}, type = 'item', slot = 7, },
        }
    },
    Emotes = {
        burger = {prop = `prop_cs_burger_01`, bone = 18905, anim = 'mp_player_int_eat_burger', dict = 'mp_player_inteat@burger', coords = vec3(0.130000, 0.050000, 0.020000), rot = vec3(-50.000000, 16.000000, 60.000000)},
        bbqf = {prop = `prop_fish_slice_01`, bone = 28422, anim = 'idle_b', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
        fries = {prop = `prop_food_bs_chips`, bone = 18905, anim = 'mp_player_int_eat_burger_fp', dict = 'mp_player_inteat@burger', coords = vec3(0.090000, -0.060000, 0.050000), rot = vec3(300.000000, 150.000000, 0.000000)},
        bsdrink = {prop = `prop_food_bs_juice02`, bone = 28422, anim = 'idle_c', dict = 'amb@world_human_drinking@coffee@male@idle_a', coords = vec3(0.02, 0.0, -0.10), rot = vec3(0.0, 0.0, -0.50)},
    }
}