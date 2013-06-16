using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Text;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Contains methods to fetch data from database
/// </summary>
public class DataFetcher
{
	public DataFetcher()
	{
	}

    public DataTable getSelectResultsAsDataTable(String query)
    {
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        SqlCommand cmd = new SqlCommand(query, mySQLConnection);
        cmd.ExecuteNonQuery();

        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
        DataTable dataTable = new DataTable();
        dataAdapter.Fill(dataTable);

        mySQLConnection.Close();

        return dataTable;
    }

    public SqlDataAdapter getSelectResultsAsSQLDataAdapter(String query)
    {
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        SqlCommand cmd = new SqlCommand(query, mySQLConnection);
        cmd.ExecuteNonQuery();

        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);

        mySQLConnection.Close();

        return dataAdapter;
    }

    public void delete_update(String query)
    {
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=mssql.wmi.amu.edu.pl;Initial Catalog=uamstrateg;User ID=uamstrateg;Password=21hMpA8a";
        mySQLConnection.Open();

        SqlCommand cmd = new SqlCommand(query, mySQLConnection);
        cmd.ExecuteNonQuery();
    }

}