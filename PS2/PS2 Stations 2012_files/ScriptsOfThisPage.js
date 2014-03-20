/// <reference path="../../JQuery.js" />
var cStations = 0;
var cached = "true", isRedirect = "false", DownloadPages = "false";
var oSearchResCount;

// Extracting parts from Query String
var qString = window.location.href;
qString = qString.substring(qString.indexOf("?") + 1);

var name_values = qString.split("&");
var len = name_values.length, key, value;
while (len > 0) {
    key = name_values[len - 1].split("=")[0];
    value = name_values[len - 1].split("=")[1];
    switch (key) {
        case "cached": cached = value; break;
        case "isRedirect": isRedirect = value; break;
        case "DownloadPages": DownloadPages = value; break;
    }
    len--;
}

if (cached == "true") {
    if (isRedirect == "false") {
        window.location.href = "PS2 Stations 2012.htm?cached=true&isRedirect=true&DownloadPages=false";
    }
}

window.onload = function () {

    document.getElementById("BodyContentPlaceHolder_Filter_Text").value = "";
    document.getElementById("BodyContentPlaceHolder_Filter_Text").focus();

    $("#FilterMe thead th a").attr("title", "Click to sort ascending or descending!");

    if (cached == "true") {
        addEvents();

        $("#FilterMe th").append("<img src='Arrow-up-15.jpg' alt='A' class='hideMe' /><img src='Arrow-down-15.jpg' alt='D' class='hideMe' />");
        $("#FilterMe th:eq(0) img:eq(0)").removeClass("hideMe");
    }
    else {
        FillStationsTable();

        var content, location, pos, link;
        $(".col1").each(function () {
            content = $(this).text().trim()
            pos = content.lastIndexOf(",");
            location = content.substr(pos + 1);
            content = content.substr(0, pos);

            $(this).children("a").text(content);
            $(this).siblings().eq(1).text(location);
        });

        AttachLinksToStations();

        // ** Caution: Only a call to UpdateStationsList(); or loadOtherDetails(); sud be used @ once.
        if (DownloadPages == "true") {
            UpdateStationsList();
        }
        else
            loadOtherDetails();

        addEvents();

        $("#FilterMe th").append("<img src='Arrow-up-15.jpg' alt='A' class='hideMe' /><img src='Arrow-down-15.jpg' alt='D' class='hideMe' />");
        $("#FilterMe th:eq(0) img:eq(0)").removeClass("hideMe");
    }
}

// Fills the stations from CompleteList.htm is Webpages folder and adds new rows to FilterMe table, which
// has the list of stations
function FillStationsTable() {
    // Get the list from CompleteList.htm
    $.ajax({
        url: "Webpages/CompleteList.htm",
        async: false,
        success: function (data) {
            $("#StationsListWorkingDiv").html($(data).children("#rightnext"));
            $("#StationsListWorkingDiv").html($("#StationsListWorkingDiv #Table1 a"));
        }
    });

    var html = "", ilink = 1;
    //Read each link from #StationsListWorkingDiv and add to table a new row.
    $("#StationsListWorkingDiv a").each(function () {

        cStations++;

        html += "<tr> \
						<td class='col0'> \
							" + ilink++ + " \
						</td> \
						<td class='col1'> \
								<a target='_blank'>" + $(this).text() + " </a> \
						</td> \
						<td class='col2'> \
							&nbsp; \
						</td> \
						<td class='col3'> \
							&nbsp; \
						</td> \
						<td class='col4'> \
							&nbsp; \
						</td> \
						<td class='hcol'> \
							" + $(this).attr("href") + " \
						</td> \
					</tr>";
    });

    $("#FilterMe tbody").children().remove();
    $("#FilterMe tbody").append(html);
}

// Downloads the webpage of each station listed in CompleteList.htm which has the list of all stations
// Uses the AJAX ASP.NET callback. Alerts the result. How many downloaded, error count and stations 
// that caused the error
function UpdateStationsList() {
    // Save all the stations' copies on server
    // BodyContentPlaceHolder_StationsList

    $("#StationsListWorkingDiv").load("Webpages/CompleteList.htm #rightnext #Table1 a", function () {
        var string = "";
        $("#StationsListWorkingDiv a").each(function () {
            string += $(this).attr("href") + "::" + $(this).text() + ";";
        });

        $.ajax({
            type: 'POST',
            url: "Default.aspx/DownloadHTML",
            data: "{'List':'" + string + "'}",
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (data) {
                alert(data.d);
            }
        });
    });

}

