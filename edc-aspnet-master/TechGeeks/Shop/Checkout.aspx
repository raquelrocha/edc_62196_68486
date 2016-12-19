<%@ Page Title="Checkout" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="TechGeeks.Shop.Checkout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
      DataSourceID="XmlDataSourceShoppingCart" GridLines="None" CssClass="table table-condensed"
      OnRowCommand="GridView1_RowCommand">
      <Columns>
         <asp:BoundField DataField="id" HeaderText="ID" />
         <asp:BoundField DataField="name" HeaderText="Name" />
         <asp:BoundField DataField="price" HeaderText="Price" />
         <asp:BoundField DataField="short" HeaderText="Short" />
         <asp:BoundField DataField="quantity" HeaderText="Quantity" />
         <asp:TemplateField ShowHeader="True" HeaderText="Commands">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Minus" CommandArgument='<%# Eval("id") %>' CssClass="fa fa-minus"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Plus" CommandArgument='<%# Eval("id") %>' CssClass="fa fa-plus"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Remove" CommandArgument='<%# Eval("id") %>' CssClass="fa fa-trash"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>

      </Columns>
      <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
      <HeaderStyle BackColor="IndianRed" ForeColor="White" />
      <EmptyDataTemplate>
         <h4 class="text-center">You haven't selected anything to buy yet.</h4>
      </EmptyDataTemplate>
   </asp:GridView>
   <div class="text-center" runat="server" id="paymentMethod">
      <h4>Choose the method to pay with</h4>
      <asp:CheckBox ID="usePoints" runat="server"/> Use my points to buy partial of this transaction<br /><small>1 point = 1€ and it is limited to the PointsLimit of each product</small>
      <br /><br />
      <asp:LinkButton runat="server" OnClick="Unnamed_Click" CssClass="btn btn-flat btn-default"><i class="fa fa-paypal"></i> Paypal</asp:LinkButton>
      <asp:LinkButton runat="server" OnClick="Unnamed_Click" CssClass="btn btn-flat btn-default"><i class="fa fa-google-wallet"></i> Google Wallet</asp:LinkButton>
      <asp:LinkButton runat="server" OnClick="Unnamed_Click" CssClass="btn btn-flat btn-default"><i class="fa fa-credit-card"></i> Debit Card</asp:LinkButton>
   </div>
   <asp:XmlDataSource ID="XmlDataSourceShoppingCart" EnableCaching="False" runat="server" XPath="/Data/ShoppingCart/Product"></asp:XmlDataSource>
</asp:Content>
