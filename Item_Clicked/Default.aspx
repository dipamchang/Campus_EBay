<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
	Inherits="Item_Clicked_Default" CodeFile="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../_css/PanelStyles.css" rel="stylesheet" type="text/css" />
	<link href="_css/ItemClicked.css" rel="stylesheet" type="text/css" />
	<link href="../_css/tabControl.css" rel="stylesheet" type="text/css" />
	<script src="../JQuery.js" type="text/javascript"></script>
	<script src="../_scripts/jquery.corner.src.js" type="text/javascript"></script>
	<script src="../_scripts/jquery.ThreeDots.js" type="text/javascript"></script>
	<script src="Dialog.js" type="text/javascript"></script>
	<link href="jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css" />
    <script src="../_scripts/createLink.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function () {
			$("#Item_Clicked").corner("20px bl br");
			$(".TabControl_Body").corner("20px tl br")
			$("#BodyContentPlaceHolder_CategoryResult_DataList img, #BodyContentPlaceHolder_item_Image").addClass("ui-corner-all");
			$("#messageDialog").dialog({ autoOpen: false, modal: true, width: 'auto'});
			//			$(".Item_Clicked_message").click(function () {
			//				$("#messageDialog").dialog("open");
			//			});

			if ((window.location.href).indexOf("?") > 0)
				window.scrollTo(0, 150);

			$('.oneLine').ThreeDots({
				max_rows: 1,
				whole_word: false,
				ellipsis_string: "<a href='javascript:void(0)'>...</a>"
			});
			$(".oneLine .threedots_ellipsis").each(function () {
				$(this).children().attr("title", $(this).parent().attr("threedots"));
			});

			$("#SendMsgDigBtn").click(function () {
				$("SendMsgDigBtn").val("Sending...").attr("disabled", true);
				var mess = "<b>Item :</b> " + $("#BodyContentPlaceHolder_itemName").val() + "<br /><b>Subject :</b> " + $("#MsgSubject").val() + "<p>" + $("#message").val() + "</p>";
				$.ajax({
					type: 'POST',
					url: "Default.aspx/sendMessage",
					contentType: "application/json; charset=utf-8",
					data: "{'Message':'" + mess + "'}",
					datatype: "json",
					success: function (data) {
						if (data.d) {
							$("#messageDialog").dialog("close");
							alert("Message Sent!");
						}
						else {
							alert("Message Sending Failed!");
						}
						$("SendMsgDigBtn").attr("disabled", false);
					}
				});
			});
		});

		function CheckLogIn() {
			$.ajax({
				type: 'POST',
				url: "Default.aspx/checkLogIn",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				success: function (data) {
					if (data.d) {
						$("SendMsgDigBtn").val("Send").attr("disabled", false);
						$("#messageDialog").dialog("open");
						$("#MsgSubject").focus();
					}
					else {
						alert("Please log in!");
					}
				}
			});
			return false;
		}

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
	<div class="Panel" id="Item_Clicked">
		<div class="Panel_header">
			<h2 class="Panel_header_text">
				<asp:Label ID="Book_Name" runat="server" Text="Book Name"></asp:Label>
			</h2>
			<a href="../ViewAllItems/Default.aspx" target="_blank" title="View all the uploads till now"
				style="font-size: 12px; text-decoration: none; border-bottom: 1px dashed #FFF;
				float: right; margin: 12px 50px 0 0; color: #FFF;">View All</a><span style="clear: both;"></span>
		</div>
		<div class="Panel_body">
			<div style="float: left; text-align: center; margin-left: 10px; width: 100px; overflow: hidden;">
				<div class="Item_details_image">
					<asp:Image ID="item_Image" Width="100px" runat="server" ImageUrl="~/items_images/default.jpg" />
				</div>
				<div class="Item_Clicked_name">
					<asp:Label ID="itemName_Label" runat="server" Text="###"></asp:Label>
				</div>
			</div>
			<div class="Item_Clicked_body_text">
				<b>Owner: </b>
				<asp:HyperLink runat="server" ID="owner_HyperLink" CssClass="personPopupTrigger">
					<asp:Label ID="owner_Label" runat="server" Text="###" ></asp:Label>
				</asp:HyperLink>
				<br />
				<b>Rs: </b>
				<asp:Label ID="itemCost_Label" runat="server" Text="###"></asp:Label>
				<span id="Author" runat="server">
					<%--Ignored Renaming to Phone--%>
					<br />
					<b>Phone: </b>
					<asp:Label ID="Phone_Label" runat="server" Text="###"></asp:Label>
				</span>
				<br />
				<b>Uploaded On: </b>
				<asp:Label ID="UploadedOn_Label" runat="server" Text="###"></asp:Label>
				<br />
				<b>Description: </b><span style="overflow: hidden; width: 100%">
					<asp:Label ID="description_Label" runat="server" Text="###" Width="100%">
					</asp:Label></span>
				<asp:Button ID="sendMsg" runat="server" Text="Send Message" CssClass="Item_Clicked_message"
					OnClientClick="return CheckLogIn()" UseSubmitBehavior="False" />
			</div>
			<div class="clear">
			</div>
		</div>
	</div>
	<div id="tabSpace" runat="server">
		<div class="tabControl">
			<div class="tabControl_Header" id="TabControl1" runat="server">
				<div class="tabControl_tab">
					<h3>
						<asp:LinkButton ID="Books_LinkButton" runat="server" OnClick="Books_LinkButton_Click">Books</asp:LinkButton></h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						<asp:LinkButton ID="Electronics_LinkButton" runat="server" OnClick="Electronics_LinkButton_Click">Electronics</asp:LinkButton></h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						<asp:LinkButton ID="Sports_LinkButton" runat="server" OnClick="Sports_LinkButton_Click">Sports</asp:LinkButton></h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						<asp:LinkButton ID="Music_LinkButton" runat="server" OnClick="Music_LinkButton_Click">Music</asp:LinkButton></h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						<asp:LinkButton ID="Misc_LinkButton" runat="server" OnClick="Misc_LinkButton_Click">Misc</asp:LinkButton></h3>
				</div>
				<div class="clear">
				</div>
			</div>
			<div class="TabControl_Body">
				<div id="Navigation" runat="server" style="font-size: 11px; text-align: right;">
					<asp:LinkButton ID="PrevBtn" runat="server"><< Previous</asp:LinkButton>
					<asp:LinkButton ID="NextBtn" runat="server">Next >></asp:LinkButton>
				</div>
				<asp:DataList ID="CategoryResult_DataList" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
					ShowHeader="False" Width="100%">
					<ItemTemplate>
						<table style="margin: 10px 15px;">
							<tr>
								<td>
									<div style="overflow: hidden; height: 85px; width: 125px;">
										<asp:LinkButton ID="Image_HyperLink" runat="server" PostBackUrl='<%#String.Format("{0}{1}","~/Item_Clicked/Default.aspx?ItemID=",Eval("Item_ID_pk_bi")) %>'>
											<asp:Image ID="Item_Image" runat="server" ToolTip='<%# Eval("description_t") %>'
												ImageUrl='<%#String.Format("{0}{1}","~/items_images/",Eval("URL_vc")) %>' Width="125px" /></asp:LinkButton>
									</div>
								</td>
							</tr>
							<tr>
								<td align="center">
									<div class="oneLine" style="width: 100px;">
										<asp:LinkButton ID="Name_Label" runat="server" Text='<%# Eval("Item_Name_vc") %>'
											PostBackUrl='<%#String.Format("{0}{1}","~/Item_Clicked/Default.aspx?ItemID=",Eval("Item_ID_pk_bi")) %>'
											CssClass="ellipsis_text"></asp:LinkButton>
									</div>
								</td>
							</tr>
						</table>
					</ItemTemplate>
					<FooterTemplate>
						<div style="text-align: center;">
							<br />
							<br />
							<br />
							<asp:Label ID="lblEmpty" Text="No Items Found! <br /> Upload one now" runat="server"
								Visible='<%# CategoryResult_DataList.Items.Count == 0 ? true : false %>'>  
							</asp:Label>
						</div>
					</FooterTemplate>
				</asp:DataList>
			</div>
		</div>
		<%--<div class="tabControl">
			<div class="tabControl_Header">
				<div class="tabControl_tab">
					<h3>
						Magazines</h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						Magazines</h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						Magazines</h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						Magazines</h3>
				</div>
				<div class="tabControl_tab">
					<h3>
						Magazines</h3>
				</div>
				<div class="clear">
				</div>
			</div>
			<div class="TabControl_Body">
			</div>
		</div>--%>
	</div>
	<br />
	<div id="messageDialog" title="Compose ur message..." style="font-size: 16px;">
		<table border="0" cellspacing="8" cellpadding="0">
			<tr>
				<td>
					<label for="to2">
						To
					</label>
				</td>
				<td>
					:&nbsp;
					<input type="text" name="to" id="toStudent" runat="server" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="item">
						Item name
					</label>
				</td>
				<td>
					:&nbsp;
					<input type="text" name="item" id="itemName" runat="server" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="subject">
						Subject
					</label>
				</td>
				<td>
					:&nbsp;
					<input type="text" name="subject" id="MsgSubject" />
				</td>
			</tr>
			<tr>
				<td>
					<label for="message">
						Message
					</label>
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="message" rows="5" id="message" cols="31"></textarea>
				</td>
			</tr>
			<tr align="right">
				<td colspan="2">
					<input id="SendMsgDigBtn" type="button" value="Send" style="width: 90px; height: 32px;" />
				</td>
			</tr>
		</table>
	</div>
	
</asp:Content>
