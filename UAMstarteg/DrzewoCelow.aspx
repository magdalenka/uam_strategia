<%@ Page Title="Strona z drzewem, zmienić koniecznie jej nazwę" Language="C#" MasterPageFile="~/TreeSite.master" AutoEventWireup="true"
    CodeFile="DrzewoCelow.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2>
        Cele wybranej strategii
    </h2>
    <p>
        Wybierz interesujący Cię cel 
    </p>

    
      <asp:TreeView ID="DrzewoCelow" Runat="server" OnSelectedNodeChanged="DrzewoCelow_SelectedNodeChanged" ShowLines=true PopulateNodesFromClient="true" ExpandDepth="0">
      <Nodes>
      </Nodes>
      </asp:TreeView>


</asp:Content>
