<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormCel.aspx.cs" Inherits="FormCel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        #TextArea1
        {
            height: 89px;
            width: 344px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 176px">
        <div class="numer">
            <div class="label">
                <asp:Label ID="Label1" runat="server" Text="Numer"></asp:Label>
            </div>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            
        </div>
       <div class="label">
                <asp:Label ID="Label2" runat="server" Text="Treść"></asp:Label>
            </div>
        <div class="tresc">
        <asp:TextBox ID="TextBox1" runat="server" Height="95px" Width="373px" 
                TextMode="MultiLine"></asp:TextBox>
        </div>
         <div class="button">
            <asp:Button ID="editButton_14" runat="server" 
            onclick="Button1_Click" Text="Zapisz" />
             <asp:Button ID="Button3" runat="server" Text="Usuń" onclick="Button3_Click" />
             <asp:Button ID="Button2" runat="server" Text="Anuluj" onclick="Button2_Click" />
        </div>
        </div>
    </form>
</body>
</html>
