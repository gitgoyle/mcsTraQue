function doGetTotals(callBack) {
    var parmFinal;
    parmFinal = localStorage.getItem("traqid");
    var sRunAjax = $.ajax({
        type: "POST",
        url: '../index.aspx/getCTETotals',
        data: '{"vParms":"' + parmFinal + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            var ret;
            var stripp;
            ret = data.d;
            for (var x = 0; x < 5; x++) {
                stripp = ret[x];
                ret[x] = stripp.replace(".00", '');
            }
            localStorage.setItem("certTotal", ret[0]);
            localStorage.setItem("trainTotal", ret[1]);
            localStorage.setItem("equipTotal", ret[2]);
            $("#adminDB_1").html("<i class='fa fa-users fa-2x'></i><table><tr><th>USERS</th><th>FREE</th><th>IND</th><th>AGENCY</th></tr>" +
                                                          "<tr><td id='adb_users'>" + ret[0] + "</td><td id='adb_free'>" + ret[1] + "</td><td id='adb_ind'>" + ret[2] + "</td><td id='adb_agency'>" + ret[3] + "</td></tr></table>");
            $("#adminDB_2").html("<i class='fa fa-certificate fa-2x'></i><table><tr><th>CERTIFICATES</tr>" +
                                                          "<tr><td id='adb_certificates'>" + ret[4] + "</td></table>");
            $("#adminDB_3").html("<i class='fa fa-battery-three-quarters fa-2x'></i><table><tr><th>TRAINING HOURS</tr>" +
            "<tr><td id='adb_training'>" + ret[5] + "</td></table>");
            $("#adminDB_4").html("<i class='fa fa-dollar fa-2x'></i><table><tr><th>EQUIPMENT PURCHASES</tr>" +
            "<tr><td id='adb_equipment'>" + ret[6] + "</td></table>");
            //console.log(ret);
            if (callBack) {
                callBack();
            }
        }
    })
}
