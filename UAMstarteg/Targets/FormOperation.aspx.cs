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

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("id"));
        strategyNr = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("strategyNr"));
        edit = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("edit"));
        //wczytaj jesli istnieje
        if (edit != 0)
        {
            LoadOperation(id);
        }
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

    public void AddNewOperation(int id_strategii, int id_cel)
    {
        string number = TextBox_Numer.Text;
        string content = TextBox_Tresc.Text;
        string wskaznik_rezultat = TextBox_Wskaznik.Text;
        string okres_od = TextBox_TerminOd.Text;
        string okres_do = TextBox_TerminDo.Text;
        string waga = TextBox_Waga.Text;
        string zatwierdzenie = TextBox_Status.Text;

        string values = "'" + content + "'," + number + ",'" + wskaznik_rezultat + "','" + okres_od + "','" + okres_do + "'," + waga + ", "
            + zatwierdzenie + ",1";
        //id nowo dodanej operacji
        int id_operation = insert("dzialanie", values);
        insert("dzialanie_cel", id_cel + ", " + id_operation);


        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    public void LoadOperation(int id)
    {
        if (TextBox_Numer.Text == "" && TextBox_Tresc.Text == "" && TextBox_Wskaznik.Text == "" && TextBox_TerminOd.Text == ""
            && TextBox_TerminDo.Text == "" && TextBox_Waga.Text == "" && TextBox_Status.Text == "")
        {
            DataTable dt = select("*", "dzialanie", "id = " + id);

            string number = dt.Rows[0]["lp"].ToString();
            string content = dt.Rows[0]["nazwa"].ToString();
            string wskaznik_rezultat = dt.Rows[0]["wskaznik_rezultat"].ToString();
            string okres_od = dt.Rows[0]["okres_od"].ToString();
            string okres_do = dt.Rows[0]["okres_do"].ToString();
            string waga = dt.Rows[0]["waga"].ToString();
            string zatwierdzenie = dt.Rows[0]["zatwierdzenie"].ToString();

            TextBox_Numer.Text = number;
            TextBox_Tresc.Text = content;
            TextBox_Wskaznik.Text = wskaznik_rezultat;
            TextBox_TerminOd.Text = okres_od;
            TextBox_TerminDo.Text = okres_do;
            TextBox_Waga.Text = waga;
            TextBox_Status.Text = zatwierdzenie;
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
        string zatwierdzenie = TextBox_Status.Text;


        string zmieniane_kolumny = "nazwa='" + content1 + "', lp=" + number + ", wskaznik_rezultat='" + wskaznik_rezultat + "', okres_od='" + okres_od +
                "', okres_do='" + okres_do + "', waga=" + waga + ", zatwierdzenie=" + zatwierdzenie;

        update("dzialanie", zmieniane_kolumny, "id=" + id);

        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);

    }


    public void DeleteOperation(int id)
    {
        update("dzialanie", "widocznosc=0", "id=" + id);
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    protected DataTable select(string co, string skad, string ograniczenie)
    {
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        String query;
        if (ograniczenie == "" || ograniczenie == null)
            query = "SELECT  " + co + " from " + skad;
        else
            query = "SELECT  " + co + " from " + skad + " where " + ograniczenie;

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

}