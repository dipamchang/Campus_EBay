using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using System.Data;
using System.Data.SqlClient;
using System.Xml;

public partial class Home_Default : System.Web.UI.Page
{
    string topN = "10"; // The latest 4 notices or LAF
    bool LoggedIn = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlConnection con = ConnectionManager.Connect())
            {
                SqlCommand com = new SqlCommand("delete from Ebay_Cabs where DepartureDate_sdt < GETDATE()", con);
                com.CommandType = CommandType.Text;
                com.ExecuteNonQuery();
            }
            Ticker();
        }

        if (Session["isloggedin"] != null && (bool)Session["isloggedin"])
        {
            asADiffUser.Text = "as a different user!";
            LoggedIn = true;
        }
        else
        {
            asADiffUser.Text = "";
            LoggedIn = false;
        }

        ShopsUpdates();
        Notices();
        LAF();
        Page.DataBind();
    }

    protected void ShopsUpdates()
    {
        string div = "";
        string default_item_url = @System.Configuration.ConfigurationManager.AppSettings["ItemImagesFolderPath_CD"] + "/";
        try
        {


            using (SqlDataReader reader = HomeFunction.LatestItems("6"))
            {
                while (reader.Read())
                {
                    div += "<div class='imageLayout' ><a href='../Item_Clicked/Default.aspx?ItemID=" + reader.GetInt64(1) + "' style='overflow: hidden; width:100px; height: 100px; display:  block; margin: 0 auto;' ><img src ='" + default_item_url + "" + reader.GetString(4) + "' name = '" + reader.GetString(2) + "' width='100' alt='" + reader.GetString(2) + "' style='background-color: #D6D6D6; margin: 10px 0;' /></a><p class='oneLine' style='width: 100px; margin: 0 auto;'><a href='../Item_Clicked/Default.aspx?ItemID=" + reader.GetInt64(1) + "' class='ellipsis_text'>" + reader.GetString(2) + "</a></p><p class='oneLine' style='width:75px; float: right; margin-right: 10px;'><a style='font-size:12px; margin: 5px 0;' class='ellipsis_text personPopupTrigger' href='../Advanced_Search/Default.aspx?StudentID=" + reader.GetInt64(5) + "&StudentName=" + reader.GetString(3) + "'> - " + reader.GetString(3) + "</a></p><span class=clear></span></div>";
                }
            }
            div += "<div  style='clear:both'></div>";
            //ShopUpdates_Body.InnerHtml = div;
            if (div.Length > 0)
                StudentsUpdates_Body.InnerHtml = div;
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Home.cs - ShopUpdates", exp);
        }
    }

    public void Notices()
    {
        string notices = "";
        try
        {
            using (SqlDataReader reader = HomeFunction.AuthenticatedNotices(topN))
            {
                while (reader.Read())
                {
                    notices += "<div style='position:relative;'><div style='width: 432px;' class='mulLine'><span class='ellipsis_text' style='text-align: justify'>" + reader.GetString(2) + "</span></div><p style='font-size: 12px; margin: 15px 3px; 0 3px'>By <a href='../Advanced_Search/Default.aspx?StudentID=" + reader.GetInt64(3) + "&StudentName=" + reader.GetString(0) + "' class='personPopupTrigger' >" + reader.GetString(0) + "</a><br /><em>" + reader.GetDateTime(1).ToString("MMM dd, yyyy @ hh:mm tt") + "</em></p></div>";
                }
            }
            if (notices.Length > 0)
                noticesBody.InnerHtml = notices;
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Home.cs - Notices", exp);
        }
    }

    public void LAF()
    {
        string laf = "";
        try
        {
            using (SqlDataReader reader = HomeFunction.AuthenticatedLAF(topN))
            {
                while (reader.Read())
                {
                    laf += "<div style='position:relative;'><div style='width: 390px;' class='LAFmulLine'><span class='ellipsis_text' style='text-align: justify'>" + reader.GetString(2) + "</span></div><p style='font-size: 12px; margin: 15px 0 0 5px;'>By <a href='../Advanced_Search/Default.aspx?StudentID=" + reader.GetInt64(3) + "&StudentName=" + reader.GetString(0) + "' class='personPopupTrigger' >" + reader.GetString(0) + "</a><br /><em>" + reader.GetDateTime(1).ToString("MMM dd, yyyy @ hh:mm tt") + "</em></p></div>";
                }
            }
            if (laf.Length > 0)
                LAFBody.InnerHtml = laf;
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Home.cs - LAF", exp);
        }
    }

    protected void Submit_Button_Click(object sender, EventArgs e)
    {
        if (email_TextBox.Text != null && password_TextBox.Text != null)
        {
            try
            {


                using (SqlConnection con = ConnectionManager.Connect())
                {
                    SqlCommand com = new SqlCommand("select Student_ID_pk_bi from EBay_Student where Username_vc = '"
                        + email_TextBox.Text + "' AND Password_vc = '" + CommonFunctions.getMd5Hash(password_TextBox.Text) + "'", con);

                    Int64 StudentId = Convert.ToInt64(com.ExecuteScalar());

                    if (StudentId > 0)
                    {
                        Session.Timeout = 30;
                        Session["studentname"] = CommonFunctions.GetScalar(StudentId, "student_id_pk_bi", "student_name_vc", "ebay_student");
                        Session["isLoggedIn"] = true;
                        Session["Time"] = DateTime.Now;
                        Session["StudentID"] = StudentId;
                        Session["bitsid"] = CommonFunctions.GetScalar(StudentId, "student_id_pk_bi", "bits_id_vc", "ebay_student");

                        Response.Redirect("~/Profile_page/Default.aspx", false);
                    }
                    else
                    {
                        errorLabel.InnerHtml = "Incorrect username or password.";
                        email_TextBox.Focus();
                    }
                }
            }
            catch (Exception exp)
            {
                CommonFunctions.logTheError("Home.cs - Submit_Button_Click", exp);
            }
        }
        else
        {
            errorLabel.InnerHtml = "Enter both username and password.";
            email_TextBox.Focus();
        }

    }
    protected void Cabs_GridView_DataBound(object sender, EventArgs e)
    {
        if (Cabs_GridView.Rows.Count > 0)
        {
            Cabs_EmptyText.Visible = false;
        }
        else
        {
            Cabs_EmptyText.Visible = true;
        }
    }
    protected void Cabs_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (LoggedIn)
        {
            if (Session["studentid"].ToString() != e.Keys[1].ToString())
            {
                Error_Label.Text = "You dont have sufficient privilege to Delete this!";
                e.Cancel = true;
            }
            else
            {
                Error_Label.Text = "";
                if (Cabs_GridView.Rows.Count > 0)
                {
                    Cabs_EmptyText.Visible = false;
                }
                else
                {
                    Cabs_EmptyText.Visible = true;
                }
            }
        }
        else
        {
            Error_Label.Text = "Please log in to delete!";
            e.Cancel = true;
        }
    }

    public void DataBindCabsGridView()
    {
        Cabs_GridView.DataBind();
    }

    [System.Web.Services.WebMethod]
    public static int AddCab(string capacity, string date, string destination)
    {
        // 0 => Not logged in
        // 1 => Success
        // 2 => Internal Error by SQL. Since no server side validation, if user tries to manipulate.

        if (HttpContext.Current.Session["isloggedin"] != null && (bool)HttpContext.Current.Session["isloggedin"])
        {
            try
            {
                using (SqlConnection con = ConnectionManager.Connect())
                {
                    SqlCommand com = new SqlCommand("insert into Ebay_Cabs (Student_id_fk_bi, Capasity_ti, DepartureDate_sdt,Destination_vc) Values ('" + HttpContext.Current.Session["StudentID"] + "','" + capacity + "','" + date + "','" + destination + "')", con);
                    com.CommandType = CommandType.Text;
                    com.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                return 2;
            }
            return 1;
        }
        return 0;
    }

    [System.Web.Services.WebMethod]
    public static bool CheckLogin()
    {
        if (HttpContext.Current.Session["isloggedin"] != null && (bool)HttpContext.Current.Session["isloggedin"])
        {
            return true;
        }
        return false;
    }

    protected void Ticker()
    {
        string Titletext = "";
        string TickerText = "";
        using (SqlDataReader reader = HomeFunction.Ticker())
        {
            while (reader.Read())
            {
                //string Date = ((DateTime)reader[1]).ToString("dd/mm/yyyy");
                Titletext += reader[0] + "||";
                TickerText += "<p>" + reader[0] + "</p>";
            }
        }
        if (Titletext.Length > 0)
        {
            Titletext = Titletext.Substring(0, Titletext.Length - 2);
        }
        Master.MyTickerText = TickerText;
        Ticker_Hidden.Value = Titletext;
    }

    /*
     * Master Page's JQuery Ajax Methods for PersonPop Up
     * */

    [System.Web.Services.WebMethod]
    public static string getToolTipStudentDetails(string StudentID)
    {
        string details;
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("select Student_Name_vc + ';' + Hostel_nc + ';' +  Room_No_nc + ';' +  BITS_ID_vc + ';' +  Phone_No_vc + ';' + CONVERT(CHAR,Signup_Time_sdt,107) + ';' +  PhotoURL from EBay_Student where Student_ID_pk_bi = " + StudentID, con);
            com.CommandType = CommandType.Text;
            details = (string)com.ExecuteScalar();

            if (CheckLogin())
            {
                // Follow / Unfollow user
                com.CommandText = "select COUNT(ByStudent_ID_fk_bi) from Ebay_CloudDictionary where ByStudent_ID_fk_bi = " + HttpContext.Current.Session["studentid"] + " and Type_c = 'Student' and CloudValue_vc = (select Student_Name_vc from EBay_Student where Student_ID_pk_bi = " + StudentID + ")";
                details += ";" + com.ExecuteScalar();
            }
        }
        return details;
    }

    [System.Web.Services.WebMethod]
    public static int FollowUnfollow(string rel, string OwnerStudentID)
    {
        int res = 0;
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("", con);
            if (rel == "1")
            {
                com.CommandText = "insert into Ebay_CloudDictionary (ByStudent_ID_fk_bi, Type_c, CloudValue_vc) VALUES (" + HttpContext.Current.Session["studentid"]
                    + ", 'Student', (select Student_Name_vc from EBay_Student where Student_ID_pk_bi = " + OwnerStudentID + "))";
            }
            else
            {
                com.CommandText = "delete from Ebay_CloudDictionary where ByStudent_ID_fk_bi = " + HttpContext.Current.Session["studentid"]
                    + " and Type_c = 'Student' and CloudValue_vc = (select Student_Name_vc from EBay_Student where Student_ID_pk_bi = "
                    + OwnerStudentID + ")";
            }

            com.CommandType = CommandType.Text;
            res = com.ExecuteNonQuery();
        }
        return res;
    }
}