using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pages_Admin_Pages : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isadmin"] == null)
            Response.Redirect("~/Home/Default.aspx", true);

    }

    protected void LogoutAdmin_LinkButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Home/Default.aspx", true);
    }
   
}
