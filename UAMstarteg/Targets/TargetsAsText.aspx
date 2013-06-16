
<%@ Page Title="System zarządzania strategiami UAM" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="TargetsAsText.aspx.cs" Inherits="TargetsAsText" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
   <script language="javascript" type= "text/javascript">
       function OpenWindowTarget(id, strategyNr, edit) {
           window.open("FormCel.aspx?id=" + id + "&strategyNr=" + strategyNr + "&edit=" + edit, '', 'width=500,height=250,top=243,left=25');
           return false;
       }
       function OpenWindowOperation(id, strategyNr, edit) {
           window.open("FormOperation.aspx?id=" + id + "&strategyNr=" + strategyNr + "&edit=" + edit, '', 'width=500,height=510,top=243,left=25');
           return false;
       }
       function OpenWindowOption(id, strategyNr, edit) {
           window.open("FormOption.aspx?id=" + id + "&strategyNr=" + strategyNr + "&edit=" + edit, '', 'width=500,height=200,top=243,left=25');
           return false;
       }
    </script>
    <link rel="stylesheet" type="text/css" href="TargetsTable.css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent" style="height: 492px" bgcolor = "#535353">
    <asp:Panel ID="StrategyInformation" runat="server" class="strategyInformation">
    </asp:Panel>
    <asp:Label ID="Label" runat="server" Text=""></asp:Label>
    <asp:Table ID="TargetTable" runat="server" BorderStyle="None" 
        GridLines="Horizontal" Height="215px" HorizontalAlign="Left" Width="98%">
    </asp:Table>

</asp:Content>
