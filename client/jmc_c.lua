local DefaultVolume = 1.0
local hasPlayerLoaded = false
Citizen.CreateThread(function()
	Wait(15000)
	hasPlayerLoaded = true
end)

RegisterNetEvent('jmc_xtrahorn:PlayHorn')
AddEventHandler('jmc_xtrahorn:PlayHorn', function(otherPlayerCoords, maxDistance, soundFile, soundVolume, action)
	if hasPlayerLoaded then
		local myCoords = GetEntityCoords(PlayerPedId())
		local distance = #(myCoords - otherPlayerCoords)

		if distance < maxDistance then
			SendNUIMessage({
				transactionType = action,
				transactionFile  = soundFile,
				transactionVolume = soundVolume or DefaultVolume
			})
		end
	end
end)
function vehicleType(using)
    local cars = Config.Vehicles
  
    for i=1, #cars, 1 do
      if IsVehicleModel(using, GetHashKey(cars[i])) then
        return true
      end
    end
    return false
end

Citizen.CreateThread(function()
    local isHornPlaying = false
    while true do
        Citizen.Wait(0)

        if IsControlPressed(1, Config.Key) then 
            if not isHornPlaying and vehicleType(GetVehiclePedIsUsing(GetPlayerPed(-1))) then
                isHornPlaying = true
                TriggerServerEvent("jmc_xtrahorn:PlayHorn", 30.0, "horn", 0.6, "playSound")
            end
        end

        if IsControlReleased(1, Config.Key) and isHornPlaying then 
            isHornPlaying = false
            TriggerServerEvent("jmc_xtrahorn:PlayHorn", 30.0, "horn", 0.0, "stopSound")
        end
    end
end)
