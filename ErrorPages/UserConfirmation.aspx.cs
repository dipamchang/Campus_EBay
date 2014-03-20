using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class ErrorPages_UserConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorMessage.Visible = false;

        if (Request.QueryString.Keys.Count == 0)
        {
            Response.Redirect("~/Home/Default.aspx", true);
        }

        if (Request.QueryString["SID"] == null || Request.QueryString["SKey"] == null)
        {
            Response.Redirect("~/Home/Default.aspx", true);
        }

        try
        {

            using (SqlConnection con = ConnectionManager.Connect())
            {
                SqlCommand com = new SqlCommand("delete from  EBay_TempStudent where DATEDIFF(SECOND, Signup_Time_sdt, GETDATE()) > 86400", con);
                com.CommandType = System.Data.CommandType.Text;
                com.ExecuteNonQuery();

                com.CommandText = "select COUNT(Student_ID_pk_bi) from EBay_TempStudent where Student_ID_pk_bi = '" + Request.QueryString["SID"] + "' and SecurityKey_nc = '" + Request.QueryString["SKey"] + "'";
                if ((int)com.ExecuteScalar() == 0)
                {
                    checking.Visible = false;
                    ErrorMessage.Visible = true;
                }
                else
                {
                    SqlDataReader reader = CommonFunctions.ObjectDetailsIDR(Request.QueryString["SID"].ToString(), "Ebay_TempStudent", "Student_ID_pk_bi");
                    reader.Read();

                    string myPhoto = reader["PhotoURL"].ToString();

                    if (myPhoto.IndexOf("default") >= 0)
                    {
                        // duplicate default profile image and save as BITS_ID.*
                        string[] files = Directory.GetFiles(@ConfigurationManager.AppSettings["ProfileImagesFolderPath"].ToString(), "*default" + "*");
                        myPhoto = reader["BITS_ID_vc"] + Path.GetExtension(files[0]);
                        string filename = @ConfigurationManager.AppSettings["ProfileImagesFolderPath"] + "\\" + myPhoto;   // creating a new file from temp file.
                        File.Copy(files[0], filename);
                    }

                    com.CommandText = "INSERT INTO EBay_Student (Username_vc, Password_vc, Student_Name_vc, IsAdmin_bool, Hostel_nc, BITS_ID_vc,Room_No_nc, Phone_No_vc, PhotoURL) VALUES ('" + reader["Username_vc"] + "','" + reader["Password_vc"] + "', '" + reader["Student_Name_vc"] + "', '" + reader["IsAdmin_bool"] + "', '" + reader["Hostel_nc"] + "', '" + reader["BITS_ID_vc"] + "', '" + reader["Room_No_nc"] + "', '" + reader["Phone_No_vc"] + "', '" + myPhoto + "');"
                        + "SELECT @StudentID = SCOPE_IDENTITY()";

                    SqlParameter p = com.Parameters.Add("@StudentID", SqlDbType.BigInt);
                    p.Direction = ParameterDirection.Output;
                    com.ExecuteNonQuery();
                    string StudentID = p.Value + "";

                    // Adding to CloudDictionary Table
                    if (reader["ItemsCloud_vc"].ToString() != "" || reader["StudentsCloud_vc"].ToString() != "")
                    {
                        string[] ICloud = reader["ItemsCloud_vc"].ToString().Split(new char[1] { ',' });
                        string[] SCloud = reader["StudentsCloud_vc"].ToString().Split(new char[1] { ',' });
                        string query = "insert into Ebay_CloudDictionary (ByStudent_ID_fk_bi, Type_c, CloudValue_vc) VALUES ";
                        bool flag = false;

                        for (int i = 0; i < ICloud.Length; i++)
                        {
                            if (ICloud[i].Trim().Length > 0 && ICloud[i].IndexOf("multiple values by comma") < 0)
                            {
                                query += "(" + StudentID + ", 'Item', '" + ICloud[i].Trim() + "'), ";
                                flag = true;
                            }
                        }

                        for (int i = 0; i < SCloud.Length; i++)
                        {
                            if (SCloud[i].Trim().Length > 0 && SCloud[i].IndexOf("multiple values by comma") < 0)
                            {
                                query += "(" + StudentID + ", 'Student', '" + SCloud[i].Trim() + "'), ";
                                flag = true;
                            }
                        }
                        if (flag)
                        {
                            query = query.Substring(0, query.Length - 2);
                            com.CommandText = query;
                            com.ExecuteNonQuery();
                        }
                    }


                    com.CommandText = "delete from EBay_TempStudent where Student_ID_pk_bi = '" + Request.QueryString["SID"] + "'";
                    com.ExecuteNonQuery();

                    // Start Session
                    Session["isLoggedIn"] = true;
                    Session["Time"] = DateTime.Now;
                    Session["StudentID"] = StudentID;
                    Session["bitsid"] = reader["BITS_ID_vc"];
                    Session["studentname"] = reader["Student_Name_vc"];

                    Response.Redirect("~/Profile_page/Default.aspx", false);
                }
            }
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("ErrorPages UserConfirmation.cs - PageLoad", exp);
        }
    }
}