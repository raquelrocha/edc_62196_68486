<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="managefeeds.aspx.cs" Inherits="Trabalho3.managefeeds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><i class="fa fa-rss" aria-hidden="true"></i> Gestão de Feeds</h1>
    <hr />
            <asp:DetailsView ID="DetailsView2" CssClass="table table-condensed col-lg-12 col-md-12" AllowPaging="True" GridLines="None"
                AutoGenerateRows="False"></asp:DetailsView>


</asp:Content>
