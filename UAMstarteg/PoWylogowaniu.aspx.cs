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
        Page.RegisterStartupScript("myScript", "<script language=JavaScript>parent.location='Default.aspx'</script>");
    }
}