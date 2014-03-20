using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;

public class ItemClicked
{
    public static SqlDataReader ItemDetails(string ItemID)
    {
        SqlDataReader reader;

        SqlConnection con = ConnectionManager.Connect();
        SqlCommand com = new SqlCommand("select Item_Name_vc, Student_Name_vc, Category_Name_vc, Upload_Time_sdt, URL_vc, Phone_No_vc, Price_m, Description_t, Student_ID_pk_bi, Hostel_nc from EBay_Item, EBay_Student, EBay_Category_Mst where Student_ID_fk_bi = Student_ID_pk_bi and Category_ID_fk_bi = Category_ID_pk_bi and Item_ID_pk_bi = " + ItemID, con);
        com.CommandType = System.Data.CommandType.Text;

        reader = com.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        return reader;
    }
}