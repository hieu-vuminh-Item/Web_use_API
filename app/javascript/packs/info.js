$('#logout').click(function () {
    $('#form-logout').submit();
});

function edit(id) {
    if (id == "admin") {
        alert("Can't edit default account");
    } else {
        $form = $('<form action="/edit" method="post" style="display: none"></form>');
        $form.append('<input type="text" name="user" value="' + id + '"/>');
        $('body').append($form);
        $form.submit();
    }
    // alert("abc");
}