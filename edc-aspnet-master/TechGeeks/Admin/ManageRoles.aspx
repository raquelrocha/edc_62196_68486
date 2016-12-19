<%@ Page Title="Role Manager" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="TechGeeks.Admin.ManageRoles" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <br />
   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
         <asp:Label ID="Label1" runat="server">Filter by user email:</asp:Label>
         <asp:TextBox ID="emailTextBox" CssClass="form-control" runat="server" AutoPostBack="true"></asp:TextBox>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
         <asp:Label ID="Label2" runat="server">Filter by role:</asp:Label>
         <asp:DropDownList CssClass="form-control" ID="ddlTypes" runat="server" AutoPostBack="true"
            DataTextField="role" DataValueField="role" AppendDataBoundItems="true">
            <asp:ListItem Text="Any role" Value="" />
            <asp:ListItem Text="administrator" Value="administrator" />
            <asp:ListItem Text="manager" Value="manager" />
            <asp:ListItem Text="member" Value="member" />
         </asp:DropDownList>
      </div>

   </div>
   <hr>
   <hr>
   <asp:GridView ID="UserRoleGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="SqlDataSource1"
      GridLines="None" AllowPaging="True" AllowSorting="True" CssClass="table table-condensed" OnRowDataBound="gv_RowDataBound" OnRowUpdating="UserRoleGrid_RowUpdating">
      <Columns>

         <asp:TemplateField HeaderText="Email" SortExpression="email">
            <ItemTemplate>
               <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Role" SortExpression="role">
            <ItemTemplate>
               <asp:Label ID="role" runat="server" Text='<%# Eval("role") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:DropDownList ID="DropDownList1" runat="server">
               </asp:DropDownList>
            </EditItemTemplate>
         </asp:TemplateField>

         <asp:TemplateField HeaderText="Commands">
            <EditItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandArgument='<%# Eval("email") %>' CommandName="Update" Text=""><i class="fa fa-floppy-o"></i></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text=""><i class="fa fa-times"></i></asp:LinkButton>
            </EditItemTemplate>

            <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Edit" Text=""><i class="fa fa-pencil"></i></asp:LinkButton>
            </ItemTemplate>

         </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
         <h3 class="text-center">There are no data records to display.</h3>
      </EmptyDataTemplate>

      <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
      <HeaderStyle BackColor="IndianRed" ForeColor="White" />
   </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
      SelectCommand="sp_getUserRoles" SelectCommandType="StoredProcedure">
      <SelectParameters>
         <asp:ControlParameter Type="String" DefaultValue=" " Name="email" ControlID="emailTextBox" PropertyName="Text" />
         <asp:ControlParameter Type="String" DefaultValue=" " Name="role" ControlID="ddlTypes" PropertyName="SelectedValue" />

      </SelectParameters>

   </asp:SqlDataSource>

</asp:Content>
