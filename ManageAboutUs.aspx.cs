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

public partial class Admin1_ManageAboutUs : System.Web.UI.Page
{
    #region Declaration Section==========================================================================
    UserBAL objUser = new UserBAL();
    #endregion===========================================================================================

    #region Load Section==========================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
        Label PageTitle = this.Master.FindControl("PageTitle") as Label;
        PageTitle.Text = "Manage About Us";        
    }
    #endregion===========================================================================================

    #region Bind Section==========================================================================
   
    #endregion===========================================================================================

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

    [System.Web.Services.WebMethod]
    public static string GetDesc()
    {
        string data = "";
        DataSet ds = new DataSet();
        AboutusBAL objaboutus = new AboutusBAL();
        objaboutus.AboutusShortDesc = "";
        objaboutus.AboutusDescription = "";
        objaboutus.Action = "Search";
        ds = objaboutus.ManageAboutUS();
        if (ds.Tables[1].Rows.Count > 0)
        {
            data = ds.Tables[1].Rows[0]["AboutusDescription"].ToString();
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

    [System.Web.Services.WebMethod]
    public static string AddData(string AboutusShortDesc, string AboutusDescription)
    {
        string data = "";
        DataSet ds = new DataSet();
        AboutusBAL objaboutus = new AboutusBAL();
        objaboutus.AboutusShortDesc = AboutusShortDesc;
        objaboutus.AboutusDescription = AboutusDescription;
        objaboutus.Action = "Insert";
        try
        {
            ds = objaboutus.ManageAboutUS();
            data = ds.Tables[0].Rows.Count.ToString();
        }
        catch (Exception exe)
        {
            data = exe.ToString();
        }
        return data;
    }
    #endregion===========================================================================================

    #region Click Event Section==========================================================================
    
    #endregion===========================================================================================

    #region CheckBox Change Section==========================================================================
    
    #endregion===========================================================================================

    #region Repeater Event Section==========================================================================    
    #endregion===========================================================================================        
}
