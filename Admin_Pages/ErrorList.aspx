<%@ Page Title="Error List : Campus eBay" Language="C#" MasterPageFile="~/Admin_Pages/Admin_Pages.master"
	AutoEventWireup="true" CodeFile="ErrorList.aspx.cs" Inherits="Admin_Pages_ErrorList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPages" runat="Server">
	<asp:SqlDataSource ID="Error_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
		DeleteCommand="DELETE FROM [Ebay_ErrorList] WHERE [Sno_bi] = @Sno_bi" 
		SelectCommand="select Sno_bi, ErrorType_vc,  Error_Desctiption_t,datename(&quot;M&quot;,Time_sdt) +' '
+ DATENAME(&quot;dd&quot;,time_sdt) +', '+ DATENAME(&quot;YEAR&quot;,Time_sdt) +'  '+ DATENAME(&quot;HH&quot; , Time_sdt)+':'+ 
DATENAME(&quot;MINUTE&quot; , Time_sdt) from Ebay_ErrorList ORDER BY [Time_sdt] DESC , Sno_bi DESC"
		
		UpdateCommand="UPDATE [Ebay_ErrorList] SET [ErrorType_vc] = @ErrorType_vc, [Error_Desctiption_t] = @Error_Desctiption_t WHERE [Sno_bi] = @Sno_bi">
		<DeleteParameters>
			<asp:Parameter Name="Sno_bi" Type="Int64" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="ErrorType_vc" Type="String" />
			<asp:Parameter Name="Error_Desctiption_t" Type="String" />
			<asp:Parameter Name="Sno_bi" Type="Int64" />
		</UpdateParameters>
	</asp:SqlDataSource>
	<asp:ScriptManager ID="ErrorList_ScriptManager" runat="server">
	</asp:ScriptManager>
	<asp:UpdatePanel ID="ErrorList_UpdatePanel" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:UpdateProgress ID="ErrorList_UpdateProgress" runat="server" 
				DisplayAfter="0">
				<ProgressTemplate>
					<p style="text-align:center; padding: 4px; background: #CCC;">Loading...</p>
				</ProgressTemplate>
			</asp:UpdateProgress>
			<asp:GridView ID="ErrorList_GridView" runat="server" AllowPaging="True" AllowSorting="True"
				AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Sno_bi" DataSourceID="Error_SqlDataSource"
				Width="100%" Font-Names="Segoe UI,Verdana,Arial" ForeColor="#333333" GridLines="None"
				Style="text-align: center" CellSpacing="1" PageSize="50">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="Sno_bi" HeaderText="Sno." InsertVisible="False" ReadOnly="True"
						SortExpression="Sno_bi">
						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:BoundField>
					<asp:BoundField DataField="ErrorType_vc" HeaderText="Error Type" SortExpression="ErrorType_vc">
						<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" 
                            CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" 
                            CssClass="gridviewPadding" />
					</asp:BoundField>
					<asp:BoundField DataField="Column1" HeaderText="Date" SortExpression="Column1" ReadOnly="true">
						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="18%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:BoundField>
					<asp:BoundField DataField="Error_Desctiption_t" HeaderText="Description" SortExpression="Error_Desctiption_t">
						<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" 
                            CssClass="gridviewPadding" Width="10%" />
						<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
					</asp:BoundField>
					<asp:CommandField CausesValidation="False" ShowEditButton="True">
						<HeaderStyle Width="12%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:CommandField>
					<asp:CommandField ShowSelectButton="True">
						<HeaderStyle Width="8%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:CommandField>
					<asp:CommandField ShowDeleteButton="True">
						<HeaderStyle Width="8%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:CommandField>
				</Columns>
				<EditRowStyle BackColor="#999999" />
				<EmptyDataTemplate>
					<asp:Label ID="EmptyErrorList_Label" runat="server" Text="Yippee! No Errors Found :)"></asp:Label>
				</EmptyDataTemplate>
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" VerticalAlign="Middle" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
			</asp:GridView>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
