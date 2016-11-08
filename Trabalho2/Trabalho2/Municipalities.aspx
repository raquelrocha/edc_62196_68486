<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Municipalities.aspx.cs" Inherits="Trabalho2.Municipalities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Properties organized by municipality</h2>
    <hr>
    <asp:Xml ID="Xml1" runat="server" DocumentSource="~/App_Data/Properties.xml" TransformSource="~/App_Data/Municipalities.xslt"></asp:Xml>
</asp:Content>
