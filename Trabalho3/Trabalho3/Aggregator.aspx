<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Aggregator.aspx.cs" Inherits="Trabalho3.Aggregator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- TODO: Filtar por categoria ou outros -->
    <!-- Esconder campos vazios no Reader -->
    <div class="row">
    <h3> <i class="fa fa-rss fa-4"></i> My Feed Aggregator <asp:Label ID="count_news" runat="server" Font-Size="Smaller"></asp:Label> </h3>

    <div class="checkbox checkboxlist col-sm-10">
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="XmlDataSourceFeedReader" DataTextField="name" DataValueField="url" AutoPostBack="true" CssClass="" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>
    </div>

    <br/>
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
                <div class="col-xs-12 col-md-6 col-lg-4">
                    <div class="well" style="height: 500px;">   <!-- não sei o tamanho! o auto nao funciona como quero! -->
                        <div class="media">
                            <div class="media-body" aria-busy="False">
                                <!-- a funcao DisplayFeedItem é chamada aqui!! -->
                                <%# DisplayFeedItem((Container as ListViewDataItem).DataItem as System.ServiceModel.Syndication.SyndicationItem) %>
                            </div>
                        </div>
                    </div>
                </div>
         </ItemTemplate>
    </asp:ListView>
    </div>
    <asp:XmlDataSource ID="XmlDataSource1" TransformFile="~/App_Data/news.xslt" runat="server" EnableCaching="false" XPath="/rss/item"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSourceFeedReader" runat="server" DataFile="~/App_Data/feedlist.xml" EnableCaching="False"></asp:XmlDataSource>
</asp:Content>
