using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
public partial class Advanced_Search_Default : System.Web.UI.Page
{
    int PageSize = 15;
    int PageIndex = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ErrorLabel.Text = "";
            if (!IsPostBack)
            {
                AdvSearch.pageIndex = 0;
                addCategories();
                NextBtn.Visible = false;
                PrevBtn.Visible = false;

                // Usernames / Emails
                SqlDataReader reader = CommonFunctions.GetAColumn("Username_vc", "EBay_Student");
                string availableUsernames = "";

                while (reader.Read())
                {
                    availableUsernames += "\"" + reader[0].ToString() + "\",";
                }
                availableUsernames = availableUsernames.Substring(0, availableUsernames.Length - 1);
                ViewState.Add("availableUserames", availableUsernames);

                // Names of Students
                reader = CommonFunctions.GetAColumn("Student_Name_vc", "EBay_Student");
                string availableNames = "";
                while (reader.Read())
                {
                    availableNames += "\"" + reader[0].ToString() + "\",";
                }
                reader.Close();
                availableNames = availableNames.Substring(0, availableNames.Length - 1);
                ViewState.Add("availableNames", availableNames);

            }
            else
            {
                //  Navigation.Visible = true;

                if (Request.QueryString["PageIndex"] != null && Request.QueryString["BtnClick"] == null)
                {
                    AdvSearch.pageSize = PageSize;
                    PageIndex = Convert.ToInt32(Request.QueryString["PageIndex"]);
                    AdvSearch.pageIndex = PageIndex;

                    if (ViewState["count"] != null && ViewState["indexes"] != null && ViewState["searchKeys"] != null) // Pager with Search Button Pressed.
                        CallSearch_DataBind((int)ViewState["count"], (int[])ViewState["indexes"], (string[])ViewState["searchKeys"]);
                }
            }

            Type cstype = this.GetType();
            ClientScript.RegisterStartupScript(cstype, "Autocomplete", "<script language='javascript'>$(function () {" +
                "var availableUsernames = [" + ViewState["availableUserames"].ToString() + "];" +
                "var availableNames = [" + ViewState["availableNames"].ToString() + "];" +
                "$('#BodyContentPlaceHolder_userName_Textbox').autocomplete({source : availableUsernames});" +
                "$('#BodyContentPlaceHolder_name_Textbox').autocomplete({source : availableNames});" +
                "})</script>");

            if (Request.QueryString.AllKeys.Length > 0 && ViewState["count"] == null && Request.QueryString["BtnClick"] == null)
            {
                int[] token = new int[2];
                DataSet ds = new DataSet();
                AdvSearch.pageSize = 15;
                if (Request.QueryString["StudentID"] != null)
                {
                    token[0] = 5;   // Student Name as StudentID with %ID% is producing extra results.
                    name_Textbox.Text = Request.QueryString["StudentName"].ToString();
                    ds = AdvSearch.Search(token, Request.QueryString["StudentName"].ToString());
                }
                else if (Request.QueryString["Hostel"] != null)
                {
                    token[0] = 3; 
                    ds = AdvSearch.Search(token, Request.QueryString["Hostel"]);
                    setHostelDropDown(Request.QueryString["Hostel"]);
                }
                else if (Request.QueryString["ItemName"] != null)
                {
                    token[0] = 1;
                    ds = AdvSearch.Search(token, Request.QueryString["ItemName"]);
                    itemName_Textbox.Text = Request.QueryString["ItemName"];
                }



                SearchResult_DataList.DataSource = ds;

                if (ds.Tables[0].Rows.Count < PageSize)
                    NextBtn.Visible = false;
                else
                    NextBtn.Visible = true;

                SearchResult_DataList.DataBind();
            }

