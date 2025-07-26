include("shared.lua")

-- Simple placeholder menu that pops up when interacting with the NPC
local function OpenNPCMenu()
    local frame = vgui.Create("DFrame")
    frame:SetSize(300, 120)
    frame:Center()
    frame:SetTitle("NPC Shop")
    frame:MakePopup()

    local label = vgui.Create("DLabel", frame)
    label:SetPos(10, 30)
    label:SetText("You talked to the NPC. (Implement shop here)")
    label:SizeToContents()
end

net.Receive("open_npc_menu", OpenNPCMenu)
