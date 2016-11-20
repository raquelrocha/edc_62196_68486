<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="managefeeds.aspx.cs" Inherits="Trabalho3.managefeeds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h1><i class="fa fa-rss"></i> Gestão de feeds</h1>
    <hr />
    
    <asp:DetailsView ID="DetailsView2" CssClass="table table-condensed col-lg-12 col-md-12"  runat="server" AllowPaging="True" GridLines="None" 
        AutoGenerateRows="False" DataSourceID="XmlDataSource4" OnItemUpdating="DetailsView2_ItemUpdating" OnItemInserting="DetailsView2_ItemInserting">
        
        <Fields>
            <asp:TemplateField HeaderText="name:" SortExpression="name">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" CssClass="form-control input-sm custom-form-width" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="url:" SortExpression="url">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control input-sm custom-form-width" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control input-sm custom-form-width" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("url") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandArgument='<%# Eval("name") %>' CommandName="Update" Text=""><i class="fa fa-floppy-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text=""><i class="fa fa-times"></i></asp:LinkButton>
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandName="Insert" Text=""><i class="fa fa-floppy-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text=""><i class="fa fa-times"></i></asp:LinkButton>
                </InsertItemTemplate>
               
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Edit" Text=""><i class="fa fa-pencil"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandArgument='<%# Eval("name") %>' OnCommand="DeleteFeed_Command" CommandName="Delete" Text="" ><i class="fa fa-trash"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="New" OnClick="NewFeed_Click" Text=""><i class="fa fa-star-o"></i></asp:LinkButton>                
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
    </asp:DetailsView>
    
    <a id="leitorBtn" class="btn btn-default" href="/"><i class="fa fa-rss"></i> Leitor de feeds</a>

    <asp:XmlDataSource ID="XmlDataSource4" runat="server" DataFile="~/App_Data/feedlist.xml"></asp:XmlDataSource>
</asp:Content>
