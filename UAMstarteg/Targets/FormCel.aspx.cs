﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Novell.Directory.Ldap;
using System.Data;
using System.Xml;
using System.Configuration;
using System.Web.Services;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.IO;

public partial class FormCel : System.Web.UI.Page
{
    private int id;
    private int strategyNr;
    private int edit;
    private string connStrMSSQL = ConfigurationManager.ConnectionStrings["myConnectionStringMSSQL"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("id"));
        strategyNr = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("strategyNr"));
        edit = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("edit"));
        //wczytaj jesli istnieje
        if (edit != 0)
        {
            LoadAim(id);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (edit != 0)
        {
            EditAim(id);
        }
        else
        {
            AddNewAim(strategyNr, id);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    public void AddNewAim(int id_strategii, int id_parent)
    {
        string number = TextBox2.Text;
        string content = TextBox1.Text;

        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = connStrMSSQL;
        mySQLConnection.Open();

        SqlCommand cmd;
        if (id_parent != -1) // podcel (t0 co było wcześniej)
        {
            cmd = new SqlCommand("insert into cel(lp, id_strategii, id_parent, tresc, widocznosc) values (" + number + "," + id_strategii + "," + id_parent + ",'" + content + "',1)", mySQLConnection);
        }
        else //nowy cel główny (z rodzicem nullem) - w kodzie guzika w TargetAsText.aspx.cs jest przesyłane -1
        {
            cmd = new SqlCommand("insert into cel(lp, id_strategii, id_parent, tresc, widocznosc) values (" + number + "," + id_strategii + ", null,'" + content + "',1)", mySQLConnection);
        }
        cmd.ExecuteNonQuery();

        mySQLConnection.Close();
        Page.RegisterStartupScript("myScript", "<script language=JavaScript>window.opener.parent.location.reload()</script>");
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
    }

    public void LoadAim(int id)
    {
        if (TextBox2.Text == "" && TextBox1.Text == "")
        {
            SqlConnection mySQLConnection = new SqlConnection();
            mySQLConnection.ConnectionString = connStrMSSQL;
            mySQLConnection.Open();

            SqlCommand cmd;
            cmd = new SqlCommand("SELECT  * from cel WHERE id=" + id, mySQLConnection);
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            String number = dt.Rows[0]["lp"].ToString();
            String content = dt.Rows[0]["tresc"].ToString();

            TextBox2.Text = number;
            TextBox1.Text = content;

            mySQLConnection.Close();
        }

    }

    public void EditAim(int id)
    {
        string number = TextBox2.Text;
        string content = TextBox1.Text;

        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = connStrMSSQL;
        mySQLConnection.Open();

        SqlCommand cmd;
        cmd = new SqlCommand("UPDATE cel SET lp=" + number + ", tresc='" + content + "' WHERE id=" + id, mySQLConnection);
        cmd.ExecuteNonQuery();

        mySQLConnection.Close();
        Page.RegisterStartupScript("myScript", "<script language=JavaScript>window.opener.parent.location.reload()</script>");
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
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
    

}