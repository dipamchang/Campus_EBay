using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pages_Tickers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Ticker_DetailsView_Load(object sender, EventArgs e)
    {
        Ticker_DetailsView.DefaultMode = DetailsViewMode.Insert;
    }
}