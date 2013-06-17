<%@ Page Title="System zarządzania strategiami UAM" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="DodawanieS.aspx.cs" Inherits="DodawanieS" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div>

    <h2>Formularz dodawania strategii</h2>
    <br />
    <p>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>

        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ListBox1_SelectedIndexChanged" Rows="1">
        </asp:ListBox>


    </div>

</asp:Content>