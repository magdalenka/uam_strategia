<%@ Page Title="System zarządzania strategiami UAM" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="DodawanieS2.aspx.cs" Inherits="DodawanieS2" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div>
        <h2>Formularz dodawania strategii</h2>
        <br />
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

</asp:Content>