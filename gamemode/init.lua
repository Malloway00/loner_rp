AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function GM:PlayerInitialSpawn(ply)
    ply:SetNWInt("cash", 500)
end

hook.Add("PlayerSay", "CheckBalance", function(ply, text)
    if text == "!balance" then
        ply:ChatPrint("Current balance: $" .. ply:GetNWInt("cash"))
        return ""
    end
end)
