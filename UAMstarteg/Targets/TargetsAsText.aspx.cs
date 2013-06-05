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
using System.Collections;

public partial class TargetsAsText : System.Web.UI.Page
{
    private DataFetcher dataFetcher = new DataFetcher();
    Stack revertRows = new Stack();
    String organizationKeyString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Boolean zadanie = true;
        int strategyNr = 1, targetNr=0;
        String strategiesQuery = "SELECT id, id_parent, lp, nazwa_strategii, organization_key AS tresc, nazwa_jednostki, widocznosc, organization_key FROM strategia";
        String targetsQuery = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel WHERE id_strategii = " + strategyNr + " and id_parent is null";

        String organizationKeyQuery = "SELECT organization_key FROM strategiA WHERE id = " + strategyNr;
        DataTable organizationKey = dataFetcher.getSelectResultsAsDataTable(organizationKeyQuery);
        organizationKeyString = organizationKey.Rows[0]["organization_key"].ToString();
        //wszystkie cele
        DataTable targets = dataFetcher.getSelectResultsAsDataTable(targetsQuery);
        int targetsNo = targets.Rows.Count;

        ArrayList previousLevel = new ArrayList();

        strategyNr = 1;

        targets = dataFetcher.getSelectResultsAsDataTable(targetsQuery);
        targetsNo = targets.Rows.Count;
        DataTable subTargets = new DataTable();

