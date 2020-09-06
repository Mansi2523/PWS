using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Wars : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label PageTitle = this.Master.FindControl("PageTitle") as Label;
        PageTitle.Text = "Wars";
        HtmlGenericControl li = this.Master.FindControl("liwr") as HtmlGenericControl;
        li.Attributes.Add("class", "menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-242 dropdown active");
    }
}