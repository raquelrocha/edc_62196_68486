<%@ Page Title="Register an external login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="TechGeeks.Account.RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <asp:PlaceHolder runat="server">
      <div class="content form-horizontal">
         <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
         <p class="text-info">
            You've authenticated with <strong><%: ProviderName %></strong>. Please enter an email below for the current site
                and click the Log in button.
         </p>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="email" CssClass="control-label">Email</asp:Label>
            <div>
               <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email" />
               <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                  Display="Dynamic" CssClass="text-danger" ErrorMessage="Email is required" />
               <asp:ModelErrorMessage runat="server" ModelStateKey="email" CssClass="text-error" />
            </div>
         </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FullNameRegister" CssClass="control-label">Name</asp:Label>
            <div>
               <asp:TextBox runat="server" ID="FullNameRegister" CssClass="form-control" TextMode="SingleLine" />
               <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="FullNameRegister"
                  CssClass="text-danger" ErrorMessage="Full name is required." />
               <asp:ModelErrorMessage runat="server" ModelStateKey="FullNameRegister" CssClass="text-error" />
            </div>
         </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="BirthdayRegister" CssClass="control-label">Birthday</asp:Label>
            <div>
               <asp:TextBox runat="server" ID="BirthdayRegister" CssClass="form-control" TextMode="Date" />
            </div>
         </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="NIFRegister" CssClass="control-label">NIF</asp:Label>
            <div>
               <asp:TextBox runat="server" ID="NIFRegister" CssClass="form-control" TextMode="Number" />
            </div>
         </div>

         <div class="form-group">
            <div>
               <asp:Button runat="server" Text="Log in" CssClass="btn btn-flat btn-default" OnClick="LogIn_Click" />
            </div>
         </div>
      </div>
   </asp:PlaceHolder>
</asp:Content>