// For filtering the rows. Filter textbox calls this
// Also adds highlight
var oFilterTexbox = document.getElementById("BodyContentPlaceHolder_Filter_Text");
var oSearchResCount = $("#res_count"), elems, val, cSearchRes;
function updateTable() {
    val = oFilterTexbox.value.toLowerCase().trim();
    $("tr:gt(0)").each(function () {
        elems = $(this).children().not(".hcol"); // All cells of the current row except the hidden ones
        if ($(elems).text().trim().toLowerCase().indexOf(val) < 0) {
            $(this).addClass("hideMe");
        }
        else {
            $(this).removeClass("hideMe");
        }
    });

    if (val.length > 0) {
        $('#FilterMe tr:gt(0)').removeHighlight().highlight(val);
        $(oSearchResCount).text("Filterted to " + $("#FilterMe tbody tr").not(".hideMe").length + " station(s) of " + cStations); // Display the count 
    }
    else {
        $('#FilterMe tr:gt(0)').removeHighlight();
        $(oSearchResCount).text(""); // Display the count 
    }
}

// FillStationsTable only fills the stations list from CompleteList.htm
// This function parses the webpages saved by UpdateStationsList() and fills the Stipend and Branches column
// of FilterMe table
function loadOtherDetails() {

    // Loads Stipend and Branches

    var amt, ccols = $("#FilterMe th").length;
    var iDetails = 0, iTable = 0;

    try {
        $("#StationsListWorkingDiv a").each(function () {
            url = "Webpages/" + $(this).text().replace("/", "_");
            url = url.replace(/&/g, "ampersand");
            url += ".htm";

            $.ajax({ url: url,
                async: false,
                success: function (data) {
                    $("#FillStipendWorkingDiv").html(data);


                    // Loading Stipends
                    iTable = ccols * iDetails + 3;
                    var cAmts = 0;  // Number of amounts they hav mentioned. This will be averaged
                    if ($("#FillStipendWorkingDiv #rightnext table:eq(0) tr:eq(1) th:eq(0)").text().indexOf("Stipend") >= 0) {
                        amt = $("#FillStipendWorkingDiv #rightnext table:eq(0) tr:eq(1) td:eq(0)").text();
                        amt = amt.replace(/[^0-9 +-]/g, "");
                        amt = amt.replace(/[+-]/g, " ");
                        amt = amt.trim();
                        if (amt.indexOf(" ") > 0) {
                            var tamt = amt.split(" ");
                            amt = 0;
                            for (var i = 0; i < tamt.length; i++) {
                                tamt[i] = tamt[i].trim();
                                if (tamt[i].length > 0) {
                                    amt += parseInt(tamt[i]);
                                    cAmts++;
                                }
                            }
                            // amt = amt / tamt.length;
                            amt = amt / cAmts;
                        }
                        $("#FilterMe td:eq(" + iTable + ")").html(amt);
                    }
                    else
                        $("#FilterMe td:eq(" + iTable + ")").html("0");

                    // Loading Branches
                    iTable = ccols * iDetails + 4;
                    if ($("#FillStipendWorkingDiv #rightnext table:eq(0) tr:eq(2) th:eq(0)").text().indexOf("Preferred Discipline") >= 0) {
                        $("#FilterMe td:eq(" + iTable + ")").text($("#FillStipendWorkingDiv #rightnext table:eq(0) tr:eq(2) td:eq(0)").text());
                    }
                    else
                        $("#FilterMe td:eq(" + iTable + ")").html("-");
                },
                complete: function () {
                    iDetails++;
                }
            });
        });
    } catch (e) {
        // Silently ignore the error
    }


    // Few Stipends may not be laoded for various reasons. Their amounts are to be replaced with 0
    $("#FilterMe .col3").each(function () {
        if ($(this).text().length == 0) {
            $(this).text("0");
        }
    });
}

