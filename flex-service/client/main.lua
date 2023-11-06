local QBCore = exports['qb-core']:GetCoreObject()
local startedtask, randompos, todo, stunned, doingtask = false, vector3(0, 0, 0), 0, false, false
local sleep = 1
local calledpolice = false
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('flex-service:client:startservice', function(amount, state)
    calledpolice = false
    local id = math.random(1, #Config.tasks)
    DoScreenFadeOut(1250)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    local ped = PlayerPedId()
    startedtask = state
    randompos = Config.tasks[id].locations[math.random(1, #Config.tasks[id].locations)]
    todo = tonumber(amount)
    QBCore.Functions.Notify(Lang:t("error.started", {value = todo}), 'error', 5000)
    SetEntityCoordsNoOffset(ped, randompos.x, randompos.y, randompos.z, false, false, false, true)
    DoScreenFadeIn(1250)
    CreateThread(function()
        while true do
            Citizen.Wait(sleep)
            if startedtask then
                local pos = GetEntityCoords(ped)
                local takeloc = #(randompos - pos)
                if takeloc < 80 and not doingtask then
                    DrawMarker(27, randompos.x, randompos.y, randompos.z-0.9, 0, 0, 0, 0.0, 0, 0, 1.0, 1.0, 1.0, Config.markercolor.r, Config.markercolor.g, Config.markercolor.b, 120, false, true, 2, false, nil, nil, false)
                    QBCore.Functions.DrawText3D(randompos.x, randompos.y, randompos.z, '[~o~E~w~] '..Config.tasks[id].text3d)
                    if takeloc < 2 then
                        if IsControlJustReleased(0, 38) then
                            calledpolice = false
                            doingtask = true
                            if Config.tasks[id].anim.type == 'broom' then
                                if math.random(1, 100) <= 50 then
                                    SetPedCanPlayAmbientAnims(ped, true) 
                                    TaskStartScenarioInPlace(ped, Config.tasks[id].anim.scenario, 0, false)
                                elseif Config.tasks[id].anim.animDic ~= nil then
                                    loadAnimDict(Config.tasks[id].anim.animDic)
                                    TaskPlayAnim(ped, Config.tasks[id].anim.animDic, Config.tasks[id].anim.animation, 2.0, 2.0, -1, 51, 0, false, false, false)    
                                    broom = CreateObject(joaat(Config.tasks[id].anim.prop), pos.x, pos.y, pos.z + 0.2, true, true, true)
                                    SetEntityCollision(broom, false, false)
                                    AttachEntityToEntity(broom, ped, GetPedBoneIndex(ped, 28422), -0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0, true, true, false, true, 1, true)    
                                else
                                    SetPedCanPlayAmbientAnims(ped, true) 
                                    TaskStartScenarioInPlace(ped, Config.tasks[id].anim.scenario, 0, false)
                                end
                                QBCore.Functions.Progressbar("dotask", Config.tasks[id].progresstext, Config.tasks[id].tasktime * 1000, false, true, {
                                    disableMovement = false,
                                    disableCarMovement = false,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = nil,
                                    anim = nil,
                                    flags = 0,
                                    task = nil,
                                }, {}, {},function()
                                    ClearPedTasks(ped)
                                    local broom = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey('prop_tool_broom'), false, true ,true)
                                    if DoesEntityExist(broom) then
                                        SetEntityAsMissionEntity(broom, false, false)
                                        DeleteObject(broom)
                                    end
                                    if todo > 0 then
                                        todo = todo - 1
                                        newrandomloc = Config.tasks[id].locations[math.random(1, #Config.tasks[id].locations)]
                                        while newrandomloc == randompos do
                                            newrandomloc = Config.tasks[id].locations[math.random(1, #Config.tasks[id].locations)]
                                            Wait(1)
                                        end
                                        randompos = newrandomloc
                                        if todo <= 0 then
                                            jobdone()
                                        else
                                            QBCore.Functions.Notify(Lang:t("error.todo", {value = todo}), 'error', 5000)
                                        end
                                    end
                                    doingtask = false
                                end, function()
                                    ClearPedTasks(ped)
                                    QBCore.Functions.Notify(Lang:t("error.canceled"), "error", 4500)
                                end)  
                            elseif Config.tasks[id].anim.type == 'clean' then
                                SetPedCanPlayAmbientAnims(ped, true) 
                                TaskStartScenarioInPlace(ped, Config.tasks[id].anim.scenario, 0, false)
                                QBCore.Functions.Progressbar("dotask", Config.tasks[id].progresstext, Config.tasks[id].tasktime * 1000, false, true, {
                                    disableMovement = false,
                                    disableCarMovement = false,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = nil,
                                    anim = nil,
                                    flags = 0,
                                    task = nil,
                                }, {}, {},function()
                                    doingtask = false
                                    ClearPedTasks(ped)
                                    if todo > 0 then
                                        todo = todo - 1
                                        newrandomloc = Config.tasks[id].locations[math.random(1, #Config.tasks[id].locations)]
                                        while newrandomloc == randompos do
                                            newrandomloc = Config.tasks[id].locations[math.random(1, #Config.tasks[id].locations)]
                                            Wait(1)
                                        end
                                        randompos = newrandomloc
                                        if todo <= 0 then
                                            jobdone()
                                        else
                                            QBCore.Functions.Notify(Lang:t("error.todo", {value = todo}), 'error', 5000)
                                        end
                                    end
                                end, function()
                                    doingtask = false
                                    ClearPedTasks(ped)
                                    QBCore.Functions.Notify(Lang:t("error.canceled"), "error", 4500)
                                end)    
                            elseif Config.tasks[id].anim.type == 'box' then
                                loadAnimDict(Config.tasks[id].anim.animDic)
                                TaskPlayAnim(ped, Config.tasks[id].anim.animDic, Config.tasks[id].anim.animation, 2.0, 2.0, -1, 51, 0, false, false, false)
                                pickupprop = CreateObject(joaat(Config.tasks[id].anim.prop), pos.x, pos.y, pos.z + 0.2, true, true, true)
                                SetEntityCollision(pickupprop, false, false)
                                AttachEntityToEntity(pickupprop, ped, GetPedBoneIndex(ped, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
                                deliverbox(id)
                            end
                        end
                    end
                elseif takeloc > Config.chockdistance then
                    if not calledpolice then
                        calledpolice = true
                        exports['ps-dispatch']:AvoidTask()
                    end
                    -- if not IsEntityPlayingAnim(ped, "stungun@standing", "damage", 3 ) and not stunned then
                    --     sleep = 5000
                    --     stunned = true
                    --     local healt = GetEntityHealth(ped)
                    --     loadAnimDict("stungun@standing") 
                    --     TaskPlayAnim(ped, "stungun@standing", "damage", 8.0, 1.0, 10000, 1, 0, false, false, false)
                    --     ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                    --     SetPedToRagdollWithFall(ped, 1500, 2000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                    --     local n = math.floor(healt-Config.checkdamage)
                    --     SetEntityHealth(ped,n)
                    --     todo = todo + Config.addtasks
                    --     QBCore.Functions.Notify(Lang:t("error.no", {value = todo}), 'error', 5000)
                    --     Citizen.SetTimeout(6000, function()
                    --         ClearPedTasks(ped)
                    --         stunned = false
                    --         sleep = 1
                    --     end)
                    -- end
                end
            else
                break
            end
        end
    end)
end)

function deliverbox(id)
    CreateThread(function()
        while true do
            Citizen.Wait(1)
            if hasbox then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local loc = Config.tasks[id].droploc
                local droploc = #(loc - pos)
                if droploc < 45 then
                    DrawMarker(27, loc.x, loc.y, loc.z-0.9, 0, 0, 0, 0.0, 0, 0, 1.0, 1.0, 1.0, Config.markercolor.r, Config.markercolor.g, Config.markercolor.b, 217, false, true, 2, false, nil, nil, false)
                    QBCore.Functions.DrawText3D(loc.x, loc.y, loc.z, '[~o~E~w~] '..Lang:t("info.deliverbox"))
                    if droploc < 2 then
                        if IsControlJustReleased(0, 38) then
                            QBCore.Functions.Progressbar("dotask", Config.tasks[id].progresstext, Config.tasks[id].tasktime * 1000, false, true, {
                                disableMovement = false,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_ped",
                                flags = 0,
                                task = nil,
                            }, {}, {},function()
                                doingtask = false
                                ClearPedTasks(ped)
                                local box = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey( Config.tasks[id].anim.prop), false, true ,true)
                                if DoesEntityExist(box) then
                                    SetEntityAsMissionEntity(box, false, false)
                                    DeleteObject(box)
                                end
                                if todo > 0 then
                                    todo = todo - 1
                                    newrandomloc = Config.tasks[id].locations[math.random(1, #Config.tasks[id].locations)]
                                    if #Config.tasks[id].locations > 1 then
                                        while newrandomloc == randompos do
                                            newrandomloc = Config.tasks[id].locations[math.random(1, #Config.tasks[id].locations)]
                                            Wait(1)
                                        end
                                    end
                                    randompos = newrandomloc
                                    if todo <= 0 then
                                        jobdone()
                                    else
                                        QBCore.Functions.Notify(Lang:t("error.todo", {value = todo}), 'error', 5000)
                                    end
                                end
                            end, function()
                                doingtask = false
                                ClearPedTasks(ped)
                                QBCore.Functions.Notify(Lang:t("error.canceled"), "error", 4500)
                            end)
                        end
                    end
                end
            else
                break
            end
        end
    end)
end

RegisterNetEvent('flex-service:client:stopservice', function()
    jobdone()
end)

function jobdone()
    DoScreenFadeOut(1250)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    local ped = PlayerPedId()
    QBCore.Functions.Notify(Lang:t("success.taskdone"), 'success', 5000)
    startedtask = false
    TriggerServerEvent('flex-service:server:jobDone')
    SetEntityCoordsNoOffset(ped, Config.policestation.x, Config.policestation.y, Config.policestation.z, false, false, false, true)
    DoScreenFadeIn(1250)
end
