$('#submit-edit-form').click(function () {
    $.ajax({
        url: "http://0.0.0.0:3000/update",
        type: "post",
        data: {
            "user": user,
            "pass": $('#pass').val(),
            "role": $('#role').val(),
            "status": $('#status').val()
        },
        success: function (data) {
            alert(data.message);
            if (data.status == 'SUCCESS') {
                submit_to_controller(user, $('#status').val());
            }
        },
        error: function (data) {
            $('#notice').text(data.message);
        }
    });
});

function submit_to_controller (user, status) {
    $.ajax({
        url: "/check_update",
        type: "post",
        data: {
            "user": user,
            "status": status
        },
        success: function (data) {
        },
        error: function (data) {
        }
    })
};