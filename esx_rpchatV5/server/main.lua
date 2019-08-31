--[[

  ESX RP Chat

--]]

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			permission_level = identity['permission_level']
		}
	else
		return nil
	end
end

AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
    
        local playerName = GetPlayerName(source)
        local name = getIdentity(source)

        if name.permission_level == 4 then
            ooc = "[STAFF](OOC) " .. name.firstname 
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-color: rgba(28, 160, 242, 0.6); border-style: solid; border-width: thin; border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
                args = { ooc, message }
            })
        elseif name.permission_level == 3 then
            ooc = "[ADMIN](OOC) " .. name.firstname
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-color: rgba(28, 160, 242, 0.6); border-style: solid; border-width: thin; border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
                args = { ooc, message }
            })
        elseif name.permission_level == 2 then
            ooc = "[MODO](OOC) " .. name.firstname
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-color: rgba(28, 160, 242, 0.6); border-style: solid; border-width: thin; border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
                args = { ooc, message }
            })
        elseif name.permission_level == 1 then
            ooc = "[HELP](OOC) " .. name.firstname
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-color: rgba(28, 160, 242, 0.6); border-style: solid; border-width: thin; border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
                args = { ooc, message }
            })       
        elseif  name.permission_level == 0 then
            ooc = "(OOC) " .. name.firstname
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
                args = { ooc, message }
            })
        end
      end
      CancelEvent()
end)



  -- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  --    local name = getIdentity(source)
  --    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 



  --- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  ---    local name = getIdentity(source)
  ---    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 
  RegisterCommand('me', function(source, args, rawCommand)
    local name = getIdentity(source)
    local msg = rawCommand:sub(3)
    TriggerClientEvent('sendProximityMessageMe', -1, source, name.firstname, msg)
end)

 RegisterCommand('twt', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })
end, false)

 RegisterCommand('ano', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 4, 0, 1); border-radius: 3px;"><i class="fas fa-globe"></i> Anonyme :<br> {1}</div>',
        args = { fal, msg }
    })
end, false)
--------------tout les metiers disponibles ^^ --------------------------------

 RegisterCommand('0', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Code Noir :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

 RegisterCommand('1', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(81, 0, 252, 1); border-radius: 3px;"><i class="fas fa-ad"></i>LSPD :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

  RegisterCommand('2', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(240, 0, 66, 1); border-radius: 3px;"><i class="fas fa-ad"></i>LSMD :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

  RegisterCommand('3', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(140, 140, 83, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Mécanos :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('4', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(189, 140, 83, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Le Concessionnaire :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

        RegisterCommand('5', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(252, 206, 83, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Taxis :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('6', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(161, 23, 255, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Vignerons :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('7', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 64, 63, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Armurier :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)         

    RegisterCommand('8', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 197, 230, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Le Weazel News :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)    
 
    RegisterCommand('9', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(176, 62, 115, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Unicorn :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('10', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(176, 62, 115, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Night Club :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('11', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(176, 62, 115, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Bahamas :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('12', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(176, 62, 115, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Tequi-la-la :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)      

    RegisterCommand('13', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(205, 251, 115, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Postal :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false) 

-----------------------------------------------------les messages des gangs-----------------------------------------------------------------------




  RegisterCommand('A1', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Le Cartel :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('A2', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Cartel de Sinaloa :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

        RegisterCommand('A3', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Cartel de la Famillia :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

  RegisterCommand('B2', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Bikers :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

   RegisterCommand('B3', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>The Bandidos :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

      RegisterCommand('B4', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>The Hells Angels :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

      RegisterCommand('B5', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>The Cossacks :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

            RegisterCommand('B6', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>The Outlaws :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

            RegisterCommand('B6', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>The Mongols :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

            RegisterCommand('B7', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>The Sons of Silence :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)    
    RegisterCommand('B8', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Devil Lost :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)
    RegisterCommand('C3', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Famillies :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('D4', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Bloods :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('E5', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Crips :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('F6', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Ballas :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)         

    RegisterCommand('G7', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>La Mafia :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)    
 
    RegisterCommand('H8', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Whites :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('I9', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)	
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Ms13 :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('J10', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)	
    fal = name.firstname .. " " .. name.lastname	
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Les Vagos :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

    RegisterCommand('Deepweb', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(9)
    local name = getIdentity(source)	
    fal = name.firstname .. " " .. name.lastname	
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 4, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i>Darkweb :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/911" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^6 911 - " .. name, { 128, 128, 128 }, string.sub(msg,5))
	end
end)

 RegisterCommand('wanted', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(8)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(140, 140, 83, 1); border-radius: 3px;"></i>Wanted :<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

--RegisterCommand('ooc', function(source, args, rawCommand)
  --if source == 0 then
    --print('esx_rpchatV5: you CancelEvent\'t use this command from rcon!')
    --return
  --end

  --args = table.concat(args, ' ')
  --local name = GetPlayerName(source)
  --if Config.EnableESXIdentity then name = GetCharacterName(source) end

  --TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), args }, color = { 171, 171, 171 } })
  --print(('CHAT: %s: %s'):format(name, args))
--end, false)


function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
