<%@ Page Title="Products Management" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="TechGeeks.Admin.ManageProducts" %>

<%@ Register Assembly="TechGeeks" Namespace="TechGeeks.Models" TagPrefix="cc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <h4 class="text-center">Select the product category below</h4>
   <asp:DropDownList CssClass="form-control" ID="ddlTypes" runat="server" AutoPostBack="true"
      DataTextField="type" DataValueField="type" AppendDataBoundItems="true">
      <asp:ListItem Text="Any category" Value="" />
      <asp:ListItem Text="Motherboard" Value="Motherboard" />
      <asp:ListItem Text="CPU" Value="CPU" />
      <asp:ListItem Text="GPU" Value="GPU" />
      <asp:ListItem Text="Sound Board" Value="Soundboard" />
      <asp:ListItem Text="Network Card" Value="Networkcard" />
      <asp:ListItem Text="Chassis" Value="Chassis" />
      <asp:ListItem Text="Hard Disk Drive" Value="HDD" />
      <asp:ListItem Text="Solid-state Drive" Value="SSD" />
      <asp:ListItem Text="Desktop Computers" Value="DesktopPC" />
      <asp:ListItem Text="Laptops" Value="Laptop" />
      <asp:ListItem Text="Other" Value="Other" />
   </asp:DropDownList><br />
   <cc1:FlexibleGridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
      DataKeyNames="Id" DataSourceID="SqlDataSourceProducts" GridLines="None" CssClass="table table-condensed"
      OnRowUpdating="GridView1_RowUpdating" ShowFooterWhenEmpty="true" ShowHeaderWhenEmpty="true" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True">
      <Columns>
         <asp:TemplateField HeaderText="Id" SortExpression="Id">
            <EditItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Name" SortExpression="Name">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:TextBox ID="newName" CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Category" SortExpression="Category">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:DropDownList ID="newCategory" runat="server"
                  DataTextField="newCategory" DataValueField="newCategory"
                  CssClass="form-control input-sm" >
                  <asp:ListItem Text="Motherboard" Value="Motherboard" />
                  <asp:ListItem Text="CPU" Value="CPU" />
                  <asp:ListItem Text="GPU" Value="GPU" />
                  <asp:ListItem Text="Sound Board" Value="Soundboard" />
                  <asp:ListItem Text="Network Card" Value="Networkcard" />
                  <asp:ListItem Text="Chassis" Value="Chassis" />
                  <asp:ListItem Text="Hard Disk Drive" Value="HDD" />
                  <asp:ListItem Text="Solid-state Drive" Value="SDD" />
                  <asp:ListItem Text="Desktop Computers" Value="DesktopPC" />
                  <asp:ListItem Text="Laptops" Value="Laptop" />
                  <asp:ListItem Text="Other" Value="Other" />
               </asp:DropDownList><br />
            </FooterTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="% Points" SortExpression="PointsLimit">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PointsLimit") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:TextBox ID="newPointsLimit" CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("PointsLimit") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Price" SortExpression="Price">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:TextBox ID="newPrice" CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Short" SortExpression="Short">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Short") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:TextBox ID="newShort" CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("Short") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Launch Date" SortExpression="LaunchDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("LaunchDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:TextBox ID="newLaunchDate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("LaunchDate") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Commands">
            <EditItemTemplate>
               <a href="#" data-toggle="modal" data-target="#modal<%# Eval("Id") %>"><i class="fa fa-search-plus"></i></a>

               <div class="modal fade" id="modal<%# Eval("Id") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                           <asp:Label ID="Label22" CssClass="h4 text-center" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </div>
                        <div class="modal-body">
                           <asp:Label ID="Label21" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                     </div>
                  </div>
               </div>
               &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="fa fa-floppy-o" CommandName="Update"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="fa fa-times" ></asp:LinkButton>
            </EditItemTemplate>
            <FooterTemplate>
               <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="False" CssClass="fa fa-star-o" OnClick="InsertButton_Click"></asp:LinkButton>
            </FooterTemplate>
            <ItemTemplate>
               <a href="#" data-toggle="modal" data-target="#modal<%# Eval("Id") %>"><i class="fa fa-search-plus"></i></a>

               <div class="modal fade" id="modal<%# Eval("Id") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                           <asp:Label ID="Label22" CssClass="h4 text-center" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </div>
                        <div class="modal-body">
                           <asp:Label ID="Label21" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                     </div>
                  </div>
               </div>
               &nbsp;
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="fa fa-pencil"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="fa fa-trash" CommandName="Delete"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>
      </Columns>
      
      <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
      <HeaderStyle BackColor="IndianRed" ForeColor="White" />
   </cc1:FlexibleGridView >

   <div class="row">
      <div class="col-md-6">
         <h4>Insert products into the database using XML/JSON</h4>
         <asp:FileUpload CssClass="btn btn-flat btn-default" id="FileUploadControl" runat="server" />
         <asp:CheckBox runat="server" ID="cb_dump" />
         <span>Database full dump (It will clear all products before upload)</span>
         <br/><br />
         
         <div class="text-center">
            <asp:DropDownList CssClass="form-control custom-form" runat="server" ID="uploadType">
               <asp:ListItem Value="xml">XML</asp:ListItem>
               <asp:ListItem Value="json">JSON</asp:ListItem>
            </asp:DropDownList>
            <asp:Button runat="server" CssClass="btn btn-flat btn-primary" id="UploadButton" text="Upload File" OnClick="UploadButton_Click" /><br />
            <br /><asp:Label runat="server" CssClass="text-bold h4" id="Label2" text="Status: " /><br />
            <asp:Label runat="server" id="StatusLabel" text="Waiting for file" />
         </div>
      </div>
      <div class="col-md-6">
         <h4>Products dump export</h4>
         Type:&nbsp;
         <asp:DropDownList CssClass="form-control custom-form" runat="server" ID="exportType">
            <asp:ListItem Value="xml">XML</asp:ListItem>
            <asp:ListItem Value="json">JSON</asp:ListItem>
         </asp:DropDownList>
         <asp:Button runat="server" ID="exportBtn" Text="Export Data"
            OnClick="exportBtn_Click" CssClass="btn btn-flat btn-primary">
         </asp:Button><br/>
         <div class="row">
            <div class="col-md-6">
               <b>Example XML: </b>
               <code><br />&lt;List&gt;<br />
                     &nbsp;&nbsp;&nbsp;&lt;Product&gt;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Name&gt;..&lt;/Name&gt;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...<br />
                     &nbsp;&nbsp;&nbsp;&lt;/Product&gt;<br />
                     &nbsp;&nbsp;&nbsp;&lt;Product&gt;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...<br />
                     &nbsp;&nbsp;&nbsp;&lt;/Product&gt;<br />
                  &lt;/List&gt;<br />
               </code>
            </div>
            <div class="col-md-6">
               <b>Example JSON:</b>
               <code><br />
                  {<br />
                     &nbsp;&nbsp;&nbsp;"List": {<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Product": [{<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'Name':'...',<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},{<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;..<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}]<br />
                     &nbsp;&nbsp;&nbsp;}<br />
                  }
               </code>
            </div>
         </div>
      </div>
   </div>
   <asp:SqlDataSource ID="SqlDataSourceProducts" runat="server"
      ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
      SelectCommand="sp_getProducts" SelectCommandType="StoredProcedure"
      FilterExpression="Category = '{0}'">
      <FilterParameters>
         <asp:ControlParameter Name="Category" ControlID="ddlTypes" PropertyName="SelectedValue" />
      </FilterParameters>
      <SelectParameters>
         <asp:Parameter DefaultValue=" " Name="Category" Type="String" />
      </SelectParameters>
   </asp:SqlDataSource>
</asp:Content>
