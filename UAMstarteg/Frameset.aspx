<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frameset.aspx.cs" Inherits="Frameset" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

    <frameset cols="70%,*">
        <frame src="Targets/TargetsAsText.aspx" name="ramka_tresc" id="ramka_tresc">
        <frameset rows="50%,*">
            <frame src="DrzewoStrategii.aspx" name="ramka_strategii" id="ramka_strategii">
            <frame src="DrzewoCelow.aspx" name="ramka_celow" id="ramka_celow">
        </frameset>
    </frameset>

