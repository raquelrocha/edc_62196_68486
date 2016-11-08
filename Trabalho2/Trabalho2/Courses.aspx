<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Trabalho2.Courses"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="page-header">Lista de Cursos</h1>
    <div class="form-group">
    <div class="col-lg-6 control-label">
        Tipos: <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="tiposCourses" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="Grau" DataValueField="Grau" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
    </div>
    <asp:XmlDataSource ID="tiposCourses" runat="server" DataFile="~/App_Data/courses.xml" TransformFile="~/App_Data/courses.xslt" EnableCaching="false" XPath="/cursos/curso[not(@Grau=preceding::curso/@Grau)]"></asp:XmlDataSource>
    <div class="col-lg-6 control-label">
    Locais: <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" DataSourceID="locaisCursos" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="Local" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataValueField="Local" XPath="/cursos/curso[not(@Local=preceding::curso/@Local)]" EnableCaching="false"></asp:DropDownList>
    </div>
        
    <asp:XmlDataSource ID="locaisCursos" runat="server" DataFile="~/App_Data/courses.xml" TransformFile="~/App_Data/courses.xslt" EnableCaching="false" XPath="/cursos/curso[not(@Local=preceding::curso/@Local)]"></asp:XmlDataSource>
    </div>
    <div>
    <asp:XmlDataSource ID="coursesXml" runat="server" DataFile="~/App_Data/courses.xml" TransformFile="~/App_Data/courses.xslt"></asp:XmlDataSource>
    <asp:GridView ID="GridView1"  CssClass="table table-striped" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="coursesXml" OnDataBound="GridView1_DataBound">
        <Columns>
            <asp:HyperLinkField HeaderText="GUID" DataTextField="GUID" DataNavigateUrlFields="GUID" SortExpression="GUID" DataNavigateUrlFormatString="~/Course?ID={0}" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="Grau" HeaderText="Grau" SortExpression="Grau" />
            <asp:BoundField DataField="Local" HeaderText="Local" SortExpression="Local" />
        </Columns>
        <EmptyDataTemplate>
            <div class="panel panel-warning">
                <div class="panel-heading">
                <h3 class="panel-title warning">ATENÇÃO!!!</h3>
                </div>
                <div class="panel-body">
                Não há cursos desse tipo nessa instituição.
                </div>
            </div>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="center" />
    </asp:GridView>
    </div class="bs-component">
</asp:Content>
