using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class ErrorPages_PasswordReset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count < 2)
        {
            Response.Redirect("~/Home/Default.aspx");
        }
    }
    protected void Sign_Up_Submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Password_TextBox.Text == RePass_TextBox.Text && Password_TextBox.Text.Trim().Length > 5)
            {
                using (SqlConnection con = ConnectionManager.Connect())
                {
                    SqlCommand com = new SqlCommand("delete from Ebay_PasswordReset where DATEDIFF(SECOND, Date_sdt, GETDATE()) > 86400", con);
                    com.CommandType = System.Data.CommandType.Text;
                    com.ExecuteNonQuery();

                    com.CommandText = "select COUNT(Student_ID_fk_bi) from Ebay_PasswordReset where Student_ID_fk_bi = '" + Request.QueryString["SID"] + "' and SecurityKey_nc = '" + Request.QueryString["SKey"] + "'";
                    if ((int)com.ExecuteScalar() == 0)
                    {
                        checking.Visible = false;
                        ErrorText.Visible = true;
                        ResetPassword.Visible = false;
                    }
                    else
                    {

                        com.CommandText = "update EBay_Student set Password_vc = '" + CommonFunctions.getMd5Hash(RePass_TextBox.Text) + "' where Student_ID_pk_bi = '" + Request.QueryString["SID"] + "'";

                        if (com.ExecuteNonQuery() > 0)
                        {
                            com.CommandText = "delete from Ebay_PasswordReset where SecurityKey_nc = '" + Request.QueryString["SKey"] + "' and Student_ID_fk_bi = '" + Request.QueryString["SID"] + "'";
                            com.ExecuteNonQuery();

                            checking.Visible = true;
                            ErrorText.Visible = false;
                            ResetPassword.Visible = false;
                        }
                        else
                        {
                            checking.Visible = false;
                            ErrorText.Visible = true;
                            ErrorText.InnerText = "We are sorry! Couldn't process your request. Please retry after sometime.";
                        }
                    }
                }
            }
            else
            {
                ErrorText.Visible = true;
                ErrorText.InnerText = "Password should atleast be 5 characters long!";
            }
        }
        catch (Exception exp)
        {
            checking.Visible = false;
            ErrorText.Visible = true;
            ErrorText.InnerText = "We are sorry! Couldn't process your request. Please retry after sometime.";
            CommonFunctions.logTheError("ErrorPages Reset Password - ", exp);
        }
    }
}