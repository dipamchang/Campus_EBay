using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
public partial class Admin_Pages_UploadedItems : System.Web.UI.Page
{
    protected void ErrorList_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string fileSourceDir = @ConfigurationManager.AppSettings["ItemImagesFolderPath"].ToString();
        // Delete the Image of Item as well
        string filename = e.Keys[0].ToString();
        try
        {
            File.Delete(Directory.GetFiles(fileSourceDir, "*" + "item_" + filename + "*")[0]);
        }
        catch (Exception exp)
        {
            CommonFunctions.logTheError("Admin_Items.cs - Deleting ItemID : " + e.Keys[0], exp);
        }
    }
}