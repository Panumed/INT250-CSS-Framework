# XCORE-AIRDROP - Usage | ALL CLIENT

# Event เปิด/ปิด UI Dashboard

```lua
-- เปิด UI dashboard
TriggerEvent("xcore-airdrop.open")

-- ปิด UI dashboard
TriggerEvent("xcore-airdrop.close")
```

## Exports

```lua
-- ซ่อน UI Airdrop ด้านบน
exports["xcore-airdrop"]:HideHeaderUI()

-- แสดง UI Airdrop ด้านบน
exports["xcore-airdrop"]:ShowHeaderUI()

-- ตรวจสอบว่าอยู่ใน airdrop หรือไม่ (return: true/false, airdropId)
exports["xcore-airdrop"]:getPlayerInAirdrop()

-- เพิ่มคะแนน kill ให้กับ killerId ใน airdrop ปัจจุบัน
exports["xcore-airdrop"]:useKilled(killerId)

-- ส่งผู้เล่นออกจาก airdrop (ผ่าน export)
--@description success true|false คือส่งผู้เล่นไปที่ fn config.functions.onExit สำเร็จไหม
local success, errors = exports["xcore-airdrop"]:useExit()
if not success then
    print(errors.status) 
    --@description หากไม่ success จะมี errors.status ย่อตามหัวข้อด้านล่าง
    -- NOT_IN_AIRDROP : ผู้เล่นไม่อยู่ใน airdrop
    -- INVALID_AIRDROP : ระบบหา airdrop ที่ผู้เล่นอยู่ไม่เจอ (อาจเกิดขึ้นได้บางคร้ง)
    -- TELEPORT_DISABLED : ระบบ Teleport ของ Airdrop ลูกนี้ถูกปิดไว้
end
```

## Commands
- `/airdrop` เปิด UI dashboard airdrop
- `/airdrop.newload` โหลดข้อมูล airdrop ใหม่ทั้งหมด
- `/switchContent` เปิด / ปิด UI Airdrop ด้านบน