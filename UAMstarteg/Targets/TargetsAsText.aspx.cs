using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.IO;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;

public partial class TargetsAsText : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //Do przekazania z drzewa - co jest rozwinięte (strategia, cel czy dzialanie) i id tego czegos rozwiniętego
        // jezeli bedzie kilka galezi rozwiniętch jednoczesnie? (? lista parametrow? po przecinku ?)
        int strategyNr = 3, targetNr = 16, subtargetNr = 27, dzialNr = 6;// do testow


        DataFetcher dataFetcher = new DataFetcher();
        String query;

        //Wszystkie strategie
        query = "SELECT id, id_parent, lp, nazwa_strategii AS tresc, nazwa_jednostki, widocznosc FROM strategia";
        SqlDataAdapter strategies = dataFetcher.getSelectResultsAsSQLDataAdapter(query);

        //wszystkie cele
        query = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel WHERE id_parent is null";
        SqlDataAdapter targets = dataFetcher.getSelectResultsAsSQLDataAdapter(query);

        //podcele do konkretnego celu
        query = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel "
            + "WHERE id_parent = " + targetNr + ";";
        SqlDataAdapter subTargets = dataFetcher.getSelectResultsAsSQLDataAdapter(query);

        //dzialania do konkretnego celu/podcelu
        query = "SELECT * FROM dzialanie_cel INNER JOIN dzialanie " +
            "ON dzialanie_cel.id_celu = " + targetNr +";";
        SqlDataAdapter operations = dataFetcher.getSelectResultsAsSQLDataAdapter(query);

        DataTable dt = dataFetcher.getSelectResultsAsDataTable("SELECT id, lp, tresc from cel where id_strategii = " + strategyNr + ";");
       
        int no = dt.Rows.Count;


        for (int i=0; i<no; i++) // dla wszytskich wyciagnietych wierszy
        {
            TableRow row = new TableRow();
           
            String id = dt.Rows[0]["id"].ToString();

            //liczba porządkowa
            TableCell lpCell = new TableCell();
            lpCell.CssClass = "lpCells";
            lpCell.Controls.Add(new LiteralControl(strategyNr + "." + dt.Rows[i]["lp"].ToString()));
            row.Cells.Add(lpCell);

            //tresc
            TableCell contentCell = new TableCell();
            contentCell.CssClass = "contentCells";
            contentCell.Controls.Add(new LiteralControl(dt.Rows[i]["tresc"].ToString()));
            row.Cells.Add(contentCell);

            // wszystkie guziki
            TableCell buttonCell = new TableCell();
            buttonCell.CssClass = "buttonCells";
            buttonCell.Width = 66;

            //dodaj
            ImageButton addButton = new ImageButton();
           // addButton.ID = "addButton_" + id;
            addButton.ImageUrl = "add.png";
            addButton.Enabled = true;
            addButton.Visible = true;
            addButton.Height = 22;
            addButton.Width = 22;
            addButton.OnClientClick = "javascript:Popup(" + id + "," + strategyNr + "," + 0 + ");";
            buttonCell.Controls.Add(addButton);

            //edytuj
            ImageButton editButton = new ImageButton();
           // editButton.ID = "editButton_" + id;
            editButton.ImageUrl = "edit.png";
            editButton.Enabled = true;
            editButton.Visible = true;
            editButton.Height = 22;
            editButton.Width = 22;
            editButton.OnClientClick = "javascript:Popup(" + id + "," + strategyNr + "," + 1 + ");";
            buttonCell.Controls.Add(editButton);

            //usun
            //niebezpiczne usuwanie
            ImageButton deleteButton = new ImageButton();
          //  deleteButton.ID = "deleteButton_" + id;
            deleteButton.ImageUrl = "delete.png";
            deleteButton.Enabled = true;
            deleteButton.Visible = true;
            deleteButton.Height = 22;
            deleteButton.Width = 22;
            deleteButton.OnClientClick = "javascript:Popup(" + id + "," + strategyNr + "," + 1 + ");";
            buttonCell.Controls.Add(deleteButton);
            row.Cells.Add(buttonCell);
            TargetTable.Rows.Add(row);
        }
    }


    public int GetAimId(object sender)
    {
        Button lbtn = (Button)sender;
        string idButton = lbtn.ID;
        var parts = idButton.Split('_');
        int id = Convert.ToInt32(parts[1]);
        return id;
    }
}