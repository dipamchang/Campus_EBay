using System;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Threading;

public class MyThreads
{
    public static String userName, phNumber, passWord, message;     // for SMS
    public static String toAdd, subject, body;                      // for Mail

    public static void send_sms()
    {
        ServicePointManager.MaxServicePointIdleTime = 10000;
        ServicePointManager.Expect100Continue = false;

        string u1 = userName;
        string p1 = passWord;
        string pn = phNumber;
        string msg = message;

        string[] phones = pn.Split(new char[1] { ',' }); // Comma added by default

        for (int i = 0; i < phones.Length; i++)
        {
            if (phones[i].Trim().Length != 10)
            {
                continue;
            }
            try
            {
                string URL = "http://ubaid.tk/sms/sms.aspx?uid=" + u1 + "&pwd=" + p1 +
                "&msg=" + msg + "&phone=" + phones[i].Trim() + "&provider=way2sms";
                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(URL);
                myReq.KeepAlive = false;
                //myReq.ProtocolVersion = HttpVersion.Version10;
                //myReq.Method = "POST";
                //myReq.ContentType = "application/x-www-form-urlencoded";
                //myReq.ContentLength = URL.Length;
                ////IWebProxy proxy
                ////myReq.Proxy = "10.1.8.30:8080"; 
                //myReq.AllowAutoRedirect = true;
                //myReq.MaximumAutomaticRedirections = 10;
                myReq.Timeout = (int)new TimeSpan(0, 0, 30).TotalMilliseconds;
                //myReq.UserAgent = "Mozilla/3.0 (compatible; My Browser/1.0)";

                //Stream writeStream = myReq.GetRequestStream();
                //byte[] bytes = System.Text.Encoding.ASCII.GetBytes(URL);
                //writeStream.Write(bytes, 0, bytes.Length);
                //writeStream.Close();

                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                //Stream responseStream = myResp.GetResponseStream();
                //StreamReader readStream = new StreamReader(responseStream, Encoding.UTF8);
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
            }
            catch (Exception exp)
            {
                CommonFunctions.logTheError("Send SMS to " + phones[i] + ". Mobile used - " + u1, exp);
            }
        }
    }

    public static void byGmail()
    {
        string toAddress = toAdd;
        string Subject = subject;
        string Body = body;

        MailMessage mail = new MailMessage();

        if (toAddress.IndexOf(',') > 0)
        {
            // Use Bcc
            string[] addresse = toAddress.Split(new char[1] { ',' });
            foreach (string address in addresse)
            {
                mail.To.Add(address);
            }
        }
        else
            mail.To.Add(toAddress);

        mail.From = new MailAddress("bits.campus.ebay@gmail.com", "Campus eBay - BITS Pilani, Goa");
        mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
        mail.Subject = Subject;
        mail.Body = Body;
        mail.IsBodyHtml = true;
        //object userstate = mail;

        // Avoiding Spam
        mail.Priority = MailPriority.High;
        

        SmtpClient smtp = new SmtpClient();
        
        smtp.Host = "smtp.gmail.com";
        smtp.Credentials = new System.Net.NetworkCredential("bits.campus.ebay@gmail.com", "campusebay2011");
        smtp.Port = 587;
        smtp.EnableSsl = true;
        try
        {
            smtp.Send(mail);
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Sending Mail: " + toAddress, exp);
        }
    }

}