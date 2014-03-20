<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Forgot_Pass_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../_css/PanelStyles.css" rel="stylesheet" type="text/css" />
    <link href="ForgotPass.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 168px;
        }
        .Panel_body
        {
            -moz-border-radius: 5px 0px 5px 0px;
            border-radius: 25px 0px 25px 0px;
        }
        .style2
        {
            width: 85px;
        }
    </style>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("BodyContentPlaceHolder_BITS_ID_TextBox").select();
        }
        function BITSID_Validate() {
//            alert(bitsid.match(/\d{4}[a-z]\d{1}[a-z]\d{4}g|\d{4}[a-z]\d{1}\w{2}\d{3}g/gi));
//            return false;
            var bitsid = document.getElementById("BodyContentPlaceHolder_BITS_ID_TextBox").value;
            if (bitsid.length < 12)
                return false;
//            else {
//               
//                return false;
//            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div class="Panel" id="ForgotPass">
        <div class="Panel_header">
            <div class="Panel_header_text" style="padding-left: 5px; padding-right: 5px;">
                Forgot Password :(
            </div>
        </div>
        <div class="Panel_body" style="padding-top: 15px;">
            <div id="ForgotPassForm">
                <center>
                    <asp:Label ID="Error_Label" runat="server" Font-Names="Segoe UI,Arial,Sans-Serif;"
                        CssClass="Fail"></asp:Label>
                </center>
                <table cellpadding="3px" cellspacing="15px" style="margin-top: 20px;">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="BITS_ID_Label" runat="server">BITS ID</asp:Label>
                            &nbsp;*
                        </td>
                        <td class="style1">
                            :
                            <asp:TextBox ID="BITS_ID_TextBox" runat="server" MaxLength="12" EnableViewState="False"
                                AutoComplete="Off"></asp:TextBox>
                        </td>
                        <td>
                            <p id="bitsidResult">
                                <asp:RequiredFieldValidator ID="BITSID_RequiredFieldValidator" runat="server" ControlToValidate="BITS_ID_TextBox"
                                    ErrorMessage="* BITS ID exactly same at the time of registration." ForeColor="Red"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Username_Label" runat="server" Text="E-mail"></asp:Label>
                            &nbsp;*
                        </td>
                        <td class="style1">
                            :
                            <asp:TextBox ID="Username_TextBox" runat="server" MaxLength="35" EnableViewState="False"
                                AutoComplete="Off"></asp:TextBox>
                        </td>
                        <td>
                            <p id="usernameResult">
                                <asp:RequiredFieldValidator ID="BITSID_RequiredFieldValidator0" runat="server" ControlToValidate="Username_TextBox"
                                    ErrorMessage="* Email/Username exactly same at the time of registration." ForeColor="Red"
                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="Username_TextBox" Display="Dynamic" ErrorMessage="* Invalid Email"
                                    ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </p>
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="30%" style="margin: 20px">
                    <tr>
                        <td>
                            <asp:Button ID="Sign_Up_Submit" runat="server" Text="Send Mail" CssClass="Button"
                                EnableTheming="True" OnClick="Sign_Up_Submit_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div style="display: none;">
        <table id="EmailTable" width='100%' border='0' cellspacing='5' cellpadding='0' style='font-family: Segoe UI, Verdana, Arial, sans-serif;'
            runat="server">
            <tr>
                <td colspan='4' align='center'>
                    <h2>
                        <a style='font-weight: lighter; color: #900; text-decoration: underline;' runat="server"
                            id="eBayLink">Campus eBay : Forgot Password</a></h2>
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    Hi,
                </td>
            </tr>
            <tr>
                <td colspan='4' align='left'>
                    You have requested for a new password for your campus eBay account recently.
                </td>
            </tr>
            <tr>
                <td colspan='4' align='center'>
                    <p>
                        &nbsp;</p>
                    <p>
                        Click <a href='#' id="ResetLink" runat="server"></a>to reset your password</p>
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan='4' align='left'>
                    Please ignore if you haven't requested for one.
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan='4' align='center'>
                    <em style='color: #F00;'>Link valid only for 24 hrs from now</em>
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    Happy Shopping :)
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    - <em>Campus eBay Team<br />
                        2011</em>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
