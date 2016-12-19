<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TechGeeks._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <nav class="navbar navbar-inverse">
      <div class="container-fluid">

         <!-- Collect the nav links, forms, and other content for toggling -->
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
               <li>
                  <asp:LinkButton runat="server" CssClass="btn btn-sm-btn-flat" OnCommand="AllNews_Click">All News</asp:LinkButton></li>
               <li>
                  <asp:LinkButton runat="server" CssClass="btn btn-sm-btn-flat" OnCommand="FilterFeed_Click" CommandArgument="Graphics">Graphics</asp:LinkButton></li>
               <li>
                  <asp:LinkButton runat="server" CssClass="btn btn-sm-btn-flat" OnCommand="FilterFeed_Click" CommandArgument="Hardware">Hardware</asp:LinkButton></li>
               <li>
                  <asp:LinkButton runat="server" CssClass="btn btn-sm-btn-flat" OnCommand="FilterFeed_Click" CommandArgument="Peripherals">Peripherals</asp:LinkButton></li>
               <li>
                  <asp:LinkButton runat="server" CssClass="btn btn-sm-btn-flat" OnCommand="FilterFeed_Click" CommandArgument="Storage">Storage</asp:LinkButton></li>
            </ul>
            <div class="navbar-form navbar-right" role="search">
               <div class="form-group">
                  <asp:TextBox ID="filterTextBox" CssClass="form-control" runat="server" placeholder="Search" AutoPostBack="false"></asp:TextBox>
               </div>
               <asp:LinkButton runat="server" class="btn btn-default" OnCommand="SearchFilterFeed_Click" AutoPostBack="false"><i class="fa fa-search"></i></asp:LinkButton>
            </div>
         </div>
         <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
   </nav>

   <asp:Xml ID="Xml1" runat="server" TransformSource="~/App_Data/Data/news.xslt"></asp:Xml>

</asp:Content>
