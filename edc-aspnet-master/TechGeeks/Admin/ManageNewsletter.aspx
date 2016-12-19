<%@ Page Title="Newsletter Management" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ManageNewsletter.aspx.cs" Inherits="TechGeeks.Admin.ManageNewsletter" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class="row">
      <div class="col-md-6">
         <h4>Write an email to all subscribers:</h4>
         <asp:TextBox CssClass="form-control" Rows="50" TextMode="MultiLine"
            runat="server" ID="emailContent" Height="300px" Wrap="true"></asp:TextBox>
         <div class="text-center">
            <asp:LinkButton runat="server" ID="sendEmailsBtn"  
            CssClass="btn btn-flat btn-primary" OnClick="sendEmailsBtn_Click">Send emails</asp:LinkButton>
         </div>
         <span class="h5" id="emailMessage" style="color:green" runat="server"></span>
      </div>
      <div class="col-md-6">
         <asp:GridView ID="GridView1" runat="server" DataSourceID="XmlDataSourceNewsletter" 
            AutoGenerateColumns="false" GridLines="None" CssClass="table table-condensed" 
            OnRowDeleting="GridView1_RowDeleting" ShowHeaderWhenEmpty="true" >
            <Columns>
               <asp:BoundField DataField="value" HeaderText="Email list" />
               <asp:TemplateField HeaderText="Unsubscribe">
                  <ItemTemplate>
                     <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="fa fa-trash"></asp:LinkButton>
                  </ItemTemplate>
               </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
               <h4 class="text-center">
                  There's no subscribers
               </h4>
            </EmptyDataTemplate>
            
            <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
            <HeaderStyle BackColor="IndianRed" ForeColor="White" />
         </asp:GridView>
      </div>
   </div>
   <asp:XmlDataSource EnableCaching="false" ID="XmlDataSourceNewsletter" runat="server" XPath="/List/Email">
   </asp:XmlDataSource>
</asp:Content>