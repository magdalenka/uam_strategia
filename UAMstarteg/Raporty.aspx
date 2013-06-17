<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Raporty.aspx.cs" Inherits="ReportViewer" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    <div> 
       <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
           <table> 
       <tr> 
           <td>Wybierz nazwę strategii dla której chcesz wygenerować raport: </td> 
           <td><asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ListBox1_SelectedIndexChanged" Rows="1">
            </asp:ListBox></td> 

           <td><asp:Button Text="Show Report" ID="btnSubmit" runat="server" onclick="btnSubmit_Click" /></td> 
       </tr> 
   </table> 
      <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="643px" 
            Width="1122px">
     </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
