using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Novell.Directory.Ldap;
using System.Data;
using System.Xml;
using System.Configuration;
using System.Web.Services;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.IO;

public partial class Targets_FormDelete : System.Web.UI.Page
{
    DataFetcher df = new DataFetcher();
    int id, strategyNr, type;

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("id"));
        strategyNr = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("strategyNr"));
        type = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("type"));//cel czy dzialanie

        LoadTrescCeluDzialaniaLiteral();
    }

    //Załaduj opis uwanego celu/działania do labelki
    protected void LoadTrescCeluDzialaniaLiteral()
    {
        String descriptionQuery = "";
        if (type == 1)//cel
        {
            descriptionQuery = "SELECT tresc FROM cel WHERE id = " + id;
        }
        if (type == 0)
        {
            descriptionQuery = "SELECT nazwa FROM dzialanie WHERE id = " + id;
        }

        DataTable dt = df.getSelectResultsAsDataTable(descriptionQuery);
        TrescCeluDzialaniaLiteral.Text = dt.Rows[0][0].ToString();
        TrescCeluDzialaniaLiteral.Text += "</br>";
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        String deleteQuery = "";
        if (type == 1)
        {
            deleteQuery = "UPDATE cel SET widocznosc = 0 WHERE id = " + id;
        }
        if (type == 0)
        {
            deleteQuery = "UPDATE dzialanie SET widocznosc = 0 WHERE id = " + id;
        }

        df.delete_update(deleteQuery);

        Page.RegisterStartupScript("myScript", "<script language=JavaScript>window.opener.parent.location.reload()</script>");
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }
}