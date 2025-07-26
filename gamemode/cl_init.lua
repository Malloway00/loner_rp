include("shared.lua")

hook.Add("HUDPaint", "DrawCash", function()
    local cash = LocalPlayer():GetNWInt("cash", 0)
    draw.SimpleText("$"..cash, "Trebuchet24", 10, 10, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end)