            UpdateNextPrevLinks();
        }
        catch (Exception exp)
        {

            CommonFunctions.logTheError("Adv Search", exp);
        }
    }

    protected void Search_Button_Click(object sender, EventArgs e)
    {
        try
        {


            bool atLeastOneisFilled = false;
            int[] indexes = new int[7]; // List of indexes of controls filled.
            string[] searchKeys = new string[7];
            int index = 0, count = 0;

            AdvSearch.dateChosen = false;
            AdvSearch.pageIndex = PageIndex;
            AdvSearch.pageSize = PageSize;

            string from = fromDate_Textbox.Text.Trim();

            if (from.Length > 0)
            {
                string to = toDate_Textbox.Text.Trim();
                if (to.Length == 0)
                    to = from;
                toDate_Textbox.Text = to;
                indexes[count] = 6;
                searchKeys[count++] = "BETWEEN " + fromDate_Textbox.Text + " AND " + toDate_Textbox.Text;
                AdvSearch.dateChosen = true;
            }

            foreach (Control c in searchFields.Controls)
            {

                if (c is TextBox || c is DropDownList) // there can be other controls like labels.
                {
                    index++; // To track the control number.
                    if (c is TextBox)
                    {
                        TextBox tb = (TextBox)c;
                        tb.Text.Trim();
                        if (tb.Text.Length > 0 && index != 6 && index != 7) // Neither 'from date' or 'to date' controls
                        {
                            indexes[count] = index;
                            searchKeys[count++] = tb.Text;
                            atLeastOneisFilled = true;
                        }
                    }
                    else
                    {
                        DropDownList dw = (DropDownList)c;
                        if (dw.SelectedIndex > 0)
                        {
                            atLeastOneisFilled = true;
                            indexes[count] = index;
                            searchKeys[count++] = dw.SelectedItem.Text;
                        }
                    }
                }
            }

            // Saving indexes, searchKeys and count in ViewState for Pager
            if (atLeastOneisFilled)
            {
                ViewState.Add("count", count);
                ViewState.Add("indexes", indexes);
                ViewState.Add("searchKeys", searchKeys);

                CallSearch_DataBind(count, indexes, searchKeys);
            }
            else
            {
                ErrorLabel.Text = "Fill any field and then press Search Button!";
            }
        }
        catch (Exception exp)
        {

            CommonFunctions.logTheError("Adv Search - Btn Click", exp);
        }
    }

    private void addCategories()
    {
        using (SqlDataReader reader = HomeFunction.TableDetails("EBay_Category_Mst"))
        {
            ListItem item;

            while (reader.Read())
            {
                item = new ListItem(reader.GetString(1), (reader.GetInt64(0)).ToString());
                category_DropDownList.Items.Add(item);
            }
        }
    }

    protected void CallSearch_DataBind(int count, int[] indexes, string[] searchKeys)
    {
        DataSet ds = new DataSet();

        switch (count)
        {
            case 1: ds = AdvSearch.Search(indexes, searchKeys[0]); break;
            case 2: ds = AdvSearch.Search(indexes, searchKeys[0], searchKeys[1]); break;
            case 3: ds = AdvSearch.Search(indexes, searchKeys[0], searchKeys[1], searchKeys[2]); break;
            case 4: ds = AdvSearch.Search(indexes, searchKeys[0], searchKeys[1], searchKeys[2], searchKeys[3]); break;
            case 5: ds = AdvSearch.Search(indexes, searchKeys[0], searchKeys[1], searchKeys[2], searchKeys[3], searchKeys[4]); break;
            case 6: ds = AdvSearch.Search(indexes, searchKeys[0], searchKeys[1], searchKeys[2], searchKeys[3], searchKeys[4], searchKeys[5]); break;
            case 7: ds = AdvSearch.Search(indexes, searchKeys[0], searchKeys[1], searchKeys[2], searchKeys[3], searchKeys[4], searchKeys[5], searchKeys[6]); break;
        }
        SearchResult_DataList.DataSource = ds;

        if (ds.Tables[0].Rows.Count < PageSize)
            NextBtn.Visible = false;
        else
            NextBtn.Visible = true;

        SearchResult_DataList.DataBind();

        // Should Set a notification that there are no more entires if ds == 0 as Next is not perfectly set.

        // Setting the Pager's Next Btn
        if (ds.Tables[0].Rows.Count == PageSize)
        {
            //Navigation.Visible = true;
            NextBtn.Visible = true;
        }
        else
        {
            NextBtn.Visible = false;
        }
    }

    protected void UpdateNextPrevLinks()
    {
        string navigationFormat = "Default.aspx?PageIndex={0}";

        if (Request.QueryString["StudentID"] != null)
            navigationFormat += "&StudentID=" + Request.QueryString["StudentID"] + "&StudentName=" + Request.QueryString["StudentName"];
        else if (Request.QueryString["Hostel"] != null)
            navigationFormat += "&Hostel=" + Request.QueryString["Hostel"];
        else if (Request.QueryString["ItemName"] != null)
            navigationFormat += "&ItemName=" + Request.QueryString["ItemName"];

        PrevBtn.PostBackUrl = String.Format(navigationFormat, PageIndex - 1);
        PrevBtn.Visible = (PageIndex > 0) ? true : false;
        PrevBtn.ToolTip = "See the previous " + PageSize + " items";

        NextBtn.PostBackUrl = String.Format(navigationFormat, PageIndex + 1);
        NextBtn.ToolTip = "See the next " + PageSize + " items";


    }

    protected void setHostelDropDown(string hostel)
    {
        Hostel_DropDownList.SelectedIndex = Convert.ToInt32(hostel.Substring(2));

        if (hostel[0] == 'C')
        {
            Hostel_DropDownList.SelectedIndex += 8;
        }
    }

}