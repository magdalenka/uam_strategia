using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Targets_FormOption : System.Web.UI.Page
{
    int id;
    int strategyNr;

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("id"));
        strategyNr = Convert.ToInt32(HttpUtility.ParseQueryString(Request.Url.Query).Get("strategyNr"));

        Button nextButton = new Button();
        nextButton.Enabled = true;
        nextButton.Visible = true;
        nextButton.Text = "Dalej";
        nextButton.Click += new EventHandler(nextButton_Click);
        Form.Controls.Add(nextButton);
    }

    protected void nextButton_Click(object sender, EventArgs e)
    {
        string selectedValue = RadioButtonList1.SelectedValue;
        string formToOpen = "";
        int width = 500;
        int height = 500;
        if (selectedValue == "podcel")
        {
            formToOpen = "FormCel.aspx?id=" + id + "&strategyNr=" + strategyNr + "&edit=0";
            width = 500;
            height = 300;
        }
        else if (selectedValue == "dzialanie")
        {
            formToOpen = "FormOperation.aspx?id=" + id + "&strategyNr=" + strategyNr + "&edit=0";
            width = 500;
            height = 600;
        }

        this.ClientScript.RegisterStartupScript(this.GetType(), null,
        "window.location.href='" + formToOpen + "'; window.resizeTo(" + width + "," + height + ")", true);

    }

}