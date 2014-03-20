using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Pages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login_Button_Click(object sender, EventArgs e)
    {
        //Result_Label.Text = CommonFunctions.getMd5Hash(AdminPassword_TextBox.Text);
        string query = "select COUNT(Student_ID_pk_bi) from EBay_Student where Username_vc = '"
            + AdminUsername_TextBox.Text + "' and Password_vc = '" + CommonFunctions.getMd5Hash(AdminPassword_TextBox.Text) + "' and IsAdmin_bool = 1";
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand(query, con);
            com.CommandType = CommandType.Text;
            if ((int)com.ExecuteScalar() == 0)
            {
                Result_Label.Visible = true;
                
                AdminUsername_TextBox.Focus();
            }
            else
            {
                Session["isadmin"] = true;
                Session["isloggedin"] = false;      // Stop normal Master Page Conflict

                Response.Redirect("~/Admin_Pages/ErrorList.aspx", true);
            }
        }
    }
}