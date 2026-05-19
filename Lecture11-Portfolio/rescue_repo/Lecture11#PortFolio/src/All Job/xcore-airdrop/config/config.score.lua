config.score = {
    Enable = true,     -- // เปิดใช้งานระบบแสดง Kill Score หลังจบ Airdrop 
    TimeShow = 5,      -- // ระยะเวลาแสดง UI 
    KeyHide = "RETURN",  -- // ใช้ KeyMapping (https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/)
    UseKillCheck = true; -- // ใช้การเช็คจาก xcore-airdrop หากไม่ใช้ เรียก export ตามด้านล่าง

    Limit = 15 -- // แสดงสูงสุดกี่คน
}

-- @ if use in other resource use exports like this (ไม่ต้อง check ว่าอยู่ใน airdrop ไหน useKilled จะเช็คให้เอง)
-- @ ```
-- @ exports["xcore-airdrop"]:useKilled(killerId) -- killerId as number
-- @ ```
