using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using BAL;
using AjaxControlToolkit;
using System.Text;
using System.Threading;
using System.Globalization;
using System.Text.RegularExpressions;
using RusticiSoftware.HostedEngine.Client;

public partial class Admin1_Dashboard : System.Web.UI.Page
{

    #region Declaration Section==========================================================================   
    UserBAL objUserBAL = new UserBAL();
    WarBAL objWar = new WarBAL();
    #endregion===========================================================================================

    #region Load Section==========================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
        Label PageTitle = this.Master.FindControl("PageTitle") as Label;
        PageTitle.Text = "Dashboard";        
        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../SignIn.aspx");
            }
            else
            {
                GetCounts();
            }
        }        
    }
    #endregion===========================================================================================

    #region Bind Section==========================================================================
   
    #endregion===========================================================================================

    #region UserDefined Function Section==========================================================================
    //Get Counts
    public void GetCounts()
    {
        DataSet Dscount = new DataSet();
        Dscount = objWar.GetCount();
        if (Dscount.Tables.Count > 0)
        {

            lblwar.Text = Dscount.Tables[0].Rows[0]["Wars"].ToString();
            lblwardetail.Text = Dscount.Tables[1].Rows[0]["WarDetails"].ToString();
            lblwarstory.Text = Dscount.Tables[2].Rows[0]["WarStories"].ToString();
            lblwar.Attributes.Add("data-value", "" + Dscount.Tables[0].Rows[0]["Wars"].ToString() + "");
            lblwardetail.Attributes.Add("data-value", "" + Dscount.Tables[1].Rows[0]["WarDetails"].ToString() + "");
            lblwarstory.Attributes.Add("data-value", "" + Dscount.Tables[2].Rows[0]["WarStories"].ToString() + "");
        }
    }
    #endregion===========================================================================================

    #region Click Event Section==========================================================================    
    #endregion===========================================================================================
}