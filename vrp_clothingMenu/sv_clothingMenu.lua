local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")

RegisterServerEvent('clothingMenu:saveClothing')
AddEventHandler('clothingMenu:saveClothing', function(name, model, hat, hat_texture, glasses, glasses_texture, ear_accessories, ear_accessories_texture, watches, watches_texture, bracelets, bracelets_texture, mask, mask_texture, shirt, shirt_texture, undershirt, undershirt_texture, pants, pants_texture, shoes, shoes_texture, bags, bags_texture, vest, vest_texture, accessories, accessories_texture, badges, badges_texture, face, arms, arms_texture)
    local user_id = vRP.getUserId({source})

    MySQL.Sync.execute("INSERT INTO saved_clothing (user_id, name, model, hat, hat_texture, glasses, glasses_texture, ear_accessories, ear_accessories_texture, watches, watches_texture, bracelets, bracelets_texture, mask, mask_texture, shirt, shirt_texture, undershirt, undershirt_texture, pants, pants_texture, shoes, shoes_texture, bags, bags_texture, vest, vest_texture, accessories, accessories_texture, badges, badges_texture, face, arms, arms_texture) VALUES (@user_id, @name, @model, @hat, @hat_texture, @glasses, @glasses_texture, @ear_accessories, @ear_accessories_texture, @watches, @watches_texture, @bracelets, @bracelets_texture, @mask, @mask_texture, @shirt, @shirt_texture, @undershirt, @undershirt_texture, @pants, @pants_texture, @shoes, @shoes_texture, @bags, @bags_texture, @vest, @vest_texture, @accessories, @accessories_texture, @badges, @badges_texture, @face, @arms, @arms_texture)", {
        ['user_id'] = user_id,
        ['name'] = name,
        ['model'] = model,
        ['hat'] = hat,
        ['hat_texture'] = hat_texture,
        ['glasses'] = glasses,
        ['glasses_texture'] = glasses_texture,
        ['ear_accessories'] = ear_accessories,
        ['ear_accessories_texture'] = ear_accessories_texture,
        ['watches'] = watches,
        ['watches_texture'] = watches_texture,
        ['bracelets'] = bracelets,
        ['bracelets_texture'] = bracelets_texture,
        ['mask'] = mask,
        ['mask_texture'] = mask_texture,
        ['shirt'] = shirt,
        ['shirt_texture'] = shirt_texture,
        ['undershirt'] = undershirt,
        ['undershirt_texture'] = undershirt_texture,
        ['pants'] = pants,
        ['pants_texture'] = pants_texture,
        ['shoes'] = shoes,
        ['shoes_texture'] = shoes_texture,
        ['bags'] = bags,
        ['bags_texture'] = bags_texture,
        ['vest'] = vest,
        ['vest_texture'] = vest_texture,
        ['accessories'] = accessories,
        ['accessories_texture'] = accessories_texture,
        ['badges'] = badges,
        ['badges_texture'] = badges_texture,
        ['face'] = face, 
        ['arms'] = arms,
        ['arms_texture'] = arms_texture,
    }, function() end)
end)

RegisterServerEvent('clothingMenu:retrieveSavedClothesIDs')
AddEventHandler('clothingMenu:retrieveSavedClothesIDs', function()
    local _source = source
    local user_id = vRP.getUserId({source})
    MySQL.Async.fetchAll('SELECT id, name FROM saved_clothing WHERE user_id = @user_id', {['user_id'] = user_id}, function(result)
        TriggerClientEvent('clothingMenu:listClothes', _source, result)
    end)
end)

RegisterServerEvent('clothingMenu:deleteOutfit')
AddEventHandler('clothingMenu:deleteOutfit', function(id)
    MySQL.Sync.execute('DELETE FROM saved_clothing WHERE id = @id', {['id'] = id})
end)

RegisterServerEvent('clothingMenu:retrieveSavedClothing')
AddEventHandler('clothingMenu:retrieveSavedClothing', function(id)
    local _source = source
    local user_id = vRP.getUserId({source})
    local result = MySQL.Sync.fetchAll('SELECT * FROM saved_clothing WHERE user_id = @user_id AND id = @id', {['user_id'] = user_id, ['id'] = id})
    TriggerClientEvent('clothingMenu:setSavedClothes', _source, result[1].model, result[1].hat, result[1].hat_texture, result[1].glasses, result[1].glasses_texture, result[1].ear_accessories, result[1].ear_accessories_texture, result[1].watches, result[1].watches_texture, result[1].bracelets, result[1].bracelets_texture, result[1].mask, result[1].mask_texture, result[1].shirt, result[1].shirt_texture, result[1].undershirt, result[1].undershirt_texture, result[1].pants, result[1].pants_texture, result[1].shoes, result[1].shoes_texture, result[1].bags, result[1].bags_texture, result[1].vest, result[1].vest_texture, result[1].accessories, result[1].accessories_texture, result[1].badges, result[1].badges_texture, result[1].face, result[1].arms, result[1].arms_texture)
    
end)