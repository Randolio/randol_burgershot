# Randolio: Burgershot Job (Rewritten 19/03/2024)

## Link to free MLO used: https://gta5mod.net/gta-5-mods/maps/mlo-gta-iv-burgershot-interior-sp-fivem-v2-0/

## Requirements

* [ox_lib](https://github.com/overextended/ox_lib/releases/)

## Optional Addons

* [Randolio: Billing](https://github.com/Randolio/randol_billing/)
* [Randolio: Multijob](https://github.com/Randolio/randol_multijob/)


ESX/QB supported with bridge along with ox/qb inventory.

## For QBCore users, Add this to your @qb-core/shared/jobs.lua. ESX users will have to implement the job themselves.
```lua
burgershot = {
    label = "Burgershot",
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = { name = "Trainee", payment = 50 },
        ['1'] = { name = "Employee", payment = 75 },
        ['2'] = { name = "Burger Flipper", payment = 100 },
        ['3'] = { name = "Manager", payment = 125 },
        ['4'] = { name = "Owner", isboss = true, payment = 150 },
    },
},	
```

## For qb-inventory users, Add to your qb-core/shared/items.lua
```lua
["burger-bleeder"] 				 = {["name"] = "burger-bleeder", 			 	["label"] = "Bleeder", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "bs_the-bleeder.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "."},
["burger-moneyshot"] 			 = {["name"] = "burger-moneyshot", 			 	["label"] = "Moneyshot", 				["weight"] = 300, 		["type"] = "item", 		["image"] = "bs_money-shot.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "."},
["burger-torpedo"] 				 = {["name"] = "burger-torpedo", 			 	["label"] = "Torpedo", 					["weight"] = 310, 		["type"] = "item", 		["image"] = "bs_torpedo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "."},
["burger-heartstopper"] 		 = {["name"] = "burger-heartstopper", 			["label"] = "Heartstopper", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "bs_the-heart-stopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "."},
["burger-meatfree"] 		 	 = {["name"] = "burger-meatfree", 				["label"] = "MeatFree", 			["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_meat-free.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "."},
["burger-fries"] 				 = {["name"] = "burger-fries", 			 	  	["label"] = "Fries", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_fries.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "."},
["burger-softdrink"] 			 = {["name"] = "burger-softdrink", 				["label"] = "Soft Drink", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ice Cold Drink."},
["burger-mshake"] 			     = {["name"] = "burger-mshake", 				["label"] = "Milkshake", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_milkshake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hand-scooped for you!"},
["burger-bun"] 				 	 = {["name"] = "burger-bun", 			 	  	["label"] = "Bun", 			["weight"] = 125, 		["type"] = "item", 					["image"] = "bs_bun.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
["burger-meat"] 				 = {["name"] = "burger-meat", 			 	  	["label"] = "Cooked Patty", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
["burger-lettuce"] 				 = {["name"] = "burger-lettuce", 			 	["label"] = "Lettuce", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_lettuce.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
["burger-tomato"] 				 = {["name"] = "burger-tomato", 			 	["label"] = "Tomato", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_tomato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
["burger-raw"] 				 	 = {["name"] = "burger-raw", 			 		["label"] = "Raw Patty", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty_raw.png", 	        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
["burger-potato"] 				 = {["name"] = "burger-potato", 			 	["label"] = "Bag of Potatoes", 		["weight"] = 1500, 		["type"] = "item", 			["image"] = "bs_potato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
["burger-mshakeformula"] 		 = {["name"] = "burger-mshakeformula", 			["label"] = "Milkshake Formula", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_ingredients_icecream.png", ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
["burger-sodasyrup"] 		 	 = {["name"] = "burger-sodasyrup", 				["label"] = "Soda Syrup", 		["weight"] = 125, 		["type"] = "item", 				["image"] = "bs_ingredients_hfcs.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},

```
# For ox inventory users, add to your items.lua 
```lua
["burger-sodasyrup"] = {
    label = "Soda Syrup", weight = 125, stack = true, close = true, degrade = 5760, description = "An Ingredient", client = { image = "bs_ingredients_hfcs.png", }
},
["burger-tomato"] = {
    label = "Tomato", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_tomato.png", }
},
["burger-bleeder"] = {
    label = "Bleeder", weight = 250, stack = true, close = true, decay = true, degrade = 5760, description = "It's a food item dude.", 
    client = { image = "bs_the-bleeder.png", },
    server = { export = 'randol_burgershot.burger-bleeder', },
},
["burger-moneyshot"] = {
    label = "Moneyshot", weight = 300, stack = true, close = true, decay = true, degrade = 5760, description = "It's a food item dude.", 
    client = { image = "bs_money-shot.png", },
    server = { export = 'randol_burgershot.burger-moneyshot', },
},
["burger-meatfree"] = {
    label = "MeatFree", weight = 125, stack = true, close = true, decay = true, degrade = 5760, description = "It's a food item dude.", 
    client = { image = "bs_meat-free.png", },
    server = { export = 'randol_burgershot.burger-meatfree', },
},
["burger-potato"] = {
    label = "Bag of Potatoes", weight = 1500, stack = true, close = true, description = "An Ingredient", client = { image = "bs_potato.png", }
},
["burger-mshake"] = {
    label = "Milkshake", weight = 125, stack = true, close = true, decay = true, degrade = 5760, description = "Hand-scooped for you!", 
    client = { image = "bs_milkshake.png", },
    server = { export = 'randol_burgershot.burger-mshake', },
},
["burger-lettuce"] = { label = "Lettuce", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_lettuce.png", }
},
["burger-raw"] = { label = "Raw Patty", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_patty_raw.png", }
},
["burger-heartstopper"] = {
    label = "Heartstopper", weight = 2500, stack = true, close = true, decay = true, degrade = 5760, description = "It's a food item dude.", 
    client = { image = "bs_the-heart-stopper.png", },
    server = { export = 'randol_burgershot.burger-heartstopper', },
},
["burger-mshakeformula"] = {
    label = "Milkshake Formula", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_ingredients_icecream.png", }
},
["burger-fries"] = {
    label = "Fries", weight = 125, stack = true, close = true, decay = true, degrade = 5760, description = "It's a food item dude.", 
    client = { image = "bs_fries.png", },
    server = { export = 'randol_burgershot.burger-fries', },
},
["burger-torpedo"] = {
    label = "Torpedo", weight = 310, stack = true, close = true, decay = true, degrade = 5760, description = "It's a food item dude.", 
    client = { image = "bs_torpedo.png", },
    server = { export = 'randol_burgershot.burger-torpedo', },
},
["burger-bun"] = {
    label = "Bun", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_bun.png", }
},
["burger-softdrink"] = {
    label = "Soft Drink", weight = 125, stack = true, close = true, decay = true, degrade = 5760, description = "An Ice Cold Drink.", 
    client = { image = "bs_softdrink.png", },
    server = { export = 'randol_burgershot.burger-softdrink', },
},
```