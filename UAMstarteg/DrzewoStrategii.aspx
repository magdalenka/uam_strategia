<%@ Page Title="Strona z drzewem, zmienić koniecznie jej nazwę" Language="C#" MasterPageFile="~/TreeSite.master" AutoEventWireup="true"
    CodeFile="DrzewoStrategii.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2>
        Wykaz dostępnych strategii
    </h2>
    <p>
        Wybierz interesującą Cię strategię
    </p>

<!--
      <asp:TreeView ID="DrzewoJednostek" Runat="server" OnSelectedNodeChanged="DrzewoJednostek_SelectedNodeChanged" ShowLines=true>
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


      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>



-->

      <asp:TreeView ID="DrzewoStrategii" Runat="server" OnSelectedNodeChanged="DrzewoStrategii_SelectedNodeChanged" ShowLines=true PopulateNodesFromClient="true" ExpandDepth="0">
      <Nodes>
      </Nodes>
      </asp:TreeView>
<!--
      <iframe name="ramka" id="ramka" src="" height=300 width=600 frameborder=1>
            Niestety, Twoja przeglądarka nie potrafi poprawnie wyświetlić zawartości strony. Zaktualizuj ją.
	  </iframe>
-->

</asp:Content>
