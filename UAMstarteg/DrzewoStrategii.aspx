﻿<%@ Page Title="Strona z drzewem, zmienić koniecznie jej nazwę" Language="C#" MasterPageFile="~/TreeSite.master" AutoEventWireup="true"
    CodeFile="DrzewoStrategii.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2>
        Wykaz dostępnych strategii
    </h2>
    <p>
        Wybierz interesującą Cię strategię lub <a href=# onClick="Popup()">dodaj nową</a>
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
    <script language="javascript" type= "text/javascript">
        function Popup() {
            parent.ramka_tresc.location="DodawanieS.aspx/?nr=0000000000&nazwa=Uniwersytet im A. Mickiewicza";
            return false;
        }
    </script>

 <asp:TreeView ID="DrzewoStrategii" Runat="server" OnSelectedNodeChanged="DrzewoStrategii_SelectedNodeChanged" ExpandDepth="0" BackColor="#F2F4F4" BorderColor="#DDDDDD" CollapseImageToolTip="" CollapseImageUrl="~/images/up-arrow-circle-blue-Shapes4FREE.png" ExpandImageToolTip="" ExpandImageUrl="~/images/down-arrow-circle-blue-Shapes4FREE.png" Font-Names="Cambria" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" ForeColor="#333399" NodeIndent="40" NoExpandImageUrl="~/images/rt-arrow-circle-blue-Shapes4FREE.png" NodeStyle-NodeSpacing="5px" BorderStyle="Solid" BorderWidth="2px" Width="566px" style="margin-left: 0px"  >
      <Nodes>
      </Nodes>
      </asp:TreeView>
<!--
      <iframe name="ramka" id="ramka" src="" height=300 width=600 frameborder=1>
            Niestety, Twoja przeglądarka nie potrafi poprawnie wyświetlić zawartości strony. Zaktualizuj ją.
	  </iframe>
-->

</asp:Content>
