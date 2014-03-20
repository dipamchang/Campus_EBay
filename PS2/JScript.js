/// <reference path="../JQuery.js" />
/// <reference path="../jquery-ui-1.7.2.custom.min.js" />

// Create XML File for Stipend Amounts
//<station name="Zynga, Bangalore">
//    <stipend>
//          30000
//    </stipend>
//</station>

function loadStipends() {
    var content, url;
    $(".col1").each(function () {
        content = $(this).children("a").text().trim();

        url = content.replace(/ /ig, "%20");
        var amt, oCells;
        // Webpages/Abexome%20Biosciences,Bangalore.htm
        
        $.ajax({ url: url,
            success: function (data) {
                $("#FillStipendWorkingDiv").html(data);
                $("#FilterMe td:eq(" + icell + ")").html($("#FillStipendWorkingDiv #rightnext table:eq(0) tr:eq(1) td:eq(0)").text());
            }
        });
    });
}