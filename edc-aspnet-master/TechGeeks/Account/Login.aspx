<%@ Page Title="Authentication" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TechGeeks.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <div class="row">
      <div class="col-md-6">
         <section id="loginForm" class="well" >
            <asp:Panel runat="server" CssClass="form-horizontal" DefaultButton="loginBtn">
               <h4 class="text-center">Use a local account to log in</h4>
               <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                  <p class="text-danger">
                     <asp:Literal runat="server" ID="FailureText" />
                  </p>
               </asp:PlaceHolder>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                     <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="groupLogin" runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                  </div>
               </div>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                     <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="groupLogin" runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                  </div>
               </div>
               <div class="form-group">
                  <ul class="text-right list-inline text-center">
                     <li>
                     <div>
                        <asp:CheckBox runat="server" ID="RememberMe" />
                        <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                     </div></li>

                     <li><asp:Button ID="loginBtn" runat="server" ValidationGroup="groupLogin" OnClick="LogIn" Text="Log in" CssClass="btn btn-flat btn-default" /></li>
                  </ul>
               </div>
            </asp:Panel>
         </section>
         <section id="socialLoginForm" class="text-center well" >
            <h4>Login using external provider</h4>
            <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
         </section>
      </div>

      <div class="col-md-6">
         <section id="registerForm" class="well">
            <asp:Panel runat="server" CssClass="form-horizontal" DefaultButton="registerBtn" >
               <h4 class="text-center">Create a new account</h4>
               <p class="text-danger">
                  <asp:Literal runat="server" ID="ErrorRegister" />
               </p>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="FullNameRegister" CssClass="col-md-2 control-label">Name</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="FullNameRegister" CssClass="form-control" TextMode="SingleLine" />
                     <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="groupRegister" runat="server" ControlToValidate="FullNameRegister"
                        CssClass="text-danger" ErrorMessage="Full name is required." />
                  </div>
               </div>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="EmailRegister" CssClass="col-md-2 control-label">Email</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="EmailRegister" CssClass="form-control" TextMode="Email" />
                     <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="groupRegister" runat="server" ControlToValidate="EmailRegister"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                  </div>
               </div>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="BirthdayRegister" CssClass="col-md-2 control-label">Birthday</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="BirthdayRegister" CssClass="form-control" TextMode="Date" />
                  </div>
               </div>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="NIFRegister" CssClass="col-md-2 control-label">NIF</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="NIFRegister" CssClass="form-control" TextMode="Number" />
                  </div>
               </div>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="ReferralRegister" CssClass="col-md-2 control-label">Referral Email</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="ReferralRegister" CssClass="form-control" TextMode="Email" Placeholder="Insert your referral email here" />
                  </div>
               </div>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="PasswordRegister" CssClass="col-md-2 control-label">Password</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="PasswordRegister" TextMode="Password" CssClass="form-control" />
                     <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="groupRegister" runat="server" ControlToValidate="PasswordRegister"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                  </div>
               </div>
               <div class="form-group">
                  <asp:Label runat="server" AssociatedControlID="ConfirmPasswordRegister" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                  <div class="col-md-10">
                     <asp:TextBox runat="server" ID="ConfirmPasswordRegister" TextMode="Password" CssClass="form-control" />
                     <asp:RequiredFieldValidator ValidationGroup="groupRegister" runat="server" ControlToValidate="ConfirmPasswordRegister"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                     <asp:CompareValidator ValidationGroup="groupRegister" runat="server" ControlToCompare="PasswordRegister" ControlToValidate="ConfirmPasswordRegister"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                  </div>
               </div>
               <div class="form-group">
                  <div class="col-md-offset-2 col-md-10">
                     <asp:Button ID="registerBtn" runat="server" ValidationGroup="groupRegister" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default btn-flat" />
                  </div>
               </div>
            </asp:Panel>
         </section>
      </div>
   </div>

</asp:Content>
