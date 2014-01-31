<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departamentos.aspx.cs" Inherits="Zion.Departamentos" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" OnSelectedIndexChanged="item_seleccionado" AllowPaging="True" AllowSorting="True" meta:resourcekey="GridView1Resource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" meta:resourcekey="BoundFieldResource2" />
            <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="PersonasId" HeaderText="PersonasId" SortExpression="PersonasId" meta:resourcekey="BoundFieldResource4" />
        </Columns>
    </asp:GridView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="Departamentos" EntityTypeFilter="Departamento" Select="">
    </asp:EntityDataSource>

    <br />
    
</asp:Content>
