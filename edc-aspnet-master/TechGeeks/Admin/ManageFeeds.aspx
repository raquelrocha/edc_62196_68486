<%@ Page Title="RSS Feeds Management" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ManageFeeds.aspx.cs" Inherits="TechGeeks.Admin.ManageFeeds" %>

<%@ Register Assembly="TechGeeks" Namespace="TechGeeks.Models" TagPrefix="cc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <cc1:FlexibleGridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
      DataKeyNames="title" DataSourceID="XmlDataSourceFeeds" GridLines="None" CssClass="table table-condensed"
       ShowFooter="True" ShowHeaderWhenEmpty="true" ShowFooterWhenEmpty="true" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" >
      <Columns>

         <asp:TemplateField HeaderText="Title" SortExpression="title">
            <FooterTemplate>
               <asp:TextBox ID="newTitle" CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("title") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>

         <asp:TemplateField HeaderText="Url" SortExpression="url">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:TextBox ID="newUrl"  CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </FooterTemplate>
               <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("url") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>

        
          <asp:TemplateField HeaderText="Commands">
            <EditItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="fa fa-floppy-o" CommandName="Update"></asp:LinkButton>
               &nbsp;&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="fa fa-times" ></asp:LinkButton>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="False" CssClass="fa fa-star-o" OnClick="InsertButton_Click"></asp:LinkButton>
            </FooterTemplate>
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="fa fa-pencil"></asp:LinkButton>
               &nbsp;&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="fa fa-trash" CommandName="Delete"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>

      </Columns>
      
      <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
      <HeaderStyle BackColor="IndianRed" ForeColor="White" />
   </cc1:FlexibleGridView>

    <asp:XmlDataSource EnableCaching="false" ID="XmlDataSourceFeeds" runat="server" XPath="/Feeds/Feed">
   </asp:XmlDataSource>


</asp:Content>