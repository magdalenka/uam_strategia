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
           Label.Text = id_str + id_cel;
       }
       else
       {
           Label.Text = "Podano niepoprawny numer strategii.";
       }
       // dotad

        Sprawdz_OrganizationKey();

    }

    String lp;
    String tytul;
    String nazwisko;
    
    protected void Button1_Click(object sender, EventArgs e)
    {
    /*    SqlConnection mySQLConnection = new SqlConnection();
            mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
            mySQLConnection.Open();
>>>>>>> Frameset + przesyłanie id strategii do podstrony

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

           // for (int i = 0; i < 10; i++) //  (int i = 0; i < dt.Rows.Count; i++)
           // {
           //    lp = dt.Rows[i]["lp"].ToString();
           //    wyjscie[i] = id + ";" + nazwa + "; " + cena + ";" + rezerwacja + ";";
           // }

            da.Dispose();
            mySQLConnection.Close();

            Label2.Text = "Polaczylem sie z baza danych i pieknie wyswietlilem:";
            Label1.Text = "Tytul to: " + tytul + " ,a nazwisko to: " + nazwisko;
        */
    }

    public string Login;
    public string OrganizationKey;
    public int OrganizationKeyINT;
   

    protected void Sprawdz_OrganizationKey()
    {
        OrganizationKey = (string)Session["OrganizationKeyP"];
        OrganizationKeyINT = Convert.ToInt32(OrganizationKey);
        if (OrganizationKeyINT == 0000000000)
        {
            // Uniwersytet
            uniwersytet.Enabled = true;
            biologia.Enabled = true;
            chemia.Enabled = true;
            Filologia.Enabled = true;
        }
        if (OrganizationKeyINT == 0200000000)
        {
            // wydzial biologii
            biologia.Enabled = true;
        }
        if (OrganizationKeyINT == 0300000000)
        {
            //chemia
            chemia.Enabled = true;
        }
        if (OrganizationKeyINT == 0400000000)
        {
            // wydział filogii polskiej i klasycznej
            Filologia.Enabled = true;
        }
       

    }

    protected void uniwersytet_Click(object sender, EventArgs e)
    {
        Label1.Text = "Masz prawo do edycji strategii Uniwersytetu";
    }
    protected void biologia_Click(object sender, EventArgs e)
    {
        Label2.Text = "Masz prawo do edycji strategii Wydziału Biologii";
    }
    protected void chemia_Click(object sender, EventArgs e)
    {
        Label3.Text = "Masz prawo do edycji strategii Wydziału Chemii";
    }
    protected void Filologia_Click(object sender, EventArgs e)
    {
        Label4.Text = "Masz prawo do edycji strategii Wydziału Filologii";
    }
}
