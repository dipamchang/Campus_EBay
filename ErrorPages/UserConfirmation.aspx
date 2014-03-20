<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
	CodeFile="UserConfirmation.aspx.cs" Inherits="ErrorPages_UserConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		h1, h2
		{
			margin: 5px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
	<div style="background: #FFF; padding: 20px; margin: 30px; height: 300px;">
		<h1 id="checking" style="color: Green;" runat="server">
			Checking...
		</h1>
		<div id="ErrorMessage" runat="server" style="text-align: center;">
			<h2 style="color: Red;">
				Your link has expired.
			</h2>
			<p>
				Please register once again @ <a href="../Sign_Up/Default.aspx">Campus eBay</a> :)
			</p>
		</div>
	</div>
</asp:Content>
