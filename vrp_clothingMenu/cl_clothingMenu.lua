RMenu.Add('rageUI', 'mainMenu', RageUI.CreateMenu("Clothing Menu", "mainMenu"))
RMenu.Add('rageUI', 'changePed', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Ped", "Change ped model"))
RMenu.Add('rageUI', 'changeClothing', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Clothing", "Change your Clothes"))
RMenu.Add('rageUI', 'changeBody', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Body Ft's", "Change Body Features"))
RMenu.Add('rageUI', 'clearProps', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Clear Props", "Clear Props"))
RMenu.Add('rageUI', 'manageOutfits', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Manage Outfits", "Manage Outfits"))

Keys.Register('E', 'E', 'Open ClothingUI mainMenu', function()
    RageUI.Visible(RMenu:Get('rageUI', 'mainMenu'), not RageUI.Visible(RMenu:Get('rageUI', 'mainMenu')))
end)

local actionIndex = 1
local numberOfDrawableVariations
local textureNumber = 1
local presets = {}
local temp_table = {}

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1)
        RageUI.IsVisible(RMenu:Get('rageUI', 'mainMenu'), function()
            RageUI.Item.Button('Change Ped', nil, {RightLabel = ">>>"}, true, {
                onSelected = function()
                    RageUI.Visible(RMenu:Get('rageUI', 'changePed'), not RageUI.Visible(RMenu:Get('rageUI', 'Ped')))
                end
            })
            RageUI.Item.Button('Clothing Options', nil, {RightLabel = ">>>"}, true, {
                onSelected = function()
                    RageUI.Visible(RMenu:Get('rageUI', 'changeClothing'), not RageUI.Visible(RMenu:Get('rageUI', 'changeClothing')))
                end
            })
            RageUI.Item.Button('Body Options', nil, {RightLabel = ">>>"}, true, {
                onSelected = function()
                    RageUI.Visible(RMenu:Get('rageUI', 'changeBody'), not RageUI.Visible(RMenu:Get('rageUI', 'changeBody')))
                end
            })
            RageUI.Item.Button('Remove Props', nil, {RightLabel = ">>>"}, true, {
                onSelected = function()
                    RageUI.Visible(RMenu:Get('rageUI', 'clearProps'), not RageUI.Visible(RMenu:Get('rageUI', 'clearProps')))
                end
            })
            RageUI.Item.Button('Manage Outfits', nil, {RightLabel = ">>>"}, true, {
                onSelected = function()
                    TriggerServerEvent('clothingMenu:retrieveSavedClothesIDs')
                    RageUI.Visible(RMenu:Get('rageUI', 'manageOutfits'), not RageUI.Visible(RMenu:Get('rageUI', 'manageOutfits')))
                end
            })
        end)
        RageUI.IsVisible(RMenu:Get('rageUI', 'changePed'), function()
            RageUI.Item.Button('MP Male', 'Become a Default Danny', {}, true, {
                onSelected = function()
                    while not HasModelLoaded(1885233650) do
                        RequestModel(1885233650)
                    end
                    local weapons = getWeapons()
                    SetPlayerModel(PlayerId(), 1885233650)
                    giveWeapons(weapons,true)
                    
                    SetHeadBlendPaletteColor(PlayerPedId(), 255, 255, 255, 1)
                    SetPedPropIndex(PlayerPedId(), 0, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 1, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 2, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 6, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 7, -1, 0, 0)
                
                    SetPedComponentVariation(PlayerPedId(), 1, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 1, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 8, 15, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 4, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 6, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 5, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 1, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 9, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 7, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 10, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 0)
                    SetPedComponentVariation(PlayerPedId(), 3, 0, 0, 0)
                end
            })
            RageUI.Item.Button('MP Female', 'Become a Default Danny (Female)', {}, true, {
                onSelected = function()
                    while not HasModelLoaded(-1667301416) do
                        Citizen.Wait(1000)
                        RequestModel(-1667301416)
                    end
                    local weapons = getWeapons()
                    SetPlayerModel(PlayerId(), -1667301416)
                    giveWeapons(weapons,true)

                    SetPedPropIndex(PlayerPedId(), 0, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 1, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 2, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 6, -1, 0, 0)
                    SetPedPropIndex(PlayerPedId(), 7, -1, 0, 0)
                
                    SetPedComponentVariation(PlayerPedId(), 1, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 1, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 8, 15, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 4, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 6, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 5, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 1, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 9, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 7, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 10, 0, 1, 0)
                    SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 0)
                    SetPedComponentVariation(PlayerPedId(), 3, 0, 0, 0)
                    SetModelAsNoLongerNeeded(-1667301416)
                end
            })
        end)

        RageUI.IsVisible(RMenu:Get('rageUI', 'changeClothing'), function()
            RageUI.Item.List('Hats/Helmets', get_drawables_prop(0), current_clothing("prop", 0, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(0, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures_prop(0, Index) then
                        textureNumber = 0
                    end
                    preview_prop(0, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Glasses', get_drawables_prop(1), current_clothing("prop", 1, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(1, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures_prop(1, Index) then
                        textureNumber = 0
                    end
                    preview_prop(1, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Ear Accessories', get_drawables_prop(2), current_clothing("prop", 2, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(2, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures_prop(2, Index) then
                        textureNumber = 0
                    end
                    preview_prop(2, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Watches', get_drawables_prop(6), current_clothing("prop", 6, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(6, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures_prop(6, Index) then
                        textureNumber = 0
                    end
                    preview_prop(6, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Bracelets', get_drawables_prop(7), current_clothing("prop", 7, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(7, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures_prop(7, Index) then
                        textureNumber = 0
                    end
                    preview_prop(7, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Masks', get_drawables(1), current_clothing("drawable", 1, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(1, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(1, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(1, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Shirts/Jackets', get_drawables(11), current_clothing("drawable", 11, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(11, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(11, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(11, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Undershirt', get_drawables(8), current_clothing("drawable", 8, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(8, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(8, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(8, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Pants', get_drawables(4), current_clothing("drawable", 4, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(4, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(4, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(4, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Shoes', get_drawables(6), current_clothing("drawable", 6, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(6, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(6, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(6, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Bags', get_drawables(5), current_clothing("drawable", 5, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(5, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(5, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(5, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Vests', get_drawables(9), current_clothing("drawable", 9, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(9, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(9, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(9, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Accessories', get_drawables(7), current_clothing("drawable", 7, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(7, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(7, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(7, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Badges', get_drawables(10), current_clothing("drawable", 10, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(10, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(10, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(10, Index, textureNumber, 0)
                end
            })
        end)
        RageUI.IsVisible(RMenu:Get('rageUI', 'changeBody'), function()
            RageUI.Item.List('Face', get_drawables(0), current_clothing("drawable", 0, false), "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(0, Index, 0, 0)
                end
            })
            RageUI.Item.List('Arms/Torso', get_drawables(3), current_clothing("drawable", 3, false), "ENTER To Change Textures", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(3, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= get_textures(3, Index) then
                        textureNumber = 0
                    end
                    preview_clothing(3, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Hair', get_drawables(2), current_clothing("drawable", 2, false), "ENTER To Change Hair Colour", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(2, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber >= GetNumHairColors() then
                        textureNumber = 0
                    end
                    SetPedHairColor(PlayerPedId(), textureNumber, 1)
                end
            })
        end)
        RageUI.IsVisible(RMenu:Get('rageUI', 'clearProps'), function()
            RageUI.Item.Button('Remove Hat', nil, {}, true, {
                onSelected = function()
                    ClearPedProp(PlayerPedId(), 0)
                end
            })
            RageUI.Item.Button('Remove Glasses', nil, {}, true, {
                onSelected = function()
                    ClearPedProp(PlayerPedId(), 1)
                end
            })
            RageUI.Item.Button('Remove Ear Accessory', nil, {}, true, {
                onSelected = function()
                    ClearPedProp(PlayerPedId(), 2)
                end
            })
            RageUI.Item.Button('Remove Watch', nil, {}, true, {
                onSelected = function()
                    ClearPedProp(PlayerPedId(), 6)
                end
            })
            RageUI.Item.Button('Remove Bracelet', nil, {}, true, {
                onSelected = function()
                    ClearPedProp(PlayerPedId(), 7)
                end
            })
        end)
        RageUI.IsVisible(RMenu:Get('rageUI', 'manageOutfits'), function()
            for k, v in pairs(temp_table) do
                --if presets[k].id ~= nil then
                    --print(temp_table[k].name)
                    RageUI.Item.Button(temp_table[k].name, ("Outfit ID: "..temp_table[k].id), {}, true, {
                        onSelected = function()
                            TriggerServerEvent('clothingMenu:retrieveSavedClothing', temp_table[k].id)
                        end
                    })
            end
            RageUI.Item.Button('Save Current Outfit', 'Press ENTER to Save Current Outfit', {RightLabel = '>>>'}, true, {
                onSelected = function()
                    save_clothing()
                end
            })
            RageUI.Item.Button('Delete Outfit', 'Delete Outfit by ID', {RightLabel = '>>>'}, true, {
                onSelected = function()
                    delete_outfit()
                end
            })
        end)
    end
end)

function current_clothing(type, index, texture)
    if type == "prop" then
        if texture then
            return GetPedPropTextureIndex(PlayerPedId(), index)
        else
            return GetPedPropIndex(PlayerPedId(), index)
        end
    elseif type == "drawable" then
        if texture then
            return GetPedTextureVariation(PlayerPedId(), index)
        else
            return GetPedDrawableVariation(PlayerPedId(), index)
        end
    end
end

function preview_clothing(type, index, textureIndex, paletteIndex)
    SetPedComponentVariation(PlayerPedId(), type, index-1, textureIndex, paletteIndex)
end

function preview_prop(type, index, textureIndex, paletteIndex)
    SetPedPropIndex(PlayerPedId(), type, index-1, textureIndex, paletteIndex)
end

function remove_clothing()

end

function get_drawables(type)
    numberOfDrawableVariations = {}

    for i=1, GetNumberOfPedDrawableVariations(PlayerPedId(), type), 1 do
        table.insert(numberOfDrawableVariations, i)
    end
    return numberOfDrawableVariations
end

function get_drawables_prop(type)
    numberOfDrawableVariations = {}

    for i=1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), type), 1 do
        table.insert(numberOfDrawableVariations, i)
    end
    return numberOfDrawableVariations
end

function get_textures(type, index)
    return GetNumberOfPedTextureVariations(PlayerPedId(), type, index)
end

function get_textures_prop(type, index)
    return GetNumberOfPedPropTextureVariations(PlayerPedId(), type, index)
end

function save_clothing()
    local name

    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP9N", "", "", "", "", "", 20)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        name = GetOnscreenKeyboardResult()
    end

    local model = GetEntityModel(PlayerPedId())
    local hat = GetPedPropIndex(PlayerPedId(), 0)
    local hat_texture = GetPedPropTextureIndex(PlayerPedId(), 0)
    local glasses = GetPedPropIndex(PlayerPedId(), 1)
    local glasses_texture = GetPedPropTextureIndex(PlayerPedId(), 1)
    local ear_accessories = GetPedPropIndex(PlayerPedId(), 2)
    local ear_accessories_texture = GetPedPropTextureIndex(PlayerPedId(), 2)
    local watches = GetPedPropIndex(PlayerPedId(), 6)
    local watches_texture = GetPedPropTextureIndex(PlayerPedId(), 6)
    local bracelets = GetPedPropIndex(PlayerPedId(), 7)
    local bracelets_texture = GetPedPropTextureIndex(PlayerPedId(), 7)

    local mask = GetPedDrawableVariation(PlayerPedId(), 1)
    local mask_texture = GetPedTextureVariation(PlayerPedId(), 1)
    local shirt = GetPedDrawableVariation(PlayerPedId(), 11)
    local shirt_texture = GetPedTextureVariation(PlayerPedId(), 11)
    local undershirt = GetPedDrawableVariation(PlayerPedId(), 8)
    local undershirt_texture = GetPedTextureVariation(PlayerPedId(), 8)
    local pants = GetPedDrawableVariation(PlayerPedId(), 4)
    local pants_texture = GetPedTextureVariation(PlayerPedId(), 4)
    local shoes = GetPedDrawableVariation(PlayerPedId(), 6)
    local shoes_texture = GetPedTextureVariation(PlayerPedId(), 6)
    local bags = GetPedDrawableVariation(PlayerPedId(), 5)
    local bags_texture = GetPedTextureVariation(PlayerPedId(), 5)
    local vest = GetPedDrawableVariation(PlayerPedId(), 9)
    local vest_texture = GetPedTextureVariation(PlayerPedId(), 9)
    local accessories = GetPedDrawableVariation(PlayerPedId(), 7)
    local accessories_texture = GetPedTextureVariation(PlayerPedId(), 7)
    local badges = GetPedDrawableVariation(PlayerPedId(), 10)
    local badges_texture = GetPedTextureVariation(PlayerPedId(), 10)
    local face = GetPedDrawableVariation(PlayerPedId(), 0)
    local arms = GetPedDrawableVariation(PlayerPedId(), 3)
    local arms_texture = GetPedTextureVariation(PlayerPedId(), 3)
    local arms = GetPedDrawableVariation(PlayerPedId(), 3)
    local arms_texture = GetPedTextureVariation(PlayerPedId(), 3)

    hair = nil

    TriggerServerEvent('clothingMenu:saveClothing', name, model, hat, hat_texture, glasses, glasses_texture, ear_accessories, ear_accessories_texture, watches, watches_texture, bracelets, bracelets_texture, mask, mask_texture, shirt, shirt_texture, undershirt, undershirt_texture, pants, pants_texture, shoes, shoes_texture, bags, bags_texture, vest, vest_texture, accessories, accessories_texture, badges, badges_texture, face, arms, arms_texture)
end

function delete_outfit()
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP9N", "", "", "", "", "", 20)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        id = GetOnscreenKeyboardResult()
    end

    TriggerServerEvent('clothingMenu:deleteOutfit', id)
end

-- Taken from vRP, used to be tvRP.getWeapons()
function getWeapons()
    local player = GetPlayerPed(-1)
  
    local ammo_types = {}
  
    local weapons = {}
    for k,v in pairs(Config.weapon_types) do
      local hash = GetHashKey(v)
      if HasPedGotWeapon(player,hash) then
        local weapon = {}
        weapons[v] = weapon
  
        local atype = Citizen.InvokeNative(0x7FEAD38B326B9F74, player, hash)
        if ammo_types[atype] == nil then
          ammo_types[atype] = true
          weapon.ammo = GetAmmoInPedWeapon(player,hash)
        else
          weapon.ammo = 0
        end
      end
    end
    return weapons
end

-- Taken from vRP, used to be tvRP.giveWeapns
function giveWeapons(weapons,clear_before)
    local player = GetPlayerPed(-1)
  
    -- give weapons to player
  
    if clear_before then
      RemoveAllPedWeapons(player,true)
    end
  
    for k,weapon in pairs(weapons) do
      local hash = GetHashKey(k)
      local ammo = weapon.ammo or 0
  
      GiveWeaponToPed(player, hash, ammo, false)
    end
end

RegisterNetEvent('clothingMenu:listClothes')
AddEventHandler('clothingMenu:listClothes', function(presets)
    temp_table = presets
end)

RegisterNetEvent('clothingMenu:setSavedClothes')
AddEventHandler('clothingMenu:setSavedClothes', function(model, hat, hat_texture, glasses, glasses_texture, ear_accessories, ear_accessories_texture, watches, watches_texture, bracelets, bracelets_texture, mask, mask_texture, shirt, shirt_texture, undershirt, undershirt_texture, pants, pants_texture, shoes, shoes_texture, bags, bags_texture, vest, vest_texture, accessories, accessories_texture, badges, badges_texture, face, arms, arms_texture)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
        RequestModel(model)
    end

    local weapons = getWeapons()
    SetPlayerModel(PlayerId(), model)
    giveWeapons(weapons,true)

    SetPedPropIndex(PlayerPedId(), 0, hat, hat_texture, 0)
    SetPedPropIndex(PlayerPedId(), 1, glasses, glasses_texture, 0)
    SetPedPropIndex(PlayerPedId(), 2, ear_accessories, ear_accessories_texture, 0)
    SetPedPropIndex(PlayerPedId(), 6, watches, watches_texture, 0)
    SetPedPropIndex(PlayerPedId(), 7, bracelets, bracelets_texture, 0)

    SetPedComponentVariation(PlayerPedId(), 1, mask, mask_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 11, shirt, shirt_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 8, undershirt, undershirt_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 4, pants, pants_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 6, shoes, shoes_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 5, bags, bags_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 1, mask, mask_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 9, vest, vest_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 7, accessories, accessories_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 10, badges, badges_texture, 0)
    SetPedComponentVariation(PlayerPedId(), 0, face, 0, 0)
    SetPedComponentVariation(PlayerPedId(), 3, arms, arms_texture, 0)

end)