local esx = nil
Citizen.CreateThread(function()
    while esx == nil do
        TriggerEvent('esx:getSharedObject', function(obj) esx = obj end)
        Citizen.Wait(0)
    end
end)
local playerVehicle = nil
local playerBlip = nil

local function removeVehicleBlip()
    if playerBlip and DoesBlipExist(playerBlip) then
        RemoveBlip(playerBlip)
    end
    playerBlip = nil
end

local function createVehicleBlip(vehicle)
    if not DoesEntityExist(vehicle) then
        return
    end
--config blips
    if not DoesBlipExist(playerBlip) then
        playerBlip = AddBlipForEntity(vehicle)
        SetBlipSprite(playerBlip, 9) -- Ícone de radar
        SetBlipColour(playerBlip, 5) -- Cor amarela
        SetBlipScale(playerBlip, 0.8) -- Tamanho do blip
        SetBlipAsShortRange(playerBlip, false) -- Blip visível em qualquer distância que esteja.
        BeginTextCommandSetBlipName("STRING")
        EndTextCommandSetBlipName(playerBlip)
    end
end

local function isPlayerOwnedVehicle(vehicle)
    if not DoesEntityExist(vehicle) then
        return false
    end

    local owner = NetworkGetEntityOwner(vehicle)
    if owner == GetPlayerServerId(PlayerId()) then
        return true
    end

    local playerPed = PlayerPedId()
    return GetPedInVehicleSeat(vehicle, -1) == playerPed
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)

        local playerPed = PlayerPedId()
        local currentVehicle = nil

        if IsPedInAnyVehicle(playerPed, false) then
            currentVehicle = GetVehiclePedIsIn(playerPed, false)
        else
            currentVehicle = GetVehiclePedIsIn(playerPed, true)
        end

        if DoesEntityExist(currentVehicle) and isPlayerOwnedVehicle(currentVehicle) then
            if currentVehicle ~= playerVehicle then
                playerVehicle = currentVehicle
                removeVehicleBlip()
            end
            createVehicleBlip(currentVehicle)
        else
            playerVehicle = nil
            removeVehicleBlip()
        end
    end
end)



