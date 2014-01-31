<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estudiantes.aspx.cs" Inherits="Zion.Estudiantes" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ OutputCache Duration="900" VaryByParam="none" 
    VaryByControl="ListBox1;DropDownList1;txtNombre;txtMatriculaFilter;txtFrom;txtTo;" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>

<body>
    <form id="Form1" runat="server"><div>
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
            <asp:Label id="Label5" runat="server" 
                text="" 
                meta:resourcekey="Label1" />
        </div>

        <asp:Label ID="Label1" runat="server" Text="Sexo" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1" >
            <asp:ListItem Value="" meta:resourcekey="ListItemResource1">Todos</asp:ListItem>
            <asp:ListItem Value="F" meta:resourcekey="ListItemResource2">Femenino</asp:ListItem>
            <asp:ListItem Value="M" meta:resourcekey="ListItemResource3">Masculino</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="Nombre" meta:resourcekey="Label2Resource1"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" meta:resourcekey="txtNombreResource1"></asp:TextBox>
        <asp:Label ID="lbMatriculaFilter" runat="server" Text="Matricula" meta:resourcekey="lbMatriculaFilterResource1"></asp:Label>
        <asp:TextBox ID="txtMatriculaFilter" runat="server" meta:resourcekey="txtMatriculaFilterResource1"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Fecha desde:" meta:resourcekey="Label3Resource1"></asp:Label>
        <asp:TextBox ID="txtFrom" runat="server" meta:resourcekey="txtFromResource1"></asp:TextBox>
        
        <asp:Label ID="Label4" runat="server" Text="hasta:" meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:TextBox ID="txtTo" runat="server" meta:resourcekey="txtToResource1"></asp:TextBox>
        
        <br />
        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" meta:resourcekey="btnBuscarResource1" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="entdsEstudiantesGrid" OnSelectedIndexChanged="item_seleccionado" 
            ItemType="Zion.Modelo.Estudiante" meta:resourcekey="GridView1Resource1">
            <Columns>
                <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" meta:resourcekey="BoundFieldResource1" />
                <asp:BoundField DataField="PerodoIngreso" HeaderText="PerodoIngreso" SortExpression="PerodoIngreso" meta:resourcekey="BoundFieldResource2" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" meta:resourcekey="BoundFieldResource3" />
                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" meta:resourcekey="BoundFieldResource4" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" meta:resourcekey="BoundFieldResource5" />
                <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" meta:resourcekey="BoundFieldResource6" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" meta:resourcekey="BoundFieldResource7" />
                <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" meta:resourcekey="BoundFieldResource8" />
                <asp:BoundField DataField="fecha_nacimiento" HeaderText="fecha_nacimiento" SortExpression="fecha_nacimiento" meta:resourcekey="BoundFieldResource9" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" meta:resourcekey="BoundFieldResource10" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="entdsEstudiantesGrid" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="Personas" EntityTypeFilter="Estudiante" AutoGenerateWhereClause="True" Where="">
        </asp:EntityDataSource>
        <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="entdsEstudiantesGrid">
            <asp:OrderByExpression DataField="Matricula" ></asp:OrderByExpression>
            <asp:PropertyExpression>
                <asp:ControlParameter ControlID="DropDownList1" Name="sexo" />
            </asp:PropertyExpression>
            <asp:SearchExpression DataFields="Nombres" SearchType="Contains">
                <asp:ControlParameter ControlID="txtNombre" />
            </asp:SearchExpression>
            <asp:SearchExpression DataFields="Matricula" SearchType="Contains">
                <asp:ControlParameter ControlID="txtMatriculaFilter" />
            </asp:SearchExpression>
            <asp:RangeExpression DataField="fecha_nacimiento" MaxType="Inclusive" MinType="Exclusive">
                <asp:ControlParameter ControlID="txtFrom" />
                <asp:ControlParameter ControlID="txtTo" />
            </asp:RangeExpression>
        </asp:QueryExtender>
        <br />
        <p>&copy; <%: DateTime.Now %> - Adnan Tavárez</p>
        </div>
    </form>
</body>
