$(document).ready(function() {

    $(".disable-div :input").attr("disabled", true).addClass("disabledbutton");
    $(document).on(
        {
            keydown: function() {
                return false;
            },
            onpaste: function() {
                return false;
            }
        },
        'input[type=number]:not("#active_code")');
    $("input[type=number]").not(".cart-prodet").attr("min", "0");
    $(".cart-prodet").attr("min", "1");
});