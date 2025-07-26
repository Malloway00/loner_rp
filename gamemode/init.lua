AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("change_job")
util.AddNetworkString("open_npc_menu")

local function loadPlayerData(ply)
    local path = "loner_rp/" .. ply:SteamID64() .. ".txt"
    if file.Exists(path, "DATA") then
        local tbl = util.JSONToTable(file.Read(path, "DATA")) or {}
        ply:SetMoney(tbl.money or 500)
        ply:SetJob(tbl.job or "citizen")
    else
        ply:SetMoney(500)
        ply:SetJob("citizen")
    end
end

function GM:PlayerInitialSpawn(ply)
    loadPlayerData(ply)
end

function GM:PlayerSpawn(ply)
    local job = g_JOBS[ply:GetNWString("job", "citizen")] or g_JOBS.citizen
    if job.model then
        ply:SetModel(job.model)
    end
    ply:StripWeapons()
    for _, w in ipairs(job.weapons or {}) do
        ply:Give(w)
    end
end

net.Receive("change_job", function(len, ply)
    local job = net.ReadString()
    if g_JOBS[job] then
        ply:SetJob(job)
        ply:Spawn()
    end
end)

function GM:PlayerDisconnected(ply)
    local path = "loner_rp/" .. ply:SteamID64() .. ".txt"
    file.CreateDir("loner_rp")
    local data = {
        money = ply:GetMoney(),
        job = ply:GetNWString("job", "citizen")
    }
    file.Write(path, util.TableToJSON(data, true))
end

hook.Add("PlayerSay", "CheckBalance", function(ply, text)
    if text == "!balance" then
        ply:ChatPrint("Current balance: $" .. ply:GetNWInt("cash"))
        return ""
    end
end)
