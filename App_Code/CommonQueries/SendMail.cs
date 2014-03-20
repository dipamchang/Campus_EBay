using System;
using System.Threading;
using System.Net.Mail;

public class SendMail
{
    public static void byGmail(string toAddress, string Subject, string Body)
    {
        MyThreads.toAdd = toAddress;
        MyThreads.subject = Subject;
        MyThreads.body = Body;

        Thread Mail_Thread = new Thread(new ThreadStart(MyThreads.byGmail));
        Mail_Thread.Start();
    }
}