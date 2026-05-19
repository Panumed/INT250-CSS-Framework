min = 60

Config = {}

Config["esx_routers"] = {
    ['getSharedObject'] = 'esx:getSharedObject',
    ['revive'] = 'esx_ambulancejob:revive'
}

Config["General"] = {
    Dimension = 0,
    TimeOnline = 30 * min,
    Item = {

    },
    Warp = {
        {
            Coords = vector4(-2061.92, -485.72, 12.32, 211.08),
            -- Model = `s_m_y_armymech_01`,
           
            HeaderText = "เข้าวอโซน",
            --HelpText = "Press ~INPUT_CONTEXT~ to Join Warzone",
        },
    }
}

Config["Warp"] = {
    {
        Zone  = 1,
        Label = "Dimension 1",
        Coords = vector3(-3897.72, -4067.8, 305.92),
    },
    {
        Zone  = 2,
        Label = "Dimension 2",
        Coords = vector3(-3897.72, -4067.8, 305.92),
    },
    {
        Zone  = 3,
        Label = "Dimension 3",
        Coords = vector3(-3897.72, -4067.8, 305.92),
    },
    {
        Zone  = 4,
        Label = "Dimension 4",
        Coords = vector3(-3897.72, -4067.8, 305.92),
    },
}

Config["Weapon"] = {
    {
        Name = "WEAPON_POOLCUEWZ",
        Price = 100
    },
    {
        Name = "WEAPON_BOTTLEWZ",
        Price = 100
    }
}

Config["Item"] = {
    {
        Name = "painkiller_wz",
        Price = 100
    },
    {
        Name = "armor_wz",
        Price = 100
    },
    {
        Name = "aed_wz",
        Price = 100
    }
}

function sendNotifyCL(msg, ntype, timeout)
    TriggerEvent("ESX:Notify", ntype, timeout or 3000, msg)
end
