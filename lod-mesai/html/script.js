lod = {}

$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    $("#yazi").click(function() {
        let inputValue = $("#yazi").val()
        return;
    })
})

$(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27:
            lod.Close();
            break;
    }
});

lod.Close = function() {
    $("#container").fadeOut(175);
    $.post('http://lod-mesai/close');
}

$('#mesai-ackapat').on('change', function() {
    if (this.checked) {
        $.post('https://lod-mesai/mesaigir', JSON.stringify({ blip: true }));
    } else {
        $.post('https://lod-mesai/mesaicik', JSON.stringify({ blip: false }));
    }
});
$("#kaydet").click(function() {
    $.post('http://lod-mesai/kayıtet', JSON.stringify({}));
    2

});