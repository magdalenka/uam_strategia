using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Novell.Directory.Ldap;
using System.Data;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.IO;

public partial class DodawanieS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyJednostki = Request.QueryString["nr"];
        string nazwaJednostki = Request.QueryString["nazwa"];

        if (ListBox1.SelectedValue == "")
        {
            SqlConnection mySQLConnection = new SqlConnection();
            mySQLConnection.ConnectionString = @"Data Source=150.254.76.229;Initial Catalog=UAMSTRATEG_USERS;Persist Security Info=True;User ID=UAMSTRATEG;Password=21hMpA8a";
            mySQLConnection.Open();

            SqlCommand cmd;
            cmd = new SqlCommand("SELECT OrganizationKey, OrganizationDesc from dbo.DimOrganization where OrganizationParentKey = '" + keyJednostki + "'", mySQLConnection);
            cmd.ExecuteNonQuery();


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dt.TableName = "ListBox1";
            da.Dispose();
            mySQLConnection.Close();

            Label1.Text = "Wybrano jednostkę <b>" + nazwaJednostki + "</b>. <a href='../DodawanieS2.aspx?jednostka=" + nazwaJednostki + "'>Dodaj strategię tej jednostki...</a><br><br>";

            ListBox1.Items.Add(new ListItem("... lub wybierz jej podjednostkę.", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListBox1.Items.Add(new ListItem(dt.Rows[i]["OrganizationDesc"].ToString(), dt.Rows[i]["OrganizationKey"].ToString() + "&nazwa=" + dt.Rows[i]["OrganizationDesc"].ToString()));
            }
        }


    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/DodawanieS.aspx/?nr=" + ListBox1.SelectedValue);
    }
}