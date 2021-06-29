$('#submit-signup-form').click(function () {
    var p1 = $('#pass1').val();
    var p2 = $('#pass2').val();
    var user = $('#user').val();
    if (p1 == "" || p2 == "" || user == "") {
        $('#notice').text("Fill all the blank input");
    } else if (p1 != p2) {
        $('#notice').text("Password doesn't match");
    } else {
        $.ajax({
            url: "http://0.0.0.0:3000/signup",
            type: "post",
            data: {
                "user": user,
                "pass": p1
            },
            success: function (data) {
                if (data.status == "ERROR") {
                    $('#notice').text(data.message);
                } else if (data.status == "SUCCESS") {
                    alert(data.message);
                    window.location.href = "http://0.0.0.0:3001/login";
                }
            },
            error: function (data) {
                $('#notice').text(data.message);
            }
        })
    }
});