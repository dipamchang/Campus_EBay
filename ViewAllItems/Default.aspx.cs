using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAllItems_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Items_GridView_PageIndexChanged(object sender, EventArgs e)
    {
        Filter_Text.Value = "";
        Filter_Text.Focus();
    }
    protected void Items_GridView_Sorted(object sender, EventArgs e)
    {
        Filter_Text.Value = "";
        Filter_Text.Focus();
    }
}