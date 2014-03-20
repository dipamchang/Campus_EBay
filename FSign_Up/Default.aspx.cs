using System;
using System.Data.SqlClient;
using System.Data;

using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;

public partial class Sign_Up_Default : System.Web.UI.Page
{
    public int sample;
    private string homeAddress = ConfigurationManager.AppSettings["homeAddress"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Load the StudentList Hidden Fiedls with available students
            using (SqlDataReader reader = CommonFunctions.GetAColumn("student_name_vc", "ebay_student"))
            {
                string availableName = "";
                while (reader.Read())
                {
                    availableName += reader.GetString(0) + ",";
                }
                StudentsList.Value = availableName.Substring(0, availableName.Length - 1);
            }
        }
    }

    protected void Sign_Up_Submit_Click(object sender, EventArgs e)
    {
        bool isValidForm = false;

        Error_Label.Visible = true;

        //if (ValidForm.Value == "0") // the hidden field, confirmation from javascript
        //{
        //    return;
        //}

        // Validation Server Side.

        // Student Name
        isValidForm = MyValidator.Required(Student_Name_TextBox.Text) && MyValidator.onlyLetter(Student_Name_TextBox.Text) && MyValidator.length(Student_Name_TextBox.Text, 3, 30);
        if (!isValidForm)
        {
            Error_Label.Text = "Invalid Name.";
            return;
        }

        //PSR
        isValidForm = MyValidator.Required(BITS_ID_TextBox.Text) && MyValidator.onlyNumber(BITS_ID_TextBox.Text);
        if (!isValidForm || CheckBITSID(BITS_ID_TextBox.Text) == 0)
        {
            Error_Label.Text = "Invalid PSR No. or PSR No. already registerted";
            return;
        }

        //Username
        isValidForm = MyValidator.Required(Username_TextBox.Text) && MyValidator.email(Username_TextBox.Text);
        if (!isValidForm || CheckUsername(Username_TextBox.Text) == 0)
        {
            Error_Label.Text = "Invalid Username or Username already registerted";
            return;
        }

        //Password
        isValidForm = MyValidator.Required(Password_TextBox.Text) && MyValidator.length(Password_TextBox.Text, 5, 20);
        if (!isValidForm)
        {
            Error_Label.Text = "Invalid Password";
            return;
        }

        //Chamber
        //isValidForm = MyValidator.Required(Chamber_TextBox.Text);
        //if (!isValidForm)
        //{
        //    Error_Label.Text = "Chamber number compulsary";
        //    return;
        //}

        //Quarter
        //isValidForm = MyValidator.Required(Quarter_No_TextBox.Text);
        //if (!isValidForm)
        //{
        //    Error_Label.Text = "Quarter Number Compulsary";
        //    return;
        //}

        // Phone
        if (Phone_no_TextBox.Text.Trim().Length > 0)
        {
            isValidForm = MyValidator.exactly(Phone_no_TextBox.Text, 10) && MyValidator.onlyNumber(Phone_no_TextBox.Text);
            if (!isValidForm)
            {
                Error_Label.Text = "Phone no. should be exactly 10 digits.";
                return;
            }
        }

        string res = CommonFunctions.ImageProcessing("~/profile_images/", Profile_Picture_Upload, BITS_ID_TextBox.Text, "profile");
        if (res.IndexOf("Only .gif, .jpeg") == 0)
        {
            Error_Label.Text = res;
            return;
        }

        Error_Label.Visible = false;
        if (res.IndexOf('/') < 0)
        {
            res = "default.jpg";
        }
        else
            res = res.Substring(res.LastIndexOf('/') + 1);

        int result = 0;
        string securityKey = CommonFunctions.RandomString();
        string NewStudentID = "0", SCloud = "", ICloud = "";

        // Items and Student Clouds
        if (subscribe.Checked)
        {
            SCloud = studentsCloud.Value.Trim();
            ICloud = itemsCloud.Value.Trim();

            if (SCloud.IndexOf("multiple values") > 0)
            {
                SCloud = "";
            }

            if (ICloud.IndexOf("multiple values") > 0)
            {
                ICloud = "";
            }

            if (SCloud.Length > 0 && ICloud.Length > 0)
            {
                if (SCloud[SCloud.Length - 1] == ',')
                    SCloud = SCloud.Substring(0, SCloud.Length - 1);
                if (ICloud[ICloud.Length - 1] == ',')
                    ICloud = ICloud.Substring(0, ICloud.Length - 1);
            }
        }


        using (SqlConnection con = ConnectionManager.Connect())
        {
            try
            {
                //SqlCommand mySql = new SqlCommand("insert into EBay_TempStudent (Username_vc, Password_vc, Student_Name_vc, IsAdmin_bool, Hostel_nc, BITS_ID_vc, Room_No_nc, Phone_No_vc, SecurityKey_nc, PhotoURL, ItemsCloud_vc, StudentsCloud_vc) VALUES ('"
                //    + Username_TextBox.Text.Trim() + "','" + CommonFunctions.getMd5Hash(Password_TextBox.Text) + "','" + Student_Name_TextBox.Text + "',0,'"
                //    + Chamber_TextBox.Text + "', '" + BITS_ID_TextBox.Text + "', '" + Quarter_No_TextBox.Text + "', '"
                //    + Phone_no_TextBox.Text + "', '" + securityKey + "','" + res.Trim() + "','" + ICloud + "','" + SCloud + "')"
                //    + "SELECT @StudentID = SCOPE_IDENTITY()"
                //    , con);

                SqlCommand mySql = new SqlCommand("insert into EBay_TempStudent (Username_vc, Password_vc, Student_Name_vc, IsAdmin_bool, Hostel_nc, BITS_ID_vc, Room_No_nc, Phone_No_vc, SecurityKey_nc, PhotoURL, ItemsCloud_vc, StudentsCloud_vc) VALUES ('"
                    + Username_TextBox.Text.Trim() + "','" + CommonFunctions.getMd5Hash(Password_TextBox.Text) + "','" + Student_Name_TextBox.Text + "',0,'----', '" + BITS_ID_TextBox.Text + "', '---', '"
                    + Phone_no_TextBox.Text + "', '" + securityKey + "','" + res.Trim() + "','" + ICloud + "','" + SCloud + "')"
                    + "SELECT @StudentID = SCOPE_IDENTITY()"
                    , con);

                SqlParameter p = mySql.Parameters.Add("@StudentID", SqlDbType.BigInt);
                p.Direction = ParameterDirection.Output;

                mySql.CommandType = CommandType.Text;
                result = mySql.ExecuteNonQuery();
                NewStudentID = (p.Value).ToString();
            }
            catch (Exception exp)
            {
                CommonFunctions.logTheError("SignUp.cs - SignUpButtonClick", exp);
            }
        }

        if (result > 0)
        {
            EmailConfirmation_Label.Text = Username_TextBox.Text;
            Type cstype = this.GetType();
            ClientScript.RegisterStartupScript(cstype, "SuccessDialog", "<script language='javascript'>$(function () {$('#SignUpResult').dialog('open');})</script>");

            // Send confirmation E-mail


            string Body = "<table width='100%' border='0' cellspacing='5' cellpadding='0' style='font-size: 10pt; font-family: Segoe UI, Verdana, Arial, sans-serif; padding: 10px; color:#333;'>" +
            "<tr><td colspan='3' align='center' valign='middle'><h1 style='color: #900; font-weight: normal;'><a href='"
            + homeAddress + "Home/' title='Visit ebay'>Campus eBay</a> : Just a step away!</h1></td></tr>" +
            "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>" +
            "<tr><td colspan='3' align='left'><p style='text-transform: capitalize'>Hi <strong>" + Student_Name_TextBox.Text + "</strong>,</p>" +
                "<br />" +
                "<p style='text-align:center'>Thanks for signing up with your Campus eBay. Power of <a href='"
                + homeAddress + "Home/'>eBay</a> just a click away!</p>" +
                "<br />" +
                "<p><em>Click here </em>: " + "<a href='" + homeAddress + "ErrorPages/UserConfirmation.aspx?SKey=" + securityKey + "&SID=" + NewStudentID + "' >"
                + homeAddress + "ErrorPages/UserConfirmation.aspx?SKey=" + securityKey + "&SID=" + NewStudentID + "</a>" + " and get started.</p>" +
                "<p style='font-size:14px;'> &nbsp;&nbsp;&nbsp; If the link doesn't work, paste the link in the Address bar above of your browser</a></p>" +
                "<p>&nbsp;</p>" +
                "<p><strong>Note:</strong> This link is valid only for <em>24hrs</em> from the time of delivery.</p>" +
                "<br />" +
                "<p>Share your views and make eBay better @ <a href='" + homeAddress + "Misc%20Pages/FeedBack_Contact.aspx#Feedback'>feeback-for-eBay</a></p>" +
                "<p>&nbsp;</p>" +
                "<p>Bye &amp; have fun,</p>" +
                "<br />" +
                "<p><em>Campus eBay Team :)</em></p></td>" +
            "</tr>" +
            "<tr><td colspan='3' align='left'>&nbsp;</td></tr>" +
        "</table>";
            SendMail.byGmail(Username_TextBox.Text, "Campus eBay: Confirmation Mail", Body);
        }
        else
        {
            Error_Label.Text = "Unknown Internal Error. Please try again after some time.";
            Error_Label.Visible = true;
        }
    }


    [System.Web.Services.WebMethod]
    public static int CheckUsername(string username)
    {
        // Checks if the username is available or not
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("delete from  EBay_TempStudent where DATEDIFF(DAY, Signup_Time_sdt, GETDATE()) > 0", con);
            com.CommandType = CommandType.Text;
            com.ExecuteNonQuery();

            com.CommandText = "select COUNT(Student_ID_pk_bi) from EBay_Student where Username_vc = '" + username + "'";

            if ((int)com.ExecuteScalar() > 0)
                return 0;

            com.CommandText = "select COUNT(Student_ID_pk_bi) from EBay_TempStudent where Username_vc = '" + username + "'";

            if ((int)com.ExecuteScalar() > 0)
                return 0;
            return 1;

        }
    }

    [System.Web.Services.WebMethod]
    public static int CheckBITSID(string ID)
    {
        // Checks if the BITSID is already registerd or not
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("delete from  EBay_TempStudent where DATEDIFF(DAY, Signup_Time_sdt, GETDATE()) > 0", con);
            com.CommandType = CommandType.Text;
            com.ExecuteNonQuery();

            com.CommandText = "select COUNT(Student_ID_pk_bi) from EBay_Student where BITS_ID_vc = '" + ID + "'";

            if ((int)com.ExecuteScalar() > 0)
                return 0;

            com.CommandText = "select COUNT(Student_ID_pk_bi) from EBay_TempStudent where BITS_ID_vc = '" + ID + "'";

            if ((int)com.ExecuteScalar() > 0)
                return 0;
            return 1;
        }
    }
}