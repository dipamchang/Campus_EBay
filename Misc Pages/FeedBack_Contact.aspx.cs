using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Misc_Pages_FeedBack_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //FeedBack_ResultLabel.InnerHtml = "";
    }
    protected void SubmitFeedback_Click(object sender, EventArgs e)
    {
        string msg = Feedback.InnerText;
        msg = msg.Trim();
        if (msg.Length == 0)
        {
            FeedBack_ResultLabel.InnerHtml = "Empty Feedback. Write something and send!";
            return;
        }
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("insert into Ebay_Feedback (IPAddress_nc, Feedback_t) values ('" 
                + Request.ServerVariables["REMOTE_ADDR"] + "','" + msg + "')", con);
            com.CommandType = CommandType.Text;
            try
            {
                com.ExecuteNonQuery();
            }
            catch (Exception exp)
            {
                CommonFunctions.logTheError("Feedback", exp);
            }
            
        }
        FeedBack_ResultLabel.InnerHtml = "Thank you very much for the feedback :)";
        Feedback.InnerText = "";
        Feedback.Focus();
    }
}