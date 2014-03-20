<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Admin_Pages_Default" %>

<%--Admins login and gain access to Admin Pages--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		.loginTablePadding
		{
			padding: 3px;
		}
	</style>
</asp:Content>
<asp:Content ID="AdminPage" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
	<div style="width: 660px; background: #FFF; padding: 20px; margin: 5px auto; height: 200px;">
		<div style="width: 500px; margin: 5px auto;">
			<br />
			<br />
			<center>
				<asp:Label ID="Result_Label" runat="server" Visible="false" ForeColor="Red">
				Couldn't Login. Username and Password mismatch!
				</asp:Label>
			</center>
			<table cellspacing="2" style="width: 100%;">
				<tr>
					<td class="loginTablePadding">
						&nbsp; Username
					</td>
					<td>
						&nbsp;:&nbsp;
					</td>
					<td>
						&nbsp;
						<asp:TextBox ID="AdminUsername_TextBox" runat="server" CausesValidation="True" ValidationGroup="Login"
							Width="150px"></asp:TextBox>
					</td>
					<td>
						<asp:RequiredFieldValidator ID="Username_RequiredFieldValidator" runat="server" ErrorMessage="* Required"
							ForeColor="Red" ValidationGroup="Login" ControlToValidate="AdminUsername_TextBox"
							SetFocusOnError="True">  * Username Required</asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td class="loginTablePadding">
						&nbsp; Password
					</td>
					<td>
						&nbsp;:&nbsp;
					</td>
					<td>
						&nbsp;
						<asp:TextBox ID="AdminPassword_TextBox" runat="server" CausesValidation="True" TextMode="Password"
							ValidationGroup="Login" Width="150px"></asp:TextBox>
					</td>
					<td>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Required"
							ForeColor="Red" ValidationGroup="Login" ControlToValidate="AdminPassword_TextBox"
							SetFocusOnError="True">* Password Required</asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="loginTablePadding">
						<br />
						<center>
							<asp:Button ID="Login_Button" runat="server" Text="Login" ValidationGroup="Login"
								Width="100px" Height="28px" OnClick="Login_Button_Click" />
						</center>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</div>
	</div>
</asp:Content>
