using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Home_Default : System.Web.UI.Page
{
    string category = "electronics"; // The default category

    const int CPageSize = 5;
    const int TPageSize = 10;

    int CPageIndex = 0;
    int TPageIndex = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString.AllKeys.Length > 0)
        {
            string input = Request.QueryString["Category"].ToString();

            input = input.ToLower();

            switch (input)
            {
                case "books": break;
                case "electronics": break;
                case "sports": break;
                case "music": break;
                case "misc": break;
                default: Response.Redirect("../Home/Default.aspx", true);
                    break;
            }

            category = input;

        }
        else
            Response.Redirect("../Home/Default.aspx", true);
        try
        {

            DataSet ds;
            if (!IsPostBack)
            {
                category = category.Substring(0, 1).ToUpper() + category.Substring(1).ToLower();
                CategoryTitle.InnerText = category;
                Page.Title = "Campus eBay :: " + category;

                AdvSearch.pageIndex = 0;

                AdvSearch.pageSize = CPageSize;
                ds = AdvSearch.Search(new int[1] { 2 }, category);
                CategoryItems_DataList.DataSource = ds;
                CategoryItems_DataList.DataBind();
                ViewState.Add("CPageIndex", 0);

                AdvSearch.pageSize = TPageSize;
                ds = AdvSearch.Search(new int[1] { 2 }, "books");
                CategoryResult_DataList.DataSource = ds;
                CategoryResult_DataList.DataBind();
                ViewState.Add("TPageIndex", 0);
                ViewState.Add("TCategory", "books");

                MakeTabsNormal();
                Books_LinkButton.CssClass = "CurrentTab";

            }


            // For that Category's items listing. The first Panel.
            if (Request.QueryString["CPageIndex"] != null && ViewState["CPageIndex"].ToString() != Request.QueryString["CPageIndex"])
            {
                AdvSearch.pageSize = CPageSize;
                CPageIndex = Convert.ToInt32(Request.QueryString["CPageIndex"]);
                AdvSearch.pageIndex = CPageIndex;

                ds = AdvSearch.Search(new int[1] { 2 }, category);
                CategoryItems_DataList.DataSource = ds;
                CNextBtn.Visible = (ds.Tables[0].Rows.Count < CPageSize) ? false : true;
                CategoryItems_DataList.DataBind();
                ViewState["CPageIndex"] = CPageIndex;
            }

            // Tabs here
            else if (Request.QueryString["TPageIndex"] != null)
            {
                AdvSearch.pageSize = TPageSize;
                TPageIndex = Convert.ToInt32(Request.QueryString["TPageIndex"]);
                AdvSearch.pageIndex = TPageIndex;

                ds = AdvSearch.Search(new int[1] { 2 }, ViewState["TCategory"].ToString());
                CategoryResult_DataList.DataSource = ds;
                TNextBtn.Visible = (ds.Tables[0].Rows.Count < TPageSize) ? false : true;
                CategoryResult_DataList.DataBind();
                ViewState["TPageIndex"] = TPageIndex;
            }

            CPageIndex = Convert.ToInt32(ViewState["CPageIndex"]);
            TPageIndex = Convert.ToInt32(ViewState["TPageIndex"]);

            CUpdateNextPrevLinks();
            TUpdateNextPrevLinks(TPageIndex);
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("CategoryClicked.cs - PageLoad", exp);
        }
    }

    protected void CUpdateNextPrevLinks()
    {
        string navigationFormat = "Default.aspx?Category={1}&CPageIndex={0}&TPageIndex={2}";

        CPrevBtn.PostBackUrl = String.Format(navigationFormat, CPageIndex - 1, category, TPageIndex);
        CPrevBtn.Visible = (CPageIndex > 0) ? true : false;
        CPrevBtn.ToolTip = "See the previous " + CPageSize + " items";

        CNextBtn.PostBackUrl = String.Format(navigationFormat, CPageIndex + 1, category, TPageIndex);
        CNextBtn.ToolTip = "See the next " + CPageSize + " items";
    }

    protected void TUpdateNextPrevLinks(int index)
    {
        string navigationFormat = "Default.aspx?Category={0}&CPageIndex={2}&TPageIndex={1}";

        TPrevBtn.PostBackUrl = String.Format(navigationFormat, category, index - 1, CPageIndex);
        TPrevBtn.Visible = (index > 0) ? true : false;
        TPrevBtn.ToolTip = "See the previous " + TPageSize + " items";

        TNextBtn.PostBackUrl = String.Format(navigationFormat, category, index + 1, CPageIndex);
        TNextBtn.ToolTip = "See the next " + TPageSize + " items";
    }

    protected void MakeTabsNormal()
    {
        foreach (Control con in TabControl1.Controls)
        {
            if (con is LinkButton)
            {
                ((LinkButton)con).CssClass = "NormalTab";
            }
        }
    }

    protected void Books_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartInLinks("Books");
        Books_LinkButton.CssClass = "CurrentTab";
    }
    protected void Electronics_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartInLinks("Electronics");
        Electronics_LinkButton.CssClass = "CurrentTab";
    }
    protected void Sports_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartInLinks("Sports");
        Sports_LinkButton.CssClass = "CurrentTab";
    }
    protected void Music_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartInLinks("Music");
        Music_LinkButton.CssClass = "CurrentTab";
    }
    protected void Misc_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartInLinks("Misc");
        Misc_LinkButton.CssClass = "CurrentTab";
    }

    private void CommonPartInLinks(string cat)
    {
        try
        {


            ViewState["TCategory"] = cat;
            AdvSearch.pageIndex = 0; AdvSearch.pageSize = 10;
            ViewState["TPageIndex"] = 0;
            DataSet ds = AdvSearch.Search(new int[1] { 2 }, cat);
            CategoryResult_DataList.DataSource = ds;
            TNextBtn.Visible = (ds.Tables[0].Rows.Count < TPageSize) ? false : true;
            CategoryResult_DataList.DataBind();
            MakeTabsNormal();
            TUpdateNextPrevLinks(0);
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("CategoryClicked.cs - CommonPartinLinks", exp);
        }
    }
}