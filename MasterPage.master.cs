using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isloggedin"] != null && (bool)Session["isloggedin"])
        {
            logout.Visible = true;
            string name = Session["studentname"].ToString();
            if (name.IndexOf(' ') > 0)
            {
                if (name.IndexOf(' ') > 0)
                    UserWelcomeLabel.Text = "Welcome " + name.Substring(0, name.IndexOf(' ')) + "!";
                else
                    UserWelcomeLabel.Text = "Welcome " + name + "!";
            }
            else
            {
                UserWelcomeLabel.Text = "Welcome " + name + "!";
            }

            logout.ToolTip = "Logout " + name + " :(";
            Session.Add("studentname", name);
        }
        else
            logout.Visible = false;
    }

    protected void Search_TextBox_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/Advanced_Search/Default.aspx?ItemName=" + Search_TextBox.Text, true);
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        // Clear Session and redirect to Home page.
        Session.RemoveAll();
        Session.Clear();
        Response.Redirect("~/Home/Default.aspx", true);
    }

    public string MyTickerText
    {
        set
        {
            ticker_div.InnerHtml = value;
        }
    }

    /*
     * Get ToolTipStudentDetails was moved to Home.cs as Error 403 was occuring when referred to masterpage.master
     * */
}
