<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AgendaWebApplication.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblEmail" runat="server" Text="E-Mail:" Font-Bold="True"></asp:Label>
            <br />
            <asp:TextBox ID="txbEmail" runat="server" ToolTip="Digite seu e-mail para efetuar logon" Width="300px"></asp:TextBox>
            <br />
            <asp:Label ID="lblSenha" runat="server" Text="Senha:" Font-Bold="True"></asp:Label>
            <br />
            <asp:TextBox ID="txbSenha" runat="server" ToolTip="Digite sua senha para efetuar logon" Width="300px" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogar" runat="server" Text="Logar" BackColor="#999999" OnClick="btnLogar_Click" />
        </div>
        <div>
            <asp:Label runat="server" ID="lblMsg"></asp:Label>&nbsp;
        </div>
    </form>
</body>
</html>
