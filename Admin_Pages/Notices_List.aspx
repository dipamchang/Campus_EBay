<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Pages/Admin_Pages.master"
	AutoEventWireup="true" CodeFile="Notices_List.aspx.cs" Inherits="Admin_Pages_Notices_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPages" runat="Server">
	<asp:SqlDataSource ID="Notice_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
		DeleteCommand="DELETE FROM [EBay_Notices] WHERE [Notices_ID_pk_bi] = @Notices_ID_pk_bi"
		
		SelectCommand="select Notices_ID_pk_bi, Notice_t, datename(&quot;M&quot;,Upload_Time_sdt) +' '
+ DATENAME(&quot;dd&quot;,Upload_Time_sdt) +', '+ DATENAME(&quot;YEAR&quot;,Upload_Time_sdt) +'  '+ DATENAME(&quot;HH&quot; , Upload_Time_sdt)+':'+ 
DATENAME(&quot;MINUTE&quot; , Upload_Time_sdt), IsModerated_bool from EBay_Notices  order by Notices_ID_pk_bi DESC" 
		UpdateCommand="UPDATE [EBay_Notices] SET [IsModerated_bool] = @IsModerated_bool WHERE [Notices_ID_pk_bi] = @Notices_ID_pk_bi">
		<DeleteParameters>
			<asp:Parameter Name="Notices_ID_pk_bi" Type="Int64" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="IsModerated_bool" Type="Boolean" />
			<asp:Parameter Name="Notices_ID_pk_bi" Type="Int64" />
		</UpdateParameters>
	</asp:SqlDataSource>
	<asp:ScriptManager ID="Notice_ScriptManager" runat="server">
	</asp:ScriptManager>
	<asp:UpdatePanel ID="ErrorList_UpdatePanel" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:UpdateProgress ID="ErrorList_UpdateProgress" runat="server" DisplayAfter="0">
				<ProgressTemplate>
					<p style="text-align: center; padding: 4px; background: #CCC;">
						Loading...</p>
				</ProgressTemplate>
			</asp:UpdateProgress>
			<asp:GridView ID="Notice_GridView" runat="server" AllowPaging="True" AllowSorting="True"
				AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Notices_ID_pk_bi" DataSourceID="Notice_SqlDataSource"
				Width="100%" Font-Names="Segoe UI,Verdana,Arial" ForeColor="#333333" GridLines="None"
				Style="text-align: center" CellSpacing="1" PageSize="50">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="Notice_t" HeaderText="Notice" SortExpression="Notice_t">
						<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
					</asp:BoundField>
					<asp:BoundField DataField="Column1" HeaderText="Date" SortExpression="Column1"
						ReadOnly="True">
						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:BoundField>
					<asp:CheckBoxField DataField="IsModerated_bool" HeaderText="Approve?" SortExpression="IsModerated_bool">
						<HeaderStyle Width="10%" />
					</asp:CheckBoxField>
					<asp:CommandField CausesValidation="False" ShowEditButton="True">
						<HeaderStyle Width="12%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:CommandField>
					<asp:CommandField ShowDeleteButton="True">
						<HeaderStyle Width="8%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:CommandField>
				</Columns>
				<EditRowStyle BackColor="#999999" />
				<EmptyDataTemplate>
					<asp:Label ID="EmptyErrorList_Label" runat="server" Text="No Items Found :<"></asp:Label>
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
