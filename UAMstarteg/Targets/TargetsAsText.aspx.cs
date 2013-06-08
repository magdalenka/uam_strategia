using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
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
    String organizationKeyString;
    protected void Page_Load(object sender, EventArgs e)
    {

        string id_str = Request.QueryString["id_strategii"];
        string id_cel = Request.QueryString["id_celu"];
        int strategyNr = 0;
        int targetNr = 0;

        if (id_str != "" && id_str != null)
        {
            strategyNr = Convert.ToInt32(id_str);
            if (id_cel != "" && id_cel != null)
            {
                targetNr = Convert.ToInt32(id_cel);
            }
        }
        if (strategyNr == 0)
        {
            StrategyInformation.Visible = false;
        }

        if (strategyNr != 0)
        {

            Boolean zadanie = false;
            if (targetNr == 0)
                zadanie = true;


            //int strategyNr = 1, targetNr=0;
            String strategiesQuery = "SELECT id, id_parent, lp, nazwa_strategii, organization_key AS tresc, nazwa_jednostki, widocznosc, organization_key FROM strategia WHERE widocznosc = 1 ORDER BY lp ASC";
            String targetsQuery = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel WHERE id_strategii = " + strategyNr + " and id_parent is null AND widocznosc = 1 ORDER BY lp ASC";

            String organizationKeyQuery = "SELECT organization_key FROM strategiA WHERE id = " + strategyNr;
            DataTable organizationKey = dataFetcher.getSelectResultsAsDataTable(organizationKeyQuery);
            organizationKeyString = organizationKey.Rows[0]["organization_key"].ToString();
            //wszystkie cele
            DataTable targets = dataFetcher.getSelectResultsAsDataTable(targetsQuery);
            int targetsNo = targets.Rows.Count;

            ArrayList previousLevel = new ArrayList();

           // strategyNr = 1;

            targets = dataFetcher.getSelectResultsAsDataTable(targetsQuery);
            targetsNo = targets.Rows.Count;
            DataTable subTargets = new DataTable();

            DataTable strategies = dataFetcher.getSelectResultsAsDataTable(strategiesQuery);
            //wyświetla całą strategię
            if (zadanie)
            {

                CreatePanelWithInformationAboutStrategy(strategyNr);
                for (int i = 0; i < targetsNo; i++) // dla każdego celu
                {
                    previousLevel.Clear();
                    previousLevel.Add(targets.Rows[i]["lp"]);
                    PutNewRowIntoTable(targets.Rows[i], previousLevel, "target", organizationKeyString);

                    targetNr = (int)targets.Rows[i]["id"];

                    //Wyciąga wszystkie podcele - 1 poziom
                    String subTargetsQuery = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel "
                   + "WHERE id_parent = " + targetNr + " AND widocznosc = 1 ORDER BY lp ASC ;";
                    subTargets = dataFetcher.getSelectResultsAsDataTable(subTargetsQuery);

                    if (subTargets != null && subTargets.Rows != null && subTargets.Rows.Count > 0)
                    {
                        createContentTable(subTargets, false, previousLevel);
                    }
                }
            }
            else // Wyświetla wszystko pod wybranym elementem
            {
                StrategyInformation.Visible = false;
                String type = "target";
                DataTable dt = new DataTable();
                
                if (type.Equals("operation")) // elementem wybranym w drzewie jest działanie
                {
                    //pobiera z bazy wybrane działanie
                    String operationQuery = "SELECT * FROM dzialanie WHERE id = " + targetNr + " AND widocznosc = 1 ORDER BY lp ASC;";
                    dt = dataFetcher.getSelectResultsAsDataTable(operationQuery);
                    // Dodaje liczbę porządkową do listy z numerami porządkowymi
                    previousLevel.Add(dt.Rows[0]["lp"]);
                    // Dodaje do tabeli wiersz z działaniem
                    PutNewRowIntoTable(dt.Rows[0], previousLevel, "operation", organizationKeyString);
                }
                else // elementem wybranym w drzewie jest cel
                {
                    //pobiera cel wybrany na drzewie
                    String targetQuery = "SELECT * FROM cel "
                          + "WHERE id = " + targetNr + " AND widocznosc = 1 ORDER BY lp ASC;";
                    dt = dataFetcher.getSelectResultsAsDataTable(targetQuery);
                    // dodaje liczbę porządkową wybranefo celu do listy z numerami porządkowymi
                    previousLevel.Add(dt.Rows[0]["lp"]);
                    // wstawia do tabeli wiersz z wybranym celem
                    PutNewRowIntoTable(dt.Rows[0], previousLevel, "target", organizationKeyString);

                    //wyciąga wszystkie podcele wybranego w drzewie celu
                    String subTargetsQuery = "SELECT id, lp, id_strategii, id_parent, tresc, widocznosc FROM cel "
                   + "WHERE id_parent = " + targetNr + " AND widocznosc = 1 ORDER BY lp ASC;";
                    subTargets = dataFetcher.getSelectResultsAsDataTable(subTargetsQuery);

                    //jeżeli podcele istnieją
                    if (subTargets != null && subTargets.Rows != null && subTargets.Rows.Count > 0)
                    {
                        //tworzy rekurencyjnie resztę tabeli (wyciąga pozostałe poziomy)
                        createContentTable(subTargets, false, previousLevel);
                    }

                }
            }
        }
        else
        {
            Label.Text = "<br>Wybierz strategię z panelu po prawej stronie.";
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
                    + "WHERE id_parent = " + subTargetNr + " AND widocznosc = 1 ORDER BY lp ASC;";
                
                DataTable newDT = dataFetcher.getSelectResultsAsDataTable(subTargetsQueryCC);
                if (newDT != null && newDT.Rows != null && newDT.Rows.Count > 0)
                {
                    createContentTable(newDT, false, previousLevel);   
                }
                else
                {
                    operationsQuery = "SELECT * FROM dzialanie_cel INNER JOIN dzialanie ON dzialanie_cel.id_dzialania = dzialanie.id WHERE dzialanie_cel.id_celu = " + subTargetNr + " AND widocznosc = 1 ORDER BY lp ASC;";
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

    //Wyświetli nad tabelą z celami panel  zaw info o strategii (opis, autorzy itd.)
    private void CreatePanelWithInformationAboutStrategy(int strategyNr)
    {
        StrategyInformation.Visible = true;

        //wyciąga dane o wybranej strategii
        String strategyQuery = "SELECT * FROM strategia WHERE id = " + strategyNr;
        DataTable dt = dataFetcher.getSelectResultsAsDataTable(strategyQuery);

        StrategyInformation.Controls.Add(new LiteralControl("<b>Nazwa : </b>" + dt.Rows[0]["nazwa_strategii"]));
        StrategyInformation.Controls.Add(new LiteralControl("</br>"));
        StrategyInformation.Controls.Add(new LiteralControl("<b>Nazwa jednostki : </b>" + dt.Rows[0]["nazwa_strategii"]));
        StrategyInformation.Controls.Add(new LiteralControl("</br>"));

        //Pobiera dane o wszystkich autorach strategii
        String strategyAuthorQuery = "SELECT * FROM strategia_autor INNER JOIN autor ON strategia_autor.id_osoby = autor.id where id_strategii = "+ strategyNr;
        dt = dataFetcher.getSelectResultsAsDataTable(strategyAuthorQuery);

        StrategyInformation.Controls.Add(new LiteralControl("<b>Autorzy strategii :</b>"));
        StrategyInformation.Controls.Add(new LiteralControl("</br>"));
        if (dt.Rows.Count == 0)
        {
            StrategyInformation.Controls.Add(new LiteralControl("Strategia nie ma jeszcze przypisanych żadnych autorów."));
            StrategyInformation.Controls.Add(new LiteralControl("</br>"));
        }
        
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            StrategyInformation.Controls.Add(new LiteralControl("- " + dt.Rows[i]["tytul"] + " " + dt.Rows[i]["nazwisko"]));
            StrategyInformation.Controls.Add(new LiteralControl("</br>"));
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
            tableRow.Cells.Add(PutOperationButtonsIntoTableRow((int)row["id"], (int)row["id_strategii"], strategy, true));
        }
        else if (type.Equals("operation"))
        {
            tableRow.Cells.Add(PutOperationContentCellIntoRow(row));
            tableRow.Cells.Add(PutOperationButtonsIntoTableRow(-1, -1, strategy, false));
        }

        TargetTable.Rows.Add(tableRow);
    }



    //Wstawia do tabeli nowy wiersz z celem / podcelem
    private TableCell PutTargetContentCellIntoRow(DataRow row)
    {
        TableCell contentCell = new TableCell();
        contentCell.CssClass = "target";

        contentCell.Controls.Add(new LiteralControl(row["tresc"].ToString()));

        return contentCell;
    }

    //Zwraca komórkę zawierającą treść działania
    private TableCell PutOperationContentCellIntoRow(DataRow row)
    {
        TableRow tableRow = new TableRow();

        TableCell contentCell = new TableCell();
        contentCell.CssClass = "operation";


        contentCell.Controls.Add(new LiteralControl("<b>" + row["nazwa"].ToString() + "</b>"));
        contentCell.Controls.Add(new LiteralControl("</br></br>"));

        contentCell.Controls.Add(new LiteralControl("<div align=left class=border>"));

        contentCell.Controls.Add(new LiteralControl("<b>Termin : </b>" + row["okres_od"].ToString() + "  -  "
            + row["okres_do"]));
        contentCell.Controls.Add(new LiteralControl("</br>"));

        contentCell.Controls.Add(new LiteralControl("<b>Waga działania : </b>" + row["waga"].ToString()));
        contentCell.Controls.Add(new LiteralControl("</br>"));

        String approval = "";
        if (row["zatwierdzenie"].ToString().Equals("1"))
        {
            approval = "Działanie zostało już zatwierdzone.";
        }
        else
        {
            approval = "Działanie nie zostało jeszcze zatwierdzone.";
        }
        contentCell.Controls.Add(new LiteralControl("<b>Status : </b>" + approval));

        //Sprawdza czy działanie zostało już podjęte
        String ifTakenQuery = "SELECT * FROM podjete_dzialanie WHERE dzialanie = " + (int)row["id"];
        DataTable dt = dataFetcher.getSelectResultsAsDataTable(ifTakenQuery);
        if (dt.Rows.Count > 0) // zostało podjęte
        {
            contentCell.Controls.Add(new LiteralControl("<div align=left class=border>"));

            contentCell.Controls.Add(new LiteralControl("<b>Działanie zostało podjęte</b>"));
            contentCell.Controls.Add(new LiteralControl("</br>"));

            contentCell.Controls.Add(new LiteralControl("Opis : " + row["opis"].ToString()));
            contentCell.Controls.Add(new LiteralControl("</br>"));

            contentCell.Controls.Add(new LiteralControl("Okres : " + row["okres_od"].ToString() +
                "   -   " + row["okres_do"].ToString()));
            contentCell.Controls.Add(new LiteralControl("</br>"));

            contentCell.Controls.Add(new LiteralControl("Realizacja : " + row["realizacja"].ToString()));
            contentCell.Controls.Add(new LiteralControl("</br>"));

            contentCell.Controls.Add(new LiteralControl("Komentarz : " + row["komentarz"].ToString()));
            contentCell.Controls.Add(new LiteralControl("</br>"));

            contentCell.Controls.Add(new LiteralControl("</div>"));
        }

        //Sprawdza czy istnieją osoby odpowiedzialne za działanie
        String peopleQuery = "SELECT * FROM dzialanie_odpowiedzialnosc WHERE id_dzialania" + (int)row["id"];
        dt = dataFetcher.getSelectResultsAsDataTable(ifTakenQuery);
        if (dt.Rows.Count > 0) //osoby odpowiedzialne istnieją
        {
            contentCell.Controls.Add(new LiteralControl("<div align=left class=border>"));

            contentCell.Controls.Add(new LiteralControl("<b>Osoby odpowiedzialne : </b>"));
            contentCell.Controls.Add(new LiteralControl("</br>"));

            for (int i = 0; i < dt.Rows.Count; i++) // Dla każdej osoby odpowiedzialnej
            {
                contentCell.Controls.Add(new LiteralControl(dt.Rows[i]["imie"].ToString() + " " +
                    dt.Rows[i]["nazwisko"]));
                contentCell.Controls.Add(new LiteralControl("</br>"));
            }

            contentCell.Controls.Add(new LiteralControl("</div>"));
        }

        contentCell.Controls.Add(new LiteralControl("<div>"));

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

    

    //Zwraca komórkę zawierającą przyciski - isTarget - czy jest celem czy dzialaniem, jak dzilaniem to zwr tylko tlo
    private TableCell PutOperationButtonsIntoTableRow(int id, int strategyNr, String organizationkey, Boolean isTarget)
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

             if (isTarget == true)
                 {

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