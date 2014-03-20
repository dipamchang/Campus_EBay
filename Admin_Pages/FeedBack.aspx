<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Pages/Admin_Pages.master"
	AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="Admin_Pages_FeedBack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPages" runat="Server">
	<asp:SqlDataSource ID="FeedBack_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EBayConnectionString %>"
		DeleteCommand="DELETE FROM [Ebay_Feedback] WHERE [Sno_bi] = @Sno_bi" SelectCommand="select Sno_bi, Feedback_t,datename(&quot;M&quot;,SentAt_sdt) +' '
+ DATENAME(&quot;dd&quot;,SentAt_sdt) +', '+ DATENAME(&quot;YEAR&quot;,SentAt_sdt) +'  '+ DATENAME(&quot;HH&quot; , SentAt_sdt)+':'+ 
DATENAME(&quot;MINUTE&quot; , SentAt_sdt), Read_bool from Ebay_Feedback ORDER BY [SentAt_sdt] DESC, Sno_bi DESC"
		UpdateCommand="UPDATE [Ebay_Feedback] SET [Read_bool] = @Read_bool WHERE [Sno_bi] = @Sno_bi">
		<DeleteParameters>
			<asp:Parameter Name="Sno_bi" Type="Int64" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="Read_bool" Type="Boolean" />
			<asp:Parameter Name="Sno_bi" Type="Int64" />
		</UpdateParameters>
	</asp:SqlDataSource>
	<asp:ScriptManager ID="FeedBack_ScriptManager" runat="server">
	</asp:ScriptManager>
	<asp:UpdatePanel ID="FeedBackList_UpdatePanel" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<asp:UpdateProgress ID="ErrorList_UpdateProgress" runat="server" DisplayAfter="0">
				<ProgressTemplate>
					<p style="text-align: center; padding: 4px; background: #CCC">
						Loading...</p>
				</ProgressTemplate>
			</asp:UpdateProgress>
			<asp:GridView ID="FeedBacks_GridView" runat="server" AllowPaging="True" AllowSorting="True"
				AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Sno_bi" DataSourceID="FeedBack_SqlDataSource"
				Width="100%" Font-Names="Segoe UI,Verdana,Arial" ForeColor="#333333" GridLines="None"
				Style="text-align: center" CellSpacing="1" PageSize="50">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="Sno_bi" HeaderText="Sno," InsertVisible="False" ReadOnly="True"
						SortExpression="Sno_bi">
						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
					</asp:BoundField>
					<asp:BoundField DataField="Feedback_t" HeaderText="Feedback" SortExpression="Feedback_t"
						ReadOnly="true">
						<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="gridviewPadding" />
					</asp:BoundField>
					<asp:BoundField DataField="Column1" HeaderText="Sent On" SortExpression="Column1"
						ReadOnly="true">
						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%" CssClass="gridviewPadding" />
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridviewPadding" />
					</asp:BoundField>
					<asp:CheckBoxField DataField="Read_bool" HeaderText="Read" SortExpression="Read_bool">
						<HeaderStyle Width="7%" />
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
					<asp:Label ID="EmptyFeedBack_Label" runat="server" Text="No Feedback :("></asp:Label>
				</EmptyDataTemplate>
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" VerticalAlign="Middle" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<%--<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
			</asp:GridView>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
