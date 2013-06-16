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

    
      <asp:TreeView ID="DrzewoCelow" Runat="server" OnSelectedNodeChanged="DrzewoCelow_SelectedNodeChanged" PopulateNodesFromClient="true" ExpandDepth="0" BackColor="#F2F4F4" BorderColor="#DDDDDD" CollapseImageToolTip="" CollapseImageUrl="~/images/up-arrow-circle-blue-Shapes4FREE.png" ExpandImageToolTip="" ExpandImageUrl="~/images/down-arrow-circle-blue-Shapes4FREE.png" Font-Names="Cambria" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" ForeColor="#333399" NodeIndent="40" NoExpandImageUrl="~/images/rt-arrow-circle-blue-Shapes4FREE.png" NodeStyle-NodeSpacing="5px" BorderStyle="Solid" BorderWidth="2px" Width="951px" style="margin-left: 0px"  >
      <Nodes>
      </Nodes>
      </asp:TreeView>


</asp:Content>
