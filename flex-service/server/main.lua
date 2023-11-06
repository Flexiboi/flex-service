local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add(Config.commando , Lang:t('command.service'), {{name = "id", help = Lang:t('command.id'), name = "amount", help = Lang:t('command.amount')}}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" then
        local targetId = tonumber(args[1])
        local amount = tonumber(args[2])
        local Target = QBCore.Functions.GetPlayer(targetId)
        if targetId ~= nil then
            if amount ~= nil and amount > 0 then
                TriggerClientEvent("flex-service:client:startservice", targetId, amount, true)
                Target.Functions.SetMetaData("tracker", true)
                TriggerClientEvent('police:client:SetTracker', targetId, true)
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("command.filltaskamount"), "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("command.fillallfield"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.nopolice"), "error")
    end
end)

QBCore.Commands.Add(Config.endcommando , Lang:t('command.service'), {{name = "id", help = Lang:t('command.id')}}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" then
        local targetId = tonumber(args[1])
        if targetId ~= nil then
            TriggerClientEvent('flex-service:client:stopservice', targetId)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("command.fillallfield"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.nopolice"), "error")
    end
end)

RegisterNetEvent('flex-service:server:jobDone', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("tracker", false)
    TriggerClientEvent('police:client:SetTracker', src, false)
    TriggerClientEvent("illenium-appearance:client:reloadSkin", source)
end)
