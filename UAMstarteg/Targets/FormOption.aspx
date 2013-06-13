<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormOption.aspx.cs" Inherits="Targets_FormOption" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link rel="stylesheet" type="text/css" href="Forms.css" />
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Czy chcesz dodać nowy:"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Text ="podcel," Value="podcel" />
            <asp:ListItem Text ="działanie?" Value="dzialanie" />
        </asp:RadioButtonList>
    
    </div>
    </form>
</body>
</html>
