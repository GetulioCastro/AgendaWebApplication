<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.Master" AutoEventWireup="true" CodeBehind="contatos.aspx.cs" Inherits="AgendaWebApplication.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="lblContatos" runat="server" Text="Lista de Contatos" Font-Bold="True"></asp:Label>
    <br />
    <asp:Label ID="lblInserir" runat="server" Text="Inserir Contatos:"></asp:Label>
    <br />
    <asp:Label ID="lblNome" runat="server" Text="Nome:" Font-Bold="true"></asp:Label>
    <br />
    <asp:TextBox ID="txbNome" runat="server" Width="300px" ToolTip="Insira um nome"></asp:TextBox>
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="E-Mail:" Font-Bold="true"></asp:Label>
    <br />
    <asp:TextBox ID="txbEmail" runat="server" Width="300px" ToolTip="Insira um e-mail"></asp:TextBox>
    <br />
    <asp:Label ID="lblTelefone" runat="server" Text="Telefone:" Font-Bold="true"></asp:Label>
    <br />
    <asp:TextBox ID="txbTeledfone" runat="server" Width="190px" ToolTip="Insira um telefone com DDD"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnInserir" runat="server" Text="Inserir" OnClick="btnInserir_Click" />
    <br />
    <br />
    <asp:GridView ID="gvContatos" runat="server" DataSourceID="SqlDataSourceC" ProviderName="System.Data.SqlClient" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:CommandField ShowEditButton="True"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="true"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceC" ConnectionString="<%$ ConnectionStrings:AgendaDBConnectionString %>" SelectCommand="SELECT * FROM [Contato]" DeleteCommand="DELETE FROM [Contato] WHERE [Id] = @Id" UpdateCommand="UPDATE [Contato] SET [nome] = @nome, [email] = @email, [telefone] = @telefone WHERE [Id] = @Id" ProviderName="System.Data.SqlClient">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </deleteparameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Telefone" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
