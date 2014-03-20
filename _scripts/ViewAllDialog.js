$(function () {
    $("body").append("<div title='' class='ViewAll'></div>");
    $(".ClickViewAll").click(function () {
        var text = "";
        var title = ($(this).parent().html()).substring(0, $(this).parent().html().indexOf("<"));
        var id = $(this).parent().parent().siblings().find(".ViewAllBody").attr("id");
        $("#" + id).children().each(function () {
            text += $(this).html() + "<hr /><br />";
        });
        text.replace("display:none", "display:block");
        $(".ViewAll").html(text).dialog("option", "title", title).dialog("open");
//        if ($(".ViewAll").width() > 700) {
//            $(".ViewAll").dialog("close").dialog("option", "width", 700).dialog("open");
//        }
//        if ($(".ViewAll").height() > 500) {
//            $(".ViewAll").dialog("close").dialog("option", "height", 500).dialog("open");
//        }
    });
    $(".ViewAll").dialog({ autoOpen: false, width: 'auto' });
});