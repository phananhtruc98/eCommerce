$(document).ready(function () {

    $(".disable-div :input").attr("disabled", true).addClass("disabledbutton");
    $(document).on(
        {
            keydown: function () {
                return false;
            },
            onpaste: function () {
                return false;
            }
        }, 'input[type=number]');
    $('input[type=number]').attr('min', '0');
});