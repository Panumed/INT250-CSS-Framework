var Select = null;
var Config = new Object();
Config.closeKeys = [27];

function SendMessage(namespace, data) {
    $.post('https://Hype_Warzone/' + namespace, JSON.stringify(data));
}

$(function() {
    window.closemenu = function() {
        $(".container").fadeOut(300);
        $(".background-all").fadeOut(300);
        SendMessage("CloseMenu", {});
    }

    $("body").on("keyup", function(key) {
        if (Config.closeKeys.includes(key.which)) {
            closemenu();
        }
    });

    window.addEventListener('message', function(event) {
        if (event.data.action == 'JoinWarzone') {
            $(".tooptip").fadeIn(300);
        } else if (event.data.action == 'Exit') {
            $(".tooptip").fadeOut(300);
            closemenu();
        } else if (event.data.action == 'UpdateTime') {
            $("#time").html(event.data.time);
        } else if (event.data.action == 'OpenShop') {
            $(".container").fadeIn(300);
            $(".background-all").fadeIn(300);
            PlaySounds('open');
            
            $(".itembonusbox").empty();
            if (event.data.bonus && event.data.bonus.length > 0) {
                $(".itembonusbox").show();
                $.each(event.data.bonus, function(index, data) {
                    $(".itembonusbox").append(`
                        <div class="itembonusbox_box">
                            <div class="itembonusbox_pic">
                                <img src="nui://nc_inventory/html/img/items/${data.ItemName}.png" alt="bonus">
                            </div>
                            <div class="itembonusbox_count">
                                x${data.ItemCount}
                            </div>
                        </div>
                    `);
                });
            } else {
                $(".itembonusbox").hide();
            }

            $('.menu__name').removeClass("active");
            Select = "Weapons";
            $(`[data-select="${Select}"]`).addClass("active");
            
            $(".menuselectdatabox").empty();
            $.each(event.data.weapons, function(index, data) {
                $(".menuselectdatabox").append(`
                    <div class="menuselectdatabox_box" onclick="Buy('${data.Name}')">
                        <div class="menuselectdatabox_box_pic">
                            <img src="nui://nc_inventory/html/img/items/${data.Name}.png" alt="weapon">
                        </div>
                        <div class="menuselectdatabox_box_count">
                            $${data.Price}
                        </div>
                    </div>
                `);
            });
        } else if (event.data.action == 'UpdateData') {
            $(".menuselectdatabox").empty();
            $.each(event.data.data, function(index, data) {
                $(".menuselectdatabox").append(`
                    <div class="menuselectdatabox_box" onclick="Buy('${data.Name}')">
                        <div class="menuselectdatabox_box_pic">
                            <img src="nui://nc_inventory/html/img/items/${data.Name}.png" alt="item">
                        </div>
                        <div class="menuselectdatabox_box_count">
                            $${data.Price}
                        </div>
                    </div>
                `);
            });
        } else if (event.data.action == 'UpdateDataWarps') {
            $(".menuselectdatabox").empty();
            $.each(event.data.data, function(index, data) {
                $(".menuselectdatabox").append(`
                    <div class="menuselectdatabox_box" onclick="Buy('${data.Label}')">
                        <div class="menuselectdatabox_box_pic">
                            <img src="${data.Img}" alt="warp">
                        </div>
                        <div class="menuselectdatabox_box_count">
                            ${data.Label}
                        </div>
                    </div>
                `);
            });
        }
    });
});

window.PlaySounds = function(name) {
    try {
        var sound = new Audio('sounds/' + name + '.mp3');
        sound.volume = 0.5;
        sound.play();
    } catch(e) {}
}

window.SelectMenu = function(name){
    PlaySounds('click');
    if (name == "Exit"){
        closemenu();
        return;
    }
    $('.menu__name').removeClass("active");
    Select = name;
    $(`[data-select="${Select}"]`).addClass("active");
    SendMessage("SelectMenu", {
        Select: Select
    });
}

window.Buy = function(data){
    PlaySounds('click');
    SendMessage("Buy", {
        Name: data,
        Select: Select
    });
}