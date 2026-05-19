function Customs.KeyRemove()
    while (#config.KeyRemove > 0) and (SharedObject.current ~= nil) do
        Citizen.Wait(3)
        for _, index in pairs(config.KeyRemove) do
            DisableControlAction(0, index, true)
        end
    end
    ESX.ShowNotification("ยกเลิกการ Block ปุ่ม")
end

Citizen.CreateThread(function()
    while true do
        for _, v in pairs(SharedObject.airdrops) do
            if v.Marker?.Enable then
                local Colour = v.Marker.Colour[v.Status]
                DrawMarker(28, v.Position.x, v.Position.y, v.Position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Radius.Maximum, v.Radius.Maximum, v.Radius.Maximum, Colour.r, Colour.g, Colour.b, Colour.a, false, false, 0.0, false, nil, nil, false);
                if v.Status == "Started" then
                    DrawMarker(28, v.Position.x, v.Position.y, v.Position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Radius.Average, v.Radius.Average, v.Radius.Average, Colour.r, Colour.g, Colour.b, Colour.a, false, false, 0.0, false, nil, nil, false)
                end
            end
        end
        Wait(#SharedObject.airdrops >= 1 and 0 or 300)
    end
end)