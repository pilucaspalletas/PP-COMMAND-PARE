ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local isTeleporting = false

RegisterCommand('pare', function(source, args, rawCommand)
    if not isTeleporting then
        isTeleporting = true
        ESX.ShowNotification('Teletransportando en 5 segundos...')

        Citizen.SetTimeout(5000, function()
            if isTeleporting then
                local x = -456.0490
                local y = -619.0244
                local z = 31.1745
                
                SetEntityCoords(GetPlayerPed(-1), x, y, z, 0, 0, 0, false)
                ESX.ShowNotification('¡Te has teletransportado al pare!')
                isTeleporting = false
            end
        end)
    else
        ESX.ShowNotification('Ya estás siendo teletransportado.')
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if isTeleporting then
            local ped = PlayerPedId()
            if not IsPedStill(ped) then
                ESX.ShowNotification('El tp ha sido cancelado por haberte movido')
                isTeleporting = false
            end
        end
    end
end)

print("discord.gg/ppshop")
