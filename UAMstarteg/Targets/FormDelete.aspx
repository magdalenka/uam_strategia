<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormDelete.aspx.cs" Inherits="Targets_FormDelete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="Forms.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="message">
        <asp:Literal ID="PytanieLiteral" runat="server" Text="Czy na pewno chcesz usunąć : "></asp:Literal>
    </div>
    <asp:Panel ID="Panel1" runat="server" Width="100%" Height="120px" ScrollBars="Vertical"> 
        <asp:Literal ID="TrescCeluDzialaniaLiteral" runat="server" Text=""></asp:Literal>
    </asp:Panel> 

    <div class="buttons" align="center">
        <asp:Button ID="Delete" runat="server" Text="Usuń" Height="30" Width="100px" 
            BackColor="White" onclick="Delete_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Cancel" runat="server" Text="Anuluj" Height="30" Width="100px"
            BackColor="White" onclick="Cancel_Click" />
    </div>
    </form>
</body>
</html>
