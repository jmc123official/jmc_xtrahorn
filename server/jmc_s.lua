

RegisterNetEvent('jmc_xtrahorn:PlayHorn')
AddEventHandler('jmc_xtrahorn:PlayHorn', function(maxDistance, soundFile, soundVolume, action)
    local src = source
    local DistanceLimit = 300
    if maxDistance < DistanceLimit then
	TriggerClientEvent('jmc_xtrahorn:PlayHorn', -1, GetEntityCoords(GetPlayerPed(src)), maxDistance, soundFile, soundVolume, action)
    end
end)