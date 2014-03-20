using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.IO;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

using System.Security.Cryptography;
using System.Text;

public class CommonFunctions
{
    public static DataSet TopNRecords(string tablebName, string pk_col, int Nrows)
    {
        DataSet latestN = new DataSet();
        try
        {
            SqlConnection con = ConnectionManager.Connect();

            String query = "SELECT COUNT(*) FROM " + tablebName;
            SqlCommand command = new SqlCommand(query, con);
            command.CommandType = System.Data.CommandType.Text;
            int rows = (int)command.ExecuteScalar();

            query = "WITH Emps AS(SELECT *, ROW_NUMBER() OVER (ORDER BY " + pk_col + ") AS 'RowNumber'FROM " + tablebName + " ) SELECT * FROM Emps WHERE RowNumber > " + rows + " - " + Nrows;
            command.CommandText = query;

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(latestN, "TopN");

            con.Close();

        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Common Functions - TopNRecords", exp);
        }
        return latestN;
    }

    public static SqlDataReader ObjectDetailsIDR(string ID, string tableName, string pk_col)
    {
        SqlDataReader data;

        SqlConnection connection = ConnectionManager.Connect();
        string query = "SELECT * FROM " + tableName + " WHERE " + pk_col + " = " + ID;
        SqlCommand command = new SqlCommand(query, connection);
        data = command.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleRow);

        return data;
    }

    public static DataSet ObjectDetailsIDDS(int ID, string tableName, string pk_col)
    {
        DataSet ds = new DataSet();

        using (SqlConnection connection = ConnectionManager.Connect())
        {
            string query = "SELECT * FROM " + tableName + " WHERE " + pk_col + " = " + ID;
            SqlCommand command = new SqlCommand(query, connection);

            SqlDataAdapter adapater = new SqlDataAdapter(command);
            adapater.Fill(ds, "ObjectDetails");
        }

        return ds;
    }

    public static string GetScalar(Int64 studentID, string filter_col, string reqd_col, string table_name) // Used to get Single values like Notices_t, Items_t by a Student
    {
        string text = "0";
        try
        {

            SqlConnection connection = ConnectionManager.Connect();

            string query = "select " + reqd_col + " from " + table_name + " where " + filter_col + " = " + studentID;
            SqlCommand command = new SqlCommand(query, connection);
            command.CommandType = CommandType.Text;


            object obj = command.ExecuteScalar();

            if (obj != null)
                text = obj.ToString();

            connection.Close();
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Common Functions - GetScalar", exp);
        }
        return text;
    }

    public static string ImageProcessing(string saveLocation, FileUpload imageUpload, string filename, string purpose)
    {
        String FileExt = "", finalPath = "Only .jpg format allowed for now.", highResFileName = null;
        Boolean FlagFile = false;

        if (imageUpload.HasFile)
        {
            FileExt = System.IO.Path.GetExtension(imageUpload.FileName);
            FileExt = FileExt.ToLower();
            String[] NeedTypes = { ".jpg" };
            for (int i = 0; i < NeedTypes.Length; i++)
            {
                if (FileExt == NeedTypes[i])
                {
                    FlagFile = true;
                    highResFileName = "~/_Pics_High_Resolution/" + purpose + "_" + filename + FileExt;
                    finalPath = highResFileName;
                    break;
                }
            }
        }
        else
        {
            finalPath = "Please select a file to Upload.";
        }

        if (FlagFile == true)
        {

            try
            {
                imageUpload.PostedFile.SaveAs(HttpContext.Current.Server.MapPath(highResFileName));
                Bitmap sourceImage = new Bitmap(HttpContext.Current.Server.MapPath(highResFileName));
                Bitmap resizedImage = new Bitmap(100, 100);
                int newImageHeight = 100, newImageWidth = 100;
                if (sourceImage.Width > sourceImage.Height)
                {
                    if (sourceImage.Width > 100)
                    {
                        newImageHeight = (int)(sourceImage.Height *
                          ((float)100 / (float)sourceImage.Width));
                        resizedImage = new Bitmap(100, newImageHeight);
                    }
                }
                else
                {
                    if (sourceImage.Height > 100)
                    {
                        newImageWidth = (int)(sourceImage.Width *
                          ((float)100 / (float)sourceImage.Height));
                        resizedImage = new Bitmap(newImageWidth, 100);
                    }
                }
                Graphics gr = Graphics.FromImage(resizedImage);
                gr.InterpolationMode = InterpolationMode.Bicubic;       // Specifies Quality
                gr.DrawImage(sourceImage, 0, 0, newImageWidth, newImageHeight);
                resizedImage.Save(HttpContext.Current.Server.MapPath(saveLocation + filename + FileExt));
                finalPath = saveLocation + filename + FileExt;
                sourceImage.Dispose();
                FileInfo F = new FileInfo(HttpContext.Current.Server.MapPath(highResFileName));
                F.Delete();

            }
            catch (Exception exp)
            {
                CommonFunctions.logTheError("Common Functions - Image Processing", exp);
            }
        }

        return finalPath;
    }


    public static string RandomString()
    {
        string securityKey = "";
        SqlCommand com;

        using (SqlConnection con = ConnectionManager.Connect())
        {
            while (true)
            {
                securityKey = "";
                Random random = new Random();
                char ch;
                for (int i = 0; i < 30; i++)
                {
                    ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                    securityKey += ch;
                }
                com = new SqlCommand("select COUNT(Student_ID_pk_bi) from EBay_TempStudent where SecurityKey_nc = '" + securityKey + "'", con);
                com.CommandType = CommandType.Text;
                if ((int)com.ExecuteScalar() == 0)
                {
                    break;
                }
            }
        }
        return securityKey;
    }

    public static SqlDataReader GetAColumn(string column, string tableName)
    {
        // Returns a column from table specified. Used for JQuery auto complete.

        SqlDataReader reader = null;
        try
        {
            SqlConnection con = ConnectionManager.Connect();

            SqlCommand com = new SqlCommand("select " + column + " from " + tableName, con);
            com.CommandType = CommandType.Text;

            reader = com.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult);
        }

        catch (Exception exp)
        {
            CommonFunctions.logTheError("Common Functions - GetAColumn", exp);
        }
        return reader;
    }

    public static string getMd5Hash(string input)
    {
        // Create a new instance of the MD5CryptoServiceProvider object.
        MD5 md5Hasher = MD5.Create();

        // Convert the input string to a byte array and compute the hash.
        byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));

        // Create a new Stringbuilder to collect the bytes
        // and create a string.
        StringBuilder sBuilder = new StringBuilder();

        // Loop through each byte of the hashed data 
        // and format each one as a hexadecimal string.
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        // Return the hexadecimal string.
        return sBuilder.ToString();
    }

    public static void logTheError(string ErrorType, Exception ErrorDescription)
    {
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("insert into Ebay_ErrorList (ErrorType_vc, Error_Desctiption_t) values ('"
                + ErrorType + "','" + ErrorDescription.Message + ", Stack - " + ErrorDescription.StackTrace + ", Target Site - " + ErrorDescription.TargetSite + "')", con);
            com.CommandType = CommandType.Text;
            try
            {
                com.ExecuteNonQuery();
            }
            catch (Exception)
            { }

        }
    }

}