ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem(Config.itemtest, function(source)
	TriggerClientEvent('az_spawn:openMenu', source)
end)