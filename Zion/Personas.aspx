<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Personas.aspx.cs" Inherits="Zion.Personas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Sexo"></asp:Label>
    
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="Refresh_listview" >
            <asp:ListItem Value="">Todos</asp:ListItem>
            <asp:ListItem Value="F">Femenino</asp:ListItem>
            <asp:ListItem Value="M">Masculino</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Fecha desde:"></asp:Label>
        <asp:TextBox ID="txtFrom" runat="server" TextMode="Date"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="hasta:"></asp:Label>
        <asp:TextBox ID="txtTo" runat="server" TextMode="Date"></asp:TextBox>
        <br />
    
        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" />
    
        <asp:ListView ID="ListView1" runat="server" DataSourceID="EntityDataSource1" ItemType="Zion.Modelo.Personas" DataKeyNames="Id" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FAFAD2;color: #284775;">Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />Nombres:
                    <asp:Label ID="NombresLabel" runat="server" Text='<%# Eval("Nombres") %>' />
                    <br />Apellidos:
                    <asp:Label ID="ApellidosLabel" runat="server" Text='<%# Eval("Apellidos") %>' />
                    <br />Cedula:
                    <asp:Label ID="CedulaLabel" runat="server" Text='<%# Eval("Cedula") %>' />
                    <br />Telefono:
                    <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
                    <br />sexo:
                    <asp:Label ID="sexoLabel" runat="server" Text='<%# Eval("sexo") %>' />
                    <br />fecha_nacimiento:
                    <asp:Label ID="fecha_nacimientoLabel" runat="server" Text='<%# Eval("fecha_nacimiento") %>' />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #FFCC66;color: #000080;">Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />Nombres:
                    <asp:TextBox ID="NombresTextBox" runat="server" Text='<%# Bind("Nombres") %>' />
                    <br />Apellidos:
                    <asp:TextBox ID="ApellidosTextBox" runat="server" Text='<%# Bind("Apellidos") %>' />
                    <br />Cedula:
                    <asp:TextBox ID="CedulaTextBox" runat="server" Text='<%# Bind("Cedula") %>' />
                    <br />Telefono:
                    <asp:TextBox ID="TelefonoTextBox" runat="server" Text='<%# Bind("Telefono") %>' />
                    <br />sexo:
                    <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' />
                    <br />fecha_nacimiento:
                    <asp:TextBox ID="fecha_nacimientoTextBox" runat="server" Text='<%# Bind("fecha_nacimiento") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Id:
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                    <br />Nombres:
                    <asp:TextBox ID="NombresTextBox" runat="server" Text='<%# Bind("Nombres") %>' />
                    <br />Apellidos:
                    <asp:TextBox ID="ApellidosTextBox" runat="server" Text='<%# Bind("Apellidos") %>' />
                    <br />Cedula:
                    <asp:TextBox ID="CedulaTextBox" runat="server" Text='<%# Bind("Cedula") %>' />
                    <br />Telefono:
                    <asp:TextBox ID="TelefonoTextBox" runat="server" Text='<%# Bind("Telefono") %>' />
                    <br />sexo:
                    <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' />
                    <br />fecha_nacimiento:
                    <asp:TextBox ID="fecha_nacimientoTextBox" runat="server" Text='<%# Bind("fecha_nacimiento") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #FFFBD6;color: #333333;">Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />Nombres:
                    <asp:Label ID="NombresLabel" runat="server" Text='<%# Eval("Nombres") %>' />
                    <br />Apellidos:
                    <asp:Label ID="ApellidosLabel" runat="server" Text='<%# Eval("Apellidos") %>' />
                    <br />Cedula:
                    <asp:Label ID="CedulaLabel" runat="server" Text='<%# Eval("Cedula") %>' />
                    <br />Telefono:
                    <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
                    <br />sexo:
                    <asp:Label ID="sexoLabel" runat="server" Text='<%# Eval("sexo") %>' />
                    <br />fecha_nacimiento:
                    <asp:Label ID="fecha_nacimientoLabel" runat="server" Text='<%# Eval("fecha_nacimiento") %>' />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />Nombres:
                    <asp:Label ID="NombresLabel" runat="server" Text='<%# Eval("Nombres") %>' DataFields="Nombres" />
                    <br />Apellidos:
                    <asp:Label ID="ApellidosLabel" runat="server" Text='<%# Eval("Apellidos") %>' />
                    <br />Cedula:
                    <asp:Label ID="CedulaLabel" runat="server" Text='<%# Eval("Cedula") %>' />
                    <br />Telefono:
                    <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
                    <br />sexo:
                    <asp:Label ID="sexoLabel" runat="server" Text='<%# Eval("sexo") %>' />
                    <br />fecha_nacimiento:
                    <asp:Label ID="fecha_nacimientoLabel" runat="server" Text='<%# Eval("fecha_nacimiento") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="Personas" EntityTypeFilter="Personas" EnableDelete="True"  EnableInsert="True" EnableUpdate="True">
        </asp:EntityDataSource>
        <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="EntityDataSource1">
            <asp:OrderByExpression DataField="Apellidos">
                <asp:ThenBy DataField="Nombres" />
            </asp:OrderByExpression>
            <asp:PropertyExpression>
                <asp:ControlParameter ControlID="DropDownList1" Name="sexo" >
                    
                </asp:ControlParameter >
            </asp:PropertyExpression>
            <asp:SearchExpression DataFields="Nombres" SearchType="Contains">
                <asp:ControlParameter ControlID="txtNombre" >
                    
                </asp:ControlParameter >
            </asp:SearchExpression>
            <asp:RangeExpression DataField="fecha_nacimiento" MaxType="Inclusive" MinType="Exclusive">
                <asp:ControlParameter ControlID="txtFrom" />
                <asp:ControlParameter ControlID="txtTo" />
            </asp:RangeExpression>
        </asp:QueryExtender>
    
    </div>
    </form>
</body>
</html>
