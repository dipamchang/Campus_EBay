using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;

public class ConnectionManager
{
	public static SqlConnection Connect() 
    {
        string Connection = ConfigurationManager.ConnectionStrings["EBayConnectionString"].ToString();

        SqlConnection connection = new SqlConnection(Connection);
        connection.Open();
        return connection;
    }
}