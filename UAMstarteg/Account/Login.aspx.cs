using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Novell.Directory.Ldap;
using System.Data;

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

    protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
    {
        bool ok = false;
        ok = login(LoginUser.UserName, LoginUser.Password);
        e.Authenticated = ok;
        if (ok)
        {
            Session["USERID"] = LoginUser.UserName;

        }
        else
        {
            Session["USERID"] = LoginUser.UserName;
        }
    }




}


