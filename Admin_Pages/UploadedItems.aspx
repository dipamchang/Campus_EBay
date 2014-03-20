<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Pages/Admin_Pages.master"
	AutoEventWireup="true" CodeFile="UploadedItems.aspx.cs" Inherits="Admin_Pages_UploadedItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPages" runat="Server">
	<asp:SqlDataSource ID="Items_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
		DeleteCommand="DELETE FROM [EBay_Item] WHERE [Item_ID_pk_bi] = @Item_ID_pk_bi"
		SelectCommand="select Item_ID_pk_bi, Item_Name_vc, Description_t, URL_vc from EBay_Item order by Item_ID_pk_bi DESC">
		<DeleteParameters>
			<asp:Parameter Name="Item_ID_pk_bi" Type="Int64" />
		</DeleteParameters>
	</asp:SqlDataSource>
	<asp:ScriptManager ID="Items_ScriptManager" runat="server">
	</asp:ScriptManager>
	<asp:UpdatePanel ID="ErrorList_UpdatePanel" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:UpdateProgress ID="ErrorList_UpdateProgress" runat="server" DisplayAfter="0">
				<ProgressTemplate>
					<p style="text-align: center; padding: 4px; background: #CCC;">
						Loading...</p>
				</ProgressTemplate>
			</asp:UpdateProgress>
			<asp:GridView ID="UploadedItems_GridView" runat="server" AllowPaging="True" AllowSorting="True"
				AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Item_ID_pk_bi" DataSourceID="Items_SqlDataSource"
				Width="100%" Font-Names="Segoe UI,Verdana,Arial" ForeColor="#333333" GridLines="None"
				Style="text-align: center" CellSpacing="1" PageSize="50" OnRowDeleting="ErrorList_GridView_RowDeleting">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="Item_ID_pk_bi" HeaderText="Item ID" InsertVisible="False"
						ReadOnly="True" SortExpression="Item_ID_pk_bi">
						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:BoundField>
					<asp:BoundField DataField="Item_Name_vc" HeaderText="Name" SortExpression="Item_Name_vc">
						<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="18%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
					</asp:BoundField>
					<asp:BoundField DataField="Description_t" HeaderText="Description" SortExpression="Description_t">
						<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
					</asp:BoundField>
					<asp:ImageField HeaderText="Image" DataImageUrlFormatString="~/items_images/{0}"
						DataImageUrlField="URL_vc">
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Height="100px" />
					</asp:ImageField>
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
