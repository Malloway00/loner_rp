AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/Humans/Group01/female_01.mdl")
    self:SetHullType(HULL_HUMAN)
    self:SetUseType(SIMPLE_USE)
    self:PhysicsInit(SOLID_BBOX)
    self:SetSolid(SOLID_BBOX)
end

function ENT:AcceptInput(name, activator)
    if name == "Use" and IsValid(activator) and activator:IsPlayer() then
        net.Start("open_npc_menu")
        net.Send(activator)
    end
end
