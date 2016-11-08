<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Trabalho2.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="page-header">Informação do curso</h1>
    <asp:DetailsView ID="ListView1" CssClass="table table-striped" runat="server" DataSourceID="curso" AutoGenerateRows="false">
        <FieldHeaderStyle BackColor="#4e5d6c" ForeColor="White" HorizontalAlign="Right" Width="200px" CssClass="th"/>
        <Fields>
            <asp:BoundField DataField="guid" HeaderText="Guid"/>
            <asp:BoundField DataField="nome" HeaderText="Nome"/>
            <asp:BoundField DataField="codigo" HeaderText="Código"/>
            <asp:BoundField DataField="grau" HeaderText="Grau"/>
            <asp:BoundField DataField="vagas" HeaderText="Vagas"/>
            <asp:BoundField DataField="saidas_profissionais" HeaderText="Saídas profissionais" HtmlEncode="false" />
            <asp:BoundField DataField="media1" HeaderText="Média [1ª Fase]"/>
            <asp:BoundField DataField="media2" HeaderText="Média [2ª Fase]"/>
            <asp:BoundField DataField="duracao" HeaderText="Duração"/>
            <asp:BoundField DataField="provas" HeaderText="Provas" HtmlEncode="false" />
        </Fields>
        
        <HeaderStyle BackColor="#0099FF" />
    </asp:DetailsView>
    <asp:XmlDataSource ID="curso" OnLoad="curso_Load" runat="server" TransformFile="~/App_Data/curso.xslt" XPath="/curso"></asp:XmlDataSource>
</asp:Content>
