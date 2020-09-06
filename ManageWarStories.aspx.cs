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

public partial class Admin1_ManageWarStories : System.Web.UI.Page
{
    #region Declaration Section==========================================================================
    UserBAL objUser = new UserBAL();
    #endregion===========================================================================================

    #region Load Section==========================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
        Label PageTitle = this.Master.FindControl("PageTitle") as Label;
        PageTitle.Text = "Manage War Story";        
    }
    #endregion===========================================================================================

    #region Bind Section==========================================================================
   
    #endregion===========================================================================================

    #region UserDefined Function Section==========================================================================
    
    #endregion===========================================================================================

    #region Click Event Section==========================================================================
    
    #endregion===========================================================================================

    #region CheckBox Change Section==========================================================================
    
    #endregion===========================================================================================

    #region Repeater Event Section==========================================================================    
    #endregion===========================================================================================

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {

    }
    protected void lnksubmit_Click(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }
}
