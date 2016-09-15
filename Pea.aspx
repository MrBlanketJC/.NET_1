<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pea.aspx.cs" Inherits="Prueba.Pea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>SELECCIONE MATERIA</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:DropDownList ID="ddl_materia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_materia_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
    
    </div>
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                    <br />
        GRID CON VARIABLES
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_PEA" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="ID_PEA" HeaderText="ID_PEA" ReadOnly="True" SortExpression="ID_PEA" />
                            <asp:BoundField DataField="ID_MATERIA" HeaderText="ID_MATERIA" SortExpression="ID_MATERIA" />
                            <asp:BoundField DataField="DESC_PEA" HeaderText="DESC_PEA" SortExpression="DESC_PEA" />
                            <asp:BoundField DataField="ESTADO_PEA" HeaderText="ESTADO_PEA" SortExpression="ESTADO_PEA" />
                            <asp:TemplateField HeaderText="CALI_PEA" SortExpression="CALI_PEA">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CALI_PEA") %>' Visible="False"></asp:TextBox>
                                    <asp:DropDownList ID="ddl_porcentaje" runat="server" SelectedValue='<%# Bind("CALI_PEA") %>'>
                                        <asp:ListItem>0 %</asp:ListItem>
                                        <asp:ListItem>5 %</asp:ListItem>
                                        <asp:ListItem>10 %</asp:ListItem>
                                        <asp:ListItem>15 %</asp:ListItem>
                                        <asp:ListItem>20 %</asp:ListItem>
                                        <asp:ListItem>25 %</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CALI_PEA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pruebaConnectionString %>" SelectCommand="SELECT * FROM [TB_PEA]"></asp:SqlDataSource>
    </form>
</body>
</html>
