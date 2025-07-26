AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    -- Basic setup so the entity behaves like a scripted NPC
    self:SetModel("models/Humans/Group01/Female_02.mdl")
    self:SetHullType(HULL_HUMAN)
    self:SetHullSizeNormal()
    self:SetNPCState(NPC_STATE_SCRIPT)
    self:CapabilitiesAdd(CAP_ANIMATEDFACE + CAP_TURN_HEAD)
    self:SetUseType(SIMPLE_USE)
end

function ENT:AcceptInput(name, activator)
    if name == "Use" and IsValid(activator) and activator:IsPlayer() then
        net.Start("open_npc_menu")
        net.Send(activator)
    end
end
