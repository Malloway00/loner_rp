ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.PrintName = "Shopkeeper"
ENT.Category = "LonerRP"
ENT.Spawnable = true
ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
    self.AutomaticFrameAdvance = bUsingAnim
end
