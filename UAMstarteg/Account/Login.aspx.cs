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

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
    }

    private string host = "150.254.65.44";
    private int port = 389;


    public bool login(string user, string pass)
    {

        LdapConnection ldapConn = new LdapConnection();
        try
        {
            string usr = "uid=" + user + ",ou=Zireael,ou=Accounts,ou=OI,dc=amu,dc=edu,dc=pl";

            ldapConn.Connect(host, port);

            ldapConn.Bind(usr, pass);
            //ldapConn.SecureSocketLayer = true;
            ldapConn.Disconnect();

            return true;

        }

        catch (Exception ex)
        {

            return true;

        }

    }



    public string USERID;
     public string Login;
    public string OrganizationKey;
    public string OrganizationKeyP;

    protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
    {
        bool ok = false;
        ok = login(LoginUser.UserName, LoginUser.Password);
        e.Authenticated = ok;
        if (ok)
        {
            
            Session["USERID"] = LoginUser.UserName;
            Login = (string)Session["USERID"];
            sprawdzOrganizationKey();


        }
        else
        {
            Session["USERID"] = LoginUser.UserName;
            Login = (string)Session["USERID"];
            sprawdzOrganizationKey();
        }

    }

    protected void sprawdzOrganizationKey()
    {
        SqlConnection mySQLConnection = new SqlConnection();
        mySQLConnection.ConnectionString = @"Data Source=150.254.76.229;Initial Catalog=UAMSTRATEG_USERS;Persist Security Info=True;User ID=UAMSTRATEG;Password=21hMpA8a";
        mySQLConnection.Open();

        SqlCommand cmd;
        cmd = new SqlCommand("SELECT OrganizationKey from dbo.UAM_USERS where Uid = '" + Login + "' ", mySQLConnection);
        cmd.ExecuteNonQuery();

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        int no = dt.Rows.Count;
        String[] wyjscie = new String[no];


        OrganizationKey = dt.Rows[0]["OrganizationKey"].ToString();
        Session["OrganizationKeyP"] = OrganizationKey;
    }



}


