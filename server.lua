local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


RegisterCommand("hp", function(source, args)    
    if args ~= nil then
  local User = VorpCore.getUser(source)
  local group = User.getGroup
  local id =  args[1]
    if group == "admin" or "superadmin" then
      TriggerClientEvent('yahsi:heal', id)
    else return false
    end
   end
  end)

  RegisterCommand("god", function(source, args)    
    if args ~= nil then
  local User = VorpCore.getUser(source)
  local group = User.getGroup
  local id =  args[1]
    if group == "admin" or "superadmin" then
      TriggerClientEvent('yahsi:godmode', id)
    else return false
    end
   end
  end)

  RegisterCommand("res", function(source, args)    
    if args ~= nil then
  local User = VorpCore.getUser(source)
  local group = User.getGroup
  local id =  args[1]
    if group == "admin" or "superadmin" then
      TriggerClientEvent('vorp:resurrectPlayer', id)
    else return false
    end
   end
  end)

  RegisterCommand("givecash", function(source, args)  
    if args ~= nil then
  local User = VorpCore.getUser(source)
  print(source)
  local group = User.getGroup
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" or "superadmin" then
      Character.addCurrency(0, cash)
    else return false
    end
   end
  end)

  RegisterCommand("givegold", function(source, args)  
    if args ~= nil then
  local User = VorpCore.getUser(source)
  print(source)
  local group = User.getGroup
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" or "superadmin" then
      Character.addCurrency(1, cash)
    else return false
    end
   end
  end)

  RegisterCommand("giveitem", function(source, args) 
    if args ~= nil then
  local User = VorpCore.getUser(source)
  print(source)
  local group = User.getGroup
  local id =  args[1]
  local item =  args[2]
  local count =  args[3]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" or "superadmin" then
      VorpInv.addItem(id, item, count)
    else return false
    end
   end
  end)

  RegisterCommand("takecash", function(source, args)    
    if args ~= nil then
  local User = VorpCore.getUser(source)
  print(source)
  local group = User.getGroup
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" or "superadmin" then
      Character.removeCurrency(0, cash)
    else return false
    end
   end
  end)

  RegisterCommand("takegold", function(source, args)    
    if args ~= nil then
  local User = VorpCore.getUser(source)
  print(source)
  local group = User.getGroup
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" or "superadmin" then
      Character.removeCurrency(1, cash)
    else return false
    end
   end
  end)

  RegisterCommand("tpm", function(source, args)
  local User = VorpCore.getUser(source)
  local group = User.getGroup
   if group == "admin" or "superadmin" then
      TriggerClientEvent('yahsi:tpm', source)
    else return false
   end
  end)

  RegisterCommand("setjob", function(source, args)    
    if args ~= nil then
  local User = VorpCore.getUser(source) 
  local group = User.getGroup 
  local id =  args[1]
  local job =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter
    if group == "admin" or "superadmin" then
      Character.setJob(job)
    else return false
    end
   end
  end)

  RegisterCommand("showjob", function(source, args)
    local Character = VorpCore.getUser(source).getUsedCharacter
    local job = Character.job
        TriggerClientEvent('yahsi:showjob', source, job)

    end)
