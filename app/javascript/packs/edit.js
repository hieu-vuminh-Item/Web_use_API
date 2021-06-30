$('#submit-edit-form').click(function () {
    $.ajax({
        url: "/edit/send_data",
        type: "post",
        data: {
            "user": user,
            "pass": $('#pass').val(),
            "role": $('#role').val(),
            "status": $('#status').val()
        },
        success: function (data) {
        },
        error: function (data) {
            $('#notice').text(data.message);
        }
    });
});