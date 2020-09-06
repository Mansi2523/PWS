using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.Services;
using BAL;
using PAL;
using System.Text;
using System.IO;
using System.Net;
using System.Xml;
using Newtonsoft.Json;
using System.Net.NetworkInformation;
using System.Collections.Specialized;

public partial class Admin1_Admin : System.Web.UI.Page
{
    #region Declaration Section==========================================================================    
    public static string FileName, Desc; 
    #endregion===========================================================================================

    #region Load Section==========================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("../SignIn.aspx");
        }
    }
    #endregion===========================================================================================

    #region Bind Section==========================================================================
    
    #endregion===========================================================================================

    #region UserDefined Function Section==========================================================================
    
    #endregion===========================================================================================

    #region Click Event Section==========================================================================
   
    protected void lkbLogoff_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("../SignIn.aspx");
    }
   
    #endregion===========================================================================================

    #region Repeater Event Section==========================================================================
    
    #endregion===========================================================================================
}