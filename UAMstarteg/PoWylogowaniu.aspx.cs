using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PoWylogowaniu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["OrganizationKeyP"] = null;
        Page.RegisterStartupScript("myScript", "<script language=JavaScript>parent.location='Targets/TargetsAsText.aspx'</script>");
    }
}