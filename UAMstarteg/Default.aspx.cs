using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.IO;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["OrganizationKeyP"] != null)
        {
            Session["OrganizationKeyP"] = null;
            Page.RegisterStartupScript("myScript", "<script language=JavaScript>__doPostBack('ctl00$HeadLoginView$HeadLoginStatus$ctl00','')</script>");
        }
        else
            Page.RegisterStartupScript("myScript", "<script language=JavaScript>parent.location='Targets/TargetsAsText.aspx'</script>");
    }
}
