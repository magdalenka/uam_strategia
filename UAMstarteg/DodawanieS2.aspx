<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DodawanieS2.aspx.cs" Inherits="DodawanieS2" %>

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
    </div>
    <asp:Label ID="Label2" runat="server" Text="Nazwa strategii:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TBNazwa" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Numer strategii:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TBLp" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Button ID="dalejButton" runat="server" Text="Dalej..." 
        onclick="dalejButton_Click" />
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
