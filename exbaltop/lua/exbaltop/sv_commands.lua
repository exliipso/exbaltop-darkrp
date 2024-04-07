include("exbaltop/sv_database.lua") 
util.AddNetworkString("exBaltop_Display")

 



hook.Add("DarkRPFinishedLoading", "exBaltop_RegisterCommands", function()
   
    local commandCooldowns = {}


    local cooldownDuration = 10

    DarkRP.defineChatCommand("baltop", function(ply)
        local plySteamID = ply:SteamID() 

        
        if commandCooldowns[plySteamID] and commandCooldowns[plySteamID] > CurTime() then
  
            local remainingTime = math.ceil(commandCooldowns[plySteamID] - CurTime())
            DarkRP.notify(ply, 1, 4, "Please wait " .. remainingTime .. " more seconds before using /baltop again.")
            return ""
        end

       
        commandCooldowns[plySteamID] = CurTime() + cooldownDuration

        getTopPlayerBalances(function(topBalances)
            if topBalances and #topBalances > 0 then
                net.Start("exBaltop_Display")
                net.WriteTable(topBalances)
                net.WriteInt(exBaltopConfig.DisplayCount, 32)
                net.WriteColor(exBaltopConfig.Colors.Header)
                net.WriteColor(exBaltopConfig.Colors.Rank)
                net.WriteColor(exBaltopConfig.Colors.Name)
                net.WriteColor(exBaltopConfig.Colors.Money) 
                net.WriteColor(exBaltopConfig.Colors.Border)  
                net.WriteBool(exBaltopConfig.BorderEnabled)  
                net.WriteString(exBaltopConfig.BorderCharacter)  
                net.WriteInt(exBaltopConfig.BorderLength, 32)  
                net.Send(ply)
            else
                DarkRP.notify(ply, 1, 4, "No data available.")
            end
        end)
        
        return ""
    end)
end)

