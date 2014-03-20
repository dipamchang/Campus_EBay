using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Forgot_Pass_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Error_Label.Text = "";
    }
    protected void Sign_Up_Submit_Click(object sender, EventArgs e)
    {
        string email = Username_TextBox.Text;
        string BITSID = BITS_ID_TextBox.Text;

        if (BITSID.Length < 12)
        {
            Error_Label.CssClass = "Fail";
            Error_Label.Text = "Inavlid BITS ID!";
            return;
        }

        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("select Student_ID_pk_bi from EBay_Student where BITS_ID_vc = '" + BITSID + "' and Username_vc = '" + email + "'", con);
            com.CommandType = CommandType.Text;

            string SID = com.ExecuteScalar().ToString();

            if (SID.Length > 0)
            {
                // Send email

                string SKey = CommonFunctions.RandomString();

                com.CommandText = "insert into Ebay_PasswordReset (Student_ID_fk_bi, SecurityKey_nc) Values ('" + SID + "', '" + SKey + "')";

                if (com.ExecuteNonQuery() > 0)
                {
                    eBayLink.HRef = ConfigurationManager.AppSettings["homeAddress"].ToString();
                    string Link = ConfigurationManager.AppSettings["homeAddress"] + "ErrorPages/PasswordReset.aspx?SKey=" + SKey + "&SID=" + SID;
                    ResetLink.HRef = Link;
                    ResetLink.InnerHtml = Link;

                    System.IO.StringWriter sw = new System.IO.StringWriter();
                    HtmlTextWriter htw = new HtmlTextWriter(sw);
                    EmailTable.RenderControl(htw);
                    SendMail.byGmail(email, "Campus eBay: Forgot Password!", sw.ToString());

                    BITS_ID_TextBox.Text = "";
                    Username_TextBox.Text = "";
                    BITS_ID_TextBox.Focus();

                }
            }
        }
        Error_Label.CssClass = "Success";
        Error_Label.Text = "E-Mail Sent! This Mail is valid only for 24 hrs.";
    }
}