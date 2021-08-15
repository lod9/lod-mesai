ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterCommand("mesai", function(source, args)
    SetDisplay(not display)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end



RegisterNUICallback("mesaigir", function(data)
  local player = PlayerPedId()
  local job = ESX.PlayerData.job.name

  if job == 'police' or job == 'ambulance' or job == 'sheriff' then
      exports['mythic_notify']:SendAlert('error', 'Zaten mesaidesin!', 3000)
      return
  end

  if job == 'offpolice' or job == 'offambulance' or job == 'offsheriff' then
      local playercoords = GetEntityCoords(player)
      local job = string.sub(job, 4)
          TriggerServerEvent('lodmesai:mesaigir')
  end
end)

-- ###########################################
RegisterNUICallback("mesaicik", function(data)
  local player = PlayerPedId()
  local job = ESX.PlayerData.job.name

  if job == 'offpolice' or job == 'offambulance' or job == 'offsheriff' then
      exports['mythic_notify']:SendAlert('error', 'Zaten mesaide değilsin!', 3000)
      return
  end

  if job == 'police' or job == 'ambulance' or job == 'sheriff' then
      local playercoords = GetEntityCoords(player)
          TriggerServerEvent('lodmesai:mesaicik')
  end
end)
-- ###########################################

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
  end)
  -- ###########################################

  RegisterNUICallback("kayıtet", function(data)
    exports['mythic_notify']:SendAlert('error', 'Zaten mesaide değilsin!', 3000)
  end)