<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartamentosAdmin.aspx.cs" Inherits="Zion.DepartamentosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" OnSelectedIndexChanged="item_seleccionado" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
            <asp:BoundField DataField="PersonasId" HeaderText="PersonasId" SortExpression="PersonasId" />
        </Columns>
    </asp:GridView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="Departamentos" EntityTypeFilter="Departamento">
    </asp:EntityDataSource>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="EntityDataSource2" Height="50px" Width="125px" OnItemDeleted="cliente_borrado" OnItemInserted="cliente_insertado" OnItemInserting="DetailsView1_ItemInserting" OnItemUpdated="cliente_updated" OnItemUpdating="DetailsView1_ItemUpdating">
        <Fields>
            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Clave" SortExpression="Clave">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Clave") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Error  Ej: MED (Solo 3 letras mayuscula)" ForeColor="#FF3300" ValidationExpression="^[A-Z]{3}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Clave") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Error  Ej: MED (Solo 3 letras mayuscula)" ForeColor="#FF3300" ValidationExpression="^[A-Z]{3}$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Clave") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PersonasId" SortExpression="PersonasId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="NombreCompleto" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" 
                        SelectCommand="SELECT [Id], [Nombres] +' '+ [Apellidos] AS [NombreCompleto], [Cedula] FROM [Personas]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreCompleto" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" SelectCommand="SELECT [Id], [Nombres] +' '+ [Apellidos] AS [NombreCompleto], [Cedula] FROM [Personas]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("PersonasId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>

    <br />
    <asp:EntityDataSource ID="EntityDataSource2" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Departamentos" Where="">
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
        </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
