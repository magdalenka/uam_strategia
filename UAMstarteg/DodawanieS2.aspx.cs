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
using System.ComponentModel;
using System.Web.UI.WebControls;


public partial class DodawanieS2 : System.Web.UI.Page
{
    string jednostka = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        jednostka = Request.QueryString["jednostka"];
        Label1.Text = "Wybrano jednostkę <b>" + jednostka + "</b><br><br>Wypełnij pozostałe pola.<br><br>";
    }

    protected void dalejButton_Click(object sender, EventArgs e)
    {
        int n;
        if (TBNazwa.Text == "" || TBNazwa.Text == null)
            LabelError.Text = "<b>Podaj nazwę strategii!</b>";
        else if (!int.TryParse(TBLp.Text, out n))
            LabelError.Text = "<b>Numer strategii musi być liczbą!</b>";
        else if (TBLp.Text == "" || TBLp.Text == null)
            LabelError.Text = "<b>Podaj numer strategii!</b>";
        else
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString150"].ConnectionString;
            SqlConnection mySQLConnection = new SqlConnection();
            mySQLConnection.ConnectionString = connStr;
            mySQLConnection.Open();

            SqlCommand cmd;
            cmd = new SqlCommand("SELECT OrganizationKey from dbo.DimOrganization where OrganizationDesc = '" + jednostka + "'", mySQLConnection);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();

            if (dt.Rows.Count == 0)
            {
                connStr = ConfigurationManager.ConnectionStrings["myConnectionStringMSSQL"].ConnectionString;
                mySQLConnection = new SqlConnection();
                mySQLConnection.ConnectionString = connStr;
                mySQLConnection.Open();

                cmd = new SqlCommand("insert into strategia(id_parent, lp, nazwa_strategii, nazwa_jednostki, widocznosc, organization_key) values (null, " + TBLp.Text + ", '" + TBNazwa.Text + "', '" + jednostka + "', 1, '0000000000')", mySQLConnection);
                cmd.ExecuteNonQuery();
                da.Dispose();
                mySQLConnection.Close();
                LabelError.Text = "<b>Dodano strategię.</b>";
                Page.RegisterStartupScript("myScript", "<script language=JavaScript>parent.location='Frameset.aspx'</script>");
            }
            else
            {
                string key = dt.Rows[0]["OrganizationKey"].ToString();

                cmd = new SqlCommand("SELECT OrganizationParentKey from dbo.DimOrganization where OrganizationDesc = '" + jednostka + "'", mySQLConnection);
                cmd.ExecuteNonQuery();
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                da.Dispose();
                string parentKey = dt.Rows[0]["OrganizationParentKey"].ToString();

                mySQLConnection.Close();
                connStr = ConfigurationManager.ConnectionStrings["myConnectionStringMSSQL"].ConnectionString;
                mySQLConnection = new SqlConnection();
                mySQLConnection.ConnectionString = connStr;
                mySQLConnection.Open();

                cmd = new SqlCommand("SELECT id from strategia where widocznosc = 1 and organization_key = '" + parentKey + "'", mySQLConnection);
                cmd.ExecuteNonQuery();
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                da.Dispose();

                string idParent = dt.Rows[0]["id"].ToString();

                cmd = new SqlCommand("insert into strategia(id_parent, lp, nazwa_strategii, nazwa_jednostki, widocznosc, organization_key) values (" + idParent + ", " + TBLp.Text + ", '" + TBNazwa.Text + "', '" + jednostka + "', 1, '" + key + "')", mySQLConnection);
                cmd.ExecuteNonQuery();
                da.Dispose();
                mySQLConnection.Close();
                LabelError.Text = "<b>Dodano strategię.</b>";
                Page.RegisterStartupScript("myScript", "<script language=JavaScript>parent.location='Frameset.aspx'</script>");
            }
        }
    }
}