<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.Master" AutoEventWireup="true" CodeBehind="contatos.aspx.cs" Inherits="AgendaWebApplication.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblContatos" runat="server" Text="Lista de Contatos"></asp:Label>
    <asp:GridView ID="gvContatos" runat="server" DataSourceID="SqlDataSourceC" ProviderName="System.Data.SqlClient">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:CommandField ShowEditButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceC" ConnectionString="<%$ ConnectionStrings:AgendaDB %>" SelectCommand="SELECT [nome], [email], [telefone] FROM [Contato]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    
</asp:Content>
