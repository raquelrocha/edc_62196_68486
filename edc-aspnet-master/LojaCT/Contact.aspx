<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="LojaCT.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        Aveiro<br />
        Deti 3810<br />
        <abbr title="Phone">P:</abbr>
       CT phone number
    </address>

    <address>
        <strong>CT Store Support:</strong>   <a href="mailto:Support@example.com">CTstoreSupport@example.com</a><br />
        <strong>CT Store Marketing:</strong> <a href="mailto:Marketing@example.com">CTstoreMarketing@example.com</a>
    </address>
</asp:Content>
