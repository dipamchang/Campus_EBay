using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class Item_Clicked_Default : System.Web.UI.Page
{
    const int PageSize = 10; // For tab Control.
    int PageIndex = 0;
    string ItemID = "1"; // Default ItemID that shows up if something does wrong.

    //    string StudentID; // StudentID of logged in person
    // string itemOwnerID; // Student ID of the present item.

    Int64 OwnerId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        AdvSearch.pageSize = PageSize;
        ItemID = Request.QueryString["ItemID"];

        if (!IsPostBack)
        {
            ViewState.Add("ItemID", 0);
            ViewState.Add("category", "Books"); // The Default Category
            ViewState.Add("PageIndex", 0);
        }

        if (Request.QueryString["ItemID"] != null)
        {
            try
            {
                if (ViewState["ItemID"].ToString() != Request.QueryString["ItemID"].ToString())
                {
                    ViewState["ItemID"] = Request.QueryString["ItemID"];

                    using (SqlDataReader reader = ItemClicked.ItemDetails(ItemID))
                    {
                        if (!reader.HasRows)
                        {
                            sendMsg.Visible = false;
                            itemName_Label.Text = "Item sold or deleted :(";
                            owner_Label.Text = "###";
                            ((LinkButton)tabSpace.FindControl("Books_LinkButton")).CssClass = "CurrentTab";
                        }
                        else
                        {
                            reader.Read();

                            OwnerId = reader.GetInt64(8);

                            itemName_Label.Text = reader.GetString(0);
                            owner_Label.Text = reader.GetString(1) + ", " + reader.GetString(9).ToUpper();
                            owner_HyperLink.NavigateUrl = "../Advanced_Search/Default.aspx?StudentID=" + OwnerId + "&StudentName=" + reader.GetString(1);

                            Session["itemOwnerID"] = reader.GetInt64(8).ToString();

                            Book_Name.Text = reader.GetString(2) + " &rarr; " + reader.GetString(0);

                            Page.Title = "Campus eBay :: " + Book_Name.Text;
                            ViewState.Add("page_title", Page.Title);

                            item_Image.ImageUrl = "~/items_images/" + reader.GetString(4);
                            itemCost_Label.Text = reader.GetDecimal(6).ToString("0,0.00");
                            if (!reader.IsDBNull(7))
                                description_Label.Text = reader.GetString(7);
                            UploadedOn_Label.Text = reader.GetDateTime(3).ToString("MMM d, yyyy @ hh:mm tt");
                            if (!reader.IsDBNull(5))
                            {
                                Phone_Label.Text = reader.GetString(5);
                                Session["Phone"] = Phone_Label.Text;
                            }
                            else
                                Phone_Label.Text = "--";

                            toStudent.Value = reader.GetString(1).ToString();
                            itemName.Value = reader.GetString(0);

                            // Bolding the tab header category.
                            ((LinkButton)tabSpace.FindControl(ViewState["category"] + "_LinkButton")).CssClass = "CurrentTab";
                        }
                    }
                }
            }
            catch (Exception exp)
            {
                CommonFunctions.logTheError("Item_Cliked.cs - PageLoad", exp);
            }
        }
        else
        {
            Response.Redirect("../Home/Default.aspx", true);
        }


        if (Session["isloggedin"] != null && (bool)Session["isloggedin"])
        {
            if (owner_Label.Text.IndexOf(' ') > 0)
                sendMsg.ToolTip = "Send message to " + owner_Label.Text.Substring(0, owner_Label.Text.IndexOf(' '));
            else
                sendMsg.ToolTip = "Send message to " + owner_Label.Text;
        }
        else
        {
            sendMsg.ToolTip = "Log in to send message.";
        }

        //if (Request.QueryString["PageIndex"] != null && IsPostBack)
        //  PageIndex = Convert.ToInt32(Request.QueryString["PageIndex"]);

        if (Request.QueryString["PageIndex"] != null && IsPostBack)
        {
            ViewState["PageIndex"] = Request.QueryString["PageIndex"];
        }

        PageIndex = Convert.ToInt32(ViewState["PageIndex"]);
        AdvSearch.pageIndex = PageIndex;
        // Default Category for tab
        DataSet ds = AdvSearch.Search(new int[1] { 2 }, ViewState["category"].ToString());
        DisableEnableNextBtn(ds);
        CategoryResult_DataList.DataSource = ds;
        CategoryResult_DataList.DataBind();
        UpdateNextPrevLinks(PageIndex);
    }

    protected void UpdateNextPrevLinks(int index)
    {
        string navigationFormat = "Default.aspx?ItemID=" + ItemID + "&PageIndex={0}";

        PrevBtn.PostBackUrl = String.Format(navigationFormat, index - 1);
        PrevBtn.Visible = (index > 0) ? true : false;
        PrevBtn.ToolTip = "See the previous " + PageSize + " items";

        NextBtn.PostBackUrl = String.Format(navigationFormat, index + 1);
        NextBtn.ToolTip = "See the next " + PageSize + " items";

    }

    protected void Books_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartOfLinkBtns("Books");
        Books_LinkButton.CssClass = "CurrentTab";
    }
    protected void Electronics_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartOfLinkBtns("Electronics");
        Electronics_LinkButton.CssClass = "CurrentTab";
    }
    protected void Sports_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartOfLinkBtns("Sports");
        Sports_LinkButton.CssClass = "CurrentTab";
    }
    protected void Music_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartOfLinkBtns("Music");
        Music_LinkButton.CssClass = "CurrentTab";
    }
    protected void Misc_LinkButton_Click(object sender, EventArgs e)
    {
        CommonPartOfLinkBtns("Misc");
        Misc_LinkButton.CssClass = "CurrentTab";
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

    [System.Web.Services.WebMethod]
    public static bool checkLogIn()
    {
        if (HttpContext.Current.Session["isloggedin"] != null && (bool)HttpContext.Current.Session["isloggedin"])
        {
            return true;
        }
        else
            return false;
    }

    [System.Web.Services.WebMethod]
    public static bool sendMessage(string Message)
    {
        Message += "<br /> <b>Phone :</b> " + CommonFunctions.GetScalar(Convert.ToInt64(HttpContext.Current.Session["studentid"]), "student_id_pk_bi", "phone_no_vc", "ebay_student");
        if (HttpContext.Current.Session["isloggedin"] != null && (bool)HttpContext.Current.Session["isloggedin"])
        {
            using (SqlConnection con = ConnectionManager.Connect())
            {
                SqlCommand com = new SqlCommand("insert into EBay_Message (Message_t, fromStudent_ID_fk_bi, toStudent_ID_fk_bi) values ('" + Message + "','" + HttpContext.Current.Session["studentid"] + "','" + HttpContext.Current.Session["itemOwnerID"] + "')", con);

                com.CommandType = CommandType.Text;

                com.ExecuteNonQuery();
            }
            return true;
        }
        return false;
    }

    private void DisableEnableNextBtn(DataSet ds)
    {
        if (ds.Tables[0].Rows.Count < PageSize)
        {
            NextBtn.Visible = false;
        }
        else
        {
            NextBtn.Visible = true;
        }
    }

    private void CommonPartOfLinkBtns(string cat)
    {
        try
        {
            ViewState["PageIndex"] = 0;
            MakeTabsNormal();
            AdvSearch.pageIndex = 0;
            DataSet ds = AdvSearch.Search(new int[1] { 2 }, cat);
            DisableEnableNextBtn(ds);
            CategoryResult_DataList.DataSource = ds;
            CategoryResult_DataList.DataBind();
            ViewState["category"] = cat;
            UpdateNextPrevLinks(0);
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("ItemClicked.cs - CommonPartinLinkBtns", exp);
        }
    }
}