RegisterNetEvent('crtxhouserobbery:joinInstance')
AddEventHandler('crtxhouserobbery:joinInstance', function(bucket)
    _source = source
    SetPlayerRoutingBucket(_source, bucket)
end)

RegisterNetEvent('crtxhouserobbery:leaveInstance')
AddEventHandler('crtxhouserobbery:leaveInstance', function()
    _source = source
    SetPlayerRoutingBucket(_source, 0)
end)

RegisterNetEvent('crtxhouserobbery:stoleItems')
AddEventHandler('crtxhouserobbery:stoleItems', function()
    _source = source
    if GetPlayerRoutingBucket(_source) ~= 0 then
        local items = math.random(1, 3)
        local chance = math.random(0, 100)
        if chance < 40 and exports.ox_inventory:CanCarryItem(_source, 'cola', items) then
            exports.ox_inventory:AddItem(_source, 'cola', items)
        elseif chance >= 40 and chance < 55 and exports.ox_inventory:CanCarryItem(_source, 'radio', 1) then
            exports.ox_inventory:AddItem(_source, 'radio', 1)
        elseif chance >= 55 and chance < 70 and exports.ox_inventory:CanCarryItem(_source, 'burger', items) then
            exports.ox_inventory:AddItem(_source, 'burger', items)
        elseif chance >= 70 and chance < 85 and exports.ox_inventory:CanCarryItem(_source, 'phone', 1) then
            exports.ox_inventory:AddItem(_source, 'phone', 1)
        elseif chance >= 85 and chance < 95 and exports.ox_inventory:CanCarryItem(_source, 'WEAPON_PISTOL', 1) then
            exports.ox_inventory:AddItem(_source, 'WEAPON_PISTOL', 1)
        elseif chance >= 95 and chance <= 100 and exports.ox_inventory:CanCarryItem(_source, 'WEAPON_SAWNOFFSHOTGUN', 1) then
            exports.ox_inventory:AddItem(_source, 'WEAPON_SAWNOFFSHOTGUN', 1)
        end
    else
        DropPlayer("bye cheater")
        TriggerServerEvent('crtx_cheater:Cheater', GetPlayerName(PlayerId()),amount)
		return
    end
end)

RegisterServerEvent('crtx_cheater:Cheater',function(player,distance)
    local license = "Unavailable"
    local discord = "Unavailable"
    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          discord = v
        end
    end
    local embed = {
        {
            ["color"] = 15548997,
            ["title"] = 'POSSIBLE CHEATER',
            ["description"] = 'Player ** ['..source..'] '..player..'** tried to use the trigger \nLicense: '..license..'\nDiscord: '..discord,
            ["footer"] = {
                ["text"] = "CRTX TEAM"
            }
        }
    }
    PerformHttpRequest("webhook", function(err, text, headers) end, "POST",json.encode({username = "CRTX",embeds = embed,avatar_url = "https://cdn.discordapp.com/icons/1021850426305413212/34fd79a74b2fb266f1987f2b340cec0f.png?size=1024"}),{["Content-Type"] = "application/json"})
end)

RegisterNetEvent('crtxhouserobbery:removeLockpick')
AddEventHandler('crtxhouserobbery:removeLockpick', function()
    _source = source
    exports.ox_inventory:RemoveItem(_source, 'lockpick', 1)
end)
