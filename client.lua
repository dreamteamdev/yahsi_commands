RegisterCommand("dv", function()
    local playerPed = PlayerPedId()
    local vehicle   = GetVehiclePedIsIn(playerPed, false)

    if IsPedInAnyVehicle(playerPed, true) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    end

    if DoesEntityExist(vehicle) then
        DeleteVehicle(vehicle)
    end
end)

RegisterCommand("dh", function()
    local playerPed = PlayerPedId()
    local mount   = GetMount(PlayerPedId())

    if IsPedOnMount(playerPed) then
        DeleteEntity(mount)
    end

end)

RegisterNetEvent('yahsi:heal')
AddEventHandler('yahsi:heal', function(id)
    local closestPlayerPed = GetPlayerPed(id)
    print(closestPlayerPed)
    local health = GetAttributeCoreValue(closestPlayerPed, 0)
    local newHealth = health + 100
    local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
    local newStamina = stamina + 100
    local health2 = GetEntityHealth(closestPlayerPed)
    local newHealth2 = health2 + 100
    Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth)
    Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina)
    SetEntityHealth(closestPlayerPed, newHealth2)
end)

RegisterNetEvent('yahsi:godmode')
AddEventHandler('yahsi:godmode', function(id)
    god = GetPlayerInvincible(id)
    if god == false then 
        SetPlayerInvincible(id, true)
    else
        SetPlayerInvincible(id, false)
    end
    god2 = GetPlayerInvincible(id)
    print(god2)
end)

RegisterNetEvent('yahsi:tpm')
AddEventHandler('yahsi:tpm', function(source)
    local playerped = GetPlayerPed(source)
    local waypt = GetWaypointCoords()
     for height = 1, 1000 do
        SetEntityCoords(playerped, waypt.x, waypt.y, height + 0.0, true, true, true, false)
        local foundGround, zPos = GetGroundZAndNormalFor_3dCoord(waypt.x, waypt.y, height + 0.0)
        if foundGround then
            SetEntityCoords(playerped, waypt.x, waypt.y, height + 0.0, true, true, true, false)
            break
        end
        Citizen.Wait(5)
    end 
end)

RegisterNetEvent('yahsi:showjob')
AddEventHandler('yahsi:showjob', function(job)
    TriggerEvent("vorp:TipBottom", 'your job title is : '..job, 4000)

end)
