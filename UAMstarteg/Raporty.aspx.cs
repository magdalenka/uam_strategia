using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Novell.Directory.Ldap;
using System.Data;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.IO;
using Microsoft.Reporting.WebForms;

//dobra wersja
public partial class ReportViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (ListBox1.SelectedValue == "")
        {
            SqlConnection mySQLConnection = new SqlConnection();
            mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
            mySQLConnection.Open();

            SqlCommand cmd;
            cmd = new SqlCommand("SELECT nazwa_strategii from strategia", mySQLConnection);
            cmd.ExecuteNonQuery();


            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dt.TableName = "ListBox1";
            da.Dispose();
            mySQLConnection.Close();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListBox1.Items.Add(new ListItem(dt.Rows[i]["nazwa_strategii"].ToString(), dt.Rows[i]["nazwa_strategii"].ToString()));
            }
        }


    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
     
    }

        

    


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        ReportViewer1.ProcessingMode = ProcessingMode.Remote; ;
        ReportViewer1.ProcessingMode = ProcessingMode.Remote;
        ReportViewer1.ServerReport.ReportServerUrl = new Uri("http://mssql.wmi.amu.edu.pl/ReportServer");
        ReportViewer1.ServerReport.ReportPath = "/uamstrateg/raport_strategia";

        ReportParameter[] param = new ReportParameter[1];
        param[0] = new ReportParameter("nazwa_strategii", ListBox1.SelectedValue);
        ReportViewer1.ServerReport.SetParameters(param);

        ReportViewer1.ServerReport.Refresh(); 
    }
}
