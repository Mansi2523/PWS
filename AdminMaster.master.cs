using System;
using System.Collections;
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
using BAL;
using PAL;
using System.IO;
using System.Text;
using System.Data.SqlClient;

public partial class Admin1_AdminMaster : System.Web.UI.MasterPage
{
    #region Declaration Section==========================================================================    
    public static string GuidLink { get; set; }
    #endregion===========================================================================================

    #region Load Section==========================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../SignIn.aspx");
            }
        }
    }
    #endregion===========================================================================================

    #region Bind Section==========================================================================
   
    #endregion===========================================================================================

    #region UserDefined Function Section==========================================================================
   
    #endregion===========================================================================================

    #region Click Event Section==========================================================================   
    protected void lnkrefresh_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    #endregion===========================================================================================

    #region Repeater Event Section==========================================================================
   
    #endregion===========================================================================================
    
}
