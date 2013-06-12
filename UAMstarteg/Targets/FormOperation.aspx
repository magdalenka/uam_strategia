<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormOperation.aspx.cs" Inherits="Targets_FormOperation" %>

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
            <asp:TextBox ID="TextBox_Numer" runat="server"></asp:TextBox>
            
        </div>
       <div class="label">
                <asp:Label ID="Label2" runat="server" Text="Treść"></asp:Label>
            </div>
        <div class="tresc">
        <asp:TextBox ID="TextBox_Tresc" runat="server" Height="95px" Width="373px" 
                TextMode="MultiLine"></asp:TextBox>
        </div>
        </div>
        <div class="terminy">
            <div>
                <asp:Label ID="Label3" runat="server" Text="Termin"></asp:Label> 
            </div>
            <asp:Label ID="Label5" runat="server" Text=" od "></asp:Label>
            <asp:TextBox ID="TextBox_TerminOd" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text=" do "></asp:Label> 
            <asp:TextBox ID="TextBox_TerminDo" runat="server"></asp:TextBox>
        </div>
        <div class="waga">
            <div>
                <asp:Label ID="Label6" runat="server" Text="Waga"></asp:Label> 
            </div>
            <asp:TextBox ID="TextBox_Waga" runat="server"></asp:TextBox>
        </div>
        <div class="status">
            <div>
                <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label> 
            </div>
            <asp:TextBox ID="TextBox_Status" runat="server"></asp:TextBox>
        </div>
        <div class="wskaznik">
            <div>
                <asp:Label ID="Label8" runat="server" Text="Wskaźnik/Rezultat"></asp:Label> 
            </div>
            <asp:TextBox ID="TextBox_Wskaznik" runat="server" Height="95px" Width="373px" 
                TextMode="MultiLine"></asp:TextBox>
        </div>

         <div class="button">
             <asp:Button ID="editButton_14" runat="server" onclick="Button1_Click" Text="Zapisz" />
             <asp:Button ID="Button3" runat="server" Text="Usuń" onclick="Button3_Click" />
             <asp:Button ID="Button2" runat="server" Text="Anuluj" onclick="Button2_Click" />
        </div>
        
    </form>
</body>
</html>
