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

    protected void Page_Load(object sender, EventArgs e)
    {
/*
        DataTable dt = select("*", "autor", "");

        int rowsCount = dt.Rows.Count;
        String tytul;
        String nazwisko;
        String lp;
        String[] wyjscie = new String[rowsCount];


        for (int i = 0; i < rowsCount; i++)
        {
            lp = dt.Rows[i]["lp"].ToString();
            tytul = dt.Rows[i]["tytul"].ToString();
            nazwisko = dt.Rows[i]["nazwisko"].ToString();

            wyjscie[i] = lp + ". " + tytul + " " + nazwisko + "<br>";
            Label1.Text += wyjscie[i];


        }
*/
        utworzKorzenDrzewaStrategii();

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

    protected void utworzKorzenDrzewaStrategii()
    {
        DataTable dtStrategie = select("*", "strategia", "widocznosc = 1");
        int rowsCountStrategie = dtStrategie.Rows.Count;

        DataRow[] drStrategie;
        drStrategie = dtStrategie.Select("id_parent is null", "lp asc");


        for (int i = 0; i < drStrategie.Length; i++)
        {
            String nazwaStrategii = drStrategie[i]["nazwa_strategii"].ToString();
            String idStrategii = drStrategie[i]["id"].ToString();

            TreeNode wezel = new TreeNode(
                nazwaStrategii,
                idStrategii,
                "",
                "Default.aspx?id_strategii=" + idStrategii,
                "ramka_tresc"
                );
            DrzewoStrategii.Nodes.Add(wezel);
            dodajPotomkowDoDrzewaStrategii(wezel, dtStrategie);

        }
    }

    protected void dodajPotomkowDoDrzewaStrategii(TreeNode rodzic, DataTable dtStrategie)
    {
        DataRow[] drStrategie;
        drStrategie = dtStrategie.Select("id_parent = "+ Convert.ToInt32(rodzic.Value), "lp asc");


        for (int i = 0; i < drStrategie.Length; i++)
        {
            String nazwaStrategii = drStrategie[i]["nazwa_strategii"].ToString();
            String idStrategii = drStrategie[i]["id"].ToString();

            TreeNode wezel = new TreeNode(
                nazwaStrategii,
                idStrategii,
                "",
                "Default.aspx?id_strategii=" + idStrategii,
                "ramka_tresc"
                );

            rodzic.ChildNodes.Add(wezel);
            

            dodajPotomkowDoDrzewaStrategii(wezel, dtStrategie);
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

    protected void DrzewoStrategii_SelectedNodeChanged(object sender, EventArgs e)
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
