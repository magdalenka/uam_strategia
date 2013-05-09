<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TargetsAsText.aspx.cs" Inherits="TargetsAsText" %>

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
    <style type="text/css">
        .lpCells
        {
            width: 100px;
            margin-right: 10px;
            text-align: center;
            text-decoration: bold;
            color: #666633;
            background-color: #cccc99; 
            -moz-box-shadow: 3px 4px 5px #999966;
            -webkit-box-shadow: 3px 4px 5px #999966;       
        }
        
        .contentCells
        {
            margin-right: 10px;
            margin-left: 10px;
            margin-bottom: 10px;
            text-align: center;
            text-decoration: none;
            color: #333300;
            background-color: #cccc66; 
            padding-top:20px;
            padding-bottom:20px;
            padding-right:40px;
            padding-left:40px;
            -moz-box-shadow: 0px 0px 5px #999933;
            -webkit-box-shadow: 0px 0px 5px #999933; 
        }
        
        .buttonCells
        {
            margin-right: 10px;
            margin-left: 10px;
            margin-bottom: 10px;
            background-color: #cccc33; 
            padding-top:20px;
            padding-bottom:20px;
            padding-right:8px;
            padding-left:8px;
            -moz-box-shadow: 0px 0px 5px #999933;
            -webkit-box-shadow: 0px 0px 5px #999933; 
        }
    </style>
</head>
<body style="height: 492px" bgcolor = "#535353">
    <form id="form1" runat="server">
    <asp:Table ID="TargetTable" runat="server" BorderStyle="None" 
        GridLines="Horizontal" Height="215px" HorizontalAlign="Left" Width="719px">
    </asp:Table>
    </form>
</body>
</html>
