<%@ Page Title="Campus eBay :: Sign Up" Language="C#" MasterPageFile="../MasterPage.master"
	AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Sign_Up_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../_css/PanelStyles.css" rel="stylesheet" type="text/css" />
	<link href="Sign_Up_Styles.css" rel="stylesheet" type="text/css" />
	<script src="../JQuery.js" type="text/javascript"></script>
	<script src="../Validation/js/jquery.validationEngine.js" type="text/javascript"></script>
	<script src="../Validation/js/jquery.validationEngine-en.js" type="text/javascript"></script>
	<link href="../Validation/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<link href="jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css" />
	<script src="jquery-ui-1.8.10.custom.min.js" type="text/javascript"></script>
	<script src="../_scripts/jquery.corner.src.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function () {
			reset_form();
			$("#BodyContentPlaceHolder_Student_Name_TextBox").select();
			$("#Sign_Up .Panel_body").css({ "border-radius": "20px" });
			$(".Button").addClass("ui-corner-all");

			$("#SignUpResult").dialog({ bgiframe: true, modal: true, resizable: false, autoOpen: false
			});

			$("#Sign_Up .Panel_body").validationEngine({ promptPosition: "centerRight" });
			$("#BodyContentPlaceHolder_BITS_ID_TextBox").bind("change", function () {
				if ($('#BodyContentPlaceHolder_BITS_ID_TextBox').val().length != 12) {
					$("#bitsidResult").text("");
					return;
				}
				$("#bitsidResult").removeClass("Fail").addClass("Success").text("Checking...");
				$.ajax({
					type: 'POST',
					url: "Default.aspx/CheckBITSID",
					data: "{'ID':'" + $('#BodyContentPlaceHolder_BITS_ID_TextBox').val() + "'}",
					contentType: "application/json; charset=utf-8",
					datatype: "json",
					success: function (data) {
						if (data.d > 0) {
							$("#bitsidResult").removeClass("Fail").addClass("Success").text("Available");
							$("#BodyContentPlaceHolder_Sign_Up_Submit").attr("disabled", false);
						}
						else {
							$("#bitsidResult").removeClass("Success").addClass("Fail").text("ID already registered.");
							$("#BodyContentPlaceHolder_Sign_Up_Submit").attr("disabled", true);
						}
					}
				});
			});

			$("#BodyContentPlaceHolder_Username_TextBox").bind("change", function () {
				if ($('#BodyContentPlaceHolder_Username_TextBox').val().length < 5 || $('#BodyContentPlaceHolder_Username_TextBox').val().length > 20) {
					$("#usernameResult").text("");
					return;
				}
				$("#usernameResult").removeClass("Fail").addClass("Success").text("Checking...");
				$.ajax({
					type: 'POST',
					url: "Default.aspx/CheckUsername",
					data: "{'username':'" + $('#BodyContentPlaceHolder_Username_TextBox').val() + "'}",
					contentType: "application/json; charset=utf-8",
					datatype: "json",
					success: function (data) {
						if (data.d > 0) {
							$("#usernameResult").removeClass("Fail").addClass("Success").text("Available");
							$("#BodyContentPlaceHolder_Sign_Up_Submit").attr("disabled", false);
						}
						else {
							$("#usernameResult").removeClass("Success").addClass("Fail").text("E-mail already registered");
							$("#BodyContentPlaceHolder_Sign_Up_Submit").attr("disabled", true);
						}
					}
				});
			});

			var defaultText = "Seperate multiple values by comma";
			$(".SText").focus(function () {
				if ($(this).val().trim().length == 0 || $(this).val() == defaultText)
					$(this).val("").addClass("hasText").removeClass("default");
			});
			$(".SText").blur(function () {
				if ($(this).val().trim().length == 0 && $(this).val() != defaultText)
					$(this).val(defaultText).addClass("default").removeClass("hasText");
			});

			var students = $("#BodyContentPlaceHolder_StudentsList").val();
			students = students.split(",");
			function split(val) {
				return val.split(/,\s*/);
			}
			function extractLast(term) {
				return split(term).pop();
			}

			$("#BodyContentPlaceHolder_studentsCloud").bind("keydown", function (event) {
				if (event.keyCode === $.ui.keyCode.TAB &&
						$(this).data("autocomplete").menu.active) {
					event.preventDefault();
				}
			}).autocomplete({
				minLength: 1,
				source: function (request, response) {
					// delegate back to autocomplete, but extract the last term
					response($.ui.autocomplete.filter(
						students, extractLast(request.term)));
				},
				focus: function () {
					// prevent value inserted on focus
					return false;
				},
				select: function (event, ui) {
					var terms = split(this.value);
					// remove the current input
					terms.pop();
					// add the selected item
					terms.push(ui.item.value);
					// add placeholder to get the comma-and-space at the end
					terms.push("");
					this.value = terms.join(", ");
					return false;
				}
			});
		});

		function BITSID() {
			if ($("#BodyContentPlaceHolder_BITS_ID_TextBox").val().length != 12)
				return false
			else
				return true;
		}

		function Hostel() {
			if ($("#BodyContentPlaceHolder_Room_No_TextBox").val().length != 3)
				return false
			else
				return true;
		}

		function validateForm() {
			$("#Sign_Up .Panel_body :text").blur(); // So that if there is any change in E-mail or BITSID AJAX check is done by onchange event.
			if ($("#Sign_Up .Panel_body").validationEngine({ promptPosition: "centerRight", returnIsValid: true }) && !($("#bitsidResult").hasClass("Fail")) && !($("#usernameResult").hasClass("Fail"))) {
				$("#BodyContentPlaceHolder_ValidForm").val(1);
				return true;
			}
			else {
				$("#BodyContentPlaceHolder_ValidForm").val(0);
				return false;
			}
		}

		function reset_form() {
			$("#Sign_Up .Panel_body :text").val("");
			document.getElementById("BodyContentPlaceHolder_Hostel_DropDownList").selectedIndex = 0;
			$.validationEngine.closePrompt('.formError', true)
			$("#Sign_Up .Panel_body :text").first().focus();
			$("#usernameResult, #bitsidResult").text("");
			$(".SText").val("Seperate multiple values by comma").removeClass("hasText").addClass("default");
		}

		function toggleSubscription() {
			if ($("#BodyContentPlaceHolder_subscribe").attr("checked") == true) {
				$("#subsciptionForm").slideDown();
			}
			else
				$("#subsciptionForm").slideUp();
		}

	</script>
	<style type="text/css">
		.style1
		{
			width: 245px;
		}
		.style2
		{
			width: 368px;
		}
		.style3
		{
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
	<asp:HiddenField ID="StudentsList" runat="server" />
	<%--For subscribe drop down--%>
	<asp:HiddenField ID="ValidForm" runat="server" Value="0" />
	<div class="Panel" id="Sign_Up">
		<div class="Panel_header">
			<div class="Panel_header_text" style="padding-left: 5px; padding-right: 5px;">
				Sign Up
			</div>
		</div>
		<div class="Panel_body" style="padding-top: 15px;">
			<div id="SignUpForm">
				<center>
					<asp:Label ID="Error_Label" runat="server" Font-Names="Segoe UI,Arial,Sans-Serif;"
						ForeColor="Red" Visible="false" Text="Correct your form and re-submit."></asp:Label>
				</center>
				<table cellpadding="3px" cellspacing="15px">
					<tr>
						<td class="style3" colspan="3">
							<center>
								For faculty sign up, go to - <a href="../FSign_Up/Default.aspx">Faculty Registration</a></center>
						</td>
					</tr>
					<tr>
						<td class="style3">
							Student
							<asp:Label ID="Student_Name_Label" runat="server">Name</asp:Label>
							&nbsp;*
						</td>
						<td class="style1">
							:
							<asp:TextBox ID="Student_Name_TextBox" runat="server" CssClass="validate[required,custom[onlyLetter],length[3,30]]"
								MaxLength="30" EnableViewState="False"></asp:TextBox>
						</td>
						<td class="style2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style3">
							<asp:Label ID="BITS_ID_Label" runat="server">BITS ID Number</asp:Label>
							&nbsp;*
						</td>
						<td class="style1">
							:
							<asp:TextBox ID="BITS_ID_TextBox" runat="server" CssClass="validate[required,custom[noSpecialCaracters],funcCall[BITSID]]"
								MaxLength="12" EnableViewState="False" AutoComplete="Off"></asp:TextBox>
						</td>
						<td class="style2">
							<span id="bitsidResult">&nbsp;</span>&nbsp; "Required for Password Recovery."
						</td>
					</tr>
					<tr>
						<td class="style3">
							<asp:Label ID="Username_Label" runat="server" Text="E-mail"></asp:Label>
							&nbsp;*
						</td>
						<td class="style1">
							:
							<asp:TextBox ID="Username_TextBox" runat="server" CssClass="validate[required,custom[email]]"
								MaxLength="35" EnableViewState="False" AutoComplete="Off"></asp:TextBox>
						</td>
						<td class="style2">
							<p id="usernameResult">
								&nbsp;</p>
						</td>
					</tr>
					<tr>
						<td class="style3">
							<asp:Label ID="Password_Label" runat="server" Text="Password"></asp:Label>
							&nbsp;*
						</td>
						<td class="style1">
							:
							<asp:TextBox ID="Password_TextBox" TextMode="Password" runat="server" EnableViewState="False"
								CssClass="validate[required,length[5,20]]" MaxLength="20"></asp:TextBox>
						</td>
						<td class="style2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style3">
							Re-type *
						</td>
						<td class="style1">
							:
							<asp:TextBox ID="RettypePass_TextBox" runat="server" EnableViewState="False" TextMode="Password"
								CssClass="validate[required,confirm[BodyContentPlaceHolder_Password_TextBox]]"
								MaxLength="20"></asp:TextBox>
						</td>
						<td class="style2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style3">
							<asp:Label ID="Hostel_Label" runat="server" Text="Hostel"></asp:Label>
							&nbsp;*
						</td>
						<td class="style1">
							:
							<asp:DropDownList ID="Hostel_DropDownList" runat="server" CssClass="validate[required]"
								EnableViewState="False">
								<asp:ListItem Selected="True" Value="">Select One</asp:ListItem>
								<asp:ListItem>AH 1</asp:ListItem>
								<asp:ListItem>AH 2</asp:ListItem>
								<asp:ListItem>AH 3</asp:ListItem>
								<asp:ListItem>AH 4</asp:ListItem>
								<asp:ListItem>AH 5</asp:ListItem>
								<asp:ListItem>AH 6</asp:ListItem>
								<asp:ListItem>AH 7</asp:ListItem>
								<asp:ListItem>AH 8</asp:ListItem>
								<asp:ListItem>CH 1</asp:ListItem>
								<asp:ListItem>CH 2</asp:ListItem>
								<asp:ListItem>CH 3</asp:ListItem>
								<asp:ListItem>CH 4</asp:ListItem>
								<asp:ListItem>CH 5</asp:ListItem>
								<asp:ListItem>CH 6</asp:ListItem>
							</asp:DropDownList>
						</td>
						<td class="style2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style3">
							<asp:Label ID="Room_No_Label" runat="server" Text="Room No."></asp:Label>
							&nbsp;*
						</td>
						<td class="style1">
							:
							<asp:TextBox ID="Room_No_TextBox" runat="server" CssClass="validate[required,funcCall[Hostel],custom[onlyNumber]]"
								MaxLength="3" Width="40px" EnableViewState="False"></asp:TextBox>
						</td>
						<td class="style2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style3">
							<asp:Label ID="Phone_no_Label" runat="server" Text="Phone Number"></asp:Label>&nbsp;*
						</td>
						<td class="style1">
							:
							<asp:TextBox ID="Phone_no_TextBox" runat="server" CssClass="validate[required, custom[telephone]]"
								MaxLength="10" EnableViewState="False"></asp:TextBox>
						</td>
						<td class="style2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="style3">
							<asp:Label ID="Profile_Picture_Label" runat="server" Text="Profile Picture"></asp:Label>
						</td>
						<td class="style1">
							:
							<asp:FileUpload ID="Profile_Picture_Upload" runat="server" EnableViewState="False" />
						</td>
						<td class="style2">
							&nbsp;
						</td>
					</tr>
				</table>
				<hr align="center" width="80%" />
				<div id="mailAlertSubscribe" style="margin-top: 10px; padding: 0 30px;">
					<table border="0" cellspacing="0" cellpadding="5">
						<tr valign="middle">
							<td>
								<input type="checkbox" name="subscribe" id="subscribe" checked="checked" onchange="toggleSubscription()"
									runat="server" />
							</td>
							<td>
								&nbsp;<label for="BodyContentPlaceHolder_subscribe">Subscribe</label>
							</td>
						</tr>
					</table>
					<br />
					<p style="font-style: italic;">
						If you subscribe to this service Campus eBay reminds you by an e-mail and an SMS
						in two situations:
						<ul style="padding: 5px 0 0 30px; font-style: italic;">
							<li>when an item of your choice has been uploaded </li>
							<li>when person of your choice uploads any item</li>
						</ul>
					</p>
					<br />
					<fieldset style="padding: 10px 20px; display: inline-block;" id="subsciptionForm">
						<legend>&nbsp;Get Notified by E-mail when...&nbsp;</legend>
						<table border="0" cellpadding="0" cellspacing="8">
							<tr>
								<td>
									these items are uploaded
								</td>
								<td>
									&raquo;
								</td>
								<td>
									<input type="text" name="itemsCloud" id="itemsCloud" value="Seperate multiple values by comma"
										class="default SText" title="Comma seperate items." runat="server" />
								</td>
							</tr>
							<tr>
								<td>
									these persons upload any item
								</td>
								<td>
									&raquo;
								</td>
								<td>
									<input type="text" name="studentsCloud" id="studentsCloud" value="Seperate multiple values by comma"
										class="default SText" title="Comma seperate Names of students." runat="server" />
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
				<br />
				<h4 style="color: red; padding-left: 10px;">
					Check your spam/junk folder for mails from Campus eBay</h4>
				<table border="0" cellpadding="0" cellspacing="0" width="30%" style="margin: 20px">
					<tr>
						<td>
							<asp:Button ID="Sign_Up_Submit" runat="server" Text="Submit" CssClass="Button" OnClientClick="return validateForm()"
								EnableViewState="False" EnableTheming="False" OnClick="Sign_Up_Submit_Click" />
						</td>
						<td>
							<input id="Reset" type="reset" value="Reset" class="Button" onclick="reset_form()" />
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="SignUpResult" style="text-align: center; font-size: 16px;" title="Success!">
		<p style="margin: 20px;">
			An Email has been sent to <em>
				<asp:Label ID="EmailConfirmation_Label" runat="server"></asp:Label>.</em>
			<br />
			Just click on the link sent & start selling!
		</p>
		<p align="center" style="padding: 3px;" class="ui-state-error ui-corner-all">
			<b>Also Check the Spam/Junk folder</b></p>
		<br />
		<p style="font-style: italic;">
			<span style="text-decoration: underline;">Note:</span> The link is valid only for
			24 hrs.</p>
	</div>
</asp:Content>
