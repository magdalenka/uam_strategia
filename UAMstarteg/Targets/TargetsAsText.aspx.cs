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
// Autor: E.C. wszelkie zażalenia kierować do autora. :)
public partial class TargetsAsText : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        int strategyNr = 3; //jakos to przekazać w parametrze
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        SqlCommand cmd;
        //id_parent is null and // tylko cele, narazie podcele tez wyswietla
        cmd = new SqlCommand("SELECT id, lp, tresc from cel where id_strategii = "+ strategyNr +";", mySQLConnection);
        cmd.ExecuteNonQuery();

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        int no = dt.Rows.Count;

        for (int i=0; i<no; i++) // dla wszytskich wyciagnietych wierszy
        {
            TableRow row = new TableRow();
            String id = dt.Rows[0]["id"].ToString();
            
            //liczba porządkowa
            TableCell lpCell = new TableCell();
            lpCell.Controls.Add(new LiteralControl(strategyNr + "." + dt.Rows[i][0].ToString()));
            row.Cells.Add(lpCell);

            //tresc
            TableCell contentCell = new TableCell();
            contentCell.Controls.Add(new LiteralControl(dt.Rows[i][1].ToString()));
            row.Cells.Add(contentCell);

            //dodaj
            TableCell addButtonCell = new TableCell();
            ImageButton addButton = new ImageButton();
            addButton.ID = "addButton_" + id;
            addButton.ImageUrl = "add.gif";
            addButton.Enabled = true;
            addButton.Visible = true;
            addButton.Height = 22;
            addButton.Width = 22;
            addButton.OnClientClick = "javascript:Popup(" + id + "," + strategyNr + "," + 0 + ");";
            addButtonCell.Controls.Add(addButton);
            row.Cells.Add(addButtonCell);

            //edytuj
            TableCell editButtonCell = new TableCell();
            ImageButton editButton = new ImageButton();
            editButton.ID = "editButton_" + id;
            editButton.ImageUrl = "edit.gif";
            editButton.Enabled = true;
            editButton.Visible = true;
            editButton.Height = 22;
            editButton.Width = 22;
            editButton.OnClientClick = "javascript:Popup(" + id + "," + strategyNr + "," + 1 + ");";
            editButtonCell.Controls.Add(editButton);
            row.Cells.Add(editButtonCell);

            //usun
            //niebezpiczne usuwanie
            TableCell deleteButtonCell = new TableCell();
            ImageButton deleteButton = new ImageButton();
            deleteButton.ID = "deleteButton_" + id;
            deleteButton.ImageUrl = "delete.gif";
            deleteButton.Enabled = true;
            deleteButton.Visible = true;
            deleteButton.Height = 22;
            deleteButton.Width = 22;
            deleteButton.OnClientClick = "javascript:Popup(" + id + "," + strategyNr + "," + 1 + ");";
            deleteButtonCell.Controls.Add(deleteButton);
            row.Cells.Add(deleteButtonCell);
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