        DataTable strategies = dataFetcher.getSelectResultsAsDataTable(strategiesQuery);
        //cała strategia
        if (zadanie)
        {
            for (int i = 0; i < targetsNo; i++) // dla każdego celu
            {
                previousLevel.Clear();
                previousLevel.Add(targets.Rows[i]["lp"]);
                PutNewRowIntoTable(targets.Rows[i], previousLevel, "target", organizationKeyString);

                targetNr = (int)targets.Rows[i]["id"];

                //Wyciąga wszystkie podcele - 1 poziom
                String subTargetsQuery = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel "
               + "WHERE id_parent = " + targetNr + ";";
                subTargets = dataFetcher.getSelectResultsAsDataTable(subTargetsQuery);

                if (subTargets != null && subTargets.Rows != null && subTargets.Rows.Count > 0)
                {
                    createContentTable(subTargets, false, previousLevel);
                }
                // previousLevel.RemoveAt(previousLevel.Count - 1);
            }
        }
        else
        {
           
            DataTable dt;
            String type = "operation";
            int id = 8; //Pobrać to
           // String operationQuery = "SELECT nazwa, lp, wskaznik_rezultat, okres_od, okres_do, waga, zatwierdzenie, widocznosc, id_celu"
             //   + " FROM dzialanie WHERE id = " + id + ";";
            String operationQuery = "SELECT * FROM dzialanie_cel INNER JOIN dzialanie ON dzialanie_cel.id_dzialania = dzialanie.id WHERE id = "+ id +";";
          //  String operationQuery = "Select * from cel inner join strategia ON cel.id = strategia.id";

            if (type.Equals("operation"))
            {
                dt = dataFetcher.getSelectResultsAsDataTable(operationQuery);
                revertRows.Push(dt.Rows[0]);
                id = (int)dt.Rows[0]["id_celu"];
            }
            String targetQuery = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel "
                  + "WHERE id = " + id + ";";
            dt = dataFetcher.getSelectResultsAsDataTable(targetQuery);
            revertRows.Push(dt.Rows[0]);
      
            id = (int)dt.Rows[0]["id_parent"];
            if (id != null)
            {
                createTableFromTreeBranch(id);
            }

            PrintTableFromTreeBranch();
        }
    }

    //Wstawia wiersze w odwroconej kolejnosci do tabeli
    private void PrintTableFromTreeBranch()
    {
        ArrayList previousLevel = new ArrayList();
       foreach (DataRow row in revertRows) 
        {
            previousLevel.Add(row["lp"]);
            if (row.ItemArray.Length == 6) //cel
            {
                PutNewRowIntoTable(row, previousLevel, "target", organizationKeyString);
            }
            else
            {
                PutNewRowIntoTable(row, previousLevel, "operation", organizationKeyString);
            }
        }
    }

    //tworzy wybraną gałąź drzewa (wstawia na stos)
    private void createTableFromTreeBranch( int id)
    {
        String targetQuery = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel "
                  + "WHERE id = " + id + ";";
        DataTable dt = dataFetcher.getSelectResultsAsDataTable(targetQuery);
        revertRows.Push(dt.Rows[0]);

        if (dt.Rows[0]["id_parent"] != DBNull.Value )
        {
            id = (int)dt.Rows[0]["id_parent"];
            createTableFromTreeBranch(id);
        }
    }

    //rekurencyjnie wyświetla całą strategię
    private void createContentTable(DataTable data, Boolean end, ArrayList previousLevel)
    {
        int subTargetNr = 0;
        String subTargetsQueryCC = "", operationsQuery = "";

        if (data != null && data.Rows != null && data.Rows.Count > 0)
        {
            for (int i = 0; i < data.Rows.Count; i++)
            {
                previousLevel.Add(data.Rows[i]["lp"]);
                PutNewRowIntoTable(data.Rows[i], previousLevel, "target", organizationKeyString);
                subTargetNr = (int)data.Rows[i]["id"];
                subTargetsQueryCC = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel "
                    + "WHERE id_parent = " + subTargetNr + ";";
                
                DataTable newDT = dataFetcher.getSelectResultsAsDataTable(subTargetsQueryCC);
                if (newDT != null && newDT.Rows != null && newDT.Rows.Count > 0)
                {
                    createContentTable(newDT, false, previousLevel);   
                }
                else
                {
                  //  operationsQuery = "SELECT * FROM dzialanie_cel INNER JOIN dzialanie " +
                    //    "ON dzialanie_cel.id_celu = " + subTargetNr + ";";
                    operationsQuery = "SELECT * FROM dzialanie_cel INNER JOIN dzialanie ON dzialanie_cel.id_dzialania = dzialanie.id WHERE dzialanie_cel.id_celu = " + subTargetNr + ";";
                    DataTable operations = dataFetcher.getSelectResultsAsDataTable(operationsQuery);
                    if (operations.Rows.Count > 0)
                    {
                        for (int j = 0; j < operations.Rows.Count; j++)
                        {
                            previousLevel.Add(operations.Rows[j]["lp"]);
                            PutNewRowIntoTable(operations.Rows[j], previousLevel, "operation", organizationKeyString);
                            previousLevel.RemoveAt(previousLevel.Count - 1);
                        }
                    }
                }
                previousLevel.RemoveAt(previousLevel.Count - 1);
            }
        }
    }

    //Wstawia do tabeli nowy wiersz z celem/podcelem
    private void PutNewRowIntoTable(DataRow row, ArrayList previousLevel, String type, String strategy)
    {
        TableRow tableRow = new TableRow();

        tableRow.Cells.Add(PutLpCellIntoTableRow((int)row["lp"], previousLevel));
        if (type.Equals("target"))
        {
            tableRow.Cells.Add(PutTargetContentCellIntoRow(row));
            tableRow.Cells.Add(PutOperationButtonsIntoTableRow((int)row["id"], (int)row["id_strategii"], strategy));
        }
        else if (type.Equals("operation"))
        {
            tableRow.Cells.Add(PutOperationContentCellIntoRow(row));
        }

        TargetTable.Rows.Add(tableRow);
    }



    //Wstawia do tabeli nowy wiersz z celem / podcelem
    private TableCell PutTargetContentCellIntoRow(DataRow row)
    {
        TableCell contentCell = new TableCell();
        contentCell.CssClass = "contentCells";

        contentCell.Controls.Add(new LiteralControl(row["tresc"].ToString()));

        return contentCell;
    }

    //!!!!!!! NIE SKONCZONE _ NIE UZYWAC !!!!!!!!
    //Wstawia do tabeli nowy wiersz z działaniem
    private TableCell PutOperationContentCellIntoRow(DataRow row)
    {
        TableRow tableRow = new TableRow();

        TableCell contentCell = new TableCell();
        contentCell.CssClass = "contentCells";
        contentCell.Controls.Add(new LiteralControl(row["nazwa"].ToString()));
        return contentCell;
    }

    //Zwraca komórkę z liczbą porządkową
    private TableCell PutLpCellIntoTableRow(int lp, ArrayList previousLevel)
    {
        TableCell lpCell = new TableCell();
        lpCell.CssClass = "lpCells";
        String lev = "";
        foreach (int level in previousLevel) {
            lev += level + ".";
        }
        lpCell.Controls.Add(new LiteralControl(lev));

        return lpCell;
    }
    public string OrganizationKey;
    public int OrganizationKeyINT;

    

    //Zwraca komórkę zawierającą przyciski
    private TableCell PutOperationButtonsIntoTableRow(int id, int strategyNr, String organizationkey)
    {
        // stad
        OrganizationKey = (string)Session["OrganizationKeyP"];
         OrganizationKeyINT = Convert.ToInt32(OrganizationKey);
         TableCell buttonCell = new TableCell();

         if (organizationkey == OrganizationKey)
         {


             // do tad
             
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
             
         }
         return buttonCell;
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