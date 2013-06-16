using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WyswietlaczRaportow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["OrganizationKeyP"] == null)
            Label1.Text = "<h2>Witamy w Systemie zarządzania strategiami UAM.</h2><p>Zaloguj się aby kontynuować.</p>";
        else
            raportramka.Visible = true;
    }
}