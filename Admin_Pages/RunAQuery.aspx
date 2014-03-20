<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Pages/Admin_Pages.master"
	AutoEventWireup="true" CodeFile="RunAQuery.aspx.cs" Inherits="Admin_Pages_RunAQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		#AdminPages_Result_GridView
		{
			margin: 20px;
		}
		th
		{
			padding: 5px;
		}
		td
		{
			padding-left: 3px;
		}
		textarea
		{
			padding: 5px;
		}
	</style>
	<script type="text/javascript">
		function checkQueryWindow() {
			
			if (document.getElementById("AdminPages_Query_TextBox").value.trim().length == 0) {
				alert("Write some query and then press Run!");
				return false;
			}
			alert(document.getElementById("AdminPages_Query_TextBox").value.trim());
			return confirm(document.getElementById('AdminPages_Query_TextBox').value.trim() + "\n\nAre u Sure ?");
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPages" runat="Server">
	<br />
	Write your query here:<br />
	<br />
	<asp:TextBox ID="Query_TextBox" runat="server" Height="200px" TextMode="MultiLine"
		Width="100%"></asp:TextBox>
	<br />
	<br />
	<center>
		<asp:Button ID="Submit_Button" runat="server" Height="35px" OnClientClick="return checkQueryWindow()"
			Text="Run!" Width="100px" OnClick="Submit_Button_Click" />
	</center>
	<br />
	<br />
	Result: <b>
		<asp:Label ID="Result_Label" runat="server"></asp:Label></b>
	<br />
	<asp:GridView ID="Result_GridView" runat="server" CellPadding="4" CellSpacing="1"
		ForeColor="#333333" GridLines="None">
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
</asp:Content>
