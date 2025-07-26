include("shared.lua")

hook.Add("HUDPaint", "DrawCash", function()
    local cash = LocalPlayer():GetNWInt("cash", 0)
    draw.SimpleText("$"..cash, "Trebuchet24", 10, 10, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end)

local function OpenJobMenu()
    local frame = vgui.Create("DFrame")
    frame:SetTitle("Select Job")
    frame:SetSize(200, 100)
    frame:Center()
    frame:MakePopup()

    local combo = vgui.Create("DComboBox", frame)
    combo:Dock(FILL)
    combo:SetValue("Choose a job")
    for id, tbl in pairs(g_JOBS) do
        combo:AddChoice(tbl.name, id)
    end

    local btn = vgui.Create("DButton", frame)
    btn:Dock(BOTTOM)
    btn:SetText("Select")
    btn.DoClick = function()
        local _, id = combo:GetSelected()
        if id then
            net.Start("change_job")
            net.WriteString(id)
            net.SendToServer()
        end
        frame:Close()
    end
end

net.Receive("open_npc_menu", OpenJobMenu)

concommand.Add("lrp_job", OpenJobMenu)
