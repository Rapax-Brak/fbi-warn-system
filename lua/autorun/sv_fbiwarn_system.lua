function InitializePlayerData(ply)
	// Check if the PData doesn't exist
	if (ply:GetPData("Warnings") == nil) then
        // Create the PData and NWInt
		ply:SetPData("Warnings", 0)
		ply:SetNWInt("Warnings", 0)
	// Else, if it does exist..
	else
		// Just create the NWInt
        ply:SetNWInt("Warnings", ply:GetPData("Warnings"))
	end
end
hook.Add("PlayerInitialSpawn", "InitializePlayerData", InitializePlayerData)

function SaveDisconnectedPlayerData(ply)
	// Update the player's warn PData
    ply:SetPData("Warnings", ply:GetNWInt("Warnings"))
end
hook.Add("PlayerDisconnected", "SaveDisconnectedPlayerData", SaveDisconnectedPlayerData)

function SaveAllPlayerData(ply)
	// Loop through every player
	for k, v in pairs(player.GetAll()) do
		// Update their level and xp PData
        v:SetPData("Warnings", v:GetNWInt("Warnings"))
	end
end
hook.Add("ShutDown", "SaveAllPlayerData", SaveAllPlayerData)