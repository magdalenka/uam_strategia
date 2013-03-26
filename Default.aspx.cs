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

    }

    String lp;
    String tytul;
    String nazwisko;

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection mySQLConnection = new SqlConnection();
            mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
            mySQLConnection.Open();

            SqlCommand cmd;
            cmd = new SqlCommand("SELECT  * from autor ", mySQLConnection);
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int no = dt.Rows.Count;
            String[] wyjscie = new String[no];


            tytul = dt.Rows[0]["tytul"].ToString();
            nazwisko = dt.Rows[0]["nazwisko"].ToString();

           /* for (int i = 0; i < 10; i++) //  (int i = 0; i < dt.Rows.Count; i++)
            {
                //lp = dt.Rows[i]["lp"].ToString();

               // wyjscie[i] = id + ";" + nazwa + "; " + cena + ";" + rezerwacja + ";";
            } */
            da.Dispose();
            mySQLConnection.Close();

            Label2.Text = "Polaczylem sie z baza danych i pieknie wyswietlilem:";
            Label1.Text = "Tytul to: " + tytul + " ,a nazwisko to: " + nazwisko;
        
    }
}
