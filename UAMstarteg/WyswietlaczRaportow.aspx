<%@ Page Title="System zarządzania strategiami UAM" Language="C#" MasterPageFile="~/ReportSite.master" AutoEventWireup="true"
    CodeFile="WyswietlaczRaportow.aspx.cs" Inherits="WyswietlaczRaportow" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <iframe id="raportramka" width=100% height=700px runat="server" src="Raporty.aspx" visible="FALSE"></iframe>
    
    </div>

</asp:Content>