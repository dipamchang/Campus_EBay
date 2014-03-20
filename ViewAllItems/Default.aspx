<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="ViewAllItems_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../JQuery.js" type="text/javascript"></script>
    <script src="../_scripts/HighlightMe.js" type="text/javascript"></script>
    <script src="../_scripts/createLink.js" type="text/javascript"></script>
    <style type="text/css">
        td
        {
            padding-left: 10px;
        }
        th
        {
            -moz-border-radius: 10px 10px 0 0;
            border-radius: 10px 10px 0 0;
        }
        tr:last-child td
        {
            -moz-border-radius: 0 0 10px 10px;
            border-radius: 0 0 10px 10px;
        }
        tr:first-child td
        {
            -moz-border-radius: 10px;
            border-radius: 10px;
        }
        tr:last-child
        {
            display: table-row !important;
        }
        .HideMe
        {
            overflow: hidden;
            width: 244px;
        }
        .col1
        {
            width: 150px !important;
        }
        .col2
        {
            width: 100px;
        }
        .col3
        {
            width: 207px;
        }
        .col4
        {
            width: 100px;
        }
        .col5
        {
            width: 200px;
        }
        .hideMe
        {
            display: none;
        }
        .PadRightForPrice
        {
            padding-right: 5px;
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
    <script type="text/javascript">
        window.onload = function () {
            var TableHeader = document.getElementsByTagName("th");
            for (var i = 0; i < TableHeader.length; i++) {
                TableHeader[i].setAttribute("title", " Click to Sort ");
            }
            $("#BodyContentPlaceHolder_Items_GridView tr:first").css({ ' -moz-border-radius': '3px',
                'border-radius': '3px'
            });

            document.getElementById("BodyContentPlaceHolder_Filter_Text").value = "";
            document.getElementById("BodyContentPlaceHolder_Filter_Text").focus();
        }
    </script>
    <script type="text/javascript">
        function updateTable() {
            var val = document.getElementById("BodyContentPlaceHolder_Filter_Text").value.toLowerCase();
            val = val.trim(); 
            $("#BodyContentPlaceHolder_Items_GridView tr:gt(2)").each(function () {
                elems = $(this).children();
                if ($(elems).text().trim().toLowerCase().indexOf(val) < 0) {
                    $(this).addClass("hideMe");
                }
                else {
                    $(this).removeClass("hideMe");
                }
            });
            if (val.length > 0) {

                $('#BodyContentPlaceHolder_Items_GridView tr:gt(2)').removeHighlight().highlight(val);
            }
            else {
                $('#BodyContentPlaceHolder_Items_GridView tr:gt(2)').removeHighlight();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div style="background: #FFF; padding: 20px; margin-top: 10px; -moz-border-radius: 10px;
        border-radius: 10px">
        <h2 style="margin: 0px auto 10px auto;">
            <asp:SqlDataSource ID="Items_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
                SelectCommand="SELECT [Item_ID_pk_bi], [Item_Name_vc], Category_Name_vc, [Upload_Time_sdt], [Price_m], [Description_t] 
				FROM [EBay_Item], EBay_Category_Mst where Category_ID_fk_bi = Category_ID_pk_bi ORDER BY [Item_ID_pk_bi] DESC">
            </asp:SqlDataSource>
            List of All Items uploaded till now...
        </h2>
        <asp:ScriptManager ID="Items_ScriptManager" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="Items_UpdatePanel" runat="server">
            <contenttemplate>
				<br />
				Filter &rarr;
				<input id="Filter_Text" type="text" onkeyup="updateTable()" maxlength="10" runat="server"
					 />
				<br />
				<br />
				<asp:GridView ID="Items_GridView" runat="server" AllowPaging="True" AllowSorting="True"
					AutoGenerateColumns="False" CellPadding="5" CellSpacing="5" DataKeyNames="Item_ID_pk_bi"
					DataSourceID="Items_SqlDataSource" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
					PageSize="50" Width="100%" OnPageIndexChanged="Items_GridView_PageIndexChanged"
					OnSorted="Items_GridView_Sorted">
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<Columns>
						<asp:HyperLinkField DataNavigateUrlFields="Item_ID_pk_bi" DataNavigateUrlFormatString="~/Item_Clicked/Default.aspx?ItemID={0}"
							DataTextField="Item_Name_vc" HeaderText="Item" SortExpression="Item_Name_vc"
							Target="_self">
							<HeaderStyle CssClass="col1" />
							<ItemStyle CssClass="col1" Wrap="True" />
						</asp:HyperLinkField>
						<asp:HyperLinkField DataNavigateUrlFields="Category_Name_vc" DataNavigateUrlFormatString="~/Category_clicked/Default.aspx?Category={0}"
							DataTextField="Category_Name_vc" HeaderText="Category" SortExpression="Category_Name_vc">
							<HeaderStyle CssClass="col2" />
							<ItemStyle CssClass="col2" />
						</asp:HyperLinkField>
						<asp:BoundField DataField="Upload_Time_sdt" HeaderText="Uploaded On..." SortExpression="Upload_Time_sdt">
							<HeaderStyle CssClass="col3" />
							<ItemStyle VerticalAlign="Middle" CssClass="col3" />
						</asp:BoundField>
						<asp:BoundField DataField="Price_m" HeaderText="Price" SortExpression="Price_m" 
                            DataFormatString="{0:n}">
							<HeaderStyle CssClass="col4" />
							<ItemStyle CssClass="col4 PadRightForPrice" HorizontalAlign="Right" VerticalAlign="Middle" />
						</asp:BoundField>
						<asp:BoundField DataField="Description_t" HeaderText="About" SortExpression="Description_t">
							<HeaderStyle CssClass="col5" />
							<ItemStyle CssClass="col5" HorizontalAlign="Left" VerticalAlign="Middle" />
						</asp:BoundField>
					</Columns>
					<EditRowStyle BackColor="#999999" />
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="30px"
						HorizontalAlign="Center" VerticalAlign="Middle" />
					<PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
					<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
					<SortedAscendingCellStyle BackColor="#E9E7E2" />
					<SortedAscendingHeaderStyle BackColor="#506C8C" />
					<SortedDescendingCellStyle BackColor="#FFFDF8" />
					<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
				</asp:GridView>
			</contenttemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
