<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormOperation.aspx.cs" Inherits="Targets_FormOperation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        #TextArea1
        {
            height: 89px;
            width: 344px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="Forms.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="500px">
 
    <div style="height: 176px">
        <div class="numer">
            <div class="label">
                <asp:Label ID="Label1" runat="server" Text="Numer"></asp:Label>
                <a class="cloud" href="#"><img src="information.png"><span>Należy wpisać liczbę porządkową działania</span></a>
            </div>
            <asp:TextBox ID="TextBox_Numer" runat="server"></asp:TextBox>
            
        </div>
       <div class="label">
                <asp:Label ID="Label2" runat="server" Text="Treść"></asp:Label>
                <a class="cloud" href="#"><img src="information.png"><span>Należy wpisać treść działania</span></a>
            </div>
        <div class="tresc">
        <asp:TextBox ID="TextBox_Tresc" runat="server" Height="95px" Width="100%" 
                TextMode="MultiLine"></asp:TextBox>
        </div>
        </div>
        <div class="terminy">
            <div>
                <asp:Label ID="Label3" runat="server" Text="Termin"></asp:Label> 
                <a class="cloud" href="#"><img src="information.png"><span>Należy wpisać daty obowiązywania działania.<br>
                Daty w formacie rok-miesiąc-dzień
                </span></a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <asp:Label ID="Label5" runat="server" Text=" od "></asp:Label>
            <asp:TextBox ID="TextBox_TerminOd" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text=" do "></asp:Label> 
            <asp:TextBox ID="TextBox_TerminDo" runat="server"></asp:TextBox>
        </div>
        <div class="waga">
            <div>
                <asp:Label ID="Label6" runat="server" Text="Waga"></asp:Label> 
                <a class="cloud" href="#"><img src="information.png"><span>Należy wpisać wagę działania</span></a>
            </div>
            <asp:TextBox ID="TextBox_Waga" runat="server"></asp:TextBox>
        </div>
        <div class="finansowanie">
            <div>
             <asp:Label ID="Label9" runat="server" Text="Źródła finansowania"></asp:Label> 
             <a class="cloud" href="#"><img src="information.png"><span>Wybierz źródło finansowania działania z listy po lewej lub wprowadź nowe źródło w polu po prawej</span></a>
            </div>
            <asp:DropDownList ID="ZrodlaFinansowaniaDropDownList" runat="server">
            </asp:DropDownList>
            <asp:TextBox ID="ZrodlaFinansowaniaTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="status">
            <div>
                <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label> 
                <a class="cloud" href="#"><img src="information.png"><span>Należy wybrać status działania.<br>
                </span></a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <asp:DropDownList ID="StatusDropDownList" runat="server">
            </asp:DropDownList>
        </div>
        <div class="wskaznik">
            <div>
                <asp:Label ID="Label8" runat="server" Text="Wskaźnik/Rezultat"></asp:Label> 
                <a class="cloud" href="#"><img src="information.png"><span>Należy wpisać jednostkę w jakiej jest mierzony stopień zrealizowania działania</span></a>
            </div>
            <asp:TextBox ID="TextBox_Wskaznik" runat="server" Height="95px" Width="373px" 
                TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="osoby_odpowiedziane">
            <div>
                <asp:Label ID="Label10" runat="server" Text="Osoby odpowiedzialne"></asp:Label> 
                <a class="cloud" href="#"><img src="information.png"><span>Należy zaznaczyć osoby odpowiedzialne za działanie, lub dodać nowe osoby</span></a>
            </div>
            <asp:Panel ID="PanelZOsobamiOdp" runat="server" ScrollBars="Vertical" Height="80">     
                <asp:CheckBoxList ID="OsobyOdpowiedzialneCheckBoxList" runat="server" 
                    BackColor="White" Width="98%" >
                </asp:CheckBoxList>        
            </asp:Panel>
            <asp:Button ID="PokarzPanelDodawaniaOsobOdp" runat="server" Text="Dodaj osobę" 
                    onclick="PokarzPanelDodawaniaOsobOdpButton_Click" BackColor="White" />
            <asp:Panel ID="PanelZDodawaniemOOdp" runat="server"> 
             <a class="cloud" href="#"><img src="information.png"><span>Należy wybrać istniejącą osobę z listy lub wprowadzić dane nowej osoby w polach tekstowych</span></a>    
                <asp:ListBox ID="OOWyborListBox" runat="server" Width="100%"></asp:ListBox>
                <div>
                    <asp:Label ID="Label11" runat="server" Text="Stanowisko&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"></asp:Label>
                    <asp:TextBox ID="OOStanowiskoTextBox" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label12" runat="server" Text="Tytuł naukowy&nbsp&nbsp"></asp:Label>
                    <asp:TextBox ID="OOTytulTextBox" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label13" runat="server" Text="Nazwisko&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"></asp:Label>
                    <asp:TextBox ID="OONazwiskoTextBox" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="DodajOsobyOdpowiedzialneButton" runat="server" 
                    Text="Dodaj osobę odpowiedzialną" 
                    onclick="DodajOsobyOdpowiedzialneButton_Click" BackColor="White" />
            </asp:Panel>
        </div>
        <div class="podjete_dzialanie">
            <div>
                <asp:Label ID="PodjeteDzialanieLabel" runat="server" Text="Podjęte działanie"></asp:Label>
                <a class="cloud" href="#"><img src="information.png"><span>Należy wybrać jedną z dostępnych opcji</span></a>
            </div>
            <div>
                <asp:DropDownList ID="PodjeteDzialanieDropDownList" runat="server" 
                    >
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="PodjeteDzialanieButton" runat="server" Text="szczegóły" 
                    onclick="PodjeteDzialanieButton_Click" />
                <a class="cloud" href="#"><img src="information.png"><span>Po naciśnięciu pojawi się 
                panel ze szczegółami dotyczącymi realizacji działania</span></a>
            </div>
            <asp:Panel ID="PodjeteDzialaniePanel" runat="server" Width="100%">
                <div>
                    <asp:Label ID="DatyRealizacjiLabel" runat="server" Text="Termin realizacji"></asp:Label>
                    <a class="cloud" href="#"><img src="information.png"><span>Należy wpisać daty rozpoczęcia 
                    i zakończenia realizacji</span></a>
                </div>
                <asp:Label ID="reOkresOdLabel" runat="server" Text="od "></asp:Label>
                <asp:TextBox ID="OkresOdTextBox" runat="server"></asp:TextBox>
                <asp:Label ID="reOkresDoLabel" runat="server" Text="do  "></asp:Label>
                <asp:TextBox ID="OkresDoTextBox" runat="server"></asp:TextBox>

                <div>
                    <asp:Label ID="StopienRealizacjiLabel" runat="server" Text="Stopień realizacji działania"></asp:Label>
                    <a class="cloud" href="#"><img src="information.png"><span>Należy wybrać procent w jakim zrealizowano już zadanie</span></a>
                </div>
                <asp:DropDownList ID="StopienRealizacjiDropDownList" runat="server" Width="100%">
                </asp:DropDownList>

                <div>
                    <asp:Label ID="UwagiLabel" runat="server" Text="Uwagi dotyczące realizacji działania"></asp:Label>
                    <a class="cloud" href="#"><img src="information.png"><span>Należy Wprowadzić komentarz lub uwagi dotyczące realizacji działania</span></a>
                </div>
                <asp:TextBox ID="UwagiTextBox" runat="server" Height="95px" Width="100%" 
                TextMode="MultiLine"></asp:TextBox>
            </asp:Panel>      
        </div>

         <div class="button">
             <asp:Button ID="editButton_14" runat="server" onclick="Button1_Click" Text="Zapisz" BackColor="White" />
             <asp:Button ID="Button2" runat="server" Text="Anuluj" onclick="Button2_Click" BackColor="White" />
        </div>
    </asp:Panel>
    </form>
</body>
</html>
