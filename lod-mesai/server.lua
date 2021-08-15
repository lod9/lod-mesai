ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('lodmesai:mesaigir')
AddEventHandler('lodmesai:mesaigir', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade

    if job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'Mesaiye girdin!'})
        TriggerEvent('m3:dispatch:client:onDuty', src)
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'Mesaiye girdin!'})
    elseif job == 'offsheriff' then
        xPlayer.setJob('sheriff', grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'Mesaiye girdin!'})
        TriggerEvent('m3:dispatch:client:onDuty', src)
    end
end)
RegisterServerEvent('lodmesai:mesaicik')
AddEventHandler('lodmesai:mesaicik', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade

    if job == 'offpolice' or job == 'offambulance' or job == 'offsheriff' then 
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Zaten mesaide değilsin!'})
        return
    end

    if job == 'police' or job == 'ambulance' or job == 'sheriff' then
        xPlayer.setJob('off'..job, grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'Mesaiden çıktın!'})
    end
end)

AddEventHandler('esx:playerLoaded', function(source)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade

    if job == 'police' or job == 'ambulance' or job == 'sheriff' then
        xPlayer.setJob('off'..job, grade)
    end
end)