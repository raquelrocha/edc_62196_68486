<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Trabalho3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1><i class="fa fa-rss" aria-hidden="true"></i> My Feed Reader</h1>
    <hr />
        <div class="row">
        <div class="col-lg-9 col-md-9 col-xs-8">
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server"></asp:DropDownList>
        </div>
        <div class="col-lg-3 col-md-3 col-xs-4 text-right"">
            <a href="" class="btn btn-primary"><i class="fa fa-rss"></i> Manage Feeds</a>
        </div>
    </div>
    <div class="row">
            <div class="col-lg-9 col-md-9 col-xs-12">
                <h3>Feed Info</h3>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="table" GridLines="None">
                    <FieldHeaderStyle Width="150px" />
                    <Fields>
                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                        <asp:BoundField DataField="link" HeaderText="Link" SortExpression="link" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" />
                        <asp:BoundField DataField="managingEditor" HeaderText="ManagingEditor" SortExpression="managingEditor" />
                        <asp:BoundField DataField="webMaster" HeaderText="WebMaster" SortExpression="webMaster" />
                        <asp:BoundField DataField="lastBuildDate" HeaderText="LastBuildDate" SortExpression="lastBuildDate" />
                        <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                    </Fields>
                </asp:DetailsView>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-12">
                <h3>Feed Image</h3>
                <div class="text-center">
                    <asp:Image ID="logo" runat="server" AlternateText="Feed image" />
                </div>
            </div>
        </div>

</asp:Content>
