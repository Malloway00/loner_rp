GM.Name = "LonerRP"
GM.Author = "StarterPack"
GM.Email = "N/A"
GM.Website = "N/A"

DeriveGamemode("sandbox")

-- Job table defining the available jobs and their loadouts
g_JOBS = {
    citizen = {
        name = "Citizen",
        model = "models/player/Group01/male_07.mdl",
        weapons = {}
    },

    police = {
        name = "Police Officer",
        model = "models/player/police.mdl",
        weapons = {"weapon_pistol"}
    }
}

local PLAYER = FindMetaTable("Player")

function PLAYER:SetMoney(amount)
    self:SetNWInt("cash", amount or 0)
end

function PLAYER:AddMoney(amount)
    self:SetMoney(self:GetNWInt("cash", 0) + (amount or 0))
end

function PLAYER:GetMoney()
    return self:GetNWInt("cash", 0)
end

function PLAYER:SetJob(id)
    if not g_JOBS[id] then return end
    self:SetNWString("job", id)
end

