﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TargetsAsText.aspx.cs" Inherits="TargetsAsText" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type= "text/javascript">
        function Popup(id, strategyNr, edit) {
            window.open("FormCel.aspx?id=" + id + "&strategyNr=" + strategyNr + "&edit=" + edit, '', 'width=500,height=250,top=243,left=25');
            return false;
        }
    </script>
    <link rel="stylesheet" type="text/css" href="TargetsTable.css" />
   
</head>
<body style="height: 492px" bgcolor = "#535353">
    <form id="form1" runat="server">
    <asp:Table ID="TargetTable" runat="server" BorderStyle="None" 
        GridLines="Horizontal" Height="215px" HorizontalAlign="Left" Width="719px">
    </asp:Table>
    </form>
</body>
</html>
