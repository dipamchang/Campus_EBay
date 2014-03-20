using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class AdvSearch
{
    public static bool dateChosen = false;

    public static int pageIndex = 0; // For Paging
    public static int pageSize = 15; // For Paging

    static string mainQuery = "WITH Search AS (SELECT *, ROW_NUMBER() OVER (ORDER BY Item_ID_pk_bi DESC) AS 'RowNumber' FROM Ebay_Search_v ";

    public static DataSet Search(int[] token, string searchKey)
    {

        string query = "where " + TokenFinder(token[0]) + " like '%" + searchKey + "%'";
        return Rest(query);
    }

    public static DataSet Search(int[] token, string searchKey, string searchKey1)
    {

        string query = "where " + TokenFinder(token[0]) + " like '%" + searchKey + "%' and " + TokenFinder(token[1]) + " like '%" + searchKey1 + "%'";
        return Rest(query);
    }

    public static DataSet Search(int[] token, string searchKey, string searchKey1, string searchKey2)
    {

        string query = "where " + TokenFinder(token[0]) + " like '%" + searchKey + "%' and " + TokenFinder(token[1]) + " like '%" + searchKey1 + "%' and " + TokenFinder(token[2]) + " like '%" + searchKey2 + "%'";
        return Rest(query);
    }

    public static DataSet Search(int[] token, string searchKey, string searchKey1, string searchKey2, string searchKey3)
    {

        string query = "where " + TokenFinder(token[0]) + " like '%" + searchKey + "%' and " + TokenFinder(token[1]) + " like '%" + searchKey1 + "%' and " + TokenFinder(token[2]) + " like '%" + searchKey2 + "%' and " + TokenFinder(token[3]) + " like '%" + searchKey3 + "%'";
        return Rest(query);
    }

    public static DataSet Search(int[] token, string searchKey, string searchKey1, string searchKey2, string searchKey3, string searchKey4)
    {

        string query = "where " + TokenFinder(token[0]) + " like '%" + searchKey + "%' and " + TokenFinder(token[1]) + " like '%" + searchKey1 + "%' and " + TokenFinder(token[2]) + " like '%" + searchKey2 + "%' and " + TokenFinder(token[3]) + " like '%" + searchKey3 + "%' and " + TokenFinder(token[4]) + " like '%" + searchKey4 + "%'";
        return Rest(query);
    }

    public static DataSet Search(int[] token, string searchKey, string searchKey1, string searchKey2, string searchKey3, string searchKey4, string searchKey5)
    {

        string query = "where " + TokenFinder(token[0]) + " like '%" + searchKey + "%' and " + TokenFinder(token[1]) + " like '%" + searchKey1 + "%' and " + TokenFinder(token[2]) + " like '%" + searchKey2 + "%' and " + TokenFinder(token[3]) + " like '%" + searchKey3 + "%' and " + TokenFinder(token[4]) + " like '%" + searchKey4 + "%' and " + TokenFinder(token[5]) + " like '%" + searchKey5 + "%'";
        return Rest(query);
    }

    public static DataSet Search(int[] token, string searchKey, string searchKey1, string searchKey2, string searchKey3, string searchKey4, string searchKey5, string searchKey6)
    {

        string query = "where " + TokenFinder(token[0]) + " like '%" + searchKey + "%' and " + TokenFinder(token[1]) + " like '%" + searchKey1 + "%' and " + TokenFinder(token[2]) + " like '%" + searchKey2 + "%' and " + TokenFinder(token[3]) + " like '%" + searchKey3 + "%' and " + TokenFinder(token[4]) + " like '%" + searchKey4 + "%' and " + TokenFinder(token[5]) + " like '%" + searchKey5 + "%' and " + TokenFinder(token[6]) + " like '%" + searchKey6 + "%'";
        return Rest(query);
    }

    private static DataSet Rest(string query)
    {
        string subquery = ") SELECT * FROM Search WHERE RowNumber BETWEEN " + (pageIndex * pageSize + 1) + " AND " + (pageIndex * pageSize + pageSize);

        DataSet ds = new DataSet();

        if (dateChosen)
        {
            query = query.Replace("upload_time_sdt like '%BETWEEN ", "upload_time_sdt BETWEEN '"); //query = "select * from Ebay_Search_v where upload_time_sdt like '%BETWEEN 06 December, 2010 AND 23 December, 2010%'"
            query = query.Replace(" AND ", "' AND '"); //query = "select * from Ebay_Search_v where upload_time_sdt BETWEEN '21 December, 2010' AND '25 December, 2010%'"
            int percent = query.IndexOf("%"); //For removing %
            string temp = query.Substring(0, percent) + query.Substring(percent + 1);
            query = temp; //query = "select * from Ebay_Search_v where upload_time_sdt BETWEEN '21 December, 2010' AND '25 December, 2010'"
        }

        string completeQuery = mainQuery + query + subquery;
        try
        {
            using (SqlConnection con = ConnectionManager.Connect())
            {
                SqlCommand command = new SqlCommand(completeQuery, con);
                command.CommandType = CommandType.Text;

                SqlDataAdapter adapater = new SqlDataAdapter(command);
                adapater.Fill(ds, "SearchResult");
            }
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("In Search.cs", exp);
        }
        return ds;
    }

    private static string TokenFinder(int token)
    {
        switch (token)
        {
            case 1: return "Item_name_vc";
            case 2: return "Category_Name_vc";
            case 3: return "Hostel_nc";
            case 4: return "username_vc";
            case 5: return "Student_name_vc";
            case 6: return "upload_time_sdt";
            case 8: return "Description_t"; // Since 'from date' and 'to date' are 2 fields
            case 9: return "Student_ID_pk_bi"; // used for search when a person is clicked.
            default: return "";
        }
    }
}