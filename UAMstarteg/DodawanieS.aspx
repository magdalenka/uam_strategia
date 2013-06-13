<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DodawanieS.aspx.cs" Inherits="DodawanieS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <h3>Formularz dodawania strategii</h3>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />

        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ListBox1_SelectedIndexChanged" Rows="1">
        </asp:ListBox>


    </div>
    </form>
</body>
</html>
