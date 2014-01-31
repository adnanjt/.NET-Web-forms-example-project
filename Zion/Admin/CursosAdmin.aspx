<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CursosAdmin.aspx.cs" Inherits="Zion.CursosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <br />
        <asp:Label ID="Label1" runat="server" Text="Departamento"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="Id" >
            <asp:ListItem Selected="True" Value="" Text="Todos"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" 
            SelectCommand="SELECT * FROM [Departamentos]"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Crédito desde:"></asp:Label>
        <asp:Label ID="lnNumeroDesde" runat="server" ></asp:Label>
        <asp:TextBox ID="txtFrom" runat="server" TextMode="Number" ></asp:TextBox>
        <ajaxToolkit:SliderExtender ID="SliderExtender1" runat="server" TargetControlID="txtFrom" Minimum="0" Maximum="15" Steps="15" 
            EnableHandleAnimation="true"
            BoundControlID="lnNumeroDesde">
        </ajaxToolkit:SliderExtender>
        <asp:Label ID="Label4" runat="server" Text="hasta:"></asp:Label>
        <asp:Label ID="lnNumeroHasta" runat="server" ></asp:Label>
        <asp:TextBox ID="txtTo" runat="server" TextMode="Number" >15</asp:TextBox>
        <ajaxToolkit:SliderExtender ID="SliderExtender2" runat="server" TargetControlID="txtTo" Minimum="0" Maximum="15" Steps="15" 
            EnableHandleAnimation="true"
            BoundControlID="lnNumeroHasta">
        </ajaxToolkit:SliderExtender>
        <br />
        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" />
        <asp:Button ID="btnIsertar" runat="server" OnClick="btnIsertar_Click1" Text="Insertar" />
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        ItemType="Zion.Modelo.Curso"
        AutoGenerateColumns="False" 
        DataKeyNames="Id" 
        DataSourceID="EntityDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Credito" HeaderText="Credito" SortExpression="Credito" />
            <asp:BoundField DataField="DepartamentoId" HeaderText="DepartamentoId" SortExpression="DepartamentoId" />
        </Columns>
    </asp:GridView>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="CursoSet">
    </asp:EntityDataSource>
        <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="EntityDataSource1">
            <asp:PropertyExpression>
                <asp:ControlParameter ControlID="DropDownList1" Name="DepartamentoId" >
                </asp:ControlParameter >
            </asp:PropertyExpression>
            <asp:SearchExpression DataFields="Nombre" SearchType="Contains">
                <asp:ControlParameter ControlID="txtNombre" >
                </asp:ControlParameter >
            </asp:SearchExpression>
            <asp:RangeExpression DataField="Credito" MaxType="Inclusive" MinType="Exclusive">
                <asp:ControlParameter ControlID="txtFrom" />
                <asp:ControlParameter ControlID="txtTo" />
            </asp:RangeExpression>
        </asp:QueryExtender>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="EntityDataSource2" Height="50px" Width="125px" OnItemDeleted="cliente_borrado" OnItemInserted="cliente_insertado" OnItemInserting="DetailsView1_ItemInserting" OnItemUpdated="cliente_updated" OnItemUpdating="DetailsView1_ItemUpdating">
        <Fields>
            <asp:TemplateField HeaderText="Clave" SortExpression="Clave">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Clave") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox1" 
                        runat="server" ControlToValidate="TextBox1" 
                        ErrorMessage="* Campo requerido" 
                        ForeColor="#FF3300"/>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Clave inválida. ej: ADH-256" ForeColor="#FF3300" ValidationExpression="^[A-Z]{3}-\d{3}"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Clave") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox1" 
                        runat="server" ControlToValidate="TextBox1" 
                        ErrorMessage="* Campo requerido" 
                        ForeColor="#FF3300"/>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Clave inválida. ej: ADH-256" ForeColor="#FF3300" ValidationExpression="^[A-Z]{3}-\d{3}"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate> 
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Clave") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox2" 
                        runat="server" ControlToValidate="TextBox2" 
                        ErrorMessage="* Campo requerido" 
                        ForeColor="#FF3300"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox2" 
                        runat="server" ControlToValidate="TextBox2" 
                        ErrorMessage="* Campo requerido" 
                        ForeColor="#FF3300"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Credito" SortExpression="Credito">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Credito") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox3" 
                        runat="server" ControlToValidate="TextBox3" 
                        ErrorMessage="* Campo requerido" 
                        ForeColor="#FF3300"/>
                    <asp:RangeValidator ID="rvTextBox3" 
                        runat="server" 
                        ControlToValidate="TextBox3" 
                        ErrorMessage="* Créditos inválidos, deben ser de 0 a 15" 
                        ForeColor="#FF3300" 
                        MaximumValue="15" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Credito") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBox3" 
                        runat="server" ControlToValidate="TextBox3" 
                        ErrorMessage="* Campo requerido" 
                        ForeColor="#FF3300"/>
                    <asp:RangeValidator ID="rvTextBox3" 
                        runat="server" 
                        ControlToValidate="TextBox3" 
                        ErrorMessage="* Créditos inválidos, deben ser de 0 a 15" 
                        ForeColor="#FF3300" 
                        MaximumValue="15" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Credito") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DepartamentoId" SortExpression="DepartamentoId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartamentoCompleto" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" SelectCommand="SELECT [Clave]+'-'+[Nombre] AS [DepartamentoCompleto], [Id]FROM [Departamentos]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartamentoCompleto" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" SelectCommand="SELECT [Clave]+'-'+[Nombre] AS [DepartamentoCompleto], [Id]FROM [Departamentos]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DepartamentoId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:EntityDataSource ID="EntityDataSource2" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CursoSet" EntityTypeFilter="Curso" Where="">
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
        </WhereParameters>
    </asp:EntityDataSource>


</asp:Content>
