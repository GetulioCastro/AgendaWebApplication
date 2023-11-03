<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePrincipal.Master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="AgendaWebApplication.usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="lvUsuarios" runat="server" DataKeyNames="email" DataSourceID="SqlDataSourceU" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                </td>
                <td>
                    <asp:Label ID="senhaLabel" runat="server" Text='<%# Eval("senha") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Salvar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel1" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="senhaTextBox" runat="server" Text='<%# Bind("senha") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>Nenhum dado foi retornado.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Inserir" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="senhaTextBox" runat="server" Text='<%# Bind("senha") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                </td>
                <td>
                    <asp:Label ID="senhaLabel" runat="server" Text='<%# Eval("senha") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">email</th>
                                <th runat="server">nome</th>
                                <th runat="server">senha</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                </td>
                <td>
                    <asp:Label ID="senhaLabel" runat="server" Text='<%# Eval("senha") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
</asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceU" runat="server" ConnectionString="<%$ ConnectionStrings:AgendaDB %>" DeleteCommand="DELETE FROM [Usuario] WHERE [email] = @email" InsertCommand="INSERT INTO [Usuario] ([email], [nome], [senha]) VALUES (@email, @nome, @senha)" SelectCommand="SELECT [email], [nome], [senha] FROM [Usuario]" UpdateCommand="UPDATE [Usuario] SET [nome] = @nome, [senha] = @senha WHERE [email] = @email" OnInserted="SqlDataSourceU_Inserted" OnUpdated="SqlDataSourceU_Updated">
    <DeleteParameters>
        <asp:Parameter Name="email" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="nome" Type="String" />
        <asp:Parameter Name="senha" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="nome" Type="String" />
        <asp:Parameter Name="senha" Type="String" />
        <asp:Parameter Name="email" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>
    <br />
    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" OnClick="btnLimpar_Click" />
</asp:Content>
