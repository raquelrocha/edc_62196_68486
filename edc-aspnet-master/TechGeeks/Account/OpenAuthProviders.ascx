<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="TechGeeks.Account.OpenAuthProviders" %>

<div id="socialLoginList">
   <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
      SelectMethod="GetProviderNames" ViewStateMode="Disabled"> 
      <ItemTemplate>
         <button type="submit" class="btn btn-default btn-flat" name="provider" value="<%#: Item %>">
            <asp:Label runat="server" CssClass="<%#: getIcon(Item) %>"></asp:Label>
         </button>
      </ItemTemplate>
      <EmptyDataTemplate>
         <div>
            <p>There are no external authentication services configured.</p>
         </div>
      </EmptyDataTemplate>
   </asp:ListView>
</div>
