using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Admin_Pages_RunAQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Button_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = ConnectionManager.Connect())
        {
            try
            {
                SqlCommand com = new SqlCommand(Query_TextBox.Text.Trim(), con);
                com.CommandType = CommandType.Text;
                Result_GridView.DataSource = com.ExecuteReader(CommandBehavior.SingleResult | CommandBehavior.CloseConnection);
                Result_GridView.DataBind();
                Result_Label.Text = "Success!";
            }
            catch (Exception exp)
            {
                Result_Label.Text = exp.Message;
            }
        }
    }
}