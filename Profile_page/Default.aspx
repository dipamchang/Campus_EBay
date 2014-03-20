<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Profile_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../_css/PanelStyles.css" rel="stylesheet" type="text/css" />
	<link href="Profile_styles.css" rel="Stylesheet" type="text/css" />
	<%--<script src="../JQuery.js" type="text/javascript"></script>--%>
	<script src="jquery.cycle.all.js" type="text/javascript"></script>
	<script src="jquery.easing.1.1.1.js" type="text/javascript"></script>
	<script src="../_scripts/jquery.corner.src.js" type="text/javascript"></script>
	<script src="../_scripts/jquery.shorten.js" type="text/javascript"></script>
	<script src="jquery-ui-1.8.10.custom.min.js" type="text/javascript"></script>
	<link href="jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css" />
	<script src="../_scripts/ViewAllDialog.js" type="text/javascript"></script>
    <script src="../_scripts/createLink.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">
		var NLAFvalidForm = true;
		var UploadItemValidForm = true;
		var Enable_AlertUpdate = false; 	// Checks this first bfore requesting the server for Updating the alert options set by user
		var isFaculty = false;			// Accordingly hides room no and hostel for faculty.

		var OriginalIndentation = new Array(); // For Conversation Left margins

		$(function () {
			Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(sendMailAlerts);
			Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
			//alert($(".Panels_small").children().length);

			$("#Uploaded_items_panel .Panel_body").scrollTop($("#BodyContentPlaceHolder_ScrollSave").val());

			$(".Panel img").addClass("ui-corner-all");

			$(".Panels_small").sortable({
				axis: 'y',
				cursor: 'move',
				handle: '.Panel_header',
				scroll: false,
				change: function () {
					$("#BodyContentPlaceHolder_order").val("2,3,1,4")
				}
			});

			$(".Panels_small .Panel_body, #Alerts_panel .Panel_body").corner("15px bl br");

			$(".Notices_lost_body").cycle({
				fx: 'scrollLeft',
				timeout: 0,
				pause: 1,
				pager: '.Notices_lost_navigate',
				easing: 'backout'
			}); // Timeout was set to 0,to prevent slideshow.

			$(".received_messages_body").cycle({
				fx: 'zoom',
				timeout: 0,
				pause: 1,
				easing: 'backout',
				next: '#next',
				prev: '#prev',
				after: After,
				before: updateMessageRead

			}); // Timeout was set to 0,to prevent slideshow.

			$("#AddNLAF").dialog({
				bgiframe: true,
				autoOpen: false,
				minHeight: 350,
				minWidth: 550,
				buttons: {
					'Submit': function () {
						if ($("#ChoiceNoticeOrLAF_0").attr("checked")) {
							if ($("#expiryDate").val().length <= 0) {
								$("#NLAFError").css("display", "block").text("Select a date on which the notice should expire");
								$("#expiryDate").focus();
								NLAFvalidForm = false;
							}
							else {
								$("#NLAFError").css("display", "none");
								NLAFvalidForm = true;
							}
						}
						else {
							$("#NLAFError").css("display", "none");
							NLAFvalidForm = true;
						}
						addNotice(); // Calls a C# function to add the above notice into DB
					}
				}
			});

			var picDialogue = $("#PhotoUpload").dialog({
				modal: true,
				bgiframe: true,
				autoOpen: false,
				minHeight: 217,
				minWidth: 451,
				close: function (evt) {
					// Two conditions not to be met for deleting the temp image
					// 1) Close coz of OK button clicked and not clicking of close button or Esc 
					// 2) None of the images on Page are usign that temp image. eg. User chose a pic and press ok btn. That pic will be named temp
					// So immedaitely the UploadItemImage will be using that temp image. Now, if by chance user opens dialog and closes without making any change, the temp image will be lost
					// **** Coz the temp image should be confirmed to a final image once the user clicks upload btn. Uplaod btn click, changes any temp image as the present image of the item.

					var usingTempImg = 0; // Flag for using temp image
					if (typeof evt.originalEvent != "undefined" && $("#BodyContentPlaceHolder_UploadItemImage").attr("src").indexOf("temp") < 0) {
						$("#BodyContentPlaceHolder_UpdatedItems_UpdatePanel table img").each(function () {
							if ($(this).attr("src").indexOf("temp") > 0) {
								usingTempImg = 1;
								return;
							}
						});
						if (usingTempImg == 1) {
							return;
						}
						$.ajax({
							type: 'POST',
							url: "Default.aspx/DeleteTempPicsOfThisUser",
							data: "{'type':'" + $("#BodyContentPlaceHolder_ChangePic").val() + "'}",
							contentType: "application/json; charset=utf-8",
							datatype: "json",
							success: function () {
								resetPhotoDialog();
							}
						});
					}
				}
			});

			picDialogue.parent().appendTo("form :first");

			$("#expiryDate").datepicker({
				maxDate: '+1M',
				minDate: '-0D',
				dateFormat: 'dd MM, yy'
			});


			$("#AddNewNLAF").click(function () {
				$("#AddNLAF").dialog("open");
			});

			function After(curr, next, opts) {

				$(this).parent().css("border", "solid 1px #000"); //indicating read

				$(".received_messages_body div").each(function () {
					if ($(this).css("display") == "block") {

						var id = $(this).attr("id"); // Eg: message_1
						id = id.substring(id.indexOf('_') + 1); // Eg: 1

						var hidden = $("#BodyContentPlaceHolder_UnRead").val();
						var ans = "";

						hidden = hidden.split(',');
						for (var i = 0; i < hidden.length; i++) {
							if (hidden[i] != id) {
								ans += hidden[i] + ",";
							}
							else {
								$(this).parent().css("border", "solid 4px #000");
							}
						}

						$("#BodyContentPlaceHolder_UnRead").val(ans.substring(0, ans.length - 1));
						return;
					}
					else {
						//$(this).parent().css("border", "solid 1px #000");
					}
				});
				msg = 'Message ' + (opts.currSlide + 1) + ' of ' + opts.slideCount;
				$("#MessageCaption").html(msg);
			}

			// Removed this from selection -- , .Uploaded_items_image
			$(".Profile_pic, .Upload_items_image").live({ mouseover: function () {
				$(this).children(".changePic").stop(true, true).fadeIn();
			},
				mouseout: function () {
					$(this).children(".changePic").stop(true, true).fadeOut();
				}
			});

			var image_index;
			$(".changePic").live("click", function () {
				resetPhotoDialog();
				$("#PhotoUpload").dialog("open");
				//setting the hidden field so that the Server saves in the right Location.
				if ($(this).parent().attr("class") == 'Profile_pic') {
					$("#BodyContentPlaceHolder_ChangePic").val("profile");
				}
				else { // For both upload new and uploaded items.
					var src = $(this).siblings().attr("src");
					src = src.substring(src.indexOf("_images/") + 8);
					if ($(this).parent().attr("class") == "Upload_items_image")
						$("#BodyContentPlaceHolder_ChangePic").val("items|" + src);
					else {
						image_index = $(this).siblings().attr("id");
						image_index = image_index.substring(image_index.lastIndexOf("_") + 1);
						$("#BodyContentPlaceHolder_IndexUploadedImg").val(image_index); // For Updating to new image in uploaded item panel
						$("#BodyContentPlaceHolder_ChangePic").val("items||" + src); // Uploaded items
					}
				}

			});

			$("#ImageUploadOK_Button").click(function () {

				/* If,

				Profile: Replace the present profile image in profile_images folder with temp_profileStudentID
				Upload New Item: Change UploadedItemImg src to temp_itemStudentID. Hitting Upload link will automatically make the temp_itemStudentID image as the latest one in func insertItem_DetailsView_ItemInserted()
				Uploaded Items: Change the value of `name` variable. UpdateUploadedPic will change the present temp_pic if any, as the pic wid name 'name' sent as an argument

				*/

				$("#PhotoUpload").dialog("close");

				var name = $("#BodyContentPlaceHolder_ChangePic").val();
				if (name.indexOf("||") > 0) {
					// Uploaded items
					name = name.substring(name.indexOf("||") + 2);
				}
				else if (name.indexOf("profile") < 0) {
					// Upload new item section
					$("#BodyContentPlaceHolder_UploadItemImage").attr("src", $("#BodyContentPlaceHolder_imgPicture").attr("src") + "?timestamp=" + new Date().getMilliseconds())
					return;
				}

				if ($("#BodyContentPlaceHolder_imgPicture").attr("src").indexOf("default") >= 0) {
					// do nothing coz user can just open the dialog and press OK (safe side though OK btn is always hidden until he choses some pic)
					return;
				}

				$.ajax({
					type: 'POST',
					url: "Default.aspx/UpdateUploadedPicName",
					data: "{'imgName':'" + name + "'}",
					contentType: "application/json; charset=utf-8",
					datatype: "json",
					success: function () {
						if ($("#BodyContentPlaceHolder_ChangePic").val() == "profile") {
							// Refresh Profile Pic;
							$("#BodyContentPlaceHolder_Details_FormView_Profile_Image").attr("src", $("#BodyContentPlaceHolder_Details_FormView_Profile_Image").attr("src") + "?timestamp=" + new Date().getMilliseconds());
							return;
						}
						// Uploaded Items
						$("#BodyContentPlaceHolder_UploadedItems_ListView_ItemImage_" + $("#BodyContentPlaceHolder_IndexUploadedImg").val()).attr("src", "../items_images/" + name + "?timestamp=" + new Date().getMilliseconds())
						resetPhotoDialog();
					}
				});
			});

			/*$("#btnUpload").click(function () {
			$.ajax({
			type: 'POST',
			url: "Default.aspx/helperProfileImage",
			contentType: "application/json; charset=utf-8",
			datatype: "json"
			});
			}); */

			LoadAlerts();
			$("#popUpTextBox").dialog({ autoOpen: false, width: 'auto', open: function () {
				$(this).children("textarea").val($("#BodyContentPlaceHolder_insertItem_DetailsView_Descrption_TextBox").val());
			},
				close: function () {
					$("#BodyContentPlaceHolder_insertItem_DetailsView_Descrption_TextBox").val($("#popUpTextBox").children().val());
				}
			});

			$("#ReplyBody").resizable({ minHeight: 82, minWidth: 379 });
			$("#ReplyMessage").dialog({ width: 'auto', modal: true, resize: false, autoOpen: false,
				buttons: {
					Send: function () {
						var toStudent = $("#" + $("#BodyContentPlaceHolder_activeItem").val()).attr("class");
						var Message = $("#ReplyBody").val();
						var MessageID = $("#BodyContentPlaceHolder_activeItem").val().substring(8);
						$.ajax({
							type: 'POST',
							url: "Default.aspx/SendReplyMessage",
							data: "{'toStudent': '" + toStudent + "', 'Message': '" + Message + "', 'OriginalMessageID': '" + MessageID + "'}",
							contentType: "application/json; charset=utf-8",
							datatype: "json",
							success: function (data) {
								if (data.d == 1) {
									alert("Message Sent :)");
									$("#ReplyMessage").dialog("close");
								}
								else {
									alert("Couldn't send message. Please try again! :(");
								}
							}
						});
					}
				}
			});

			// Conversation

			var DefaultIndentation = 20;

			$(".msgHeader").live("click", function () {
				$(this).siblings(".msgBody").slideToggle();
			});

			var state = true; // Toogle with live isn't allowed

			$(".msgIndent").live("click", function (e) {
				var divID = e.currentTarget.parentElement.parentElement.id;
				if (state) {
					$(this).text("Off");
					for (i = 0; i < $("#" + divID + " .convMsg").length; i++) {
						//			modifiedWidth = "-=" + (OriginalIndentation[i] - DefaultIndentation) + "px";		// Modify width so that right edges of all messages align.
						//			$($(".convMsg")[i]).css({"margin-left": OriginalIndentation[i], "width": modifiedWidth});
						$($("#" + divID + " .convMsg")[i]).css({ "margin-left": 20 });
					}
					state = false;
				}
				else {
					$(this).text("On");
					SetIndentation(divID);
					state = true;
				}
			});

			$(".msgExpand").live("click", function (e) {
				$("#" + e.currentTarget.parentElement.parentElement.id + " .convMsg .msgBody").slideDown();
			});

			$(".msgCollapse").live("click", function (e) {
				$("#" + e.currentTarget.parentElement.parentElement.id + " .convMsg .msgBody").slideUp();
			});


			/*
			Removing Room No and Hostel if faculty.
			Faculty while sign up, are not asked Room and Hostel. The values inserted are ---- and --- respectively.
			So Chceking if Hostel No is ---- and this setting display none to those fields
			*/
			
			if ($("#BodyContentPlaceHolder_Details_FormView_Room_Label").text() == "---") {
				CorrectFacultyDetails();
				isFaculty = true;
			}

			$("#BodyContentPlaceHolder_Details_FormView_DetailsEdit_LinkButton, #BodyContentPlaceHolder_Details_FormView_UpdateButton, #BodyContentPlaceHolder_Details_FormView_UpdateCancelButton").live("click", function () {
				if (isFaculty) {
					CorrectFacultyDetails();
				}
			});

		});                                       // document ready

		/*
		Faculty correction for Profile Details.
		*/
		function EndRequestHandler(e) {
			if (e._activeElement.id == "BodyContentPlaceHolder_Details_FormView_DetailsEdit_LinkButton" || e._activeElement.id == "BodyContentPlaceHolder_Details_FormView_UpdateCancelButton" || e._activeElement.id == "BodyContentPlaceHolder_Details_FormView_UpdateButton") {
				CorrectFacultyDetails();
			}
		}

		function CorrectFacultyDetails() {
			if (!isFaculty) {
				return;
			}
			$("#BodyContentPlaceHolder_Details_FormView_Hostel_Name_Label").css("display", "none");
			$("#BodyContentPlaceHolder_Details_FormView_Room_Label").css("display", "none");

			var detailsContent = $("#BodyContentPlaceHolder_Details_FormView .Details_panel_body_data").html();
			$("#BodyContentPlaceHolder_Details_FormView .Details_panel_body_data").html(detailsContent.replace(/<br>/, ""));
			//$("#BodyContentPlaceHolder_Details_FormView .Details_panel_body_data").html(detailsContent.replace(/,/, ""));

			// In Edit mode
			$("#BodyContentPlaceHolder_Details_FormView .Details_panel_body_data table tr:eq(1)").css("display", "none");
		}


		function loadNotice() // The same for both LAF and Notice as they come in the same DIV tag.
		{
			if ($(".Notices_lost_body div").length == 0) {
				return false;
			}
			$(".Notices_lost_body div").each(function () {
				if ($(this).css("display") == "block") {
					$("#BodyContentPlaceHolder_activeItem").val($(this).attr("id"));
					return;
				}
			});
			return true;
		}

		function loadMessage() // Loads the Present message viewed by user into Hidden field
		{
			if ($(".received_messages_body div").length == 0) {
				return false;
			}
			$(".received_messages_body div").each(function () {
				if ($(this).css("display") == "block") {
					$("#BodyContentPlaceHolder_activeItem").val($(this).attr("id"));
					return;
				}
			});
			return true;
		}

		function setForm(type) {
			if (type == 1) {
				$("#noticeDetail").slideDown("medium");
				$("#ui-dialog-title-AddNLAF").text("Add A Notice");
			}
			else {
				$("#NLAFError").css("display", "none");
				$("#noticeDetail").slideUp("medium");
				$("#ui-dialog-title-AddNLAF").text("Add Lost and found");
			}
		}

		function setZIndex() {
			//modal dialog's z-index is dynamic, so setting the date-picker's z-index also dynamically so that it comes above the dialog
			$("#ui-datepicker-div").css("z-index", parseInt($("#AddNLAF").parent().css('z-index')) + 1);
		}

		function updateMessageRead() {
			/* AJAXian update about the recently read message.
			*/
			var id;
			$(".received_messages_body div").each(function () {
				if ($(this).css("display") == 'block') {
					id = $(this).attr("id");
					id = id.substring(id.indexOf("_") + 1);
				}
			});
			//AJAX call to update the DB but with async false(default);
			$.ajax({
				type: 'POST',
				url: "Default.aspx/helperMessageReadUpdate",
				data: "{'ID':'" + id + "'}",
				contentType: "application/json; charset=utf-8",
				datatype: "json"
			});
		}

		function addNotice() {

			if (NLAFvalidForm) {
				$.ajax({
					type: 'POST',
					url: "Default.aspx/helperAddNLAF",
					data: "{'IsNotice':'" + $("#ChoiceNoticeOrLAF_0").attr("checked") + "', 'expiryDate': '" + $("#expiryDate").val() + "', 'message': '" + $("#description").val() + "'}",
					contentType: "application/json; charset=utf-8",
					datatype: "json",
					async: "true",
					success: function (data) {
						//Use the Master Page Message label to display the message.
						alert("Updated the Database.");
						//$("#BodyContentPlaceHolder_Notices, .Notices_lost_navigate").children().remove();
						//window.location.href = "Default.aspx";
						$("#header_form").submit();
					}
				});
			}
		}

		function validateItemUpload() {

			UploadItemValidForm = true;

			$("#BodyContentPlaceHolder_insertItem_DetailsView :input").each(function () {

				if ($(this).val().length == 0) {
					UploadItemValidForm = false;
					return;
				}
			});
		}

		function SaveScrollPos() {
			// Save the current scroll position of Uploaded Item panel and load next time
			$("#BodyContentPlaceHolder_ScrollSave").val($("#Uploaded_items_panel .Panel_body").scrollTop());

			//			$("#Uploaded_items_panel a").click(function () {
			//				alert($(this).parent().parent().parent().parent().parent().position().top);
			//				//alert($("#Uploaded_items_panel table:eq(2)").position().top);
			//			});
			//			return false;
		}

		function CheckPic() {
			if ($("#BodyContentPlaceHolder_UploadItemImage").attr("src").indexOf("items_images/default") >= 0) {
				return confirm("Are u sure to use the default pic for this item? \n (hover ur mouse over it to change)");
			}
			$("#BodyContentPlaceHolder_UploadItemImage").attr("src", "../items_images/default.jpg?timestamp=" + new Date().getMilliseconds())
			return true;
		}

		function arrange() {
			var order = document.getElementById("order").value;
			order = order.split(",");
			for (i = 0; i < order.length; i++)
				$("#allDivs div:eq(" + (order[i] - 1) + ")").clone().appendTo("#allDivs");
			for (i = 0; i < order.length; i++)
				$("#allDivs div:eq(0)").remove();
		}

		function resetPhotoDialog() {
			// Chnage Pic to default and set display none to OK button and lbloutput
			$("#ImageUploadOK_Button, #BodyContentPlaceHolder_lblOutput").css("display", "none");
			$("#BodyContentPlaceHolder_imgPicture").attr("src", "../profile_images/default.jpg");
			document.getElementById("BodyContentPlaceHolder_image_FileUpload").outerHTML = document.getElementById("BodyContentPlaceHolder_image_FileUpload").outerHTML;
		}

		function sendMailAlerts(sender, args) {
			// This method makes an async req to send mails to ppl subscribed for items
			if (typeof sender._activeElement != "undefined") {
				if (sender._activeElement.id.indexOf("insertItem_DetailsView") < 0)
					return;

				$.ajax({
					type: 'POST',
					url: "Default.aspx/SendAlert",
					data: "{}",
					contentType: "application/json; charset=utf-8",
					datatype: "json",
					async: "true"
				});
			}
		}

		function enable_update() {
			Enable_AlertUpdate = true;
		}

		function LoadAlerts() {
			$.ajax({
				type: 'POST',
				url: "Default.aspx/Load_Alerts",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				success: function (msg) {
					var alerts = (msg.d).split("|||||");

					if (alerts[0].length > 2) {
						alerts[0] = alerts[0].substring(0, alerts[0].length - 2);
					}
					if (alerts[1].length > 2) {
						alerts[1] = alerts[1].substring(0, alerts[1].length - 2);
					}
					document.getElementById("Item_Alerts_text").innerHTML = alerts[0];
					document.getElementById("Student_Alerts_text").innerHTML = alerts[1];
				}
			});
		}

		function updateAlerts() {
			if (!Enable_AlertUpdate) {
				return;
			}
			$("#UpdateAlertsLink").text("Updating...").removeAttr("href");
			$("#helperUpdate").css("display", "none");
			$.ajax({
				type: 'POST',
				url: "Default.aspx/Update_Alerts",
				data: "{'items': '" + $("#Item_Alerts_text").val() + "', 'students': '" + $("#Student_Alerts_text").val() + "'}",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				success: function (msg) {
					Enable_AlertUpdate = false;
					LoadAlerts();
					$("#UpdateAlertsLink").text("Update").attr("href", "javascript:void(0)");
					$("#helperUpdate").css("display", "inline");
				},
				error: function () {
					$("#Item_Alerts_text").val("Error Updating! Refresh Page or Retry.");
					$("#Student_Alerts_text").val("Error Updating! Refresh Page or Retry.");
				}
			});
		}

		var CompletedLoading = true; // Prevents multiple clicks by user, if message id being loaded.
		function ShowConversation(MsgId) {
			if (!CompletedLoading) {
				alert(" Loading conversation...\n Please wait");
				return;
			}
			CompletedLoading = false;
			$.ajax({
				type: 'POST',
				url: "Default.aspx/helperGetConversation",
				data: "{'ReplyID':'" + MsgId + "'}",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				success: function (data) {
					if ((data.d).length > 0) {
						var HTML = CreateConversationHTML(data.d);
						var ConversationID = "conv" + HTML.substring(0, (HTML).indexOf("<"));
						$("#" + ConversationID).remove(); 	// Remove if already generated
						$("body").append(HTML.substring(HTML.indexOf("<")));
						$("#" + ConversationID).dialog({ width: 'auto' });
						$(".msgBody a").remove();
						SetIndentation(ConversationID);
					}
					else {
						alert("Internal error. Please try again!");
					}
				},
				complete: function () {
					CompletedLoading = true;
				}
			});
		}

		function CreateConversationHTML(XML) {

			var ConversationID = $($(XML).children("Conversation")[0]).children("ID").text();

			var conversation = ConversationID + "<div class='Conversation' id='conv" + ConversationID + "' title='This is how it began...'> <div class='msgControls'>Message Indentation: <a href='javascript:void(0)' class='msgIndent'>On</a>&nbsp;&nbsp;<a href='javascript:void(0);' class='msgExpand'>Expand All</a> | <a href='javascript:void(0);' class='msgCollapse'>Collapse All</a></div>";

			// Now get the order of Rendering
			var table = new Array();
			table[0] = new Array();
			table[1] = new Array();

			var IDindex = 0;
			$(XML).children("Conversation").children("ID").each(function () {
				table[0][IDindex++] = parseInt($(this).text());
			});
			IDindex = 1;
			table[1][0] = 0; // For root
			$(XML).children("Conversation:gt(0)").children("RID").each(function () {
				table[1][IDindex++] = parseInt($(this).text());
			});

			var order = "0)0," + GenerateOrder(table, ConversationID);
			order = order.split(",");
			for (var i = 0; i < order.length - 1; i++) {
				temp = order[i].split(")");
				OriginalIndentation[i] = temp[0];
				order[i] = parseInt(temp[1]);
			}

			for (var i = 0; i < $(XML).children("Conversation").length; i++) {

				var thisConvMsg = $(XML).children("Conversation")[order[i]];

				conversation += "<div class='convMsg'><div class='msgHeader'> <strong><a href='../Advanced_Search/Default.aspx?StudentID=" + $(thisConvMsg).children("FSID").text() + "&StudentName=" + $(thisConvMsg).children("FSN").text() + "' class='personPopupTrigger'>" + $(thisConvMsg).children("FSN").text() + "</a></strong><p align='right'>" + $(thisConvMsg).children("DT").text() + "</p><hr width='80%' align='left' />" +
		"</div><div class='msgBody'>" + $(thisConvMsg).children("MSG").html() + "</div>" +
		"<div class='msgFooter'> <a href='javascript:void(0)' onclick='$(\"#BodyContentPlaceHolder_activeItem\").val(\"message_" + $(thisConvMsg).children("ID").text() + "\"); $(\"#ReplyMessage\").dialog(\"open\");'>Reply</a></div></div>";
			}

			//			&nbsp; <a href='javascript:void(0)' onclick='return(confirm(\"Are U sure?\") && $(\"#BodyContentPlaceHolder_activeItem\").val(\"message_" + $(thisConvMsg).children("ID").text() + "\")) '>Delete</a>	// Delete button. Should write a new method for delete in C# (AJAX)

			conversation += "</div>"
			return conversation;
		}

		function GenerateOrder(table, root) {
			// Generates an Array which shows the order of Conversation - Parent & Reply & Reply to Reply etc...
			var conv = "", Level = 1;
			return Main(root, 1);

			function Main(msgID, startIndex) {
				for (i = startIndex; i < table[0].length; i++) {
					if (table[1][i] == msgID) {
						conv += ((Level++) + ")") + i + ",";
						startIndex = i;
						Main(table[0][i], i + 1);
						i = startIndex;
					}
				}
				//		conv += "--";
				Level--;
				return conv;
			}
		}

		function SetIndentation(ConvID) {
			for (i = 0; i < $("#" + ConvID + " .convMsg").length; i++) {
				//			modifiedWidth = "-=" + (OriginalIndentation[i] - DefaultIndentation) + "px";		// Modify width so that right edges of all messages align.
				//			$($(".convMsg")[i]).css({"margin-left": OriginalIndentation[i], "width": modifiedWidth});
				$($("#" + ConvID + " .convMsg")[i]).css({ "margin-left": OriginalIndentation[i] * 20 });
			}

		}

	</script>
	<style type="text/css">
		.style1
		{
			text-align: center;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
	<asp:ScriptManager ID="Profile_ScriptManager" runat="server">
	</asp:ScriptManager>
	<%--Used for Messages, LAF and Notices--%>
	<input id="activeItem" type="hidden" runat="server" />
	<%--Changed dynamically using JQuery--%>
	<input id="UnRead" type="hidden" runat="server" value="" />
	<%--Helps in finding which Picture u want to change like Profile, UploadedItem, Upload a new Item--%>
	<input id="ChangePic" type="hidden" runat="server" />
	<%--For storing the index of change pic link clicked in uploaded items panel--%>
	<input id="IndexUploadedImg" type="hidden" runat="server" />
	<%--Save Scroll Position for the uploaded item panel--%>
	<input type="hidden" id="order" runat="server" value="1,2,3,4" />
	<input id="ScrollSave" type="hidden" runat="server" />
	<div class="Panels_small" style="margin-top: 10px;">
		<div class="Panel" id="Present_profile_details_panel">
			<div class="Panel_header">
				<h2 class="Panel_header_text">
					Present Profile Details</h2>
			</div>
			<div class="Panel_body">
				<div class="Profile_body_temp">
					<div class="Details_panel_body_data">
						<%--UpdateCommand="UPDATE [EBay_Student] SET [Student_Name_vc] = @Student_Name_vc, [Hostel_nc] = @Hostel_nc, [BITS_ID_vc] = @BITS_ID_vc, [Phone_No_vc] = @Phone_No_vc WHERE [Student_ID_pk_bi] = @Student_ID_pk_bi"--%>
						<asp:SqlDataSource ID="ProfileDetails_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
							OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Student_ID_pk_bi], [Student_Name_vc], [Hostel_nc], [Room_No_nc], [BITS_ID_vc], [Phone_No_vc], [PhotoURL] FROM [EBay_Student] WHERE ([Student_ID_pk_bi] = @Student_ID_pk_bi)"
							UpdateCommand="UPDATE [EBay_Student] SET [Student_Name_vc] = @Student_Name_vc, [Hostel_nc] = @Hostel_nc, [Room_No_nc] = @Room_No_nc, [Phone_No_vc] = @Phone_No_vc WHERE [Student_ID_pk_bi] = @Student_ID_pk_bi">
							<SelectParameters>
								<asp:SessionParameter DefaultValue="1" Name="Student_ID_pk_bi" SessionField="studentId"
									Type="Int64" />
							</SelectParameters>
							<UpdateParameters>
								<asp:Parameter Name="Student_Name_vc" Type="String" />
								<asp:Parameter Name="Hostel_nc" Type="String" />
								<asp:Parameter Name="Room_No_nc" Type="String" />
								<asp:Parameter Name="Phone_No_vc" Type="String" />
								<asp:SessionParameter DefaultValue="1" Name="Student_ID_pk_bi" SessionField="studentId"
									Type="Int64" />
							</UpdateParameters>
						</asp:SqlDataSource>
						<asp:UpdateProgress ID="ProfileDetails_UpdateProgress" runat="server" DisplayAfter="0"
							AssociatedUpdatePanelID="ProfileDetails_UpdatePanel">
							<ProgressTemplate>
								<p class="ui-corner-all updateProgress" style="position: absolute; top: 60px; z-index: 2;
									width: 90%; opacity: .8;">
									Loading...
								</p>
							</ProgressTemplate>
						</asp:UpdateProgress>
						<asp:UpdatePanel ID="ProfileDetails_UpdatePanel" runat="server" UpdateMode="Conditional">
							<ContentTemplate>
								<p runat="server" id="ProfileDetailsErrorLbl" style="color: Red; text-align: center;
									margin-bottom: 3px;">
								</p>
								<asp:FormView ID="Details_FormView" runat="server" DataSourceID="ProfileDetails_SqlDataSource"
									OnItemUpdating="Details_FormView_ItemUpdating" OnItemCommand="Details_FormView_ItemCommand">
									<EditItemTemplate>
										<div class="Profile_pic">
											<asp:Image ID="Profile_Image" runat="server" ImageUrl='<%# String.Format("{0}{1}?timestamp={2}","~/profile_images/",Eval("PhotoURL"),DateTime.Now) %>'
												Width="115px" AlternateText="<%# Bind('Student_Name_vc') %>" CssClass="ui-corner-all" />
											<a href='javascript:void(0)' class='changePic ui-corner-all'>Change</a>
										</div>
										<div class="Details_panel_body_data">
											<table style="width: 100%;" border="0">
												<tr>
													<td>
														Name
													</td>
													<td>
														&nbsp;:&nbsp;
													</td>
													<td>
														<asp:TextBox ID="Student_Name_vcTextBox" runat="server" Text='<%# Bind("Student_Name_vc") %>' />
													</td>
												</tr>
												<tr>
													<td>
														Hostel
													</td>
													<td>
														&nbsp;:&nbsp;
													</td>
													<td>
														<%--<asp:DropDownList ID="ProfileDetailsHostels_DropDownList" runat="server">
															<asp:ListItem Value="AH 1">AH 1</asp:ListItem>
															<asp:ListItem Value="AH 2">AH 2</asp:ListItem>
															<asp:ListItem Value="AH 3">AH 3</asp:ListItem>
															<asp:ListItem Value="AH 4">AH 4</asp:ListItem>
															<asp:ListItem Value="AH 5">AH 5</asp:ListItem>
															<asp:ListItem Value="AH 6">AH 6</asp:ListItem>
															<asp:ListItem Value="AH 7">AH 7</asp:ListItem>
															<asp:ListItem Value="AH 8">AH 8</asp:ListItem>
															<asp:ListItem Value="CH 1">CH 1</asp:ListItem>
															<asp:ListItem Value="CH 2">CH 2</asp:ListItem>
															<asp:ListItem Value="CH 3">CH 3</asp:ListItem>
															<asp:ListItem Value="CH 4">CH 4</asp:ListItem>
															<asp:ListItem Value="CH 5">CH 5</asp:ListItem>
															<asp:ListItem Value="CH 6">CH 6</asp:ListItem>
														</asp:DropDownList>--%>
														<asp:TextBox ID="Hostelnc" runat="server" Text='<%# Bind("Hostel_nc") %>' Width="35px"
															MaxLength="4" />
														&nbsp; Room
														<asp:TextBox ID="Room_TextBox" runat="server" Text='<%# Bind("Room_No_nc") %>' Width="25px"
															MaxLength="3" />
													</td>
												</tr>
												<tr>
													<td>
														BITS ID
													</td>
													<td>
														&nbsp;:&nbsp;
													</td>
													<td>
														<asp:Label ID="BITS_ID_vcLabel" runat="server" Text='<%# Bind("BITS_ID_vc") %>' />
													</td>
												</tr>
												<tr>
													<td>
														Mobile
													</td>
													<td>
														&nbsp;:&nbsp;
													</td>
													<td>
														<asp:TextBox ID="Phone_No_vcTextBox" runat="server" Text='<%# Bind("Phone_No_vc") %>'
															MaxLength="11" />
													</td>
												</tr>
												<tr>
													<td>
														<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
															Text="Update" />
													</td>
													<td>
														&nbsp;
													</td>
													<td>
														<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
															Text="Cancel" />
													</td>
												</tr>
											</table>
										</div>
									</EditItemTemplate>
									<ItemTemplate>
										<div class="Profile_pic">
											<asp:Image ID="Profile_Image" runat="server" ImageUrl='<%# String.Format("{0}{1}?timestamp={2}","~/profile_images/",Eval("PhotoURL"),DateTime.Now) %>'
												Width="115px" AlternateText="<%# Bind('Student_Name_vc') %>" CssClass="ui-corner-all" />
											<a href='javascript:void(0)' class='changePic ui-corner-all'>Change</a>
										</div>
										<div class="Details_panel_body_data">
											<asp:Label ID="Student_Name_Label" runat="server" Text='<%# Bind("Student_Name_vc") %>' />
											<br />
											<asp:Label ID="Hostel_Name_Label" runat="server" Text='<%# Bind("Hostel_nc") %>' />,
											<asp:Label ID="Room_Label" runat="server" Text='<%# Bind("Room_no_nc") %>' />
											<br />
											<asp:Label ID="BITS_ID_Label" runat="server" Text='<%# Bind("BITS_ID_vc") %>' />
											<br />
											<asp:Label ID="Phone_No_Label" runat="server" Text='<%# Bind("Phone_No_vc") %>' />
											<br />
											<asp:LinkButton ID="DetailsEdit_LinkButton" runat="server" CommandName="Edit">Edit</asp:LinkButton>
										</div>
										<div class="clear">
										</div>
									</ItemTemplate>
								</asp:FormView>
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
				</div>
			</div>
		</div>
		<div class="Panel" id="Received_messages_panel">
			<div class="Panel_header">
				<h2 class="Panel_header_text">
					Received Messages<a href="javascript:void(0)" class="ClickViewAll" title="View all Messages">View
						All</a>
				</h2>
			</div>
			<div class="Panel_body">
				<div class="received_messages_arrow">
					<a href="javascript:void(0)" style="border: none;">
						<img src="Profile_page_images/PrevMessage.png" alt="Prev" id="prev" title="Previous Message" /></a></div>
				<div class="received_messages_body ViewAllBody" id="Messages" runat="server">
					<p align="center">
						<br />
						<br />
						<br />
						No Messages Received :(
					</p>
				</div>
				<div class="received_messages_arrow">
					<a href="javascript:void(0)" style="border: none;">
						<img src="Profile_page_images/NextMessage.png" alt="Next" id="next" title="Next Message" /></a></div>
				<div id="MessageCaption" style="margin-top: 10px; display: inline-block;">
				</div>
				<div class="received_messages_delete">
					<a id="Reply_LinkButton" href="javascript:void(0)" onclick="loadMessage(); $('#ReplyMessage').dialog('open')">
						Reply</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:LinkButton ID="MessageDelete_hyperlink" runat="server" OnClick="MessageDelete_hyperlink_Click"
						OnClientClick="return (confirm('Are you sure?') && loadMessage())">Delete</asp:LinkButton></div>
			</div>
		</div>
		<div class="Panel" id="Upload_items_panel">
			<div class="Panel_header">
				<h2 class="Panel_header_text">
					Upload an Item</h2>
			</div>
			<div class="Panel_body">
				<asp:ObjectDataSource ID="InsertItem_ObjectDataSource" runat="server" InsertMethod="InsertNewItem"
					TypeName="ProfilePage">
					<InsertParameters>
						<asp:Parameter Name="Name" Type="String" />
						<asp:Parameter Name="CategoryFKID" Type="Int32" />
						<asp:Parameter Name="Price" Type="Int32" />
						<asp:Parameter Name="Author" Type="String" DefaultValue="None" />
						<asp:Parameter Name="Description" Type="String" />
						<asp:Parameter Name="URL" Type="String" />
						<asp:SessionParameter DefaultValue="1" Name="StudentFKID" SessionField="studentId"
							Type="Int32" />
						<%--<asp:Parameter Name="NewItemID" Direction="Output" Type="Int64" DefaultValue="0" />--%>
					</InsertParameters>
				</asp:ObjectDataSource>
				<div class="Upload_items_image">
					<img src="../items_images/default.jpg" alt="UserImage" width="115" runat="server"
						id="UploadItemImage" class="ui-corner-all" />
					<a href='javascript:void(0)' class='changePic ui-corner-all'>Change</a>
				</div>
				<asp:UpdateProgress ID="InsertItem_UpdateProgress" runat="server" AssociatedUpdatePanelID="InsertItem_UpdatePanel"
					DisplayAfter="0">
					<ProgressTemplate>
						<p class="ui-corner-all updateProgress" style="position: absolute; width: 97%; top: 74px;
							opacity: .7;">
							Loading...
						</p>
					</ProgressTemplate>
				</asp:UpdateProgress>
				<asp:UpdatePanel ID="InsertItem_UpdatePanel" runat="server" UpdateMode="Conditional">
					<ContentTemplate>
						<p runat="server" id="UploadItemErrorLbl" style="color: Red; margin-bottom: 3px;">
						</p>
						<asp:DetailsView ID="insertItem_DetailsView" runat="server" DataSourceID="InsertItem_ObjectDataSource"
							OnModeChanging="insertItem_DetailsView_ModeChanging" BorderStyle="None" BorderWidth="0px"
							CellPadding="0" DataKeyNames="Item_ID_pk_bi" AutoGenerateRows="False" OnItemInserting="insertItem_DetailsView_ItemInserting"
							OnItemInserted="insertItem_DetailsView_ItemInserted" AlternatingRowStyle-Wrap="False"
							GridLines="None">
							<Fields>
								<asp:TemplateField>
									<InsertItemTemplate>
										<div class="Upload_items_data">
											<table cellspacing="5px">
												<tr>
													<td>
														Name
													</td>
													<td>
														:&nbsp;
													</td>
													<td>
														&nbsp;<asp:TextBox ID="ItemName_Textbox" runat="server" Text="<%# BIND('Name') %>"
															MaxLength="30"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td>
														Price
													</td>
													<td>
														:
													</td>
													<td>
														&nbsp;Rs
														<asp:TextBox ID="Price_TextBox" runat="server" Text="<%# BIND('Price') %>" Width="75px"
															MaxLength="5"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td>
														Category
													</td>
													<td>
														:
													</td>
													<td>
														&nbsp;<asp:DropDownList ID="Categories_DropDownList" runat="server" DataSourceID="Categories_SqlDataSource"
															DataTextField="Category_Name_vc" DataValueField="Category_ID_pk_bi" Width="157px">
														</asp:DropDownList>
													</td>
												</tr>
												<tr valign="top">
													<td>
														Description
													</td>
													<td>
														:
													</td>
													<td>
														&nbsp;<asp:TextBox ID="Descrption_TextBox" runat="server" Text="<%# BIND('Description') %>"
															TextMode="MultiLine" Height="45px" Width="135px" MaxLength="150"></asp:TextBox>
														<input type="button" value="..." onclick="javascript:$('#popUpTextBox').dialog('open')"
															title="Get a Bigger Space :)" />
													</td>
												</tr>
												<tr>
													<td>
														<asp:LinkButton CommandName="Insert" runat="server" Text="Upload" ID="UploadItem"
															OnClientClick="return CheckPic()" CausesValidation="false"></asp:LinkButton>
													</td>
													<td>
													</td>
													<td>
														<input type="reset" value="Reset" style="background: none; border: none; text-decoration: underline;
															color: blue; cursor: pointer;" />
													</td>
												</tr>
											</table>
										</div>
									</InsertItemTemplate>
								</asp:TemplateField>
								<%--<asp:CommandField ShowInsertButton="True" InsertText="Upload" CancelText="Reset" />--%>
							</Fields>
						</asp:DetailsView>
					</ContentTemplate>
				</asp:UpdatePanel>
			</div>
		</div>
		<div class="Panel" id="Add_notice_panel">
			<div class="Panel_header">
				<h2 class="Panel_header_text">
					Add a notice or 'lost and found'</h2>
			</div>
			<div class="Panel_body">
				<div class="Notices_lost_body" id="Notices" runat="server">
					<p>
						<br />
						<br />
						No Notices or Lost & Found!
						<br />
						Upload one now!
					</p>
				</div>
				<div class="Notices_lost_navigate">
					<%--											<asp:DropDownList ID="Hostel_Name_DropDownList" runat="server" --%>
				</div>
				<a class="Notices_lost_add_link" title="'Notice' or 'Report a Lost Item'" id="AddNewNLAF"
					href="javascript:void(0)">Add new</a>
				<asp:LinkButton ID="deleteNotice_LinkButton" runat="server" CssClass="received_messages_delete"
					OnClick="deleteNotice_LinkButton_Click" OnClientClick="return loadNotice()">Delete</asp:LinkButton>
				<div class="clear">
				</div>
			</div>
		</div>
	</div>
	<div id="AddNLAF" title="Add A Notice">
		<p class="ui-state-error ui-corner-all" id="NLAFError" style="display: none;">
		</p>
		<p>
			Add a...
			<br />
			<label>
				<input name="ChoiceNoticeOrLAF" type="radio" id="ChoiceNoticeOrLAF_0" value="Notice"
					checked="checked" onchange="setForm(1)" />
				Notice</label>
			&nbsp; &nbsp;
			<label>
				<input type="radio" name="ChoiceNoticeOrLAF" value="LAF" id="ChoiceNoticeOrLAF_1"
					onchange="setForm(0)" />
				Lost and found</label>
		</p>
		<br />
		<p id="noticeDetail">
			Expiry date (max 1 month from now) :
			<input type="text" name="expiryDate" id="expiryDate" style="width: 135px;" onfocus="setZIndex()" />
		</p>
		<p style="margin-top: 5px;">
			<label>
				Description
				<br />
				<textarea name="description" id="description" style="width: 490px; padding: 3px;
					height: 100px;"></textarea>
			</label>
		</p>
		<br />
	</div>
	<div id="PhotoUpload" title="EBay Image Upload">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="3">
					<asp:Label ID="lblOutput" runat="server" Visible="false" CssClass="ui-state-error ui-corner-all"
						Width="100%"></asp:Label>
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td width="130" rowspan="5">
					<div id="ImageUpload_img" style="width: 100px; height: 100px; overflow: hidden;">
						<asp:Image ID="imgPicture" runat="server" ImageUrl="~/profile_images/default.jpg"
							Width="100px" CssClass="ui-corner-all" />
					</div>
				</td>
				<td colspan="2">
					Select your image :
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<asp:FileUpload ID="image_FileUpload" runat="server" BackColor="White" BorderStyle="Solid"
						BorderWidth="1" />
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<asp:Button ID="ImageUpload_Button" runat="server" Text="Upload" OnClick="ImageUpload_Button_Click"
						Width="100" Height="30" />
				</td>
				<td>
					<input type="button" value="OK" style="height: 30px; width: 85px; display: none;"
						id="ImageUploadOK_Button" />
				</td>
			</tr>
		</table>
	</div>
	<div class="Panels_large" style="margin-top: 10px;">
		<div class="Panel" id="Alerts_panel">
			<div class="Panel_header">
				<h2 class="Panel_header_text">
					Manage your alerts
				</h2>
			</div>
			<div class="Panel_body">
				<p>
					Alert me when any of these items are uploaded:</p>
				<textarea style="width: 389px; height: 50px;" id="Item_Alerts_text" onchange="enable_update()"
					title="Seperate multiple values by comma">Loading...</textarea>
				<br />
				<p>
					Alert me when any of these people upload an item:</p>
				<textarea id="Student_Alerts_text" style="width: 389px; height: 50px;" onchange="enable_update()"
					title="Seperate multiple values by comma">Loading...</textarea>
				<br />
				<center>
					<a href="javascript:void(0)" onclick="updateAlerts()" id="UpdateAlertsLink">Update</a>
					&nbsp;&nbsp;<span id="helperUpdate" style="display: none;">Updated!</span>
				</center>
			</div>
		</div>
		<div class="Panel" id="Uploaded_items_panel">
			<div class="Panel_header">
				<h2 class="Panel_header_text">
					Uploaded Items</h2>
			</div>
			<div class="Panel_body" style="overflow: scroll; padding-top: 15px;">
				<asp:UpdateProgress ID="UplaodedItems_UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatedItems_UpdatePanel">
					<ProgressTemplate>
						<p class="ui-corner-all updateProgress">
							Loading...
						</p>
					</ProgressTemplate>
				</asp:UpdateProgress>
				<asp:UpdatePanel ID="UpdatedItems_UpdatePanel" runat="server" UpdateMode="Conditional">
					<ContentTemplate>
						<p runat="server" id="UploadedItemsErrorLbl" style="color: Red; margin-bottom: 3px;
							text-align: center;">
						</p>
						<asp:ListView ID="UploadedItems_ListView" runat="server" DataSourceID="UploadedItems_SqlDataSource"
							DataKeyNames="Item_ID_pk_bi" OnItemUpdating="UploadedItems_ListView_ItemUpdating"
							OnItemCommand="UploadedItems_ListView_ItemCommand" OnItemDeleting="UploadedItems_ListView_ItemDeleting">
							<EditItemTemplate>
								<table width="397" border="0" cellspacing="4" cellpadding="2" style="background-color: #5F5F5F"
									class="ui-corner-all">
									<tr>
										<td rowspan="3">
											<div class="Uploaded_items_image">
												<img id="ItemImage" src='<%#String.Format("{0}{1}","~/items_images/",Eval("URL_vc")) %>'
													alt='<%#String.Format("{0}{1}",Eval("Item_Name_vc")," Image") %>' runat="server"
													width="78" class="ui-corner-all" />
												<a href="javascript:void(0)" title="Change Picture" class="changePic" style="display: inline;
													position: static; background: none; color: blue; margin-left: 18px;">Change</a>
											</div>
										</td>
										<td>
											Name
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											<asp:TextBox ID="ItemName_TextBox" runat="server" Text="<%# BIND('Item_Name_vc') %>"
												MaxLength="30" />
										</td>
									</tr>
									<tr>
										<td>
											Uploaded On
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											<asp:Label ID="UploadedOn" runat="server" Text="<%# BIND('Upload_Time_sdt') %>" />
										</td>
									</tr>
									<tr>
										<td>
											Price
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											Rs
											<asp:TextBox ID="PriceDetails_TextBox" runat="server" Text="<%# BIND('Price_m','{0:n0}') %>"
												Width="50px" MaxLength="4" /></div>
										</td>
									</tr>
									<tr valign="top">
										<td>
											&nbsp;
										</td>
										<td>
											Description
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											<asp:TextBox ID="Item_Description" runat="server" Rows="4" Width="183px" TextMode="MultiLine"
												Text="<%# BIND('Description_t') %>"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="Uploaded_details_edit">
												<asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
												&nbsp; &nbsp;
												<asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
											</div>
										</td>
									</tr>
								</table>
							</EditItemTemplate>
							<EmptyDataTemplate>
								<p align="center">
									No items uploaded / All items sold!</p>
							</EmptyDataTemplate>
							<ItemTemplate>
								<table width="397" border="0" cellspacing="4" cellpadding="2">
									<tr>
										<td rowspan="3">
											<div class="Uploaded_items_image">
												<img id="ItemImage" src='<%#String.Format("{0}{1}","~/items_images/",Eval("URL_vc")) %>'
													alt='<%#String.Format("{0}{1}",Eval("Item_Name_vc")," Image") %>' runat="server"
													width="78" class="ui-corner-all" />
												<a href="javascript:void(0)" title="Change Picture" class="changePic" style="display: inline;
													position: static; background: none; color: blue;">Change</a>
											</div>
										</td>
										<td>
											Name
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											<asp:Label ID="ItemName_Label" runat="server" Text="<%# BIND('Item_Name_vc') %>"
												ToolTip="<%# BIND('Item_Name_vc') %>" />
										</td>
									</tr>
									<tr>
										<td>
											Uploaded On
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											<asp:Label ID="UploadedOn" runat="server" Text="<%# BIND('Upload_Time_sdt') %>" />
										</td>
									</tr>
									<tr>
										<td>
											Price
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											Rs
											<asp:Label ID="PriceDetails_Label" runat="server" Text="<%# BIND('Price_m','{0:n0}') %>" />
										</td>
									</tr>
									<tr valign="top">
										<td>
											&nbsp;
										</td>
										<td>
											Description
										</td>
										<td>
											&nbsp;:&nbsp;
										</td>
										<td>
											<asp:TextBox ID="Item_Description" runat="server" Rows="4" Width="183px" TextMode="MultiLine"
												Text="<%# BIND('Description_t') %>" ReadOnly="true"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="Uploaded_details_edit">
												<asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" OnClientClick="SaveScrollPos()" />
												&nbsp; &nbsp;
												<asp:LinkButton ID="Sold_LinkButton" runat="server" CommandName="Delete" Text="Sold!"
													OnClientClick="return confirm('Are you sure?');" ToolTip="Item is Sold! Yippee."
													OnClick="SaveTheSoldItems" />
												&nbsp; &nbsp;
												<asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"
													OnClientClick="return confirm('Are you sure?');" />
											</div>
										</td>
									</tr>
								</table>
							</ItemTemplate>
							<ItemSeparatorTemplate>
								<center>
									<img src="Profile_page_images/Profile_page_upload_seperator.png" style="margin: 25px 0;" />
								</center>
							</ItemSeparatorTemplate>
							<%--					<LayoutTemplate>
						<div style="" id="itemPlaceholderContainer" runat="server">
							<span runat="server" id="itemPlaceholder" />
						</div>
						<div style="">
							<asp:DataPager ID="DataPager1" runat="server">
								<Fields>
									<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False"
										ShowPreviousPageButton="False" />
									<asp:NumericPagerField />
									<asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
										ShowPreviousPageButton="False" />
								</Fields>
							</asp:DataPager>
						</div>
					</LayoutTemplate>--%>
						</asp:ListView>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="insertItem_DetailsView" EventName="ItemInserted" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
	</div>
	<div style="clear: both">
	</div>
	<asp:SqlDataSource ID="Categories_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
		SelectCommand="SELECT * FROM [EBay_Category_Mst]"></asp:SqlDataSource>
	<asp:SqlDataSource ID="UploadedItems_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
		DeleteCommand="DELETE FROM [EBay_Item] WHERE [Item_ID_pk_bi] = @original_Item_ID_pk_bi"
		OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Item_ID_pk_bi], [Item_Name_vc], [Student_ID_fk_bi], [Price_m], [Upload_Time_sdt], [Author_vc], [URL_vc], [Description_t] FROM [EBay_Item] WHERE ([Student_ID_fk_bi] = @Student_ID_fk_bi) order by Item_ID_pk_bi DESC"
		UpdateCommand="UPDATE [EBay_Item] SET [Item_Name_vc] = @Item_Name_vc, [Price_m] = @Price_m, [Author_vc] = @Author_vc, [Description_t] = @Description_t WHERE [Item_ID_pk_bi] = @original_Item_ID_pk_bi">
		<DeleteParameters>
			<asp:Parameter Name="original_Item_ID_pk_bi" Type="Int64" />
		</DeleteParameters>
		<SelectParameters>
			<asp:SessionParameter DefaultValue="1" Name="Student_ID_fk_bi" SessionField="studentId"
				Type="Int64" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="Item_Name_vc" Type="String" />
			<asp:Parameter Name="Price_m" Type="Decimal" />
			<asp:Parameter Name="Author_vc" Type="String" />
			<asp:Parameter Name="Description_t" Type="String" />
			<asp:Parameter Name="original_Item_ID_pk_bi" Type="Int64" />
		</UpdateParameters>
	</asp:SqlDataSource>
	<div id="popUpTextBox" title="Close, to fill desctiption box">
		<textarea rows="10" cols="35"></textarea>
	</div>
	<div id="ReplyMessage" title="My Reply">
		<br />
		Subject&nbsp;&nbsp;
		<input type="text" id="ReplySubject" />
		<br />
		<br />
		Message
		<br />
		<textarea rows="5" cols="45" id="ReplyBody"></textarea>
	</div>
</asp:Content>
