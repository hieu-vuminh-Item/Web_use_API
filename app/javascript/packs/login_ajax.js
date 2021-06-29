$('#submit-login-form').click(function () {
    // $('#login-form').submit();
    $.ajax({
        url: "http://0.0.0.0:3000/login",
        type: "post",
        data: {
            "user": $('#user').val(),
            "pass": $('#pass').val()
        },
        success: function (data) {
            $('#notice').text(data.message);
        },
        error: function (data) {
            $('#notice').text(data.message);
        }
    })
});