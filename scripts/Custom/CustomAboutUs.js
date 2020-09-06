//Int JS
$(document).ready(function () {    

    //Get Short  Description FrontEnd     
    $.ajax({
        type: "POST",
        url: "Default.aspx/GetShortDesc",
        datatype: "json",
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            var Data = JSON.parse(response.d);
            $("#aboutussd").html(Data);
        }
    });


    //Get Short  Description FrontEnd     
    $.ajax({
        type: "POST",
        url: "AboutUs.aspx/GetDesc",
        datatype: "json",
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            var Data = JSON.parse(response.d);
            $("#aboutusld").html(Data);
        }
    });
});