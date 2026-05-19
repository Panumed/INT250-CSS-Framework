config = config or {};

config.debug = true

config.KeyRemove = { -- // บล็อคปุ่มเมื่ออยู่ใน Airdrop
    12, 34, 56       -- // https://docs.fivem.net/docs/game-references/controls/
}

config.OldUI = false; -- // ใช้ UI เก่าปรับเป็น true (มีผลต่อการส่งตัวแปรไปยัง HTML)

config.RemoveAfter = 10; -- // หลังจากผู้เล่นเก็บของใน airdrop หมดแล้วให้ ลบภายในกี่วิ

config.Blur = true; -- // เปิดโหมด Blur หน้าจอเมื่อเปิด UI

config.UIPosition = 'top'; -- left | right | top -- // ตำแหน่งของ UI Airdrop

config.BasePicture = 'esx_inventory/html/img/items/' -- // Path รูปภาพไอเท็มต่างๆ

config.BlockVehicle = true -- // บล็อครถไม่ให้เข้า airdrop

config.HealthAfterPlay = -1 -- // เลือดหลังจากเล่น airdrop จบ (-1 คือเท่าเดิมเมื่อตอนเข้ามา) | 100 - 200

config.ArmourAfterPlay = -1 -- // (-1 คือเกราะเท่าเดิมเมื่อตอนเข้ามา) | (nil คือไม่ยุ่งกับค่าเกราะเลย เล่น airdrop แล้วเกราะเหลือแค่ไหนก็ได้เท่านั้น)

config.SoundVolume = -1 -- // (-1 คือเสียงของ airdrop จะปรับเบา-ดัง ตาม setting ของผู้เล่นคนนั้นๆ) | (0.0 - 1.0 คือปรับจาก server ผู้เล่นได้ยินเท่ากันทุกคน)

config.HitHealth = 10 -- // เลือดลดลงเท่าไหร่เมื่ออยู่นอกวง airdrop (ต่อ 1 วินาที)

config.DisableCommandOnEntered = true -- // ปิดคำสั่ง /airdrop เมื่ออยู่ในวง airdrop หรือไม่ ? (ทำงานเมื่อกำลังอยู่ใน airdrop ที่เริ่มไปแล้วเท่านั้น)

config.WinnerIsJoined = false -- // ผู้เล่นที่ชนะ airdrop ได้รองรางวัลใน Joined ด้วยไหม true = ได้ | false = ไม่ได้

config.OnAnnouncement = {  -- // เปิด / ปิด ใช้งานประกาศกลางจอเมื่อดำเนินการ action ต่างๆ 
    announce_remove = true,         -- // เมื่อ airdrop ถูกลบออกโดยระบบ
    announce_admin_remove = true,   -- // เมื่อ airdrop ถูกลบออกโดยแอดมิน
    announce_starting = false,      -- // เมื่อ airdrop กำลังนับถอยหลัง
    announce_started = true,        -- // เมื่อ airdrop เริ่มให้เก็บ
    announce_congrats = true,       -- // เมื่อ airdrop ประกาศคนชนะ
    notify_hud_item_success = true, -- // เมื่อ airdrop ประกาศคนชนะเก็บของชิ้นสุดท้ายและกำลังจะลบ
}

config.OneCollected = true -- // เก็บ airdrop ครั้งเดียวไม่ใช้ UI

config.AllowStarted = false -- // เข้า airdrop ตอนไหนก็ได้ (ปรับ false จะเข้าตอนที่เริ่มนับเวลาถอยหลังไม่ได้)

config.Exit = {
    --@description [@ Enable] เปิดใช้งานการออกจาก airdrop
    Enable = true,

    Setting = {
        --@description [@ Dead] กดออกจาก airdrop เมื่ออยู่ในสถานะตาย
        --@description [@ Alive] กดออกจาก airdrop เมื่ออยู่ในสถานะปกติ

        Dead = {
            --@description [@ RewardOnExit] กดออกจาก airdrop ได้รับรางวัล Joined ด้วยไหม (ได้รับรางวัลก็ต่อเมื่อ Airdrop อยู่ในสถานะปลดล็อก)
            --@description [@ RewardTimer] อยู่ใน airdrop อย่างน้อยกี่นาทีถึงกดออก airdrop แล้วได้รางวัล Joined (หน่วยเป็นนาที)

            RewardOnExit = true,
            RewardTimer = 3,
        },
        Alive = {
            RewardOnExit = false
        },
        
    }
}

config.HideHeaderUI = { -- // ซ่อน UI Airdrop ด้านบน (Enable = true เปิดใช้งาน | Command = คำสั่งที่ใช้สลับการแสดงผล)
    Enable = true;
    Command = "switchContent" 
}

config.Blacklist = {
    Zone = {
        { x = 1944.29, y = 4657.84, z = 46.33, radius = 100.0 }, -- // ตัวอย่าง พื้นที่แบล็คลิสต์ (ห้ามวาปไป airdrop ในพื้นที่นี้)
    }
}

config.Pick = {
    Animation = {
        Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Name = 'machinic_loop_mechandplayer',
        Optional = {
            8.0 --[[ number ]], 
            -8.0 --[[ number ]], 
            -1 --[[ integer ]], 
            1 --[[ integer ]], 
            0 --[[ number ]], 
            0 --[[ boolean ]], 
            0 --[[ boolean ]], 
            0 --[[ boolean ]]
        }
    },
    Time = 15 * 1000, -- // ระยะเวลาการเก็บ Airdrop
    Cancel = true --  -- // กด X ยกเลิกการเก็บได้ไหม?
}

config.Permission = {
    Job = {
        ["council"] = {
            OffHitHeath = true,
        }
    },
}