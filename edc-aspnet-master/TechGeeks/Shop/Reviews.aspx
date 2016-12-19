<%@ Page Title="Reviews" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="TechGeeks.Shop.Reviews" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceReviews" AutoGenerateColumns="False"
      GridLines="None" CssClass="table table-condensed table-hover" AllowPaging="True" AllowSorting="True">
      <Columns>
         <asp:BoundField DataField="ReviewedAt" HeaderText="Review at" SortExpression="ReviewedAt" />
         <asp:BoundField DataField="Name" HeaderText="By" ReadOnly="True" SortExpression="Name" />
         <asp:TemplateField HeaderText="Review" SortExpression="Review">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Review") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("Review")==null ? Eval("Review") : Eval("Review").ToString().Replace("\n", "<br />") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
      </Columns>
      <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
      <HeaderStyle BackColor="IndianRed" ForeColor="White" />
      <EmptyDataTemplate>
         <h3 class="text-center">There is no reviews yet, you can always be the first :)</h3>
      </EmptyDataTemplate>
   </asp:GridView>

   <asp:SqlDataSource ID="SqlDataSourceReviews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sp_getReviews" SelectCommandType="StoredProcedure">
      <SelectParameters>
         <asp:RouteParameter Name="ProductId" RouteKey="productid" Type="Int32" />
      </SelectParameters>
   </asp:SqlDataSource>

</asp:Content>