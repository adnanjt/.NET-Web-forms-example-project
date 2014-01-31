<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="Zion.Cursos" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <br />
        <asp:Label ID="Label1" runat="server" Text="Departamento" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="Id" meta:resourcekey="DropDownList1Resource1" >
            <asp:ListItem Selected="True" Value="" Text="Todos" meta:resourcekey="ListItemResource1"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" 
            SelectCommand="SELECT * FROM [Departamentos]"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Nombre" meta:resourcekey="Label2Resource1"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" meta:resourcekey="txtNombreResource1"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Crédito desde:" meta:resourcekey="Label3Resource1"></asp:Label>
        <asp:Label ID="lnNumeroDesde" runat="server" meta:resourcekey="lnNumeroDesdeResource1" ></asp:Label>
        <asp:TextBox ID="txtFrom" runat="server" TextMode="Number" meta:resourcekey="txtFromResource1" ></asp:TextBox>
        <ajaxToolkit:SliderExtender ID="SliderExtender1" runat="server" TargetControlID="txtFrom" Minimum="0" Maximum="15" Steps="15" 
            EnableHandleAnimation="True"
            BoundControlID="lnNumeroDesde" Enabled="True">
        </ajaxToolkit:SliderExtender>
        <asp:Label ID="Label4" runat="server" Text="hasta:" meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:Label ID="lnNumeroHasta" runat="server" meta:resourcekey="lnNumeroHastaResource1" ></asp:Label>
        <asp:TextBox ID="txtTo" runat="server" TextMode="Number" meta:resourcekey="txtToResource1" >15</asp:TextBox>
        <ajaxToolkit:SliderExtender ID="SliderExtender2" runat="server" TargetControlID="txtTo" Minimum="0" Maximum="15" Steps="15" 
            EnableHandleAnimation="True"
            BoundControlID="lnNumeroHasta" Enabled="True">
        </ajaxToolkit:SliderExtender>
        <br />
        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" meta:resourcekey="btnBuscarResource1" />
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        ItemType="Zion.Modelo.Curso"
        AutoGenerateColumns="False" 
        DataKeyNames="Id" 
        DataSourceID="EntityDataSource1" meta:resourcekey="GridView1Resource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" meta:resourcekey="BoundFieldResource2" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="Credito" HeaderText="Credito" SortExpression="Credito" meta:resourcekey="BoundFieldResource4" />
            <asp:BoundField DataField="DepartamentoId" HeaderText="DepartamentoId" SortExpression="DepartamentoId" meta:resourcekey="BoundFieldResource5" />
        </Columns>
    </asp:GridView>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="CursoSet" EntityTypeFilter="" Select="">
    </asp:EntityDataSource>
        <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="EntityDataSource1">
        </asp:QueryExtender>
    <br />
    

</asp:Content>
