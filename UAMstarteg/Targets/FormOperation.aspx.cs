using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web;


public partial class Targets_FormOperation : System.Web.UI.Page
{
    private int id;
    private int strategyNr;
    private int edit;
    private DataFetcher df = new DataFetcher();

    protected void Page_Load(object sender, EventArgs e)
    {
        PanelZDodawaniemOOdp.Visible = false;
        id = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("id"));
        strategyNr = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("strategyNr"));
        edit = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("edit"));
        //Załaduj źródła finansowania
        LoadZrodloFinansowaniaListBox();
        LoadStatusDropDownList();
    
        //wczytaj jesli istnieje
        if (edit != 0) //eycja
        {
            LoadOperation(id);
        }
        else //dodawanie
            PanelZOsobamiOdp.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (edit != 0)
        {
            EditOperation(id);
        }
        else
        {
            AddNewOperation(strategyNr, id);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        DeleteOperation(id);
    }

    protected void LoadZrodloFinansowaniaListBox()
    {
        if (ZrodlaFinansowaniaDropDownList.Items.Count == 0)
        {
            DataTable dt = select("*", "zrodlo_finansowania", "nazwa != ''", " nazwa ASC");
            ZrodlaFinansowaniaDropDownList.Items.Add(new ListItem(" ", "-1"));//pusta opcja
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ZrodlaFinansowaniaDropDownList.Items.Add(new ListItem(dt.Rows[i]["nazwa"].ToString(), dt.Rows[i]["id"].ToString()));
            }
        }
    }

    protected void LoadOOWyborListBox()
    {
        if (OOWyborListBox.Items.Count == 0)
        {
            //DataTable dt = select("*", "osoby_odpowiedzialne "," id_startegii = "+strategyNr, " stanowisko ASC");
            String Query = "SELECT * FROM osoby_odpowiedzialne WHERE id_startegii = " + strategyNr + " ORDER BY stanowisko ASC";
            DataTable dt = df.getSelectResultsAsDataTable(Query);
            OOWyborListBox.Items.Add(new ListItem(" ", "-1"));//pusta opcja
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["stanowisko"] == DBNull.Value)
                    dt.Rows[i]["stanowisko"] = "";
                if (dt.Rows[i]["tytul"] == DBNull.Value)
                    dt.Rows[i]["tytul"] = "";
                if (dt.Rows[i]["nazwisko"] == DBNull.Value)
                    dt.Rows[i]["nazwisko"] = "";
                OOWyborListBox.Items.Add(new ListItem(dt.Rows[i]["stanowisko"] + " " +
                    dt.Rows[i]["tytul"] + " " + dt.Rows[i]["nazwisko"], dt.Rows[i]["id"].ToString()));
            }
            OOWyborListBox.Items[0].Selected = true;
        }
    }

    //Załaduj wszytskie możliwe opcje zatwierdzenia
    protected void LoadStatusDropDownList()
    {
        if (StatusDropDownList.Items.Count == 0)
        {
            StatusDropDownList.Items.Add(new ListItem(" ", "-1"));
            StatusDropDownList.Items.Add(new ListItem("Zatwierdzono", "1"));
            StatusDropDownList.Items.Add(new ListItem("Niezatwierdzono", "0"));

            //   StatusDropDownList.SelectedValue = "-1";
            if (edit == 0)// nowe działanie
            {
                if (StatusDropDownList.SelectedValue.Equals("") || StatusDropDownList.SelectedValue.Equals(null))
                    StatusDropDownList.SelectedValue = "-1";
            }
            else
            {
                String statusQuery = "SELECT zatwierdzenie FROM dzialanie WHERE id = " + id;
                DataTable dt = df.getSelectResultsAsDataTable(statusQuery);
                if (dt.Rows[0]["zatwierdzenie"] == DBNull.Value)//nie było przypisane
                    StatusDropDownList.SelectedValue = "-1";
                else
                    StatusDropDownList.SelectedValue = dt.Rows[0]["zatwierdzenie"].ToString();
            }
        }
    }

    protected void LoadOsobyOdpowiedzialneCheckBoxList()
    {
        if (OsobyOdpowiedzialneCheckBoxList.Items.Count == 0)
        {
            //Dodaje tylko osoby odpowiedzialne już przypisane do działania
            DataTable dt = select("*", "osoby_odpowiedzialne INNER JOIN dzialanie_odpowiedzialnosc ON id = id_osoby ",
               " id_dzialania = " + id, " stanowisko ASC");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["nazwisko"] == DBNull.Value)
                    dt.Rows[i]["nazwisko"] = "";
                if (dt.Rows[i]["tytul"] == DBNull.Value)
                    dt.Rows[i]["tytul"] = "";
                //Dodaj nowy element do listy
                OsobyOdpowiedzialneCheckBoxList.Items.Add(new ListItem(dt.Rows[i]["stanowisko"] + " " +
                    dt.Rows[i]["tytul"] + " " + dt.Rows[i]["nazwisko"], dt.Rows[i]["id"].ToString()));
                //Zaznacz go ptaszkiem
                OsobyOdpowiedzialneCheckBoxList.Items[i].Selected = true;
            }

            if (dt.Rows.Count == 0 || dt == null || dt.Rows == null)
                PanelZOsobamiOdp.Visible = false;
            else
                PanelZOsobamiOdp.Visible = true;
        }
    }

    //Usuwa osoby odpowiedzialne z działania jeżeli nie są zaznaczone ptaszkiem
    //a wcześniej były zaznaczone
    protected void deleteOsobyOdpowiedzialne()
    {
        int counter = 0;
        String deletePersonQuery = "DELETE FROM dzialanie_odpowiedzialnosc WHERE id_osoby in ( ";
        for (int i = 0; i < OsobyOdpowiedzialneCheckBoxList.Items.Count; i++)
        {
            if (!OsobyOdpowiedzialneCheckBoxList.Items[i].Selected)
            {
                if (counter > 0)
                {
                    deletePersonQuery += ", ";
                }
                deletePersonQuery += OsobyOdpowiedzialneCheckBoxList.Items[i].Value;
                counter++;
            }
        }
        deletePersonQuery += " ) AND id_dzialania = "+id;
        //Jeżeli jest coś do usunięcia to usuwa połączenie
        if (counter > 0)
            df.delete_update(deletePersonQuery);
    }


    public void AddNewOperation(int id_strategii, int id_cel)
    {
        string number = TextBox_Numer.Text;
        string content = TextBox_Tresc.Text;
        string wskaznik_rezultat = TextBox_Wskaznik.Text;
        string okres_od = TextBox_TerminOd.Text;
        string okres_do = TextBox_TerminDo.Text;
        string waga = TextBox_Waga.Text;
        String zatwierdzenie = StatusDropDownList.SelectedValue;
        if (zatwierdzenie.Equals("-1") || zatwierdzenie.Equals("null"))
            zatwierdzenie = "0";
        String zrodlo_finansowania_id = AddNewFinSourceIfNotSelected();

        string values = "'" + content + "'," + number + ",'" + wskaznik_rezultat + "','" + okres_od + "','" + okres_do + "'," + waga + ", "
            + zatwierdzenie + ",1";
        //id nowo dodanej operacji
        int id_operation = insert("dzialanie", values);
        insert("dzialanie_cel", "'"+id_cel+"'" + ", " + id_operation);
        //uzupelnienie tabeli dzialanie_zrodlo
        values = id_operation + " ," + zrodlo_finansowania_id;
        int id_dzialanie_zrodlo = insert("dzialanie_zrodlo", values);
        id = id_operation;
        AddOsobyOdpowiedzialne();

        Page.RegisterStartupScript("myScript", "<script language=JavaScript>window.opener.parent.location.reload()</script>");
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    protected String AddNewFinSourceIfNotSelected()
    {
        String zrodlo_finansowania_id = ZrodlaFinansowaniaDropDownList.SelectedValue;
        if (zrodlo_finansowania_id.Equals("-1") || zrodlo_finansowania_id == null || zrodlo_finansowania_id.Equals(""))
        {
            String nowe_zrodlo_finansowania = ZrodlaFinansowaniaTextBox.Text;
            if (!nowe_zrodlo_finansowania.Equals(""))
                zrodlo_finansowania_id = insert("zrodlo_finansowania", "'" + nowe_zrodlo_finansowania.ToString() + "'").ToString();
        }

        return zrodlo_finansowania_id;
    }

    public void LoadOperation(int id)
    {
        if (TextBox_Numer.Text == "" && TextBox_Tresc.Text == "" && TextBox_Wskaznik.Text == "" && TextBox_TerminOd.Text == ""
            && TextBox_TerminDo.Text == "" && TextBox_Waga.Text == "")
        {
            DataTable dt = select("*", "dzialanie", "id = " + id, null);

            string number = dt.Rows[0]["lp"].ToString();
            string content = dt.Rows[0]["nazwa"].ToString();
            string wskaznik_rezultat = dt.Rows[0]["wskaznik_rezultat"].ToString();
            string okres_od = dt.Rows[0]["okres_od"].ToString();
            string okres_do = dt.Rows[0]["okres_do"].ToString();
            string waga = dt.Rows[0]["waga"].ToString();
            string zatwierdzenie = dt.Rows[0]["zatwierdzenie"].ToString();
           
            dt = select("*", "dzialanie_zrodlo", "id_dzialania = " + id, null);
            if (dt.Rows.Count > 0)
                ZrodlaFinansowaniaDropDownList.SelectedValue = dt.Rows[0]["id_zrodlo_finansowania"].ToString();
            else
                ZrodlaFinansowaniaDropDownList.SelectedValue = "-1";

            LoadOsobyOdpowiedzialneCheckBoxList();

            TextBox_Numer.Text = number;
            TextBox_Tresc.Text = content;
            TextBox_Wskaznik.Text = wskaznik_rezultat;
            TextBox_TerminOd.Text = okres_od;
            TextBox_TerminDo.Text = okres_do;
            TextBox_Waga.Text = waga;
            //TextBox_Status.Text = zatwierdzenie;
            if (!zatwierdzenie.Equals(""))
                StatusDropDownList.SelectedValue = zatwierdzenie;
            else
                StatusDropDownList.SelectedValue = "-1";
        }

    }

    public void EditOperation(int id)
    {
        string number = TextBox_Numer.Text;
        string content1 = TextBox_Tresc.Text;
        string wskaznik_rezultat = TextBox_Wskaznik.Text;
        string okres_od = TextBox_TerminOd.Text;
        string okres_do = TextBox_TerminDo.Text;
        string waga = TextBox_Waga.Text;
        string zatwierdzenie = StatusDropDownList.SelectedValue;
        if (zatwierdzenie.Equals("-1") || zatwierdzenie.Equals("null"))
            zatwierdzenie = "0";
        String zrodlo_finansowania_id = AddNewFinSourceIfNotSelected();

        string zmieniane_kolumny = "nazwa='" + content1 + "', lp=" + number + ", wskaznik_rezultat='" + wskaznik_rezultat + "', okres_od='" + okres_od +
                "', okres_do='" + okres_do + "', waga=" + waga + ", zatwierdzenie=" + zatwierdzenie;

        update("dzialanie", zmieniane_kolumny, "id=" + id);

        DataTable dt = select("*", "dzialanie_zrodlo", "id_dzialania = "+id, null);
        if (dt.Rows.Count > 0)
        {
            zmieniane_kolumny = "id_dzialania='" + id + "' , id_zrodlo_finansowania='" + zrodlo_finansowania_id + "'";
            update("dzialanie_zrodlo", zmieniane_kolumny, "id_dzialania=" + id);
        }
        else
        {
            String values = id + " ," + zrodlo_finansowania_id;
            int id_dzialanie_zrodlo = insert("dzialanie_zrodlo", values);
        }
        //Usuń osoby kóre były przypisane, ale zostały odznaczone na liście
        deleteOsobyOdpowiedzialne();

        Page.RegisterStartupScript("myScript", "<script language=JavaScript>window.opener.parent.location.reload()</script>");
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }


    public void DeleteOperation(int id)
    {
        update("dzialanie", "widocznosc=0", "id=" + id);
        Page.RegisterStartupScript("myScript", "<script language=JavaScript>window.opener.parent.location.reload()</script>");
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    protected DataTable select(string co, string skad, string ograniczenie, String order)
    {
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        String query;
        if (ograniczenie == "" || ograniczenie == null)
            query = "SELECT  " + co + " from " + skad;
        else
            query = "SELECT  " + co + " from " + skad + " where " + ograniczenie;
        if (order != null && order != "")
            query += " ORDER BY " + order;

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

    protected void update(string tabela, string zmieniane_kolumny, string ograniczenie)
    {

        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        String query;
        if (ograniczenie == "" || ograniczenie == null)
            query = "UPDATE  " + tabela + " SET " + zmieniane_kolumny;
        else
            query = "UPDATE  " + tabela + " SET " + zmieniane_kolumny + " WHERE " + ograniczenie;

        SqlCommand cmd = new SqlCommand(query, mySQLConnection);
        cmd.ExecuteNonQuery();

    }

    protected int insert(String tabela, String values)
    {
        int id_operation = 0;

        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        SqlCommand cmd;
        string sql = "insert into " + tabela + " values (" + values + ") ;SELECT CAST(scope_identity() AS int)";
        cmd = new SqlCommand(sql, mySQLConnection);

        try
        {
            id_operation = Convert.ToInt32(cmd.ExecuteScalar());
        }
        catch (Exception ex)
        {
            Console.WriteLine("{0} Exception caught.", ex);
        }

        mySQLConnection.Close();

        return id_operation;

    }
    protected void PokarzPanelDodawaniaOsobOdpButton_Click(object sender, EventArgs e)
    {
        PanelZDodawaniemOOdp.Visible = true;
        PanelZOsobamiOdp.Visible = true;
        //Załaduj wszytskie osoby z kórych można wybierać
        LoadOOWyborListBox();
    }

    protected void DodajOsobyOdpowiedzialneButton_Click(object sender, EventArgs e)
    {
        String nazwisko = OONazwiskoTextBox.Text;
        String tytul = OOTytulTextBox.Text;
        String stanowisko = OOStanowiskoTextBox.Text;  
        int id_osoby = 0;
        String values = "";
        if (OOWyborListBox.SelectedValue.Equals("-1") || OOWyborListBox.Items[0].Selected)//nic nie wybrano z listboxa
        {
           //Dodaj do tabeli osoby_odpowiedzialne, jeżeli chociaż jedno pole nie jest puste
            if (!nazwisko.Equals("") || !tytul.Equals("") || !stanowisko.Equals(""))
            {
                values = "1, '" + stanowisko + "', '" + tytul + "', '" + nazwisko + "', " + strategyNr;
               // values = "1, '" + stanowisko + "', '" + tytul + "', '" + nazwisko + "', " + 1;
                id_osoby = insert(" osoby_odpowiedzialne ", values);
            }
        }
        else // Wybrano już istniejącą osobę z listy
        {
            id_osoby = Convert.ToInt32(OOWyborListBox.SelectedValue);
            DataTable dt = select("*", "osoby_odpowiedzialne", "id = "+id_osoby, null);
            tytul = dt.Rows[0]["tytul"].ToString();
            nazwisko = dt.Rows[0]["nazwisko"].ToString();
            stanowisko = dt.Rows[0]["stanowisko"].ToString();
            OOWyborListBox.SelectedValue = "-1";
        }
        if (!nazwisko.Equals("") || !tytul.Equals("") || !stanowisko.Equals(""))
        {
            if (edit != 0)// istniejące działanie jest edytowane
            {
                //Dodaj do tabeli dzialanie_odpowiedzialnosc

                values = " " + id_osoby + ", " + id + " ";
                insert(" dzialanie_odpowiedzialnosc", values);

            }

            //Dodaj do listy i oznacz ptaszkiem

            OsobyOdpowiedzialneCheckBoxList.Items.Add(new ListItem(stanowisko + " " +
                       tytul + " " + nazwisko, id_osoby.ToString()));
            OsobyOdpowiedzialneCheckBoxList.Items[OsobyOdpowiedzialneCheckBoxList.Items.Count - 1].Selected = true;
        }

        PanelZDodawaniemOOdp.Visible = false;
        PanelZOsobamiOdp.Visible = true;
    }

    //Dodaj osoby odp do celu gdy cel jeszcze nie istnieje 
    //(narazie istnieją tylko jako elementy w liścioe nie w bazie danych)
    protected void AddOsobyOdpowiedzialne()
    {
        foreach (ListItem item in OsobyOdpowiedzialneCheckBoxList.Items)
        {
            if (item.Selected)// dodaj do bazytylko elementy oznaczone ptaszkiem
            {   
                String values = " " + item.Value + ", " + id + " ";
                insert(" dzialanie_odpowiedzialnosc", values);
            }
        }
    }

}