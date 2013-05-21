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

    <asp:Label ID="Label" runat="server" Text=""></asp:Label>
    <br />
<!--
    <p>
        &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Wyswietl" />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
-->
    <asp:Button ID="zalogowany" runat="server" onclick="zalogowany_Click" 
        Text="Zalogowany" />
    <asp:Label ID="LDAP" runat="server" Text="Label"></asp:Label>
</asp:Content>
