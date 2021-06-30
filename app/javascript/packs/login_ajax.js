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
            if (data.status == "SUCCESS") {
                user = data.data;
                submit_to_controller(data.data)
            }
        },
        error: function (data) {
            $('#notice').text(data.message);
        }
    })
});

function submit_to_controller (user) {
    $.ajax({
        url: "/session",
        type: "post",
        data: {
            "user": user
        },
        success: function (data) {
        },
        error: function (data) {
        }
    })
};