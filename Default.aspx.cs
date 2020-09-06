using BAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label PageTitle = this.Master.FindControl("PageTitle") as Label;
        PageTitle.Text = "Home";
        HtmlGenericControl li = this.Master.FindControl("lihm") as HtmlGenericControl;
        li.Attributes.Add("class", "active");
    }

    #region UserDefined Function Section==========================================================================
    [System.Web.Services.WebMethod]
    public static string GetShortDesc()
    {
        string data = "";
        DataSet ds = new DataSet();
        AboutusBAL objaboutus = new AboutusBAL();
        objaboutus.AboutusShortDesc = "";
        objaboutus.AboutusDescription = "";
        objaboutus.Action = "Search";
        ds = objaboutus.ManageAboutUS();
        if (ds.Tables[0].Rows.Count > 0)
        {
            data = ds.Tables[0].Rows[0]["AboutusShortDesc"].ToString();
        }
        else
        {
            data = "No Data Yet";
        }
        System.Web.Script.Serialization.JavaScriptSerializer jSearializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string aaData = jSearializer.Serialize(data);
        // aaData = "{\"data\": " + aaData + "}";
        return aaData;
    }    
    #endregion===========================================================================================
}