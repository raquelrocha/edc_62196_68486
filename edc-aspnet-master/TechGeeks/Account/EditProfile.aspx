<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="TechGeeks.Account.EditProfile" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <div class="row">
      <div class="col-md-6">
         <h4>Edit your profile details</h4>
         <br />
         <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" GridLines="None"
            DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="table table-condensed"
            OnItemUpdating="DetailsView1_ItemUpdating">
            <FieldHeaderStyle BackColor="IndianRed" ForeColor="White" HorizontalAlign="Left" Width="170px" />
            <Fields>
               <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="true" />
               <asp:TemplateField HeaderText="FullName" SortExpression="FullName">
                  <EditItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"
                        Text='<%# Bind("FullName") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                  </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="BirthDate" SortExpression="BirthDate">
                  <EditItemTemplate>
                     <asp:TextBox ID="TextBox2" TextMode="DateTime" runat="server" CssClass="form-control"
                        Text='<%# Bind("BirthDate") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("BirthDate") %>'></asp:Label>
                  </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="NIF" SortExpression="NIF">
                  <EditItemTemplate>
                     <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"
                        Text='<%# Bind("NIF") %>'></asp:TextBox>
                  </EditItemTemplate>
                  <ItemTemplate>
                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("NIF") %>'></asp:Label>
                  </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField ShowHeader="False">
                  <EditItemTemplate>
                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandName="Update" Text=""><i class="fa fa-floppy-o"></i></asp:LinkButton>
                     &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text=""><i class="fa fa-times"></i></asp:LinkButton>
                  </EditItemTemplate>
                  <ItemTemplate>
                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Edit" Text=""><i class="fa fa-pencil"></i></asp:LinkButton>
                  </ItemTemplate>
               </asp:TemplateField>
            </Fields>
         </asp:DetailsView>
      </div>
      <div class="col-md-6">
         <div class="form-horizontal">
            <section id="passwordForm">
               <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                  <p>
                     You do not have a local password for this site. Add a local
                           password so you can log in without an external login.
                  </p>
                  <div class="form-horizontal">
                     <h4>Set Password Form</h4>
                     <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                     <hr />
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                           <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                              CssClass="text-danger" ErrorMessage="The password field is required."
                              Display="Dynamic" ValidationGroup="SetPassword" />
                           <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                              CssClass="text-danger" SetFocusOnError="true" />
                        </div>
                     </div>

                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                        <div class="col-md-10">
                           <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                              CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                              ValidationGroup="SetPassword" />
                           <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                              CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                              ValidationGroup="SetPassword" />

                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                        </div>
                     </div>
                  </div>
               </asp:PlaceHolder>

               <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                  <div class="form-horizontal">
                     <h4>Change Password Form</h4>
                     <hr />
                     <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                     <div class="form-group">
                        <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Current password</asp:Label>
                        <div class="col-md-10">
                           <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                              CssClass="text-danger" ErrorMessage="The current password field is required."
                              ValidationGroup="ChangePassword" />
                        </div>
                     </div>
                     <div class="form-group">
                        <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New password</asp:Label>
                        <div class="col-md-10">
                           <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                              CssClass="text-danger" ErrorMessage="The new password is required."
                              ValidationGroup="ChangePassword" />
                        </div>
                     </div>
                     <div class="form-group">
                        <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm new password</asp:Label>
                        <div class="col-md-10">
                           <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                              CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
                              ValidationGroup="ChangePassword" />
                           <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                              CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                              ValidationGroup="ChangePassword" />
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-default" />
                        </div>
                     </div>
                  </div>
               </asp:PlaceHolder>
            </section>
         </div>
      </div>
   </div>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sp_getUserDetails" SelectCommandType="StoredProcedure">
      <SelectParameters>
         <asp:Parameter Name="userid" Type="String" />
      </SelectParameters>
   </asp:SqlDataSource>

</asp:Content>
