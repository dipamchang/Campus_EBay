<%@ Page Title="Welcome :) Campus eBay" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Home_Default" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../_css/PanelStyles.css" rel="stylesheet" type="text/css" />
    <link href="Home_Styles.css" rel="stylesheet" type="text/css" />
    <link href="jquery-ui-1.8.12.custom.css" rel="stylesheet" type="text/css" />
    <%--<script src="../JQuery.js" type="text/javascript"></script>--%>
    <script src="jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="Dialog_Datepicker.js" type="text/javascript"></script>
    <script src="fx.shadow.js" type="text/javascript"></script>
    <script src="../_scripts/jquery.corner.src.js" type="text/javascript"></script>
    <script src="jquery.cycle.all.js" type="text/javascript"></script>
    <script src="jquery.easing.1.1.1.js" type="text/javascript"></script>
    <script src="../_scripts/jquery.ThreeDots.js" type="text/javascript"></script>
    <script src="../_scripts/HighlightMe.js" type="text/javascript"></script>
    <script src="../_scripts/ViewAllDialog.js" type="text/javascript"></script>
    <script src="../_scripts/createLink.js" type="text/javascript"></script>
    <script type="text/javascript">
		$(function () {
			if ((window.location.href).indexOf("?") > 0) {
				window.scrollTo(0, 700);
			}
			else {
				$("#BodyContentPlaceHolder_email_TextBox").focus();
			}

			$("#Cabs th").attr("title","Sort Ascending/Descending");

			$("#topPanels .Panel .Panel_body, #middlePanels .Panel .Panel_body, #Cabs .Panel_body").corner("15px bl br");
			$(".imageLayout img").addClass("ui-corner-all");

			$("#ellipsis_dialog").dialog({ autoOpen: false, width: "500px" });

			$('.oneLine').ThreeDots({
				max_rows: 1,
				whole_word: false,
				ellipsis_string: "<a href='javascript:void(0)'>...</a>"
			});


			$(".oneLine .threedots_ellipsis").each(function () {
				$(this).children().attr("title", $(this).parent().attr("threedots"));
			});

			$(".mulLine").ThreeDots({
				max_rows: 8,
				whole_word: false,
				ellipsis_string: "<a href='javascript:void(0)'>...</a>"
			});


			$(".LAFmulLine").ThreeDots({
				max_rows: 5,
				whole_word: false,
				ellipsis_string: "<a href='javascript:void(0)'>...</a>"
			});

			$(".mulLine .threedots_ellipsis, .LAFmulLine .threedots_ellipsis").click(function () {
				$("#ellipsis_dialog").text($(this).parent().attr("threedots")).dialog("open"); ;
			});

			$("#BodyContentPlaceHolder_noticesBody").cycle({
				fx: 'scrollDown',
				timeout: 4000,
				pause: 1,
				easing: 'backout'
			});

			$("#BodyContentPlaceHolder_LAFBody").cycle({
				fx: 'fadeZoom',
				timeout: 3000,
				pause: 1
			});

			$(".imageLayout").shadow();
			//$(".imageLayout, .fx-shadow").addClass("ui-corner-all");

			$("#LeavingOn_Text").datepicker({ dateFormat: "d M yy", minDate: new Date(), maxDate: '+1M', });
			$("#CabHour_Text").val(new Date().format("hh"));
			$("#CabMin_Text").val(new Date().format("mm"));

			$("#AddCab_dialog").dialog({ width: 'auto', modal: true, autoOpen: false, buttons: { "Add my cab :)": function () {
				// Validation

				var validate = $("#CabTo_Text").val();
				if (isEmpty(validate)) {
					alert("Destination cannot be empty");
					$("#CabTo_Text").select(); return;
				}

				validate = $("#CabCapasity_Text").val();
				if (isEmpty(validate)) {
					alert("Capacity cannot be empty");
					$("#CabCapasity_Text").select(); return;
				}

				validate = $("#CabCapasity_Text").val();
				if (isNaN(validate) || parseInt(validate) < 0) {
					alert("Invalid Capacity");
					$("#CabCapasity_Text").select(); return;
				}

				validate = $("#LeavingOn_Text").val();
				if (isEmpty(validate)) {
					alert("Leaving on cannot be empty");
					$("#LeavingOn_Text").select(); return;
				}

				validate = $("#CabHour_Text").val();
				if (isEmpty(validate)) {
					alert("Time cannot be empty");
					$("#CabHour_Text").select(); return;
				}


				validate = $("#CabHour_Text").val();
				if (isNaN(validate) || parseInt(validate) < 0 || parseInt(validate) > 12) {
					alert("Invalid Hours. 12 hrs clock.");
					$("#CabHour_Text").select(); return;
				}

				validate = $("#CabMin_Text").val();
				if (isEmpty(validate)) {
					alert("Time cannot be empty");
					$("#CabMin_Text").select(); return;
				}

				validate = $("#CabMin_Text").val();
				if (isNaN(validate) || parseInt(validate) < 0 || parseInt(validate) > 59) {
					alert("Invalid minutes.");
					$("#CabMin_Text").select(); return;
				}

				// forming date
				var date = $("#LeavingOn_Text").val().trim() +" "+ $("#CabHour_Text").val().trim() + ":" + $("#CabMin_Text").val().trim() + " " + $("#Meridian").val();

				//sending capacity, date and destination in the same order.

				$.ajax({
					type: 'POST',
					url: "Default.aspx/AddCab",
					data: "{'capacity':'" + $("#CabCapasity_Text").val().trim() + "','date':'" + date + "','destination':'" + $("#CabTo_Text").val().trim() + "'}",
					contentType: "application/json; charset=utf-8",
					datatype: "json",
					success: function (msg) {
						switch (msg.d) {
							case 0: alert("Log in to add a Cab!"); break;
							case 2: alert("Couldn't Add Cab. Internal Error!.\n Please try after sometime."); break;
							case 1: // Reload the page. 
								window.location.href = "Default.aspx?Scrollme";
						}
					}
				});
			}
			}
			});

			// Ticker
//			var presentTitle = " -> " + document.title;
//			var Tickers = ($("#BodyContentPlaceHolder_Ticker_Hidden").val()).split("||");
//			var index = 0;
//			if (Tickers[0].length > 0) {
//				setInterval(function () {
//					if (index == Tickers.length) {
//						index = 0;
//					}
//					document.title = Tickers[index++] + presentTitle;
//				}, 5000);
//			}

			$("#ticker_div").css({height: 28, width: '100%'})
			$("#ticker_div").cycle({
				fx: 'blindY',
				timeout: 4000,
				pause: 1
			});
			$("#ticker_div p").css("width","100%");


			var presentObj;				// Saves the hovered Object
			var presentIndex = 0;		// Hovered object's index
			var Margins = new Array("50px","160px","100px","60px","170px");	// Left margins of all the Categories
			var Categories = $("#BodyContentPlaceHolder_Categories_DataList").children().children("a");
			for (var i = 0; i < Margins.length; i++) {
				Categories[i].style.marginLeft = Margins[i];
			}

//			$("#BodyContentPlaceHolder_Categories_DataList").wrapAll("<a id='categoryWrapper'></a>");
//			$("#BodyContentPlaceHolder_Categories_DataList").parent().css({display: "block", height: "144px"}).addClass("ui-corner-all").bind("mouseleave", function () {
//				$(this).children().children("span").css("display","inline").removeClass("CategoryAnimatePosition").css({left: 0, top: 0});
//				$("#categoryWrapper").css("background","rgba(0,0,0,0)").removeAttr("href").parent().css("background-image","url('../_images/Panel_Background.gif')");
//				$(presentObj).children("a").css({"margin-left" : Margins[presentIndex], color: "Blue"});
//			}).end().children("span").bind("mouseover", function () {
//				presentObj = $(this);
//				presentIndex = $(this).index("span");
//				presentIndex = (presentIndex - 15) / 2;
//				$(this).children("a").css({"margin-left":10, color: "#FFF"});
//				if (presentIndex == 4) {	// Changing color if its Misc
//					$(this).children("a").css({color: "#000"});
//				}
//				$(this).children("a:eq(4)").css({"margin-left":10, color: "#000"});
//				if (presentIndex == 0 || presentIndex == 2 || presentIndex == 1) { // adding black box for Books and Sports
//					$("#categoryWrapper").css("background","rgba(0,0,0,0.5)").attr("href",$(this).children().attr("href")).parent().css("background-image","url('" + "images/" + ($(this).text()).trim() + ".jpg" + "')");
//				}
//				else {
//					$("#categoryWrapper").attr("href",$(this).children().attr("href")).parent().css("background-image","url('" + "images/" + ($(this).text()).trim() + ".jpg" + "')");    
//				}
//				$(this).siblings("span").css("display","none").end().addClass("CategoryAnimatePosition").animate({left: 0, top: '10px'}, 300);
//			});

		});	// Document.Ready

		function checkIfIE6() {		// Not using for now.
			var rv = 0; // assuming true, i.e
			if (navigator.appName == 'Microsoft Internet Explorer')
			{
				var ua = navigator.userAgent;
				var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
				if (re.exec(ua) != null)
				  rv = parseFloat( RegExp.$1 );
				if (rv < 6) {
					return false;
				}
			}
			return true;
		}

		function isEmpty(value) {
			if (value.trim().length == 0)
				return true;
			return false;
		}

		function AddCab() {
			$.ajax({
				type: 'POST',
				url: "Default.aspx/CheckLogin",
				data: "{}",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				success: function (msg) {
					if (!msg.d) {
						alert("Please log in to add a cab!");
						return false;
					}
					else {
						$("#AddCab_dialog").dialog("open");
						return true;
					}
				}
			});
		}

    </script>
    <script type="text/javascript">
        function updateTable() {
            var val = document.getElementById("BodyContentPlaceHolder_Filter_Text").value.toLowerCase();
            val = val.trim();
            $("#BodyContentPlaceHolder_Cabs_GridView tr").each(function () {
                elems = $(this).children();
                if ($(elems).text().trim().toLowerCase().indexOf(val) < 0) {
                    $(this).addClass("hideMe");
                }
                else {
                    $(this).removeClass("hideMe");
                }
            });
            if (val.length > 0) {
                $('#BodyContentPlaceHolder_Cabs_GridView tr:gt(0)').removeHighlight().highlight(val);
            }
            else {
                $('#BodyContentPlaceHolder_Cabs_GridView tr:gt(0)').removeHighlight();
            }
        }
    </script>
    <style type="text/css">
        .style1
        {
            width: 97px;
        }
        .hideMe
        {
            display: none;
        }
        #BodyContentPlaceHolder_Cabs_GridView tr:first-child
        {
            display: table-row !important;
        }
        .highlight
        {
            background-color: yellow;
            box-shadow: 2px 2px 2px #888;
            padding: 1px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <input id="Ticker_Hidden" type="hidden" runat="server" />
    <div id="topPanels">
        <div class="Panel" id="Students_Updates">
            <div class="Panel_header">
                <h2 class="Panel_header_text">
                    Latest Uploads <a href="../ViewAllItems/Default.aspx" target="_blank" title="View all the uploads till now"
                        style="font-size: 12px; border-bottom: 1px dashed #FFF; margin-left: 600px; color: #FFF;">
                        View All</a></h2>
            </div>
            <div class="Panel_body" runat="server" id="StudentsUpdates_Body">
                <p style="text-align: center">
                    No New Updates :(
                    <br />
                    &nbsp;&rarr; Referesh Page...</p>
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="middlePanels">
        <div class="Panel" id="Category_list">
            <div class="Panel_header">
                <h2 class="Panel_header_text">
                    Categories</h2>
            </div>
            <div class="Panel_body">
                <asp:DataList ID="Categories_DataList" runat="server" DataSourceID="Categories_ObjectDataSource"
                    RepeatColumns="2" ShowFooter="False" ShowHeader="False" RepeatDirection="Horizontal"
                    RepeatLayout="Flow" Width="414px" EnableViewState="False">
                    <ItemTemplate>
                        <a href='<%#String.Format("{0}{1}","../Category_clicked/Default.aspx?Category=",Eval("Category_name_vc")) %>'
                            runat="server" id="Category_id" style="display: inline-block; margin: 10px;">
                            <asp:Label ID="Category_Label" runat="server" Text="<%# BIND('Category_name_vc') %>"></asp:Label>
                        </a>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="Categories_ObjectDataSource" runat="server" SelectMethod="TableDetails"
                    TypeName="HomeFunction">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="EBay_Category_Mst" Name="tableName" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="Panel" id="SignIn">
            <div class="Panel_header">
                <h2 class="Panel_header_text">
                    Sign In
                    <asp:Label ID="asADiffUser" runat="server" EnableViewState="False"></asp:Label></h2>
            </div>
            <div class="Panel_body">
                <p style="text-align: center; color: Red" runat="server" id="errorLabel">
                </p>
                <div style="margin-left: 10px;">
                    <table cellpadding="10" cellspacing="10">
                        <tr>
                            <td class="style1">
                                E-mail
                            </td>
                            <td>
                                :&nbsp;&nbsp;
                                <asp:TextBox ID="email_TextBox" runat="server" EnableViewState="False" EnableTheming="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                Password
                            </td>
                            <td>
                                :&nbsp;&nbsp;
                                <asp:TextBox ID="password_TextBox" runat="server" EnableViewState="False" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p style="height: 15px">
                                </p>
                                <asp:Button ID="Submit_Button" runat="server" Height="30px" Text="Submit" Width="90px"
                                    OnClick="Submit_Button_Click" EnableViewState="False" />
                                &nbsp;
                                <asp:HyperLink ID="Register_HyperLink" runat="server" ToolTip="Register & get your Campus eBay account right away!"
                                    Font-Size="10pt" Font-Underline="True" ForeColor="Blue" NavigateUrl="../Sign_Up/Default.aspx"
                                    Target="_blank" EnableViewState="False">Sign Up!</asp:HyperLink>
                                &nbsp;
                                <asp:HyperLink ID="ForgotPass_HyperLink" runat="server" ToolTip="Change your password right away :)"
                                    Font-Size="10pt" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/Forgot_Pass/Default.aspx"
                                    Target="_blank" EnableViewState="False">Forgot/Change Password?</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="Panel" id="Notices">
        <div class="Panel_header">
            <h2 class="Panel_header_text">
                Notices&nbsp;&nbsp;<span style="font-size: 10px;">Hover ur mouse to pause amination!</span>
                <a href="javascript:void(0)" class="ClickViewAll" title="View all Notices">View All</a></h2>
        </div>
        <div class="Panel_body">
            <div id="noticesBody" runat="server" style="float: left; width: 432px;" class="ViewAllBody">
                <p style="text-align: center;">
                    No New Notices!
                    <br />
                    Add one right away :)</p>
            </div>
            <div class="Panel" id="LostAndFound">
                <div class="Panel_header">
                    <h2 class="Panel_header_text">
                        Lost And Found &nbsp;
                        <%--<span style="font-size: 10px;">Hover ur mouse to pause amination!</span>--%>
                        <a href="javascript:void(0)" class="ClickViewAll" title="View all Lost and Found!">View
                            All</a></h2>
                </div>
                <div class="Panel_body">
                    <div id="LAFBody" runat="server" class="ViewAllBody">
                        <p style="text-align: center;">
                            No New Lost And Found items!<br />
                            Add one right away :(
                        </p>
                    </div>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
    <div class="Panel" id="Cabs">
        <div class="Panel_header">
            <h2 class="Panel_header_text">
                Campus eBay - Share Cabs!
            </h2>
        </div>
        <div class="Panel_body" runat="server" id="CabsList">
            <asp:ScriptManager ID="Cabs_ScriptManager" runat="server">
            </asp:ScriptManager>
            <asp:UpdateProgress ID="Cabs_UpdateProgress" runat="server" AssociatedUpdatePanelID="Cabs_UpdatePanel"
                DisplayAfter="200">
                <progresstemplate>
					<p style="background: #000; opacity: 0.8; color: #FFF; text-align: center; padding: 3px;
						position: absolute; right: 0;">
						<img src="images/loading_background.gif" alt="Loading..." width="50" />
					</p>
				</progresstemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="Cabs_UpdatePanel" runat="server" UpdateMode="Conditional">
                <contenttemplate>
					<br />
					Filter &rarr;
					<input id="Filter_Text" type="text" onkeyup="updateTable()" maxlength="10" runat="server" />
					<br />
					<p style="text-align: center" runat="server" id="Cabs_EmptyText">
						<br />
						<br />
						<asp:LinkButton ID="AddCab_LinkButton" runat="server" OnClientClick="AddCab()">Add Cab!</asp:LinkButton>
						<br />
						<br />
						<br />
					</p>
					<br />
					<center>
						<asp:Label ID="Error_Label" runat="server" Text="" ForeColor="Red"></asp:Label></center>
					<asp:GridView ID="Cabs_GridView" runat="server" AllowSorting="True" AutoGenerateColumns="False"
						CellPadding="10" DataKeyNames="Sno_ID_pk_bi,Student_id_fk_bi" DataSourceID="Cabs_SqlDataSource"
						ForeColor="#333333" GridLines="None" CellSpacing="2" OnDataBound="Cabs_GridView_DataBound"
						Width="100%" OnRowDeleting="Cabs_GridView_RowDeleting">
						<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
						<Columns>
							<asp:TemplateField SortExpression="Destination_vc" HeaderText="Destination">
								<ItemTemplate>
									<asp:Label ID="Departure_Label" runat="server" Text="<%# BIND('Destination_vc') %>"></asp:Label>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="Departure_TextBox" runat="server" Text="<%# BIND('Destination_vc') %>"
										Width="100px"></asp:TextBox>
								</EditItemTemplate>
							</asp:TemplateField>
							<%--<asp:BoundField DataField="Destination_vc" HeaderText="Destination" SortExpression="Destination_vc" />--%>
							<asp:BoundField DataField="Departure" HeaderText="Departure" SortExpression="Departure"
								ReadOnly="True">
								<HeaderStyle Width="15%" />
								<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
							</asp:BoundField>
							<asp:TemplateField HeaderText="Capacity" SortExpression="Capasity_ti" ItemStyle-Width="80px"
								ItemStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:Label ID="Capasity_Label" runat="server" Text="<%# BIND('Capasity_ti') %>"></asp:Label>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="Capasity_TextBox" runat="server" Text="<%# BIND('Capasity_ti') %>"
										Width="35px" MaxLength="2"> </asp:TextBox>
								</EditItemTemplate>
								<ItemStyle HorizontalAlign="Center" Width="80px" />
							</asp:TemplateField>
							<asp:BoundField DataField="Student_Name_vc" HeaderText="Added by" SortExpression="Student_Name_vc"
								ReadOnly="true">
								<HeaderStyle Width="15%" />
								<ItemStyle VerticalAlign="Middle" />
							</asp:BoundField>
							<asp:BoundField DataField="Phone_No_vc" HeaderText="Phone" SortExpression="Phone_No_vc"
								ReadOnly="true">
								<HeaderStyle Width="15%" />
							</asp:BoundField>
							<asp:BoundField DataField="AddedOn" HeaderText="Added On" SortExpression="AddedOn"
								ReadOnly="True">
								<HeaderStyle Width="13%" />
								<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
							</asp:BoundField>
							<asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<%--<asp:LinkButton ID="Edit_LinkButton" runat="server" CommandName="Edit">Edit</asp:LinkButton>
							&nbsp;--%>
									<asp:LinkButton ID="Delete_LinkButton" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure?');">Delete</asp:LinkButton>
								</ItemTemplate>
								<%--<EditItemTemplate>
							<asp:LinkButton ID="Update_LinkButton" runat="server" CommandName="Update">Update</asp:LinkButton>
							&nbsp;
							<asp:LinkButton ID="Cancel_LinkButton" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
						</EditItemTemplate>--%>
								<ItemStyle Width="15%" />
							</asp:TemplateField>
						</Columns>
						<EditRowStyle BackColor="#999999" />
						<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
						<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
						<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
						<SortedAscendingCellStyle BackColor="#E9E7E2" />
						<SortedAscendingHeaderStyle BackColor="#506C8C" />
						<SortedDescendingCellStyle BackColor="#FFFDF8" />
						<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
					</asp:GridView>
					<a href="javascript:void(0)" onclick="AddCab()" style="margin-left: 30px; margin-bottom: 15px;
						display: inline-block;" title="Share your cab!">Add New</a>
					<asp:SqlDataSource ID="Cabs_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
						DeleteCommand="DELETE FROM [Ebay_Cabs] WHERE [Sno_ID_pk_bi] = @Sno_ID_pk_bi"
						SelectCommand="SELECT Sno_ID_pk_bi,Student_id_fk_bi,Capasity_ti, Student_Name_vc, Phone_No_vc, CONVERT(varchar,DepartureDate_sdt,100) as 'Departure', 
CONVERT(varchar, AddedOn_sdt, 103) as 'AddedOn', Destination_vc
FROM [Ebay_Cabs], EBay_Student
where Student_ID_pk_bi = Student_id_fk_bi
ORDER BY [DepartureDate_sdt], [Destination_vc] " UpdateCommand="UPDATE [Ebay_Cabs] SET [Capasity_ti] = @Capasity_ti, [Destination_vc] = @Destination_vc WHERE [Sno_ID_pk_bi] = @Sno_ID_pk_bi">
						<DeleteParameters>
							<asp:Parameter Name="Sno_ID_pk_bi" Type="Int64" />
						</DeleteParameters>
						<UpdateParameters>
							<asp:Parameter Name="Capasity_ti" Type="Byte" />
							<asp:Parameter Name="Destination_vc" Type="String" />
							<asp:Parameter Name="Sno_ID_pk_bi" Type="Int64" />
						</UpdateParameters>
					</asp:SqlDataSource>
				</contenttemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div title="Full Story..." id="ellipsis_dialog" style="font-size: 14px;">
    </div>
    <div title="Share Cabs using Campus eBay!" id="AddCab_dialog">
        <table style="width: 100%;" cellspacing="10" cellpadding="5">
            <tr>
                <td class="style2">
                    Going to
                </td>
                <td>
                    <input id="CabTo_Text" title="Destination" type="text" style="width: 190px" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Capacity
                </td>
                <td>
                    <input id="CabCapasity_Text" title="Number of People u can accomodate" type="text"
                        maxlength="2" style="width: 25px; text-align: center;" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Leaving on
                </td>
                <td valign="middle">
                    <input id="LeavingOn_Text" title="Date" type="text" style="width: 100px" readonly="readonly" />
                    @
                    <input id="CabHour_Text" maxlength="2" type="text" style="width: 25px; text-align: center;" />
                    :
                    <input id="CabMin_Text" maxlength="2" type="text" style="width: 25px; text-align: center;" />
                    <select id="Meridian">
                        <option>AM</option>
                        <option>PM</option>
                    </select>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
