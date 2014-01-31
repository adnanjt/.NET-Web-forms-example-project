<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Docentes.aspx.cs" Inherits="Zion.Docentes" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ OutputCache Duration="30" VaryByParam="none" VaryByControl="txtNombre;txtCedulaFilter;txtFrom;txtTo;btnBuscar;ListBox1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>

<body>
    <form id="Form1" runat="server">
        <br />
        <div>
            <asp:ListBox id="ListBox1" runat="server">
            <asp:ListItem value="es" selected="True">Español</asp:ListItem>
            <asp:ListItem value="en" >English</asp:ListItem>
            </asp:ListBox><br />
            <asp:Button id="Button1" runat="server" 
                text="Set Language" 
                meta:resourcekey="Button1" />
            <br />
            <asp:Label id="Label1" runat="server" 
                text="" 
                meta:resourcekey="Label1" />
        </div>

    <asp:Label ID="Label2" runat="server" Text="Nombre" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:TextBox ID="txtNombre" runat="server" meta:resourcekey="txtNombreResource1"></asp:TextBox>
    <asp:Label ID="lbCedulaFilter" runat="server" Text="Cédula" meta:resourcekey="lbCedulaFilterResource1"></asp:Label>
    <asp:TextBox ID="txtCedulaFilter" runat="server" meta:resourcekey="txtCedulaFilterResource1"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Fecha Ingreso desde:" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:TextBox ID="txtFrom" runat="server" meta:resourcekey="txtFromResource1"></asp:TextBox>
    <asp:Label ID="Label4" runat="server" Text="hasta:" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:TextBox ID="txtTo" runat="server" meta:resourcekey="txtToResource1"></asp:TextBox>
    <br />
    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" meta:resourcekey="btnBuscarResource1" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" 
        OnSelectedIndexChanged="item_seleccionado" 
        AllowPaging="True"
        ItemType="Zion.Modelo.Estudiante" meta:resourcekey="GridView1Resource1">
        <Columns>
            <asp:BoundField DataField="FechaIngreso" HeaderText="FechaIngreso" SortExpression="FechaIngreso" meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" meta:resourcekey="BoundFieldResource2" />
            <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" meta:resourcekey="BoundFieldResource4" />
            <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" meta:resourcekey="BoundFieldResource5" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" meta:resourcekey="BoundFieldResource6" />
            <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" meta:resourcekey="BoundFieldResource7" />
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="fecha_nacimiento" SortExpression="fecha_nacimiento" meta:resourcekey="BoundFieldResource8" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" meta:resourcekey="BoundFieldResource9" />
        </Columns>
    </asp:GridView>
        
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="Personas" EntityTypeFilter="Docente" Select="">
    </asp:EntityDataSource>
    <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="EntityDataSource1">
        <asp:OrderByExpression DataField="Apellidos" >
            <asp:ThenBy DataField="Nombres" />
        </asp:OrderByExpression>
            <asp:SearchExpression DataFields="Nombres" SearchType="Contains">
                <asp:ControlParameter ControlID="txtNombre" />
            </asp:SearchExpression>
            <asp:SearchExpression DataFields="Cedula" SearchType="Contains">
                <asp:ControlParameter ControlID="txtCedulaFilter" />
            </asp:SearchExpression>
            <asp:RangeExpression DataField="FechaIngreso" MaxType="Inclusive" MinType="Exclusive">
                <asp:ControlParameter ControlID="txtFrom" />
                <asp:ControlParameter ControlID="txtTo" />
            </asp:RangeExpression>
    </asp:QueryExtender>
    <br />
    <p>&copy; <%: DateTime.Now %> - Adnan Tavárez</p>
    </form>
</body>

