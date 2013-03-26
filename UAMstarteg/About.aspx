<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About
    </h2>
    <p>
        Put content here.
    </p>


      <asp:TreeView ID="DrzewoJednostek" Runat="server" ShowLines=true>
      <Nodes>

        <asp:TreeNode Value="Wydzial1" Expanded="False" Text="Wydział Matematyki i Informatyki">
          <asp:TreeNode Value="Katedra1" Text="Katedra Matematyki Dyskretnej" />
          <asp:TreeNode Value="Katedra2" Text="Instytut Sztucznej Inteligencji" />
        </asp:TreeNode>

        <asp:TreeNode Value="Wydzial2" Expanded="False" Text="Wydzial Fizyki">
          <asp:TreeNode Value="Katedra1" Text="Instytut Teoretyczny" />
          <asp:TreeNode Value="Katedra2" Expanded="False" Text="Instytut Akustyki" >
               <asp:TreeNode Value="Gabinet1" Text="Pokój Reżyserów Dźwięku" />
          </asp:TreeNode>
        </asp:TreeNode>

        <asp:TreeNode Value="Wydzial3" Expanded="False" Text="Collegium Magicum">
          <asp:TreeNode Value="Katedra1" Text="Catedrumm Juridicumm Olongatuus" />
        </asp:TreeNode>

      </Nodes>
      </asp:TreeView>


</asp:Content>
