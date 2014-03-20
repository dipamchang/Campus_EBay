using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class ProfilePage
{
    //public static Int64 NewItemIDAdded = 0;

    public static SqlDataReader GetNotices(Int64 studentID)
    {
        SqlDataReader reader = null;

        SqlConnection connection = ConnectionManager.Connect();
        SqlCommand command = new SqlCommand("select Notices_ID_pk_bi, Notice_t, Upload_Time_sdt, Expiry_Date_sdt from EBay_Notices  where Student_ID_fk_bi = " + studentID + " and IsModerated_bool = 1 and Expiry_Date_sdt >= GETDATE() order by Notices_ID_pk_bi DESC;", connection);
        command.CommandType = CommandType.Text;

        reader = command.ExecuteReader(CommandBehavior.CloseConnection);

        return reader;
    }

    public static SqlDataReader GetLAF(Int64 studentID)
    {
        SqlDataReader reader = null;

        SqlConnection connection = ConnectionManager.Connect();
        SqlCommand command = new SqlCommand("select LAF_ID_pk_bi, Text_t, Upload_Time_sdt from EBay_LAF where Student_ID_fk_bi = " + studentID + " and IsModerated_bool = 1 and DATEDIFF(MM, Upload_Time_sdt, GETDATE()) <= 1 order by LAF_ID_pk_bi DESC", connection);
        command.CommandType = CommandType.Text;

        reader = command.ExecuteReader(CommandBehavior.CloseConnection);

        return reader;
    }

    public static SqlDataReader GetMessages(Int64 studentID)
    {
        SqlDataReader reader = null;

        SqlConnection connection = ConnectionManager.Connect();

        string query = "select Message_ID_pk_bi, Message_t, Upload_Time_sdt, s.Student_Name_vc, Message_Read_bool, fromStudent_ID_fk_bi from EBay_Message m, EBay_Student s where toStudent_ID_fk_bi = " + studentID + " and m.fromStudent_ID_fk_bi = s.Student_ID_pk_bi order by Message_ID_pk_bi DESC";
        SqlCommand command = new SqlCommand(query, connection);
        command.CommandType = CommandType.Text;

        reader = command.ExecuteReader(CommandBehavior.CloseConnection);
        return reader;
    }

    public static void delete(Int64 objectID, string key, Int64 studentID) //Used for Notices, Messages, Items, LAF...
    {
        //objectID - Eg: NoticeID that needs to be deleted from Ebay_Notices table.
        //key - Eg: key = Notices if u want to delete a Notice
        //          key = LAF for Lost and Found
        //          key = Message for Messages
        //          key = Item for Items uploaded to be deleted.

        // deleting that object from respective table. Eg: deleting the Notice from Ebay_Notices table.
        try
        {
            string query = "delete EBay_" + key + " where " + key + "_ID_pk_bi = " + objectID;
            using (SqlConnection connection = ConnectionManager.Connect())
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;
                command.ExecuteNonQuery();
            }
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Profile AppCode Class - delete", exp);
        }
    }

    public static void addNoticeLAF(string IsNotice, string expiryDate, string message, Int64 studentID)
    {
        using (SqlConnection connection = ConnectionManager.Connect())
        {
            SqlCommand command;
            string query;

            if (IsNotice == "true")
            {
                query = "insert into EBay_Notices (IsModerated_bool, Student_ID_fk_bi, Expiry_Date_sdt, Notice_t) " +
                    "values (1,'" + studentID + "','" + expiryDate + "', '" + message + "')";
            }
            else
            {
                query = "insert into EBay_LAF (IsModerated_bool,Student_ID_fk_bi, Text_t) values(1," + studentID + ",'" + message + "')"; ;
            }

            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();
        }
    }

    public static void MessageReadUpdate(string messageID)
    {
        using (SqlConnection connection = ConnectionManager.Connect())
        {
            string query = "update EBay_Message set Message_Read_bool = 1 where Message_ID_pk_bi = " + messageID;
            SqlCommand command = new SqlCommand(query, connection);
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();
        }
    }

    public static void updatePicture(string value, Int64 itemID)
    {
        SqlCommand command;
        using (SqlConnection connection = ConnectionManager.Connect())
        {
            string query = "update EBay_Item set URL_vc = '" + value + "' where Item_ID_pk_bi = " + itemID;
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.Text;
            command.ExecuteNonQuery();
        }
    }

    public static void InsertNewItem(string Name, Int64 StudentFKID, Int64 CategoryFKID, int Price, string Author, string Description, string URL)
    {

        using (SqlConnection con = ConnectionManager.Connect())
        {
            string query = "INSERT INTO [EBay_Item] ([Item_Name_vc], [Student_ID_fk_bi], [Category_ID_fk_bi], " +
                            "[Price_m], [Author_vc], [Description_t]) VALUES ('" + Name + "', " + StudentFKID + ", " + CategoryFKID + ", " + Price + ", '" + Author + "', '" + Description + "')" +
                            "SELECT @ItemID = SCOPE_IDENTITY()";

            SqlCommand com = new SqlCommand(query, con);

            SqlParameter p = com.Parameters.Add("@ItemID", SqlDbType.BigInt);
            p.Direction = ParameterDirection.Output;

            com.CommandType = CommandType.Text;

            com.ExecuteNonQuery();
            HttpContext.Current.Session["NewItemIDAdded"] = Convert.ToInt64(p.Value);
        }

    }

    public static SqlDataReader Alerts_SelectMethod(string studentID)
    {
        SqlConnection con = ConnectionManager.Connect();
        SqlCommand comm = new SqlCommand("select Type_c, CloudValue_vc  from Ebay_CloudDictionary where ByStudent_ID_fk_bi = " + studentID, con);
        comm.CommandType = CommandType.Text;
        return comm.ExecuteReader(CommandBehavior.CloseConnection);

    }

    public static bool UpdateAlerts(string StudentID, string[] items, string[] students)
    {
        try
        {
            string query = "delete from Ebay_CloudDictionary where ByStudent_ID_fk_bi = " + StudentID;
            using (SqlConnection con = ConnectionManager.Connect())
            {
                SqlCommand com = new SqlCommand(query, con);
                com.CommandType = CommandType.Text;
                com.ExecuteNonQuery();
            }

            query = "insert into Ebay_CloudDictionary (ByStudent_ID_fk_bi, Type_c, CloudValue_vc) Values ";
            bool flag = false;

            for (int i = 0; i < items.Length; i++)
            {
                items[i] = items[i].Trim();
                if (items[i].Length > 0)
                {
                    query += "(" + StudentID + ",'Item','" + items[i] + "'), ";
                    flag = true;
                }
            }

            for (int i = 0; i < students.Length; i++)
            {
                students[i] = students[i].Trim();
                if (students[i].Length > 0)
                {
                    query += "(" + StudentID + ",'Student','" + students[i] + "'), ";
                    flag = true;
                }
            }

            if (flag)
            {
                query = query.Substring(0, query.Length - 2);
                using (SqlConnection con = ConnectionManager.Connect())
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.CommandType = CommandType.Text;
                    com.ExecuteNonQuery();
                }
            }
            return true;
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError(" Updating Email Alerts - ", exp);
            return false;
        }
    }

    public static DataSet GetConverstion(string ReplyID)
    {
        DataSet ds = new DataSet();
        using (SqlConnection con = ConnectionManager.Connect())
        {
            SqlCommand com = new SqlCommand("EBay_Conversation_P", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add("RepliedID", SqlDbType.BigInt).Value = ReplyID;

            SqlDataAdapter adapter = new SqlDataAdapter(com);
            adapter.Fill(ds, "Conversation");

        }
        return ds;
    }
}