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


public partial class About : System.Web.UI.Page
{

    int idStrategii = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        idStrategii = Convert.ToInt32(Request.QueryString["id_strategii"]);
        utworzKorzenDrzewaCelow();
        Page.RegisterStartupScript("myScript", "<script language=JavaScript>parent.ramka_tresc.location='Default.aspx?id_strategii=" + idStrategii + "&id_celu=0'</script>");
    }


    protected DataTable select(string co, string skad, string ograniczenie)
    {
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        String query;
        if (ograniczenie == "" || ograniczenie == null)
            query = "SELECT  "+ co +" from "+ skad;
        else
	        query = "SELECT  "+ co +" from "+ skad + " where " + ograniczenie;

        SqlCommand cmd = new SqlCommand(query, mySQLConnection);
        cmd.ExecuteNonQuery();

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        dt.TableName = co;
        da.Dispose();
        mySQLConnection.Close();
        return dt;
    }

    protected void utworzKorzenDrzewaCelow()
    {
        DataTable dtCele = select("*", "cel", "id_strategii ="+ idStrategii +" and widocznosc = 1");
        int rowsCountCele = dtCele.Rows.Count;

        DataRow[] drCele;
        drCele = dtCele.Select("id_parent is null", "lp asc");


        for (int i = 0; i < drCele.Length; i++)
        {
            String nazwaCelu = drCele[i]["tresc"].ToString();
            String idCelu = drCele[i]["id"].ToString();

            TreeNode wezel = new TreeNode(
                nazwaCelu,
                idCelu,
                "",
                "Default.aspx?id_strategii=" + idStrategii + "&id_celu=" + idCelu,
                "ramka_tresc"
                );
            DrzewoCelow.Nodes.Add(wezel);
            dodajPotomkowDoDrzewaCelow(wezel, dtCele);

        }
    }

    protected void dodajPotomkowDoDrzewaCelow(TreeNode rodzic, DataTable dtCele)
    {
        DataRow[] drCele;
        drCele = dtCele.Select("id_parent = "+ Convert.ToInt32(rodzic.Value), "lp asc");


        for (int i = 0; i < drCele.Length; i++)
        {
            String nazwaCelu = drCele[i]["tresc"].ToString();
            String idCelu = drCele[i]["id"].ToString();

            TreeNode wezel = new TreeNode(
                nazwaCelu,
                idCelu,
                "",
                "Default.aspx?id_strategii=" + idStrategii + "&id_celu=" + idCelu,
                "ramka_tresc"
                );

            rodzic.ChildNodes.Add(wezel);
            

            dodajPotomkowDoDrzewaCelow(wezel, dtCele);
        }
    }
    

    protected void DrzewoJednostek_SelectedNodeChanged(object sender, EventArgs e)
    {/*
        switch (DrzewoJednostek.SelectedValue)
        {
            case "Wydzial1":
                Response.Redirect("http://google.com", false);
                break;
            case "Wydzial2":
                Response.Redirect("http://bash.org.pl", false);
                break;
            case "Katedra1": // uważać na duplikaty nazw
                Response.Redirect("http://fb.com", false);
                break;

        }*/
    }

    protected void DrzewoCelow_SelectedNodeChanged(object sender, EventArgs e)
    {/*
        switch (DrzewoJednostek.SelectedValue)
        {
            case "Wydzial1":
                Response.Redirect("http://google.com", false);
               break;
            case "Wydzial2":
               Response.Redirect("http://bash.org.pl", false);
               break;
            case "Katedra1": // uważać na duplikaty nazw
                Response.Redirect("http://fb.com", false);
                break;

        */
    }


}
