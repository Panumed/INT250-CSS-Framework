function SendMessage(namespace, data) {
    $.post('https://Hype_Quiz/' + namespace, JSON.stringify(data));
}

let cd = null;
let answered = false;

$(document).ready(function () {
    SendMessage("ready", {})
});

$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.action == 'Alert') {
            $('#wrapper').fadeIn()
            PlaySounds('start')
            updateHudTimer(event.data.time)
        } else if (event.data.action == 'updateTime') {
            updateHudTimer(event.data.time)
        } else if (event.data.action == 'OpenUi') {
            $('#wrapper').fadeIn()
        } else if (event.data.action == 'Close') {
            $('#wrapper').fadeOut()
        } else if (event.data.action == 'Open') {
            $('#warpperevent').fadeIn()
            $('.quiz-badge').html(`<span id="count">0</span>/${event.data.MaxQuiz}`)
        } else if (event.data.action == 'UpdateQuiz') {
            $('.question').text(event.data.quiz.question)
            $('#count').text(event.data.score)
            $('.answer').empty()
            const markers = ['A', 'B', 'C', 'D'];
            $.each(event.data.quiz.answer, function (k, v) {
                const mk = markers[k] || '';
                var apps = `
                    <div class="item" data-correct="${v.correct}">
                        <div class="item-inner-pill">
                            <div class="item-logo"><span class="marker-char">${mk}</span></div>
                            <p class="answer-val">${v.label}</p>
                        </div>
                    </div>
                `;
                $(".answer").append(apps);
            });
            startCooldown(event.data.time)
            answered = false;
            $('.answer').off('click', '.item').on('click', '.item', function () {
                if (answered) return;                    // เลือกได้แค่ครั้งเดียว
                answered = true;
                cancelCooldown();                        // หยุดคูลดาวน์ทันที

                const $this = $(this);
                const label = $this.find('.answer-val').text();
                const markerLabel = $this.find('.marker-char').text() || '';
                const correct = $this.data('correct') === true || $this.data('correct') === 'true';

                if (correct) {
                    // ===== ตอบถูก =====
                    $this.replaceWith(`
                        <div class="item correct">
                            <div class="item-inner-pill">
                                <div class="item-logo"><span class="marker-char">${markerLabel}</span></div>
                                <p class="answer-val">${label}</p>
                            </div>
                            <div class="item-right-content">
                                <img src="./img/correct.png">
                            </div>
                        </div>
                    `);
                    setTimeout(function () {
                        SendMessage("answer", { correct: true })
                    }, 2000);
                } else {
                    // ===== ตอบผิด =====
                    $this.replaceWith(`
                        <div class="item wrong">
                            <div class="item-inner-pill">
                                <div class="item-logo"><span class="marker-char">${markerLabel}</span></div>
                                <p class="answer-val">${label}</p>
                            </div>
                            <div class="item-right-content">
                                <img src="./img/wrong.png">
                            </div>
                        </div>
                    `);

                    // หา item ที่ถูกต้องแล้วทำให้เป็น correct
                    $('.answer .item').each(function () {
                        if ($(this).data('correct') === true || $(this).data('correct') === 'true') {
                            const goodLabel = $(this).find('.answer-val').text();
                            const goodMarker = $(this).find('.marker-char').text() || '';
                            $(this).replaceWith(`
                                <div class="item correct">
                                    <div class="item-inner-pill">
                                        <div class="item-logo"><span class="marker-char">${goodMarker}</span></div>
                                        <p class="answer-val">${goodLabel}</p>
                                    </div>
                                    <div class="item-right-content">
                                        <img src="./img/correct.png">
                                    </div>
                                </div>
                            `);
                            return false; // เจอแล้วหยุด loop
                        }
                    });
                    setTimeout(function () {
                        SendMessage("answer", { correct: false })
                    }, 2000);
                }
            });
        } else if (event.data.action == 'ShowScore') {
            $('#count').text(event.data.score)
            $('.scoretext').text(event.data.score + "/" + event.data.MaxQuiz)
            $('.score').fadeIn()
            setTimeout(function () {
                $('.score').fadeOut()
                $('#warpperevent').fadeOut()
                SendMessage("CloseMenu", {})
            }, 3000);
        }
    })
})

function PlaySounds(name) {
    var sound = new Audio(`sounds/` + name + `.mp3`);
    sound.volume = 0.5;
    sound.play();
}

function updateHudTimer(timeStr) {
    if (!timeStr) return;
    let parts = String(timeStr).split(':');
    if (parts.length === 2) {
        $('#minutes').text(parts[0]);
        $('#seconds').text(parts[1]);
    } else {
        $('#minutes').text('00');
        $('#seconds').text(timeStr);
    }
}

function startCooldown(ms) {
    cancelCooldown();                         // เคลียร์รอบเดิมถ้ามี

    const startAt = performance.now(),
        endAt = startAt + ms,
        tid = setTimeout(onDone, ms);

    cd = { startAt, endAt, ms, tid, raf: null };
    update();                                 // เริ่มอัปเดตเปอร์เซ็นต์
}

function update() {
    if (!cd) return;
    const now = performance.now(),
        remaining = Math.max(0, cd.endAt - now),
        pct = Math.floor(remaining / cd.ms * 100);

    $('.delay-bg').css('width', pct + '%');

    cd.raf = pct > 0 ? requestAnimationFrame(update)
        : null;                  // หยุด loop เมื่อถึง 0
}

function cancelCooldown() {
    if (!cd) return;
    clearTimeout(cd.tid);
    cancelAnimationFrame(cd.raf || 0);

    cd = null;
    $('.delay-bg').css('width', '0%');
}

function onDone() {
    // หา item ที่ถูกต้องแล้วทำให้เป็น correct
    $('.answer .item').each(function () {
        if ($(this).data('correct') === true || $(this).data('correct') === 'true') {
            const goodLabel = $(this).find('.answer-val').text();
            const goodMarker = $(this).find('.marker-char').text() || '';
            $(this).replaceWith(`
                <div class="item correct">
                    <div class="item-inner-pill">
                        <div class="item-logo"><span class="marker-char">${goodMarker}</span></div>
                        <p class="answer-val">${goodLabel}</p>
                    </div>
                    <div class="item-right-content">
                        <img src="./img/correct.png">
                    </div>
                </div>
            `);
            return false; // เจอแล้วหยุด loop
        }
    });
    setTimeout(function () {
        SendMessage("answer", { correct: false })
    }, 2000);
    cd = null;
}