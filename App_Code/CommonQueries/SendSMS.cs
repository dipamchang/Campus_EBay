using System;
using System.Net;
using System.Threading;
using System.Data;
using System.Data.SqlClient;

public class SendSMS
{
    static int SMS_Limit = 100;    // Assuming 100 sms per day is the limit from each mobile.
    static string[] usernames = new string[5] { "7702907916", "7702907942", "7702903122", "7702903724", "7702927932" };
    static string password = "campusebay2011";         // As all accounts have same password

    public static void ByWay2SMS(string message, string no)
    {
        string[] phones = no.Split(new char[1] { ',' }); // Comma added by default
        int requirement = 0;

        for (int i = 0; i < phones.Length; i++)
        {
            if (phones[i].Trim().Length < 10)
            {
                continue;
            }
            requirement++;
        }

        MyThreads.userName = usernames[Availability(requirement)];
        MyThreads.passWord = password;

        MyThreads.phNumber = no;
        MyThreads.message = message;

        Thread SMS_Thread = new Thread(new ThreadStart(MyThreads.send_sms));
        SMS_Thread.Start();
    }

    protected static int Availability(int req)
    {
        // Returns the index of phone number which is available for today
        SqlConnection con = ConnectionManager.Connect();

        SqlCommand com = new SqlCommand("Ebay_isAvailable", con);
        com.CommandType = CommandType.StoredProcedure;

        com.Parameters.Add("Limit", SqlDbType.TinyInt).Value = SMS_Limit;
        com.Parameters.Add("Req", SqlDbType.TinyInt).Value = req;
        SqlParameter p = com.Parameters.Add("Result", SqlDbType.Bit);
        p.Direction = ParameterDirection.Output;

        for (int i = 0; i < usernames.Length; i++)
        {
            com.Parameters.Add("Phone", SqlDbType.NChar).Value = usernames[i];
            com.ExecuteScalar();
            if ((bool)p.Value)
            {
                return i;
            }
        }
        return 0;       // No other option as no mobiles are available
    }
}