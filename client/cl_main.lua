ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


IsInSpawnMenu = false

AddEventHandler('az_spawn:openMenu', function()
	OpenSpawnMenu()
end)

function StartSpawnRestriction()
	Citizen.CreateThread(function()
		while IsInSpawnMenu do
			Citizen.Wait(0)
            local playerPed = PlayerPedId()
			FreezeEntityPosition(playerPed, true)
			SetEntityVisible(playerPed, false)

			DisableControlAction(0, 214, true)
			DisableControlAction(0, 177, true)
			DisableControlAction(0, 179, true)
			DisableControlAction(0, 194, true)
			DisableControlAction(0, 202, true)
			DisableControlAction(0, 203, true)
			DisableControlAction(0, 256, true)
			DisableControlAction(0, 296, true)
			DisableControlAction(0, 297, true)

			if IsControlJustReleased(0, 38) then
				YesOrNo()
			end
		end
	end)
end

function YesOrNo()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('Sur_about_that'),
		align    = 'top-left',
		elements = {
			{label = _U('Yes'),           value = 'yes'},
			{label = _U('No'),            value = 'no'},
	}}, function(data, menu)
		local action = data.current.value

		if action == 'yes' then
				IsInSpawnMenu = false
				Citizen.Wait(0)
				ESX.UI.Menu.CloseAll()
				local playerPed = PlayerPedId()
				FreezeEntityPosition(playerPed, false)
				SetEntityVisible(playerPed, true)
        elseif action == 'no' then
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenSpawnMenu()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('Spawn_menu'),
		align    = 'top-left',
		elements = {
			{label = _U('cayo_perico'),           value = 'cayo_perico'},
			{label = _U('los_santos'),            value = 'los_santos'},
			{label = _U('blaine_country'),        value = 'blaine_country'},
	}}, function(data, menu)
		local action = data.current.value

		if action == 'cayo_perico' then
			OpenCayoMenu()
        elseif action == 'los_santos' then
            OpenLosSantosMenu()
        elseif action == 'blaine_country' then
            OpenBlaineMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenCayoMenu()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('cayo_perico'),
		align    = 'top-left',
		elements = {
			{label = _U('Spawn_1_cayo'),           value = 'Spawn_1_cayo'},
			{label = _U('Spawn_2_cayo'),           value = 'Spawn_2_cayo'},
			{label = _U('Spawn_3_cayo'),           value = 'Spawn_3_cayo'},
			{label = _U('Spawn_4_cayo'),           value = 'Spawn_4_cayo'},
            {label = _U('return'),                 value = 'return'},
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		if action == 'Spawn_1_cayo' then
			SetEntityCoords(playerPed, 4367.37, -4574.21, 4.21)
        elseif action == 'Spawn_2_cayo' then
            SetEntityCoords(playerPed, 5161.13, -4672.08, 1.44)
        elseif action == 'Spawn_3_cayo' then
            SetEntityCoords(playerPed, 5108.07, -5139.96, 1.93)
        elseif action == 'Spawn_4_cayo' then
            SetEntityCoords(playerPed, 5091.37, -5734.19, 15.77)
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenLosSantosMenu()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('los_santos'),
		align    = 'top-left',
		elements = {
			{label = _U('Spawn_1_ls'),           value = 'Spawn_1_ls'},
			{label = _U('Spawn_2_ls'),           value = 'Spawn_2_ls'},
			{label = _U('Spawn_3_ls'),           value = 'Spawn_3_ls'},
			{label = _U('Spawn_4_ls'),           value = 'Spawn_4_ls'},
			{label = _U('Gang_ls'),              value = 'Spawn_5_ls'},
            {label = _U('return'),               value = 'return'},
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		if action == 'Spawn_1_ls' then
			SetEntityCoords(playerPed, 320.66, -1627.05, 32.53)
        elseif action == 'Spawn_2_ls' then
            SetEntityCoords(playerPed, -60.15, -2503.91, 6.14)
        elseif action == 'Spawn_3_ls' then
            SetEntityCoords(playerPed, -636.85, -1077.85, 12.33)
        elseif action == 'Spawn_4_ls' then
            SetEntityCoords(playerPed, -643.63, 415.36, 101.17)
		elseif action == 'Spawn_5_ls' then
            OpenMenuSpawnGangls()
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenMenuSpawnGangls()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('Gang_ls'),
		align    = 'top-left',
		elements = {
			{label = _U('Families'),                 value = 'Spawn_1_gangls'},
			{label = _U('Vagos'),                    value = 'Spawn_2_gangls'},
			{label = _U('Ballas'),                   value = 'Spawn_3_gangls'},
			{label = _U('Blood'),                    value = 'Spawn_4_gangls'},
            {label = _U('return'),                   value = 'return'},
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		if action == 'Spawn_1_gangls' then
			SetEntityCoords(playerPed, -224.11, -1635.49, 33.59)
        elseif action == 'Spawn_2_gangls' then
            SetEntityCoords(playerPed, 323.99, -2113.11, 17.74)
        elseif action == 'Spawn_3_gangls' then
            SetEntityCoords(playerPed, 40.37, -1921.22, 21.65)
        elseif action == 'Spawn_4_gangls' then
            SetEntityCoords(playerPed, -1581.1, -435.65, 43.9)
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenBlaineMenu()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('blaine_country'),
		align    = 'top-left',
		elements = {
			{label = _U('grapeseed'),                value = 'Spawn_1_blaine'},
			{label = _U('sandy_shores'),              value = 'Spawn_2_blaine'},
			{label = _U('paleto_bay'),               value = 'Spawn_3_blaine'},
			{label = _U('Gang_blaine'),              value = 'Spawn_4_blaine'},
            {label = _U('return'),                   value = 'return'},
	}}, function(data, menu)
		local action = data.current.value

		if action == 'Spawn_1_blaine' then
			OpenGrapeseedMenu()
        elseif action == 'Spawn_2_blaine' then
            OpenMenuSandyShores()
        elseif action == 'Spawn_3_blaine' then
            OpenMenuPaleto()
        elseif action == 'Spawn_4_blaine' then
            OpenMenuSpawnGangblaine()
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end


function OpenMenuPaleto()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('Gang_ls'),
		align    = 'top-left',
		elements = {
			{label = _U('Spawn_1_paleto'),                    value = 'Spawn_1_paleto'},
			{label = _U('Spawn_2_paleto'),                    value = 'Spawn_2_paleto'},
			{label = _U('Spawn_3_paleto'),                    value = 'Spawn_3_paleto'},
            {label = _U('return'),                           value = 'return'},
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		if action == 'Spawn_1_paleto' then
			SetEntityCoords(playerPed, -150.29, 6422.34, 31.92)
        elseif action == 'Spawn_2_paleto' then
            SetEntityCoords(playerPed, 106.02, 6632.67, 31.7)
        elseif action == 'Spawn_3_paleto' then
            SetEntityCoords(playerPed, -219.54, 6574.32, 7.56)
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenMenuSandyShores()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('Gang_ls'),
		align    = 'top-left',
		elements = {
			{label = _U('Spawn_1_sandy'),                    value = 'Spawn_1_sandyshores'},
			{label = _U('Spawn_2_sandy'),                    value = 'Spawn_2_sandyshores'},
			{label = _U('Spawn_3_sandy'),                    value = 'Spawn_3_sandyshores'},
			{label = _U('Spawn_4_sandy'),                    value = 'Spawn_4_sandyshores'},
            {label = _U('return'),                           value = 'return'},
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		if action == 'Spawn_1_sandyshores' then
			SetEntityCoords(playerPed, 970.48, 3615.94, 32.64)
        elseif action == 'Spawn_2_sandyshores' then
            SetEntityCoords(playerPed, 1910.12, 3921.03, 32.4)
        elseif action == 'Spawn_3_sandyshores' then
            SetEntityCoords(playerPed, 1551.73, 3521.06, 35.99)
        elseif action == 'Spawn_4_sandyshores' then
            SetEntityCoords(playerPed, 2492.62, 3757.38, 41.99)
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenMenuSpawnGangblaine()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('Gang_ls'),
		align    = 'top-left',
		elements = {
			{label = _U('Nudist'),                 value = 'Spawn_1_gangblaine'},
			--{label = _U('Vagos'),                    value = 'Spawn_2_gangblaine'},
			--{label = _U('Ballas'),                   value = 'Spawn_3_gangblaine'},
			--{label = _U('Blood'),                    value = 'Spawn_4_gangblaine'},
            {label = _U('return'),                   value = 'return'},
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		if action == 'Spawn_1_gangblaine' then
			SetEntityCoords(playerPed, -1094.22, 4884.56, 215.69)
        elseif action == 'Spawn_2_gangblaine' then
            SetEntityCoords(playerPed, 323.99, -2113.11, 17.74)
        elseif action == 'Spawn_3_gangblaine' then
            SetEntityCoords(playerPed, 40.37, -1921.22, 21.65)
        elseif action == 'Spawn_4_gangblaine' then
            SetEntityCoords(playerPed, -1581.1, -435.65, 43.9)
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end

function OpenGrapeseedMenu()
    IsInSpawnMenu = true

    StartSpawnRestriction()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = _U('grapeseed'),
		align    = 'top-left',
		elements = {
			{label = _U('Spawn_1_grapeseed'),           value = 'Spawn_1_grapeseed'},
			{label = _U('Spawn_2_grapeseed'),           value = 'Spawn_2_grapeseed'},
			{label = _U('Spawn_3_grapeseed'),           value = 'Spawn_3_grapeseed'},
			{label = _U('Spawn_4_grapeseed'),           value = 'Spawn_4_grapeseed'},
            {label = _U('return'),                 value = 'return'},
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		if action == 'Spawn_1_grapeseed' then
			SetEntityCoords(playerPed, 1701.48, 4834.71, 41.99)
        elseif action == 'Spawn_2_grapeseed' then
            SetEntityCoords(playerPed, 2537.61, 4662.97, 34.08)
        elseif action == 'Spawn_3_grapeseed' then
            SetEntityCoords(playerPed, 2515.68, 4220.0, 39.92)
        elseif action == 'Spawn_4_grapeseed' then
            SetEntityCoords(playerPed, 2932.03, 4624.51, 48.72)
        elseif action == 'return' then
            ESX.UI.Menu.CloseAll()
			--SetEntityCoords(playerPed, -446.9, -2807.77, 6.3)
            OpenSpawnMenu()
        end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'reseller_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
	end)
end