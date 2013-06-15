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
	   Page.RegisterStartupScript("myScript", "<script language=JavaScript>__doPostBack('ctl00$HeadLoginView$HeadLoginStatus$ctl00','')</script>");
       // odbieranie nr strategii i nr celu, mozna potem usunac wyswietlanie w labelu
       string id_str = Request.QueryString["id_strategii"];
       string id_cel = Request.QueryString["id_celu"];

       if (id_str != "" && id_str != null)
       {
           id_str = "Wybrałeś strategię numer " + id_str + ".<br>";

           if (id_cel != "" && id_cel != null)
           {
               id_cel = "Wybrałeś cel numer " + id_cel + ".";
           }
           else
           {
               id_cel = "Podano niepoprawny numer celu.";
           }
       }
    }      
}
