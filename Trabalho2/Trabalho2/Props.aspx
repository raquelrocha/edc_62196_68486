<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Props.aspx.cs" Inherits="Trabalho2.Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Properties</h2>
    <hr>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped " DataSourceID="XmlDataSource1"
                    GridLines="None" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" AllowPaging="True">
        <Columns>
            <asp:TemplateField HeaderText="Register Number" SortExpression="id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>' Enabled="false"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newid" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newType" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cost" SortExpression="cost">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cost") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newCost" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("cost") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency" SortExpression="currency">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("currency") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newCurrency" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("currency") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="city">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newCity" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Street" SortExpression="street">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("street") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newStreet" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("street") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Port No." SortExpression="port">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("port") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newPort" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("port") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" Text="Update" CommandName="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="False" Text="Insert" OnClick="InsertButton_Click"></asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
    </asp:GridView>
    <div class="col-log-12 col-md-12" style="height:20px;"></div>
    <h2>Properties Owners</h2>
    <hr>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource2" 
        CssClass="table table-striped" GridLines="None" OnRowUpdating="GridView2_RowUpdating" OnRowDeleting="GridView2_RowDeleting" 
        ShowFooter="True">
        <Columns>
            <asp:TemplateField HeaderText="Register Number" SortExpression="id">
                <EditItemTemplate>
                    <asp:Label ID="TextBox1" runat="server" Text='<%# Bind("id") %>' Enabled="false"></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newOwnerRegister" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tax Number" SortExpression="taxId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("taxId") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newtaxId" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("taxId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newDate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="First name" SortExpression="firstname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("firstname") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newFirstName" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last name" SortExpression="lastname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("lastname") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="newLastName" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Commands">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" Text="Update" CommandName="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="InsertButton_PropertyOwner" runat="server" CausesValidation="False" Text="Insert" OnClick="InsertButton_PropertyOwner_Click"></asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="col-log-12 col-md-12" style="height:20px;"></div>
    <h2>Find properties owned by:</h2>
    <hr>
    <div class="col-log-12 col-md-12">
        <div class="col-log-3 col-md-3" style="width:120px; margin-top: 10px;">
            Tax Number:
            </div>
        <div class="col-log-9 col-md-9">
            <asp:TextBox ID="taxId" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;   
            <asp:Button ID="search" CssClass="btn btn-md btn-success" runat="server" Text="Search" OnClick="search_Click"/>
        </div>
    </div>
    <div class="col-log-12 col-md-12" style="height:20px;"></div>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource3" 
        CssClass="table table-striped" GridLines="None" BorderStyle="None" HeaderStyle-BackColor="#0099FF" AllowPaging="True" OnDataBound="GridView3_DataBound">
        <Columns>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="RegisterNumber" HeaderText="RegisterNumber" SortExpression="RegisterNumber" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
            <asp:BoundField DataField="Port" HeaderText="Port" SortExpression="Port" />
        </Columns>
        <EmptyDataTemplate>
            <div class="panel panel-warning">
                <div class="panel-heading">
                <h3 class="panel-title">Warning!!!</h3>
                </div>
                <div class="panel-body">
                The person with this tax number has no properties.
                </div>
            </div>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="center" />
    </asp:GridView>

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Properties.xml" TransformFile="~/App_Data/PropertiesInline.xslt"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/Properties.xml" TransformFile="~/App_Data/PropertiesOwners.xslt"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/App_Data/Properties.xml" TransformFile="~/App_Data/CurrentOwners.xslt"></asp:XmlDataSource>
</asp:Content>
