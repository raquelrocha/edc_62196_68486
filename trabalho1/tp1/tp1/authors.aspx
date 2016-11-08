<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="authors.aspx.cs" Inherits="tp1.authors" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="au_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Width="1190px">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="fa fa-floppy-o"/>
                    &nbsp;<asp:LinkButton ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="fa fa-times"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="fa fa-pencil"/>
                    &nbsp;<asp:LinkButton ID="Button2" runat="server" CausesValidation="False" CommandName="Select" CssClass="fa fa-check-square-o" />
                    &nbsp;<asp:LinkButton ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="fa fa-trash" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="au_id" HeaderText="au_id" ReadOnly="True" SortExpression="au_id" />
            <asp:BoundField DataField="au_lname" HeaderText="au_lname" SortExpression="au_lname" />
            <asp:BoundField DataField="au_fname" HeaderText="au_fname" SortExpression="au_fname" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
            <asp:CheckBoxField DataField="contract" HeaderText="contract" SortExpression="contract" />
        </Columns>
        <SelectedRowStyle CssClass="success" />
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pubsConnectionString1 %>" DeleteCommand="DELETE FROM [authors] WHERE [au_id] = @au_id" InsertCommand="INSERT INTO [authors] ([au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract]) VALUES (@au_id, @au_lname, @au_fname, @phone, @address, @city, @state, @zip, @contract)" ProviderName="<%$ ConnectionStrings:pubsConnectionString1.ProviderName %>" SelectCommand="SELECT [au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract] FROM [authors]" UpdateCommand="UPDATE [authors] SET [au_lname] = @au_lname, [au_fname] = @au_fname, [phone] = @phone, [address] = @address, [city] = @city, [state] = @state, [zip] = @zip, [contract] = @contract WHERE [au_id] = @au_id">
        <DeleteParameters>
            <asp:Parameter Name="au_id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="au_id" Type="String" />
            <asp:Parameter Name="au_lname" Type="String" />
            <asp:Parameter Name="au_fname" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zip" Type="String" />
            <asp:Parameter Name="contract" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="au_lname" Type="String" />
            <asp:Parameter Name="au_fname" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zip" Type="String" />
            <asp:Parameter Name="contract" Type="Boolean" />
            <asp:Parameter Name="au_id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>


