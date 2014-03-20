<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Pages/Admin_Pages.master"
	AutoEventWireup="true" CodeFile="Tickers.aspx.cs" Inherits="Admin_Pages_Tickers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		#AdminPages_Ticker_GridView th
		{
			padding: 5px;
		}
		#AdminPages_Ticker_GridView td, #AdminPages_Ticker_DetailsView td
		{
			padding: 5px;
		}
		#AdminPages_Ticker_DetailsView input[type=text]
		{
			width: 600px;
		}
	</style>
	<script type="text/javascript">
		window.onload = function () {
			//	document.getElementsByName("ctl00$AdminPages$Ticker_DetailsView$ctl01")[0].style.width = "600px";
			document.getElementsByName("ctl00$AdminPages$Ticker_DetailsView$ctl01")[0].focus();
		}

		//$("#AdminPages_Ticker_DetailsView").css("width", 600);
		
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPages" runat="Server">
	<asp:ScriptManager ID="Ticker_ScriptManager" runat="server">
	</asp:ScriptManager>
	<asp:UpdatePanel ID="Ticker_UpdatePanel" runat="server">
		<ContentTemplate>
			<asp:SqlDataSource ID="Ticker_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
				SelectCommand="SELECT * FROM [Ebay_Ticker]" InsertCommand="INSERT INTO [Ebay_Ticker] ([Ticker_text]) VALUES (@Ticker_text)"
				DeleteCommand="DELETE FROM [Ebay_Ticker] WHERE [Ticker_ID_bi] = @Ticker_ID_bi"
				UpdateCommand="UPDATE [Ebay_Ticker] SET [isVisible_b] = @isVisible_b, [Ticker_text] = @Ticker_text WHERE [Ticker_ID_bi] = @Ticker_ID_bi">
				<DeleteParameters>
					<asp:Parameter Name="Ticker_ID_bi" Type="Int64" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="Ticker_text" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="isVisible_b" Type="Boolean" />
					<asp:Parameter Name="Ticker_text" Type="String" />
					<asp:Parameter Name="Ticker_ID_bi" Type="Int64" />
				</UpdateParameters>
			</asp:SqlDataSource>
			<asp:GridView ID="Ticker_GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
				DataSourceID="Ticker_SqlDataSource" ForeColor="#333333" GridLines="None" CellSpacing="2"
				AllowSorting="True" EmptyDataText="No Tickers :(   Add One" DataKeyNames="Ticker_ID_bi">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="Ticker_text" HeaderText="Ticker Text" SortExpression="Ticker_text">
					</asp:BoundField>
					<asp:BoundField DataField="DateTime_sdt" HeaderText="Date" SortExpression="DateTime_sdt"
						ReadOnly="true" />
					<asp:CheckBoxField DataField="isVisible_b" HeaderText="Show?" SortExpression="isVisible_b" />
					<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
			<br />
			<br />
			<asp:DetailsView ID="Ticker_DetailsView" runat="server" CellPadding="4" DataSourceID="Ticker_SqlDataSource"
				ForeColor="#333333" GridLines="None" OnLoad="Ticker_DetailsView_Load" AutoGenerateRows="False"
				HorizontalAlign="Center">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
				<EditRowStyle BackColor="#999999" />
				<FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
				<Fields>
					<asp:BoundField DataField="Ticker_text" HeaderText="Ticker Text"></asp:BoundField>
					<asp:CommandField HeaderText="New" ShowInsertButton="True" />
				</Fields>
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Width="100px" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
			</asp:DetailsView>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
