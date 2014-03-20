using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Text;

using System.Configuration;

public partial class Profile_Default : System.Web.UI.Page
{

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["isloggedin"] == null)
            Response.Redirect("~/Home/Default.aspx");
    }

    string fileSourceDir = @ConfigurationManager.AppSettings["ItemImagesFolderPath"].ToString();  // Change this accorrdingly.
    // Change the Path in the method " UpdateUploadedPicName " when chaging this.

    int expirationMonths = 1; // Number of Months Before expiry for LAF items
    string BITSID; // the name selected for Profile Pic
    const string DefaultUploadedItemsPic = "items||default";
    //static Int64 HttpContext.Current.Session["StudentID"];
    Int64 itemID;
    string ItemName;
    string StudentName;
    //static string StudentName2;     // For Mail Alert
    bool isSold = false; // Flag for Sold, to distinguish from Delete Button Click.

    protected void Page_Load(object sender, EventArgs e)
    {
        BITSID = Session["bitsid"].ToString();
        Session["PostBack"] = true;

        if (!IsPostBack)
        {
            lblOutput.Visible = false;
            ViewState.Add("url", "");
            LoadMessages();
            Session["PostBack"] = false;
            if (((Label)Details_FormView.Controls[0].Controls[1].FindControl("Hostel_Name_Label")).Text == "----")
            {
                // Implies This is a faculty login
                ViewState.Add("isFaculty", true);
            }
        }

        LoadNLAF();

        int hour = DateTime.Now.Hour;
        string greetings = "Good ";
        if (hour < 12)
            greetings += "Morning, ";
        else if (hour < 17)
            greetings += "Afternoon, ";
        else if (hour < 23)
            greetings += "Evening, ";
        else
            greetings += "Night, ";

        //StudentName2 = Session["studentname"].ToString().Trim();
        StudentName = Session["studentname"].ToString();
        if (StudentName.IndexOf(' ') > 0)
            StudentName = StudentName.Substring(0, StudentName.IndexOf(' '));


        greetings += StudentName;
        Page.Title = greetings + " :: Campus eBay";


        insertItem_DetailsView.ChangeMode(DetailsViewMode.Insert);

    }

    private void LoadNLAF() // Loads Notices, Lost & Found
    {
        string div = "";
        using (SqlDataReader reader = ProfilePage.GetNotices(Convert.ToInt64(HttpContext.Current.Session["StudentID"])))
        {
            while (reader != null && reader.Read())
            {
                DateTime date = reader.GetDateTime(2); // Uplaoded Date 
                div += "<div style='width: 330px' id='notice_" + reader.GetInt64(0) + "'><h3 style='margin-bottom: 2px;'>Notice</h3><p style='text-align:justify'>" + reader.GetString(1) + "</p><br />________________________________________<br /><span style='font-size: 9pt; color: #999'> <strong style='color: #000'>Uploaded on</strong> " + date.ToString("MMM d, yyyy @ hh:mm tt") + "<br /><strong style='color: #000'>Expires on</strong> ";
                date = reader.GetDateTime(3); // Expiry Date of Notice
                div += date.ToString("MMM d, yyyy @ hh:mm tt") + " </span> </div>";
            }
        }

        using (SqlDataReader reader = ProfilePage.GetLAF(Convert.ToInt64(HttpContext.Current.Session["StudentID"])))
        {
            while (reader != null && reader.Read())
            {
                DateTime date = reader.GetDateTime(2); // Uploaded Date
                div += "<div style='width: 330px' id='laf_" + reader.GetInt64(0) + "'><h3 style='margin-bottom: 2px;'>Lost & Found</h3><p style='text-align:justify'>" + reader.GetString(1) + "</p><br />________________________________________<br /><span style='font-size: 9pt; color: #999'> <strong style='color: #000'>Uploaded on</strong> " + date.ToString("MMM d, yyyy @ hh:mm tt") + "<br /><strong style='color: #000'>Expires on</strong> ";
                date = date.AddMonths(expirationMonths); // Expiry Date of LAF Item with a span of 1 month
                div += date.ToString("MMM d, yyyy @ hh:mm tt") + " </span> </div>";
            }
        }
        if (div.Length == 0)
            div = "No Notices or Lost & Found!<br />Upload one now!";
        Notices.InnerHtml = div; // Adding both notices and LAF in Notices Panel.
    }

    private void LoadMessages()
    {
        string div = "";
        using (SqlDataReader reader = ProfilePage.GetMessages(Convert.ToInt64(Session["StudentID"])))
        {
            while (reader != null && reader.Read())
            {
                // delete Button - <img src='Profile_page_images/DeleteButton.gif' id='M_" + reader.GetInt64(0) + "' class='delete' alt='Delete' runat='server' style='position:absolute; left:307px; top: 0;' />
                DateTime date = reader.GetDateTime(2);
                div += "<div id= 'message_" + reader.GetInt64(0) + "' style='width: 98%; padding: 3px;' class='" + reader.GetInt64(5) + "'><span style='display:block'><span style='font-size: 9pt;'>From</span> <strong><a href='../Advanced_Search/Default.aspx?StudentID=" + reader.GetInt64(5) + "&StudentName=" + reader.GetString(3) + "' style='color:#900; text-decoration: none; border-bottom: 1px dashed #900' class='personPopupTrigger'>" + reader.GetString(3) + "</a></strong></span><span style='font-size:10pt; color:#999; float: right;'>" + date.ToString("MMM d, yyyy @ hh:mm tt") + " </span><br /><p style='text-align:justify; clear:both'>" + reader.GetString(1) + "</p><br /></div>";
                if (!reader.GetBoolean(4))
                    UnRead.Value += reader.GetInt64(0) + ",";
            }
            if (UnRead.Value.Length > 0)
                UnRead.Value = UnRead.Value.Substring(0, UnRead.Value.Length - 1);
        }
        if (div.Length == 0)
            div = "No Messages Recived :(";
        Messages.InnerHtml = div;

    }

    protected void deleteNotice_LinkButton_Click(object sender, EventArgs e)
    {
        string ID = activeItem.Value;
        try
        {


            if (ID.IndexOf("notice") >= 0)
                ProfilePage.delete(Convert.ToInt64(ID.Substring(ID.IndexOf('_') + 1)), "Notices", Convert.ToInt64(HttpContext.Current.Session["StudentID"]));
            else
                ProfilePage.delete(Convert.ToInt64(ID.Substring(ID.IndexOf('_') + 1)), "LAF", Convert.ToInt64(HttpContext.Current.Session["StudentID"]));
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("ProfilePage.cs - deleteNotice_LinkButton_Click", exp);
        }
        LoadNLAF();
    }

    protected void MessageDelete_hyperlink_Click(object sender, EventArgs e)
    {
        string ID = activeItem.Value;
        ProfilePage.delete(Convert.ToInt64(ID.Substring(ID.IndexOf('_') + 1)), "Message", Convert.ToInt64(HttpContext.Current.Session["StudentID"]));
        LoadMessages();
    }

    [System.Web.Services.WebMethod]
    public static void helperAddNLAF(string IsNotice, string expiryDate, string message)
    {
        ProfilePage.addNoticeLAF(IsNotice, expiryDate, message, Convert.ToInt64(HttpContext.Current.Session["StudentID"]));
    }

    [System.Web.Services.WebMethod]
    public static void helperMessageReadUpdate(string ID)
    {
        ProfilePage.MessageReadUpdate(ID);
    }

    protected void ImageUpload_Button_Click(object sender, EventArgs e)
    {
        string type = ChangePic.Value, result = "";
        if (type == "profile")
            result = CommonFunctions.ImageProcessing("~/profile_images/", image_FileUpload, "temp_profile" + HttpContext.Current.Session["StudentID"], "profile");
        else
        {
            result = CommonFunctions.ImageProcessing("~/items_images/", image_FileUpload, "temp_item" + HttpContext.Current.Session["StudentID"], "items");
        }
        lblOutput.Visible = true;

        if (result.IndexOf('/') == -1)
        {
            lblOutput.Text = result;
            imgPicture.ImageUrl = "../items_images/default.jpg";
        }
        else
        {
            imgPicture.ImageUrl = result;
            lblOutput.Text = "Press OK to confirm your image.";

        }

        Type cstype = this.GetType();
        ClientScript.RegisterStartupScript(cstype, "PhotoDialogue", "<script language='javascript'>$(function () {if ($('#BodyContentPlaceHolder_lblOutput').text().indexOf('confirm your image') >= 0) { $('#ImageUploadOK_Button').css('display', 'block'); } else { $('#ImageUploadOK_Button').css('display', 'none'); }$('#PhotoUpload').dialog('open');})</script>");

    }

    protected void insertItem_DetailsView_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        e.NewMode = DetailsViewMode.Insert;
    }

    protected void insertItem_DetailsView_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        //Validation
        UploadItemErrorLbl.InnerHtml = "";
        TextBox Validate = (TextBox)insertItem_DetailsView.FindControl("ItemName_Textbox");
        if (!(MyValidator.Required(Validate.Text)))
        {
            UploadItemErrorLbl.InnerHtml = "Name is compulsary";
            Validate.Focus();
            e.Cancel = true;
            return;
        }

        Validate = (TextBox)insertItem_DetailsView.FindControl("Price_TextBox");
        if (!(MyValidator.Required(Validate.Text) && MyValidator.onlyNumber(Validate.Text)))
        {
            UploadItemErrorLbl.InnerHtml = "Amount is compulsary & only numbers";
            Validate.Focus();
            e.Cancel = true;
            return;
        }

        DropDownList CategoryList = (DropDownList)insertItem_DetailsView.FindControl("Categories_DropDownList");
        e.Values["CategoryFKID"] = CategoryList.SelectedIndex + 1;
        ItemName = e.Values["Name"].ToString(); // For sending Email - Alerts
        Session["itemname"] = ItemName;

        //string filename = "default.jpg";
        //if (ChangePic.Value.IndexOf("items||") < 0 && ChangePic.Value.IndexOf("items|") >= 0)
        //    filename = ChangePic.Value.Substring(ChangePic.Value.IndexOf("items|") + 6);
        //e.Values["URL"] = filename;
    }

    protected void insertItem_DetailsView_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        try
        {
            itemID = Convert.ToInt64(Session["NewItemIDAdded"]);
            //Session["itemID"] = itemID;             // For sendAlert()

            string[] files;
            if (Directory.GetFiles(fileSourceDir, "*" + "temp_item" + Session["StudentID"] + ".*").Length > 0)
            {
                // User chose a pic and not using the default pic.
                files = Directory.GetFiles(fileSourceDir, "*" + "temp_item" + Session["StudentID"] + ".*");
                //File.Move(files[0], fileSourceDir + "\\item_" + itemID + Path.GetExtension(files[0]));
                File.Move(files[0], fileSourceDir + "\\..\\" + fileSourceDir.Substring(0, fileSourceDir.LastIndexOf('/') + 1) + "_Pics_High_Resolution" + "\\item_" + itemID + Path.GetExtension(files[0]));
                File.Move(fileSourceDir + "\\..\\" + fileSourceDir.Substring(0, fileSourceDir.LastIndexOf('/') + 1) + "_Pics_High_Resolution" + "\\item_" + itemID + Path.GetExtension(files[0]), fileSourceDir + "\\item_" + itemID + Path.GetExtension(files[0]));
                //File.Delete(fileSourceDir.Substring(0, fileSourceDir.LastIndexOf('/') + 1) + "_Pics_High_Resolution" + "\\item_" + itemID + Path.GetExtension(files[0]));
            }
            else
            {
                // User is using the default pic. So make a copy of default pic and save it as item_`itemID`.ext
                files = Directory.GetFiles(fileSourceDir, "*" + "default" + "*");
                File.Copy(files[0], fileSourceDir + "\\item_" + itemID + Path.GetExtension(files[0]), true);
            }

            ProfilePage.updatePicture("item_" + itemID + Path.GetExtension(files[0]), itemID);

            UploadedItems_ListView.DataBind();
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("ProfilePage.cs - insertItem_DetailsView_itemInserted", exp);
        }
    }

    [System.Web.Services.WebMethod]
    public static void UpdateUploadedPicName(string imgName)
    {
        string[] files;

        // If profile Pic. Delete BITS.ext pic and move temp_profile_studenId.ext to BITSid.ext
        try
        {
            if (imgName == "profile")
            {
                files = Directory.GetFiles(@ConfigurationManager.AppSettings["ProfileImagesFolderPath"].ToString(), "*" + HttpContext.Current.Session["BITSID"] + "*");
                string filename = files[0];
                files = Directory.GetFiles(@ConfigurationManager.AppSettings["ProfileImagesFolderPath"].ToString(), "*" + "temp_profile" + HttpContext.Current.Session["StudentID"] + ".*");
                File.Delete(filename);
                File.Move(files[0], filename);
                return;
            }

            // Uploaded Items
            files = Directory.GetFiles(@ConfigurationManager.AppSettings["ItemImagesFolderPath"].ToString(), "*" + imgName + "*");
            File.Delete(files[0]);
            string oldFile = files[0];
            files = Directory.GetFiles(@ConfigurationManager.AppSettings["ItemImagesFolderPath"].ToString(), "*temp_item" + HttpContext.Current.Session["StudentID"] + ".*");
            File.Move(files[0], oldFile);
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("ProfilePage.cs - UpdateUploadedPic", exp);
        }
    }

    protected void Details_FormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Validating Present Profile Details
        ProfileDetailsErrorLbl.InnerHtml = "";
        TextBox forValidation = (TextBox)Details_FormView.Row.FindControl("Student_Name_vcTextBox");
        if (!(MyValidator.Required(forValidation.Text) && MyValidator.onlyLetter(forValidation.Text) && MyValidator.length(forValidation.Text, 3, 30)))
        {
            forValidation.Focus();
            ProfileDetailsErrorLbl.InnerHtml = "Name should be 3 - 30 chars long";
            e.Cancel = true;
            return;
        }

        if (ViewState["isFaculty"] != null && !(bool)ViewState["isFaculty"])
        {
            // This Validation only for students as faculty do not have hostel or room

            forValidation = (TextBox)Details_FormView.FindControl("Hostelnc");
            if (!(MyValidator.Required(forValidation.Text)))
            {
                ProfileDetailsErrorLbl.InnerHtml = "Hostel is required. Eg: AH 2";
                forValidation.Focus();
                e.Cancel = true;
                return;
            }

            // Checking Hostel is in correct format or not. AH 2 is the reqd format
            string hostel = forValidation.Text.ToUpper();
            hostel = hostel.Trim();
            if (!(MyValidator.exactly(hostel, 4) && MyValidator.onlyLetter(hostel.Substring(0, 2)) && MyValidator.noSpecialChars(forValidation.Text) && MyValidator.onlyNumber(hostel.Substring(3, 1))))
            {
                ProfileDetailsErrorLbl.InnerHtml = "Hostel in incorrect format(4 characters). Eg: AH 2";
                forValidation.Focus();
                e.Cancel = true;
                return;
            }
            forValidation.Text = hostel.ToUpper();


            forValidation = (TextBox)Details_FormView.FindControl("Room_TextBox");
            if (!(MyValidator.Required(forValidation.Text) && MyValidator.onlyNumber(forValidation.Text)))
            {
                ProfileDetailsErrorLbl.InnerHtml = "Only numbers in room!";
                forValidation.Focus();
                e.Cancel = true;
                return;
            }
        }


        forValidation = (TextBox)Details_FormView.FindControl("Phone_No_vcTextBox");
        if (!(MyValidator.Required(forValidation.Text) && MyValidator.length(forValidation.Text, 10, 11) && MyValidator.onlyNumber(forValidation.Text)))
        {
            forValidation.Focus();
            ProfileDetailsErrorLbl.InnerHtml = "Invalid Phone number";
            e.Cancel = true;
            return;
        }
        //        ProfileDetails_SqlDataSource.UpdateParameters.Add("Hostel_nc", TypeCode.String, ((DropDownList)Details_FormView.FindControl("ProfileDetailsHostels_DropDownList")).SelectedValue);

    }

    protected void Details_FormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            ProfileDetailsErrorLbl.InnerHtml = "";
        }
    }

    protected void UploadedItems_ListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        // Validation

        ListViewItem item = UploadedItems_ListView.Items[e.ItemIndex];

        UploadedItemsErrorLbl.InnerHtml = "";
        TextBox validate = (TextBox)item.FindControl("ItemName_TextBox");
        if (!(MyValidator.Required(validate.Text)))
        {
            UploadedItemsErrorLbl.InnerHtml = "Name is compulsary";
            validate.Focus();
            e.Cancel = true;
            return;
        }

        validate = (TextBox)item.FindControl("PriceDetails_TextBox");
        if (!(MyValidator.Required(validate.Text) && MyValidator.onlyNumber(validate.Text)))
        {
            UploadedItemsErrorLbl.InnerHtml = "Amount is compuldary & only numbers";
            validate.Focus();
            e.Cancel = true;
            return;
        }
    }

    protected void UploadedItems_ListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            UploadedItemsErrorLbl.InnerHtml = "";
        }
    }

    protected void UploadedItems_ListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string filename = e.Keys[0].ToString(); // filename forming stepwise for delete

        if (isSold)
        {
            // Saving the Item in Ebay_SoldItems Table

            using (SqlConnection con = ConnectionManager.Connect())
            {
                SqlCommand com = new SqlCommand("insert into Ebay_SoldItems (SItem_ID_pk_bi, SStudent_ID_fk_bi, SCategory_ID_fk_bi, SItem_Name_vc, SUpload_Time_sdt, SPrice_m, SAuthor_vc, SDescription_t, SURL_vc) select * from EBay_Item where Item_ID_pk_bi = " + filename, con);
                com.CommandType = CommandType.Text;

                com.ExecuteNonQuery();
                isSold = false;
            }
        }

        try
        {
            File.Delete(Directory.GetFiles(fileSourceDir, "*" + "item_" + filename + ".*")[0]);
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("ProfilePage.cs - Item Image Deleting ID : " + e.Keys[0], exp);
        }
    }

    [System.Web.Services.WebMethod]
    public static void DeleteTempPicsOfThisUser(string type)
    {
        try
        {
            if (type == "profile")
            {
                if (Directory.GetFiles(@ConfigurationManager.AppSettings["ProfileImagesFolderPath"] + "", "*" + "temp_profile" + HttpContext.Current.Session["StudentID"] + ".*").Length > 0)
                {
                    File.Delete(Directory.GetFiles(@ConfigurationManager.AppSettings["ProfileImagesFolderPath"] + "", "*" + "temp_profile" + HttpContext.Current.Session["StudentID"] + ".*")[0]);
                }
            }
            else
            {
                if (Directory.GetFiles(@ConfigurationManager.AppSettings["ItemImagesFolderPath"] + "", "*" + "temp_item" + HttpContext.Current.Session["StudentID"] + ".*").Length > 0)
                {
                    File.Delete(Directory.GetFiles(@ConfigurationManager.AppSettings["ItemImagesFolderPath"] + "", "*" + "temp_item" + HttpContext.Current.Session["StudentID"] + ".*")[0]);
                }
            }
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("ProfilePage.cs - DeleteTempPicsOfThisUser", exp);
        }
    }

    [System.Web.Services.WebMethod]
    public static void SendAlert()
    {
        if (!(bool)HttpContext.Current.Session["PostBack"])
        {
            return;
        }
        // Check and send emails about the new item that is inserted.
        using (SqlConnection con = ConnectionManager.Connect())
        {
            string StudentName = HttpContext.Current.Session["studentname"].ToString();
            Int64 itemID = Convert.ToInt64(HttpContext.Current.Session["NewItemIDAdded"]);
            string ItemName = HttpContext.Current.Session["itemname"].ToString().Trim();

            SqlCommand com = new SqlCommand("select Username_vc, Phone_No_vc from EBay_Student where Student_ID_pk_bi in " +
            "(select distinct ByStudent_ID_fk_bi from Ebay_CloudDictionary " +
            "where (CHARINDEX(CloudValue_vc, '" + ItemName + "', 0) > 0 and Type_c = 'Item') or (CHARINDEX(CloudValue_vc, '" + StudentName + "', 0) > 0 and Type_c = 'Student') )", con);
            com.CommandType = CommandType.Text;
            SqlDataReader reader = com.ExecuteReader();
            string emails = "";
            string phones = "";
            while (reader.Read())
            {
                emails += reader["Username_vc"] + ",";
                phones += reader["Phone_No_vc"] + ",";
            }
            if (emails.Length > 0)
            {
                int spaceIndex = StudentName.IndexOf(' ');
                if (spaceIndex > 0)
                    StudentName = StudentName.Substring(0, spaceIndex);

                emails = emails.Substring(0, emails.Length - 1);
                phones = phones.Substring(0, phones.Length - 1);
                string Description = CommonFunctions.GetScalar(itemID, "Item_ID_pk_bi", "Description_t", "EBay_Item");
                // Forming the body of mail
                string Body = "<style type='text/css'>" +
                "* {padding: 0;	margin: 0;	font:'Segoe UI', Verdana, Arial, sans-serif;	font-size: 14px;}" +
                "p {margin: 5px;}</style>" +
                "<div id='wrapper' style='padding: 20px; display: inline-block;'>" +
                "<h2><a href='" + ConfigurationManager.AppSettings["homeAddress"] + "Home' title='Go to Campus eBay Home'>Campus eBay</a></h2><br />" +
                "<table border='0' cellspacing='5' cellpadding='0'>" +
                "<tr><td>Item Name</td><td><strong> &nbsp;&raquo;&nbsp; </strong></td><td>" + ItemName + "</td></tr>" +
                "<tr><td>Added By</td><td><strong>&nbsp;&raquo;&nbsp;</strong></td><td>" + StudentName + "</td></tr>" +
                "<tr><td>Added On</td><td><strong>&nbsp;&raquo;&nbsp;</strong></td><td>" + DateTime.Now + "</td></tr>" +
                "<tr><td valign='top'>Description</td><td valign='top'><strong>&nbsp;&raquo;&nbsp;</strong></td><td valign='top'>" + Description + "</td>" +
                "</tr><tr><td ></td><td ></td><td ></td></tr>" +
                "</table>" +
                "<p><a href='" + ConfigurationManager.AppSettings["homeAddress"] + "Item_Clicked/Default.aspx?ItemID=" + itemID + "' title='Send a message to this user...'>Send Message</a> | <a href='" + ConfigurationManager.AppSettings["homeAddress"] + "Item_Clicked/Default.aspx?ItemID=" + itemID + "' title='View complete details of the item...'>View Complete Details</a><br /></p>" +
                "<p><a href='" + ConfigurationManager.AppSettings["homeAddress"] + "Profile_page/Default.aspx'>Check your messages @ eBay</a></p>" +
                "<p>&nbsp;</p><p><a href='" + ConfigurationManager.AppSettings["homeAddress"] + "Misc%20Pages/FeedBack_Contact.aspx#Feedback'>Give Feedback :)</a></p></div>";

                SendMail.byGmail(emails, "Campus eBay : New Items Added!", Body);

                if (ItemName.Length > 35)
                {
                    ItemName = ItemName.Substring(0, 36);
                }
                if (StudentName.Length > 35)
                {
                    StudentName = StudentName.Substring(0, 36);
                }

                //string owner_mobile = CommonFunctions.GetScalar(HttpContext.Current.Session["StudentID"], "Student_ID_pk_bi", "Phone_No_vc", "EBay_Student");   // To be added in the Message sent to the buyer.
                SendSMS.ByWay2SMS("Campus eBay: New Upload - \"" + ItemName + "\" by " + StudentName + ". Visit site for more details.", phones);
                //SendSMS.ByWay2SMS("Campus eBay: New Upload etails.", phones);
            }
        }
    }

    [System.Web.Services.WebMethod]
    public static string Load_Alerts()
    {
        using (SqlDataReader reader = ProfilePage.Alerts_SelectMethod(HttpContext.Current.Session["StudentID"].ToString()))
        {
            string items = "", students = "";
            while (reader.Read())
            {
                if (reader["Type_c"].ToString().IndexOf("Item") >= 0)
                {
                    items += reader["CloudValue_vc"] + ", ";
                }
                else
                {
                    students += reader["CloudValue_vc"] + ", ";
                }
            }
            return items + "|||||" + students;
        }
    }

    [System.Web.Services.WebMethod]
    public static bool Update_Alerts(string items, string students)
    {

        if (ProfilePage.UpdateAlerts(HttpContext.Current.Session["StudentID"].ToString(), items.Split(new char[1] { ',' }), students.Split(new char[1] { ',' })))
            return true;
        return false;
    }

    protected void SaveTheSoldItems(object sender, EventArgs e)
    {
        isSold = true;
    }

    [System.Web.Services.WebMethod]
    public static int SendReplyMessage(string toStudent, string Message, string OriginalMessageID)
    {
        Message = Message.Insert(0, "<a href=\"javascript:void(0)\" onclick=\"ShowConversation(" + OriginalMessageID + ")\">View this conversation</a><br />");
        using (SqlConnection con = ConnectionManager.Connect())
        {
            //SqlCommand com = new SqlCommand("insert into EBay_Message (fromStudent_ID_fk_bi, toStudent_ID_fk_bi, Message_t, parentMessage_ID_pk_bi) values (" + HttpContext.Current.Session["studentid"] + ", " + toStudent + ", '" + Message + "', " + OriginalMessageID + ")", con);
            //com.CommandType = CommandType.Text;
            //return com.ExecuteNonQuery();

            SqlCommand com = new SqlCommand("Ebay_insertReply_P", con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.Add("fStudent", SqlDbType.BigInt).Value = HttpContext.Current.Session["StudentID"];
            com.Parameters.Add("tStudent", SqlDbType.BigInt).Value = toStudent;
            com.Parameters.Add("Message", SqlDbType.VarChar, 300).Value = Message;
            com.Parameters.Add("input_parentID", SqlDbType.BigInt).Value = OriginalMessageID;

            return com.ExecuteNonQuery();
        }
    }

    [System.Web.Services.WebMethod]
    public static string helperGetConversation(string ReplyID)
    {
        //StringBuilder conversation = new StringBuilder();

        try
        {
            DataSet ds = ProfilePage.GetConverstion(ReplyID);
            return ds.GetXml().Replace("\r\n", "").Replace("    <", "<").Replace("&lt;", "<").Replace("&gt;", ">");
            //conversation.Append(ds.Tables[0].Rows[0][0].ToString());
            //conversation.Append("<div class='msgControls'>Message Indentation: <a href='javascript:void(0)' class='msgIndent'>On</a>	&nbsp;&nbsp;<a href='javascript:void(0);' class='msgExpand'>Expand All</a> | <a href='javascript:void(0);' class='msgCollapse'>Collapse All</a>	</div>");
            //foreach (DataRow row in ds.Tables[0].Rows)
            //{
            //    conversation.Append("<div class='convMsg'><div class='msgHeader'> <strong>");
            //    conversation.Append(row["Student_Name_vc"]);
            //    conversation.Append("</strong><p align='right'>");
            //    conversation.Append(((DateTime)row["Upload_Time_sdt"]).ToString("dd MMM, yyyy, h:mm tt"));
            //    conversation.Append("</p><hr width='80%' align='left' /></div><div class='msgBody'>");
            //    conversation.Append(row["Message_t"]);
            //    conversation.Append("</div><div class='msgFooter'> <a href='javascript:void(0)' onclick='$(\"#BodyContentPlaceHolder_activeItem\").val(\"message_" + row[0] + "\"); $(\"#ReplyMessage\").dialog(\"open\");'>Reply</a> </div></div>");
            //}

            //return conversation.ToString();
        }
        catch (Exception ex)
        {
            CommonFunctions.logTheError("GetConversation", ex);
            return "";
        }

    }
}