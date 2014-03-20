<%@ Page Title="Campus eBay :: Advanced Search" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Advanced_Search_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../_css/PanelStyles.css" rel="stylesheet" type="text/css" />
    <link href="_css/SearchStyles.css" rel="stylesheet" type="text/css" />
    <script src="../JQuery.js" type="text/javascript"></script>
    <script src="DatePicker_AutoComplete.js" type="text/javascript"></script>
    <link href="_css/jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css" />
    <script src="../_scripts/jquery.corner.src.js" type="text/javascript"></script>
    <script src="../_scripts/jquery.ThreeDots.js" type="text/javascript"></script>
    <script src="../_scripts/createLink.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            $("#BodyContentPlaceHolder_itemName_Textbox").select();

            if ((window.location.href).indexOf("?") > 0)
                window.scrollTo(0, 570);

            $('.oneLine').ThreeDots({
                max_rows: 1,
                whole_word: false,
                ellipsis_string: "<a href='javascript:void(0)'>...</a>"
            });

            $(".oneLine .threedots_ellipsis").each(function () {
                $(this).children().attr("title", $(this).parent().attr("threedots"));
            });

            $("#BodyContentPlaceHolder_Search_Button, #BodyContentPlaceHolder_SearchResult_DataList img").addClass("ui-corner-all");

            var dates = $("#BodyContentPlaceHolder_fromDate_Textbox, #BodyContentPlaceHolder_toDate_Textbox").datepicker({
                changeMonth: true,
                dateFormat: 'dd MM, yy',
                onSelect: function (selectedDate) {
                    var option = this.id == "BodyContentPlaceHolder_fromDate_Textbox" ? "minDate" : "maxDate",
					instance = $(this).data("datepicker");
                    date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings);
                    dates.not(this).datepicker("option", option, date);
                }
            });

            $("#BodyContentPlaceHolder_fromDate_Textbox").datepicker({ "maxDate": '+1D' });

            $("#ui-datepicker-div").css("z-index", 1000);

            $("#Search_Result .Panel_body").corner("70px tl br");
            $("#Advanced_Search .Panel_body").corner("15px bl br");



            //alert(document.getElementById("BodyContentPlaceHolder_SearchResult_DataList_Item_Image_1").offsetHeight);
            // resize images
            //			$("#BodyContentPlaceHolder_SearchResult_DataList img").each(function () {

            //				//alert(this.height);
            //				if (ht > 100) {

            //					$("#BodyContentPlaceHolder_SearchResult_DataList img").height(12500 / ht); 	// assuming the default width is 125
            //				}
            //			})

        });

        function CheckForm() {
            $("#BodyContentPlaceHolder_searchFields :text").each(function () {
                if ($(this).val().trim().length > 0) {
                    return true;
                }
            });

            if ($("#BodyContentPlaceHolder_category_DropDownList").val() > 0 || $("#BodyContentPlaceHolder_Hostel_DropDownList").val() > 0) {
                return true;
            }

            if ($("#BodyContentPlaceHolder_searchDescription_Textbox").val().trim().length > 0) {
                return true;
            }

            alert("Fill any of the fields and then press Search!");
            $("#BodyContentPlaceHolder_itemName_Textbox").focus();
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <%--<input id="from" type="text" />--%>
    <div class="Panel" id="Advanced_Search">
        <div class="Panel_header">
            <h2 class="Panel_header_text">
                Filter it as much as u want!!
            </h2>
        </div>
        <div class="Panel_body">
            <center>
                <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="ErrorLabel"></asp:Label></center>
            <div class="Search_Category" runat="server" id="searchFields">
                <div class="Category_text">
                    Item Name
                </div>
                <div class="Search_Box">
                    : &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="itemName_Textbox" runat="server"></asp:TextBox>
                </div>
                <div class="clear">
                </div>
                <div class="Category_text">
                    Category
                </div>
                <div class="Search_Box">
                    : &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="category_DropDownList" runat="server" Width="155px">
                        <asp:ListItem Text="Any" Selected="True" Value="0" />
                    </asp:DropDownList>
                </div>
                <div class="clear">
                </div>
                <div class="Category_text">
                    Hostel
                </div>
                <div class="Search_Box">
                    : &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="Hostel_DropDownList" runat="server" Width="155px">
                        <asp:ListItem Selected="True" Value="0">Any</asp:ListItem>
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
                    </asp:DropDownList>
                </div>
                <div class="clear">
                </div>
                <div class="Category_text">
                    E-mail
                </div>
                <div class="Search_Box">
                    : &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="userName_Textbox" runat="server"></asp:TextBox>
                </div>
                <div class="clear">
                </div>
                <div class="Category_text">
                    Name
                </div>
                <div class="Search_Box">
                    : &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="name_Textbox" runat="server"></asp:TextBox>
                </div>
                <div class="clear">
                </div>
                <div class="Category_text">
                    <center>
                        From
                    </center>
                </div>
                <div class="Search_Box">
                    : &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="fromDate_Textbox" runat="server" CssClass="fromDate"></asp:TextBox>
                    <%--<input id="to" type="text" />--%>
                </div>
                <div class="Category_text">
                    <center>
                        To :</center>
                </div>
                <div class="Search_Box">
                    <asp:TextBox ID="toDate_Textbox" runat="server" CssClass="toDate"></asp:TextBox>
                    <%--<input id="to" type="text" />--%>
                </div>
                <div class="clear">
                </div>
                <div class="Search_text">
                    Search this in the descriptions of items
                </div>
                <div class="clear">
                </div>
                <div class="Category_text">
                    <asp:TextBox ID="searchDescription_Textbox" runat="server" Width="680px" Height="140px"
                        TextMode="MultiLine" Font-Names="Segoe UI, Arial, Sans-Serif" MaxLength="20"></asp:TextBox>
                </div>
                <div class="clear">
                </div>
                <asp:Button ID="Search_Button" runat="server" Text="Search" CssClass="Search_Button"
                    OnClick="Search_Button_Click" PostBackUrl="~/Advanced_Search/Default.aspx?PageIndex=0&amp;BtnClick=1" />
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="Panel" id="Search_Result">
        <div class="Panel_header" style="z-index: 3">
            <h2 class="Panel_header_text">
                Your Search Results
            </h2>
        </div>
        <div class="Panel_body">
            <div id="Navigation" runat="server" style="font-size: 11px; text-align: right;">
                <asp:LinkButton ID="PrevBtn" runat="server"><< Previous</asp:LinkButton>
                <asp:LinkButton ID="NextBtn" runat="server">Next >></asp:LinkButton>
            </div>
            <asp:DataList ID="SearchResult_DataList" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                ShowHeader="false" HorizontalAlign="Justify" Width="100%">
                <ItemStyle VerticalAlign="Top" HorizontalAlign="Center" />
                <ItemTemplate>
                    <table style="margin: 30px 15px 0 20px;">
                        <tr>
                            <td>
                                <div style="overflow: hidden; height: 85px; width: 125px;">
                                    <asp:HyperLink runat="server" NavigateUrl='<%#String.Format("{0}{1}","~/Item_Clicked/Default.aspx?ItemID=",Eval("Item_ID_pk_bi")) %>'>
                                        <asp:Image ID="Item_Image" runat="server" ToolTip='<%# Eval("description_t") %>'
                                            ImageUrl='<%#String.Format("{0}{1}","~/items_images/",Eval("URL_vc")) %>' Width="125px" />
                                    </asp:HyperLink>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div class="oneLine" style="width: 100px;">
                                    <asp:HyperLink ID="Name_Label" runat="server" Text='<%# Eval("Item_Name_vc") %>'
                                        NavigateUrl='<%#String.Format("{0}{1}","~/Item_Clicked/Default.aspx?ItemID=",Eval("Item_ID_pk_bi")) %>'
                                        CssClass="ellipsis_text"></asp:HyperLink>
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
                        <asp:Label ID="lblEmpty" Text="No Items Found! <br /> <br /> Search differently :)"
                            runat="server" Visible='<%# SearchResult_DataList.Items.Count == 0 ? true : false %>'>  
                        </asp:Label>
                    </div>
                </FooterTemplate>
            </asp:DataList>
        </div>
    </div>
    <br />
</asp:Content>
