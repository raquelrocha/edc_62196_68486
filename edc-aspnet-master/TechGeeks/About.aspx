<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TechGeeks.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 460px;
      }
    </style>
   
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqJb31-ibms8GMT1h_7qEskVAjQGHEP88&callback=initMap"
        async defer></script>
   
   <div class="row">
      <div class="col-md-6 text-center">
         <h4>Information</h4>
         <div class="well">
            <h5><b>Address:</b> Rua da Pega, DETI Aveiro Portugal </h5>
            <h5><b>Opening hours:</b> 8am - 20pm</h5>
            <h5><b>Contact:</b> 910000000</h5>
         </div>
      </div>
   </div>
</asp:Content>
