using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

public partial class PS2List_Default : System.Web.UI.Page
{

    /// <summary>
    /// Downloads the HTML files of individual stations
    /// The list of stations, name and URL is passed as an argument "List",
    /// by JQuery AJAX
    /// </summary>
    /// <param name="List">
    /// List of stations. Each station has 2 things - URL and name (same order)
    /// URL and name are seperated by ::
    /// and each station is seperated by a ;
    /// </param>
    /// <returns>
    /// Result of asyn download. No. of errors while downloading, those station's names.
    /// No. of stations attempted to download
    /// </returns>
    [System.Web.Services.WebMethod]
    public static string DownloadHTML(string List)
    {
        int errorCount = 0, stationsFound = 0;
        string StationsThatCreatedProblem = "";

        WebClient myWebRequest = new WebClient();

        // Set proxy and username and password only if i'm in hostel
        WebProxy myProxy = new WebProxy();
        //myProxy.Address = (new Uri("http://10.1.9.20:8080"));
        //myProxy.Credentials = new NetworkCredential("f2008567", "a8gjfgv");

        //myProxy.Address = (new Uri("http://10.10.10.123:808"));
        //myProxy.Credentials = new NetworkCredential("Nithanaroy", "saibaba");
        //myWebRequest.Proxy = myProxy;

        String[] Stations = List.Split(new char[1] { ';' });
        String[] StationDetails;
        foreach (String Station in Stations)
        {
            StationDetails = Station.Split(new String[1] { "::" }, StringSplitOptions.None);

            // These characters are npt allowed in the filenames - \ / : * ? " < > |

            try
            {
                StationDetails[1] = StationDetails[1].Replace("&", "ampersand"); // Unsafe URL if & is found
                StationDetails[1] = StationDetails[1].Replace('/', '_'); // JQuery also sending, "" as the last link. To ignore that error, placed this line in try block
                myWebRequest.DownloadFile(StationDetails[0], HttpContext.Current.Server.MapPath("~/PS2/Webpages/") + StationDetails[1] + ".htm");
                stationsFound++;
            }
            catch (Exception)
            {
                if (StationDetails[0] != "")
                    StationsThatCreatedProblem += StationDetails[1] + "\n ";
                // Silently ignore such errors for now...
                // One possible reason for now is internal Server Error. An error on Pilani Server itself
                errorCount++;
            }
        }
        return "Errors: " + --errorCount + ". \n Stations Attempted to Download: " + --stationsFound + "\n\n Stations That created Problem:\n " + StationsThatCreatedProblem;
    }
}