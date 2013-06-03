<%@ Page Title="System zarządzania strategiami UAM" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Witamy w Systemie zarządzania strategiami UAM.
    </h2>
    <p>
        Zaloguj się aby kontynuować.
    </p>
    <br />

    <!--potem do skasowania-->
    <asp:Label ID="Label" runat="server" Text=""></asp:Label>
    <br /><br />
    <!--dotad-->

    <asp:Button ID="uniwersytet" runat="server" Enabled="False" Text="Uniwersytet" 
        onclick="uniwersytet_Click" style="padding-top: 0px" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="biologia" runat="server" Enabled="False" Text="Biologia" 
        Height="27px" onclick="biologia_Click" Width="103px" />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="chemia" runat="server" Enabled="False" Height="29px" 
        onclick="chemia_Click" Text="Chemia" Width="103px" />
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Button ID="Filologia" runat="server" Enabled="False" Height="30px" 
        onclick="Filologia_Click" Text="Filologia" Width="104px" />
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
</asp:Content>
