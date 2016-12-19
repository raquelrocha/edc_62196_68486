<%@ Page Title="Transactions" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="TechGeeks.Account.Transactions" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
      GridLines="None" AllowPaging="True" AllowSorting="True" CssClass="table table-condensed" OnRowUpdating="GridView1_RowUpdating">
      <Columns>
         <asp:BoundField DataField="TransactionId" HeaderText="ID" SortExpression="TransactionId" />
         <asp:BoundField DataField="Bought_date" HeaderText="Bought at" SortExpression="Bought_date" />
         <asp:TemplateField HeaderText="Product ID" SortExpression="Product_id">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Product_id") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("Product_id") %>'></asp:Label>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:BoundField DataField="Product_name" HeaderText="Product Name" SortExpression="Product_id" />
         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
         <asp:TemplateField HeaderText="Feedback">
            <ItemTemplate>
               <a href="#" data-toggle="modal" data-target='<%# String.Format("#modal{0}", Eval("Product_id")) %>'><i class="fa fa-star"></i>&nbsp;Submit</a>
               &nbsp;<a runat="server" href='<%# String.Format("~/Shop/Reviews/{0}", Eval("Product_id")) %>' data-toggle="modal"><i class="fa fa-comment"></i>&nbsp;View</a>
               <div class="modal fade" id='<%# String.Format("modal{0}", Eval("Product_id")) %>' tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                   <div class="modal-content">
                     <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="Label2" CssClass="h4 text-center" runat="server" Text='Feedback Modal'></asp:Label>
                     </div>
                     <div class="modal-body">
                        <asp:Label Visible="false" runat="server" ID="productIdLabel" Text='<%# String.Format("{0}", Eval("Product_id")) %>'></asp:Label>
                        <asp:TextBox ID='data' CssClass="form-control textarea-noresize" Height="300px" Wrap="true" 
                          runat="server" TextMode="MultiLine"></asp:TextBox>
                     </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-flat btn-default" data-dismiss="modal">Close</button>
                        <asp:LinkButton runat="server" CssClass="btn btn-flat btn-primary" CommandName="Update"><i class="fa fa-floppy-o"></i>&nbsp;Save Changes</asp:LinkButton>
                     </div>
                   </div>
                 </div>
               </div>
               <asp:LinkButton runat="server"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
         <h3 class="text-center">You haven't made any transactions yet.</h3>
      </EmptyDataTemplate>
      
      <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
      <HeaderStyle BackColor="IndianRed" ForeColor="White" />
   </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sp_getUserTransactions" SelectCommandType="StoredProcedure">
      <SelectParameters>
         <asp:Parameter Name="userid" Type="String" />
      </SelectParameters>
   </asp:SqlDataSource>
</asp:Content>
