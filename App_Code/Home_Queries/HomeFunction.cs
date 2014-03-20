using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class HomeFunction
{
    public static SqlDataReader LatestItems(string Number)
    {
        SqlDataReader reader;

        SqlConnection con = ConnectionManager.Connect();

        SqlCommand command = new SqlCommand("WITH Emps AS (SELECT ROW_NUMBER() OVER (ORDER BY Item_ID_pk_bi DESC) AS 'RowNumber', Item_ID_pk_bi, Item_Name_vc, Student_Name_vc, URL_vc, Student_ID_pk_bi FROM EBay_Item, EBay_Student where Student_ID_fk_bi = Student_ID_pk_bi ) SELECT * FROM Emps WHERE RowNumber <= " + Number, con);
        command.CommandType = CommandType.Text;

        reader = command.ExecuteReader(CommandBehavior.CloseConnection);


        return reader;
    }

    public static SqlDataReader ItemUpdate()
    {
        SqlDataReader reader;

        // Form the String with comma seperated values.
        string IDs = "";
        DataSet ds = CommonFunctions.TopNRecords("EBay_Item", "Item_ID_pk_bi", 3);
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            IDs += String.Format("{0},", row["Item_ID_pk_bi"]);
        }

        if (IDs.Length > 0)
            IDs = IDs.Substring(0, IDs.Length - 1); // for removing the leading comma
        else
            IDs = "0";

        SqlConnection connection = ConnectionManager.Connect();
        string query = "select URL_vc, Item_Name_vc, Student_Name_vc from EBay_Item i, EBay_Student s where s.Student_ID_pk_bi = i.Student_ID_fk_bi and Item_ID_pk_bi in (" + IDs + ")";
        SqlCommand command = new SqlCommand(query, connection);
        command.CommandType = CommandType.Text;

        reader = command.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult);

        return reader;
    }

    public static SqlDataReader TableDetails(string tableName)
    {
        SqlConnection connection = ConnectionManager.Connect();
        string query = "SELECT * from " + tableName;

        SqlCommand command = new SqlCommand(query, connection);
        command.CommandType = CommandType.Text;
        SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult);

        return reader;
    }

    public static SqlDataReader AuthenticatedNotices(string HowMany)
    {
        SqlDataReader reader;

        SqlConnection con = ConnectionManager.Connect();

        // WITH Emps AS (SELECT ROW_NUMBER() OVER (ORDER BY Item_ID_pk_bi DESC) AS 'RowNumber', Item_ID_pk_bi, Item_Name_vc, Student_Name_vc, URL_vc, Student_ID_pk_bi FROM EBay_Item, EBay_Student where Student_ID_fk_bi = Student_ID_pk_bi ) SELECT * FROM Emps WHERE RowNumber <= " + Number

        SqlCommand command = new SqlCommand("WITH Emps AS (SELECT Student_Name_vc, Upload_Time_sdt, Notice_t, Student_ID_pk_bi, ROW_NUMBER() OVER (ORDER BY Notices_ID_pk_bi DESC) AS 'RowNumber' FROM EBay_Notices, EBay_Student where Student_ID_fk_bi = Student_ID_pk_bi  and IsModerated_bool = 1) SELECT * FROM Emps WHERE RowNumber <= " + HowMany, con);
        command.CommandType = CommandType.Text;

        reader = command.ExecuteReader(CommandBehavior.CloseConnection);

        return reader;
    }

    public static SqlDataReader AuthenticatedLAF(string HowMany)
    {
        SqlDataReader reader;

        SqlConnection con = ConnectionManager.Connect();

        SqlCommand command = new SqlCommand("WITH Emps AS (SELECT Student_Name_vc, Upload_Time_sdt, Text_t, Student_ID_pk_bi, ROW_NUMBER() OVER (ORDER BY LAF_ID_pk_bi DESC) AS 'RowNumber' FROM EBay_LAF, EBay_Student where Student_ID_fk_bi = Student_ID_pk_bi and IsModerated_bool = 1) SELECT * FROM Emps WHERE RowNumber <= " + HowMany, con);
        command.CommandType = CommandType.Text;

        reader = command.ExecuteReader(CommandBehavior.CloseConnection);

        return reader;
    }

    public static SqlDataReader Ticker()
    {
        SqlCommand com = new SqlCommand("select Ticker_text from Ebay_Ticker where isVisible_b = 1", ConnectionManager.Connect());
        com.CommandType = CommandType.Text;
        SqlDataReader reader = com.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult);
        return reader;
    }


}