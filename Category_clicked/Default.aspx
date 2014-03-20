<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Home_Default" %>

<%--TO CHECK::Check the necessity of "show per page label" in the category list panel. If the name of the category
    is large then ellipses should be displayed ,auto adjusting to the width specified. Images are given
    specified dimensions(square) which should go in to seperrate div tag("Category_list_body_images_box")
     created for it.--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../_css/PanelStyles.css" rel="stylesheet" type="text/css" />
    <link href="Category_clicked.css" rel="stylesheet" type="text/css" />
    <link href="../_css/tabControl.css" rel="stylesheet" type="text/css" />
    <script src="../JQuery.js" type="text/javascript"></script>
    <script src="../_scripts/jquery.corner.src.js" type="text/javascript"></script>
    <script src="../_scripts/jquery.ThreeDots.js" type="text/javascript"></script>
    <script src="../_scripts/createLink.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#Category_list .Panel_body").corner("20px bl br");
            $("#BodyContentPlaceHolder_CategoryResult_DataList img, #BodyContentPlaceHolder_CategoryItems_DataList img").addClass("ui-corner-all")
            $(".TabControl_Body").corner("20px tl br")
            //$(".tabControl_Header .tabControl_tab").first().corner("20px tl")

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
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div class="Panel" id="Category_list">
        <div class="Panel_header">
            <h2 class="Panel_header_text" runat="server" id="CategoryTitle">
            </h2>
            <a href="../ViewAllItems/Default.aspx" target="_blank" title="View all the uploads till now"
                style="font-size: 12px; text-decoration: none; border-bottom: 1px dashed #FFF;
                float: right; margin: 12px 50px 0 0; color: #FFF;">View All</a><span style="clear: both;"></span>
        </div>
        <div class="Panel_body">
            <%--<div class="Pages_preference">
				<p>
					Show
					<asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="40px"></asp:TextBox>
					Per Page
				</p>
			</div>--%>
            <div class="clear">
            </div>
            <div id="Category_Navigation" runat="server" style="font-size: 11px; text-align: right;">
                <asp:LinkButton ID="CPrevBtn" runat="server"><< Previous</asp:LinkButton>
                <asp:LinkButton ID="CNextBtn" runat="server">Next >></asp:LinkButton>
            </div>
            <asp:DataList ID="CategoryItems_DataList" runat="server" RepeatColumns="6" RepeatDirection="Horizontal"
                ShowHeader="False" Width="100%">
                <ItemTemplate>
                    <table style="margin: 10px 15px;">
                        <tr>
                            <td>
                                <div style="overflow: hidden; height: 85px; width: 125px;">
                                    <asp:Image ID="Item_Image" runat="server" ToolTip='<%# Eval("description_t") %>'
                                        ImageUrl='<%#String.Format("{0}{1}","~/items_images/",Eval("URL_vc")) %>' Width="125px" />
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
                        <asp:Label ID="lblEmpty" Text="No Items Found! <br /> Upload one now" runat="server"
                            Visible='<%# CategoryItems_DataList.Items.Count == 0 ? true : false %>'>  
                        </asp:Label>
                    </div>
                </FooterTemplate>
            </asp:DataList>
            <%--<div class="Category_list_body">
				<div class="Category_list_body_images_box">
					<img alt="Books" class="Category_list_body_images" src="Category_clicked_images/books.png" />
				</div>
				<p class="Category_list_body_text">
					BOOKS</p>
			</div>
			<div class="Category_list_body">
				<div class="Category_list_body_images_box">
					<img alt="Books" class="Category_list_body_images" src="Category_clicked_images/laptop.png" />
				</div>
				<p class="Category_list_body_text">
					BOOKS</p>
			</div>
			<div class="Category_list_body">
				<div class="Category_list_body_images_box">
					<img alt="Books" class="Category_list_body_images" src="Category_clicked_images/books.png" />
				</div>
				<p class="Category_list_body_text">
					BOOKS</p>
			</div>
			<div class="Category_list_body">
				<div class="Category_list_body_images_box">
					<img alt="Books" class="Category_list_body_images" src="Category_clicked_images/books.png" />
				</div>
				<p class="Category_list_body_text">
					BOOKS</p>
			</div>
			<div class="Category_list_body">
				<div class="Category_list_body_images_box">
					<img alt="Books" class="Category_list_body_images" src="Category_clicked_images/books.png">
				</div>
				<p class="Category_list_body_text">
					BOOKS</p>
			</div>
			<div class="Category_list_body">
				<div class="Category_list_body_images_box">
					<img alt="Books" class="Category_list_body_images" src="Category_clicked_images/books.png" />
				</div>
				<p class="Category_list_body_text">
					BOOKS</p>
			</div>--%>
        </div>
    </div>
    <div id="tabSpace" runat="server">
        <div class="tabControl" id="TabControl1" runat="server">
            <div class="tabControl_Header" id="TabControlHeader">
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
                    <asp:LinkButton ID="TPrevBtn" runat="server"><< Previous</asp:LinkButton>
                    <asp:LinkButton ID="TNextBtn" runat="server">Next >></asp:LinkButton>
                </div>
                <asp:DataList ID="CategoryResult_DataList" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                    ShowHeader="False" Width="100%">
                    <ItemTemplate>
                        <table style="margin: 10px 15px;">
                            <tr>
                                <td>
                                    <div style="overflow: hidden; height: 85px; width: 125px;">
                                        <asp:HyperLink ID="Image_HyperLink" runat="server" NavigateUrl='<%#String.Format("{0}{1}","~/Item_Clicked/Default.aspx?ItemID=",Eval("Item_ID_pk_bi")) %>'>
                                            <asp:Image ID="Item_Image" runat="server" ToolTip='<%# Eval("description_t") %>'
                                                ImageUrl='<%#String.Format("{0}{1}","~/items_images/",Eval("URL_vc")) %>' Width="125px" /></asp:HyperLink>
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
</asp:Content>