// Adds the click event to table headers for sorting
function addEvents() {
    // sorting algo events
    // adding click events to all controls of header of table.

    var tableHTML = document.getElementById("FilterMe");
    // var oCells = ((tableHTML.getElementsByTagName("thead")[0]).getElementsByTagName("tr")[0]).getElementsByTagName("th");
    var oCells = $("#FilterMe thead th");
    var cCells = oCells.length;
    for (var i = 0; i < cCells; i++) {
        com_nitin.EVENTS.addEventHandler(oCells[i].getElementsByTagName("a")[0], "click", sortTable, false);
        // com_nitin.EVENTS.addEventHandler(oCells[i].getElementsByTagName("span")[1], "click", sortTable, false);
    }
    getTableFromHTML();
}

// Sorting table algo starts from here
var table = new Array(); 	// Has the table that is to be sorted in 2D array format with extra fields - sortType, sortCol

// Converts the HTML table and creates the 2D table array
function getTableFromHTML() {
    var tableHTML = document.getElementById("FilterMe");
    // var oRows = (tableHTML.getElementsByTagName("tbody")[0]).getElementsByTagName("tr");
    var oRows = $("#FilterMe tbody tr");
    var cRows = oRows.length;
    for (var j = 0; j < cRows; j++) {
        table[j] = new Array();
        var oCells = oRows[j].getElementsByTagName("td");
        var cCells = oCells.length;
        for (var k = 0; k < cCells; k++) {
            table[j][k] = $(oCells[k]).text().trim();
        }
    }
}

// Sorts the table using the data- attributes and sortCol property of the table
function sortTable(e) {
    var target = e.currentTarget;
    if (target.getAttribute("data-currsortorder") == "asc") {
        // sign 1
        table.sortType = -1;
        target.setAttribute("data-currsortorder", "desc");
    }
    else {
        table.sortType = 1;
        target.setAttribute("data-currsortorder", "asc");
    }
    table.sortCol = parseInt(target.getAttribute("data-icol"));
    table.sort(compareCells);
    replaceTable(table);

}

// The comparer function used by JavaScript sort function
function compareCells(val1, val2) {
    val1 = val1[table.sortCol];
    val2 = val2[table.sortCol];
    if (!isNaN(val1)) {
        val1 = parseFloat(val1);
        val2 = parseFloat(val2);
    }
    else {
        val1 = val1.toLowerCase();
        val2 = val2.toLowerCase();
    }
    if (val1 > val2)
        return 1 * table.sortType;
    else if (val1 < val2) {
        return -1 * table.sortType;
    }
    return 0;
}

// Replace the existing table with sorted. 
// Removes any HTML to the table cell's content, like if the cell data is in an anchor tag, only text is displayed
function replaceTable(sortedTable) {
    var tableHTML = document.getElementById("FilterMe");
    var oRowsHTML = (tableHTML.getElementsByTagName("tbody")[0]).getElementsByTagName("tr");
    var oCellsHTML, curr_elem, j, i;
    for (i = 0; i < sortedTable.length; i++) {
        oCellsHTML = oRowsHTML[i].getElementsByTagName("td");
        for (j = 0; j < sortedTable[i].length; j++) {
            curr_elem = oCellsHTML[j];
            while ($(curr_elem).children().length > 0) {
                curr_elem = $(curr_elem).children().eq(0);
            }
            $(curr_elem).text(sortedTable[i][j]);
        }
    }

    // Display sorting icon
    $("#FilterMe th img").addClass("hideMe");
    var iimg = table.sortType;
    if (iimg == -1) {
        iimg = 1;
    }
    else
        iimg = 0;
    $("#FilterMe th:eq(" + table.sortCol + ") img:eq(" + iimg + ")").removeClass("hideMe");

    // Content is filtered
    if (document.getElementById("BodyContentPlaceHolder_Filter_Text").value.trim().length > 0) {
        updateTable();
    }
    // Extra addon for this site. Attaching links to Station Col using the Hidden Link Col
    AttachLinksToStations();
}

// Using a dummy col (last column with .hcol class) to store the links of stations.
// These links are attached again here as they are lost during sorting
function AttachLinksToStations() {
    $("#FilterMe .col1").each(function () {
        $(this).children("a:eq(0)").attr("href", $(this).siblings(".hcol").text());
    });
}
