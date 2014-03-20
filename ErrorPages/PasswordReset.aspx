<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
	CodeFile="PasswordReset.aspx.cs" Inherits="ErrorPages_PasswordReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		h1, h2
		{
			margin: 5px;
		}
		.Button
		{
			background-image: url("../_images/Button.png");
			background-repeat: repeat-x;
			width: 200px;
			height: 31px;
			font-size: 18px;
			color: #FFF;
			border: none;
			font-family: Calibri, Arial, Times New Roman;
			-moz-border-radius: 5px;
			border-radius: 5px;
		}
		.Button:hover
		{
			cursor: pointer;
		}
		.style2
		{
			width: 172px;
		}
		.style3
		{
			width: 20px;
		}
		.style4
		{
			width: 217px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
	<div style="background: #FFF; padding: 20px; margin: 30px; height: 300px; -moz-border-radius: 35px 0 35px 0;
		border-radius: 35px 0 35px 0;">
		<h2 id="checking" style="color: Green;" visible="false" runat="server" align="center">
			Password Successfully Changed!
			<br />
			Please login from HOME Page.
		</h2>
		<h2 style="color: Red;" id="ErrorText" runat="server" visible="false" align="center">
			Your link has expired.
		</h2>
		<div id="ResetPassword" runat="server">
			<br />
			<h2>
				Reset your password here &rarr;</h2>
			<br />
			<table style="width: 100%;" cellpadding="10" cellspacing="10">
				<tr>
					<td class="style4">
						New Password * <span style="font-size: 12px; color: Red;">(Min 5 characters)</span>
					</td>
					<td class="style3">
						&nbsp; :
					</td>
					<td class="style2">
						<asp:TextBox ID="Password_TextBox" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
					</td>
					<td>
						<asp:RequiredFieldValidator ID="Password_RequiredFieldValidator" runat="server" ControlToValidate="Password_TextBox"
							Display="Dynamic" ErrorMessage="* Required " ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td class="style4">
						Retype New Password *
					</td>
					<td class="style3">
						&nbsp; :
					</td>
					<td class="style2">
						<asp:TextBox ID="RePass_TextBox" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
					</td>
					<td>
						<asp:RequiredFieldValidator ID="Password_RequiredFieldValidator0" runat="server"
							ControlToValidate="RePass_TextBox" Display="Dynamic" ErrorMessage="* Required "
							ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
						<asp:CompareValidator ID="Password_CompareValidator" runat="server" ControlToCompare="Password_TextBox"
							ControlToValidate="RePass_TextBox" Display="Dynamic" ErrorMessage="* Fields are not matching"
							ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
					</td>
				</tr>
				<tr>
					<td class="style4">
						&nbsp;
					</td>
					<td class="style3">
						&nbsp;
					</td>
					<td class="style2">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<asp:Button ID="Sign_Up_Submit" runat="server" Text="Change My Password" CssClass="Button"
							EnableTheming="True" OnClick="Sign_Up_Submit_Click" />
					</td>
				</tr>
			</table>
		</div>
	</div>
</asp:Content>
