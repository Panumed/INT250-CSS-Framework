config.Errors = {
    Error_GetItem = function(xPlayer)
        -- // ผู้เล่นเก็บ airdrop ไม่ตรงกับจุดที่ตัวเองอยู่
        
    end,
    Error_Distance = function(xPlayer)
        -- // ผู้เล่นเก็บ airdrop แต่ยืนอยู่ห่างจากระยะของ airdrop (+ 10) ที่เก็บได้ 
        
    end,
    Error_Delete = function(xPlayer)
        -- // ผู้เล่นที่ไม่ใช่ Admins พยายามเรียกใช้ Event ลบ Airdrop
        
    end,
    Error_Notsafe = function(xPlayer)
        -- // ผู้เล่นที่เรียกใช้ Event เก็บของโดยข้ามขั้นตอนการเปิด UI
        
    end,
    Error_Instance = function(xPlayer)
        -- // ผู้เล่นเก็บ airdrop แต่ อยู่มิติที่ไม่ตรงกับ config.Instance ของ airdrop (ผู้เล่นแคช airdrop แล้วเข้ามาใหม่ แต่ airdrop ยังไม่จบ มีโอกาศเกิด Error นี้)
        
    end,
}