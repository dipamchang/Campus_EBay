var hideDelay = 500;
var currentID;
var hideTimer = null;
var href = 0;

var windowWidth;
var windowHeight;

$(function () {

    container = $("#personPopupContainer");
    // var PresentStudentID = 0; // Flag for avoiding further requests if Student Details are already present
    windowHeight = getDocHeight();
    windowWidth = getDocWidth();

    var divWidth = $(container).outerWidth(true);
    var divHeight = $(container).outerHeight(true);
    var containerLeft, containerTop;

    $('.personPopupTrigger').live('mouseover', function (evt) {

        href = $(this).attr("href");
        href = href.substring(href.indexOf("=") + 1, href.indexOf("&"));
        href = parseInt(href);

        if (hideTimer)
            clearTimeout(hideTimer);

        containerLeft = $(this).offset().left + $(this).width();
        containerTop = $(this).offset().top + 5;

        if (containerLeft + divWidth > windowWidth) {
            containerLeft = windowWidth - divWidth;
            containerTop += 10;
        }
        
//        if (containerTop + divHeight - $(document).scrollTop() > windowHeight) {
//            containerTop = windowHeight - divHeight + document.body.scrollTop;
//        }

        container.css({
            left: containerLeft + 'px',
            top: containerTop + 'px'
        });
        container.fadeIn(300);



        $("#popName").text("Loading...");
        $("#popHostel").text("Loading...");
        $("#popRoom").text("Loading...");
        $("#popBITSID").text("Loading...");
        $("#popPhone").text("Loading...");
        $("#popDate").text("Loading...");
        $("#popImage").attr("src", "../profile_images/default.jpg");

        $.ajax({
            type: 'POST',
            url: "../Home/Default.aspx/getToolTipStudentDetails",
            contentType: "application/json; charset=utf-8",
            data: "{'StudentID' : '" + href + "'}",
            datatype: "json",
            success: function (data) {
                var details = (data.d).toString().split(";");
                $("#popName").text(details[0]);
                $("#popHostel").text(details[1]);
                $("#popRoom").text(details[2]);
                $("#popBITSID").text(details[3]);
                $("#popPhone").text(details[4]);
                $("#popDate").text(details[5]);
                $("#popImage").attr("src", "../profile_images/" + details[6]);
                PresentStudentID = href;

                if (details.length == 8) {
                    // Student has logged in
                    if (details[7] == 0) {
                        // Not following - Show Follow Text
                        $("#popFollowMe").text("Follow").attr({ "href": "javascript:void(0)", "rel": 1 });
                    }
                    else {
                        // Following - Show Unfollow Text
                        $("#popFollowMe").text("Unfollow").attr({ "href": "javascript:void(0)", "rel": 0 });
                    }
                }
                else {
                    $("#popFollowMe").text("Log in to follow/unfollow").removeAttr("href");
                }

            },
            complete: function () {
                haveOwnerDetails = true;
            }
        });

    });

    $("#popFollowMe").click(function () {

        var link = $(this);
        $.ajax({
            type: 'POST',
            url: "../Home/Default.aspx/FollowUnfollow",
            contentType: "application/json; charset=utf-8",
            data: "{'rel' : '" + $(this).attr("rel") + "', 'OwnerStudentID': '" + href + "'}",    // rel = 0 Unfollow, 1 = Start following
            datatype: "json",
            success: function (data) {
                if (data.d == 1) {
                    if ($(link).attr("rel") == "1") {
                        $(link).text("Unfollow").attr("rel", 0);
                    }
                    else {
                        $(link).text("Follow").attr("rel", 1);
                    }
                }
                else {
                    alert("Cloudn't connect to database. Please try again.");
                }
            }
        });
    });

    $('.personPopupTrigger').live('mouseout', function () {
        if (hideTimer)
            clearTimeout(hideTimer);
        hideTimer = setTimeout(function () {
            container.css('display', 'none');
        }, hideDelay);
    });

    // Allow mouse over of details without hiding details
    $('#personPopupContainer').mouseover(function () {
        if (hideTimer)
            clearTimeout(hideTimer);
    });

    // Hide after mouseout
    $('#personPopupContainer').mouseout(function () {
        if (hideTimer)
            clearTimeout(hideTimer);
        hideTimer = setTimeout(function () {
            container.css('display', 'none');
        }, hideDelay);
    });

    $('#personPopupContainer').click(function () {
        $(this).css('display', 'none');
    })
});

function getDocHeight() {
    //    var D = document;
    //    return Math.max(
    //			Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
    //			Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
    //			Math.max(D.body.clientHeight, D.documentElement.clientHeight)
    //		    );
    return $(window).height();
    
}

function getDocWidth() {
    var D = document;
    return Math.max(
			Math.max(D.body.scrollWidth, D.documentElement.scrollWidth),
			Math.max(D.body.offsetWidth, D.documentElement.offsetWidth),
			Math.max(D.body.clientWidth, D.documentElement.clientWidth)
		    );
}

window.onresize = function () {
    windowWidth = getDocWidth();
    windowHeight = getDocHeight();
}