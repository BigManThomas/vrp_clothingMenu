RMenu.Add('rageUI', 'mainMenu', RageUI.CreateMenu("Clothing Menu", "mainMenu"))
RMenu.Add('rageUI', 'changePed', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Ped", "Change ped model"))
RMenu.Add('rageUI', 'changeClothing', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Clothing", "Change your Clothes"))
RMenu.Add('rageUI', 'changeBody', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Body Ft's", "Change Body Features"))
RMenu.Add('rageUI', 'facialFeatures', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Face", "Facial Features"))
RMenu.Add('rageUI', 'hairTypes', RageUI.CreateSubMenu(RMenu:Get('rageUI', 'mainMenu'), "Change Face", "Hair Types"))
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
local opacity = 0.0
local faceScale = {-1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}
local skinMix = {0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}
local eyebrowType
local highlightID = 0

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
            RageUI.Item.Button('MP Male', 'WARNING: Resets all your Body Options', {}, true, {
                onSelected = function()
                    while not HasModelLoaded(1885233650) do
                        RequestModel(1885233650)
                    end
                    local weapons = getWeapons()
                    SetPlayerModel(PlayerId(), 1885233650)
                    giveWeapons(weapons,true)
                    
                    SetPedHeadBlendData(PlayerPedId(), 0, 0, 0, 15, 0, 0, 0, 1.0, 0, false)
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
            RageUI.Item.Button('MP Female', 'WARNING: Resets all your Body Options', {}, true, {
                onSelected = function()
                    while not HasModelLoaded(-1667301416) do
                        Citizen.Wait(1000)
                        RequestModel(-1667301416)
                    end
                    local weapons = getWeapons()
                    SetPlayerModel(PlayerId(), -1667301416)
                    giveWeapons(weapons,true)

                    SetPedHeadBlendData(PlayerPedId(), 0, 0, 0, 15, 0, 0, 0, 1.0, 0, false)
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
            RageUI.Item.List('Hats/Helmets', get_drawables_prop(0), current_clothing("prop", 0, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(0, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures_prop(0, Index-1) then
                        textureNumber = 0
                    end
                    preview_prop(0, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Glasses', get_drawables_prop(1), current_clothing("prop", 1, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(1, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures_prop(1, Index-1) then
                        textureNumber = 0
                    end
                    preview_prop(1, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Ear Accessories', get_drawables_prop(2), current_clothing("prop", 2, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(2, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures_prop(2, Index-1) then
                        textureNumber = 0
                    end
                    preview_prop(2, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Watches', get_drawables_prop(6), current_clothing("prop", 6, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(6, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures_prop(6, Index-1) then
                        textureNumber = 0
                    end
                    preview_prop(6, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Bracelets', get_drawables_prop(7), current_clothing("prop", 7, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_prop(7, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures_prop(7, Index-1) then
                        textureNumber = 0
                    end
                    preview_prop(7, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Masks', get_drawables(1), current_clothing("drawable", 1, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(1, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(1, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(1, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Shirts/Jackets', get_drawables(11), current_clothing("drawable", 11, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(11, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(11, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(11, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Undershirt', get_drawables(8), current_clothing("drawable", 8, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(8, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(8, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(8, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Pants', get_drawables(4), current_clothing("drawable", 4, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(4, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(4, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(4, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Shoes', get_drawables(6), current_clothing("drawable", 6, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(6, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(6, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(6, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Bags', get_drawables(5), current_clothing("drawable", 5, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(5, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(5, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(5, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Vests', get_drawables(9), current_clothing("drawable", 9, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(9, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(9, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(9, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Accessories', get_drawables(7), current_clothing("drawable", 7, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(7, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(7, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(7, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Badges', get_drawables(10), current_clothing("drawable", 10, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(10, Index, 1, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(10, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(10, Index, textureNumber, 0)
                end
            })
        end)
        RageUI.IsVisible(RMenu:Get('rageUI', 'changeBody'), function()
            RageUI.Item.Button('Facial Features', nil, {RightLabel = ">>>"}, true, {
                onSelected = function()
                    RageUI.Visible(RMenu:Get('rageUI', 'facialFeatures'), not RageUI.Visible(RMenu:Get('rageUI', 'facialFeatures')))
                end
            })
            RageUI.Item.Button('Hair Types', nil, {RightLabel = ">>>"}, true, {
                onSelected = function()
                    RageUI.Visible(RMenu:Get('rageUI', 'hairTypes'), not RageUI.Visible(RMenu:Get('rageUI', 'hairTypes')))
                end
            })
            RageUI.Item.List('Skin Tone', skinMix, 1, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadBlendData(PlayerPedId(), 0, 0, 0, 15, 0, 0, 0, skinMix[Index], 0, false)
                end
            })
            RageUI.Item.List('Arms/Torso', get_drawables(3), current_clothing("drawable", 3, false)+1, "ENTER To Change Textures ("..textureNumber..")", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(3, Index, 0, 0)
                end,
                onSelected = function(Index, Items)
                    textureNumber = textureNumber + 1
                    if textureNumber > get_textures(3, Index-1) then
                        textureNumber = 0
                    end
                    preview_clothing(3, Index, textureNumber, 0)
                end
            })
            RageUI.Item.List('Body Blemishes', get_facial_features(11), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 11, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 11, Index, opacity)
                end
            })
            -- RageUI.Item.List('Tattoos', get_drawables(3), current_clothing("drawable", 3, false), "ENTER To Change Textures", {}, true, {
            --     onListChange = function(Index, Items)
            --         preview_clothing(3, Index, 0, 0)
            --     end,
            --     onSelected = function(Index, Items)
            --         textureNumber = textureNumber + 1
            --         if textureNumber >= get_textures(3, Index) then
            --             textureNumber = 0
            --         end
            --         preview_clothing(3, Index, textureNumber, 0)
            --     end
            -- })
        end)
        RageUI.IsVisible(RMenu:Get('rageUI', 'facialFeatures'), function()
            RageUI.Item.List('Nose Width', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 0, faceScale[Index])
                end
            })
            RageUI.Item.List('Nose Height', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 1, faceScale[Index])
                end
            })
            RageUI.Item.List('Nose Peak Length', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 2, faceScale[Index])
                end
            })
            RageUI.Item.List('Nose Peak Height', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 4, faceScale[Index])
                end
            })
            RageUI.Item.List('Nose Bone Height', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 3, faceScale[Index])
                end
            })
            RageUI.Item.List('Nose Bone Twist', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 5, faceScale[Index])
                end
            })
            RageUI.Item.List('Eyebrow Type', get_facial_features(2), 1,  "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 2, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 2, Index, opacity)
                end
            })
            RageUI.Item.List('Eyebrow Colour', get_hair_colours(), 1,  "ENTER To Change Highlights ("..highlightID..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlayColor(PlayerPedId(), 2, 1, Index, 1)
                end,
                onSelected = function(Index, Items)
                    highlightID = highlightID + 1
                    if highlightID > 63 then
                        highlightID = 0
                    end
                    SetPedHeadOverlayColor(PlayerPedId(), 2, 1, Index, highlightID)
                end
            })
            RageUI.Item.List('Eyebrow Height', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 6, faceScale[Index])
                end
            })
            RageUI.Item.List('Eyebrow Depth', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 7, faceScale[Index])
                end
            })
            RageUI.Item.List('Cheek Bone Height', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 8, faceScale[Index])
                end
            })
            RageUI.Item.List('Cheek Bone Width', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 9, faceScale[Index])
                end
            })
            RageUI.Item.List('Cheek Width', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 10, faceScale[Index])
                end
            })
            RageUI.Item.List('Lips Thickness', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 12, faceScale[Index])
                end
            })
            RageUI.Item.List('Jaw-bone Width', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 13, faceScale[Index])
                end
            })
            RageUI.Item.List('Jaw-bone Length', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 14, faceScale[Index])
                end
            })
            RageUI.Item.List('Chin Size', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 15, faceScale[Index])
                end
            })
            RageUI.Item.List('Chin Length', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 16, faceScale[Index])
                end
            })
            RageUI.Item.List('Chin Peak Length', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 17, faceScale[Index])
                end
            })
            RageUI.Item.List('Chin Hole', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 18, faceScale[Index])
                end
            })
            RageUI.Item.List('Neck Thickness', faceScale, 11, "Change Your Face", {}, true, {
                onListChange = function(Index, Items)
                    SetPedFaceFeature(PlayerPedId(), 19, faceScale[Index])
                end
            })
            RageUI.Item.List('Facial Blemishes', get_facial_features(0), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 0, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 0, Index-1, opacity)
                end
            })
            RageUI.Item.List('Ageing', get_facial_features(3), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 3, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 3, Index, opacity)
                end
            })
            RageUI.Item.List('Makeup', get_facial_features(4), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 4, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 4, Index, opacity)
                end
            })
            RageUI.Item.List('Blush', get_facial_features(5), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 5, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 5, Index, opacity)
                end
            })
            RageUI.Item.List('Blush Colour', get_hair_colours(), 1,  "ENTER To Change Highlights ("..highlightID..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlayColor(PlayerPedId(), 5, 2, Index, 1)
                end,
                onSelected = function(Index, Items)
                    highlightID = highlightID + 1
                    if highlightID > 63 then
                        highlightID = 0
                    end
                    SetPedHeadOverlayColor(PlayerPedId(), 5, 2, Index, highlightID)
                end
            })
            RageUI.Item.List('Complexion', get_facial_features(6), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 6, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 6, Index, opacity)
                end
            })
            RageUI.Item.List('Sun Damage', get_facial_features(7), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 7, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 7, Index, opacity)
                end
            })
            RageUI.Item.List('Lipstick', get_facial_features(8), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 8, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 8, Index, opacity)
                end
            })
            RageUI.Item.List('Lipstick Colour', get_hair_colours(), 1,  "ENTER To Change Highlights ("..highlightID..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlayColor(PlayerPedId(), 8, 2, Index, 1)
                end,
                onSelected = function(Index, Items)
                    highlightID = highlightID + 1
                    if highlightID > 63 then
                        highlightID = 0
                    end
                    SetPedHeadOverlayColor(PlayerPedId(), 8, 2, Index, highlightID)
                end
            })
            RageUI.Item.List('Moles/Freckles', get_facial_features(9), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 9, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 9, Index, opacity)
                end
            })
            RageUI.Item.List('Lipstick Colour', get_hair_colours(), 1,  "ENTER To Change Highlights ("..highlightID..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlayColor(PlayerPedId(), 10, 1, Index, 1)
                end,
                onSelected = function(Index, Items)
                    highlightID = highlightID + 1
                    if highlightID > 63 then
                        highlightID = 0
                    end
                    SetPedHeadOverlayColor(PlayerPedId(), 10, 1, Index, highlightID)
                end
            })
        end)
        RageUI.IsVisible(RMenu:Get('rageUI', 'hairTypes'), function()
            RageUI.Item.List('Hair', get_drawables(2), current_clothing("drawable", 2, false)+1, "Change Hair Style", {}, true, {
                onListChange = function(Index, Items)
                    preview_clothing(2, Index, 0, 0)
                end,
            })
            RageUI.Item.List('Hair Colour', get_hair_colours(), 1,  "ENTER To Change Highlights ("..highlightID..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHairColor(PlayerPedId(), Index, highlightID)
                end,
                onSelected = function(Index, Items)
                    highlightID = highlightID + 1
                    if highlightID > 63 then
                        highlightID = 0
                    end
                    SetPedHairColor(PlayerPedId(), Index, highlightID)
                end
            })
            RageUI.Item.List('Facial Hair', get_facial_features(1), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 1, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 1, Index, opacity)
                end
            })
            RageUI.Item.List('Facial Hair Colour', get_hair_colours(), 1,  "ENTER To Change Highlights ("..highlightID..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlayColor(PlayerPedId(), 1, 1, Index, 1)
                end,
                onSelected = function(Index, Items)
                    highlightID = highlightID + 1
                    if highlightID > 63 then
                        highlightID = 0
                    end
                    SetPedHeadOverlayColor(PlayerPedId(), 1, 1, Index, highlightID)
                end
            })
            RageUI.Item.List('Chest Hair', get_facial_features(10), 1, "ENTER To Change Opacity ("..opacity..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlay(PlayerPedId(), 10, Index, opacity)
                end,
                onSelected = function(Index, Items)
                    opacity = opacity + 0.1
                    if opacity > 1 then
                        opacity = 0.0
                    end
                    SetPedHeadOverlay(PlayerPedId(), 10, Index, opacity)
                end
            })
            RageUI.Item.List('Chest Hair Colour', get_hair_colours(), 1,  "ENTER To Change Highlights ("..highlightID..")", {}, true, {
                onListChange = function(Index, Items)
                    SetPedHeadOverlayColor(PlayerPedId(), 10, 1, Index, 1)
                end,
                onSelected = function(Index, Items)
                    highlightID = highlightID + 1
                    if highlightID > 63 then
                        highlightID = 0
                    end
                    SetPedHeadOverlayColor(PlayerPedId(), 10, 1, Index, highlightID)
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
    elseif type == "face" then
        if texture then
            --return GetPedHeadOverlayData(PlayerPedId(), index)
            return 1
        else
            print(GetPedFaceFeature(PlayerPedId(), index))
            return GetPedFaceFeature(PlayerPedId(), index)
        end
    end
end

function preview_clothing(type, index, textureIndex, paletteIndex)
    SetPedComponentVariation(PlayerPedId(), type, index-1, textureIndex, paletteIndex)
end

function preview_prop(type, index, textureIndex, paletteIndex)
    SetPedPropIndex(PlayerPedId(), type, index-1, textureIndex, paletteIndex)
end

function get_hair_colours()
    local numColours = {}

    for i=1, GetNumHairColors(), 1 do
        table.insert(numColours, i)
    end
    return numColours
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

function get_facial_features(type)
    numberOfOverlays = {}

    for i=1, GetPedHeadOverlayNum(type), 1 do
        table.insert(numberOfOverlays, i)
    end

    return numberOfOverlays
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

    --local hair = GetPedDrawableVariation(PlayerPedId(), 2)
    --local hair_color = GetPedHairColor(PlayerPedId())

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