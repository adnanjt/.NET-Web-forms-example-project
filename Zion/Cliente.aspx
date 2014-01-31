<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="Zion.Cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDsCliente" 
            AllowPaging="True" AllowSorting="True" BackColor="#CCCCFF" 
            AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="item_seleccionado">
            <EmptyDataTemplate>
                Vacio
            </EmptyDataTemplate>
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" />
                <asp:BoundField DataField="fecha_nacimiento" HeaderText="Fecha nacimiento" SortExpression="fecha_nacimiento" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDsCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" SelectCommand="SELECT * FROM [Personas]" DeleteCommand="DELETE FROM [Personas] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Personas] ([Id], [Nombres], [Apellidos], [Cedula], [Telefono]) VALUES (@Id, @Nombres, @Apellidos, @Cedula, @Telefono)" UpdateCommand="UPDATE [Personas] SET [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Cedula] = @Cedula, [Telefono] = @Telefono WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="Nombres" Type="String" />
                <asp:Parameter Name="Apellidos" Type="String" />
                <asp:Parameter Name="Cedula" Type="String" />
                <asp:Parameter Name="Telefono" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nombres" Type="String" />
                <asp:Parameter Name="Apellidos" Type="String" />
                <asp:Parameter Name="Cedula" Type="String" />
                <asp:Parameter Name="Telefono" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource1" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Id" style="margin-right: 92px" OnItemInserted="cliente_insertado" OnItemUpdated="cliente_updated" OnItemDeleted="cliente_borrado">
            <Fields>
                <asp:TemplateField HeaderText="Nombres" SortExpression="Nombres">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombres") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombres") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombres") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellidos" SortExpression="Apellidos">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Apellidos") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Apellidos") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Apellidos") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cedula" SortExpression="Cedula">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Cedula") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Cédula inválida. ej: 031-7264832-1" ForeColor="#FF3300" ValidationExpression="\d{3}-\d{7}-\d{1}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Cedula") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Cédula inválida. ej: 031-7264832-1" ForeColor="#FF3300" ValidationExpression="\d{3}-\d{7}-\d{1}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cedula") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telefono" SortExpression="Telefono">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Teléfono inválido. ej: 8099935647" ForeColor="#FF3300" ValidationExpression="^\d{10}"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Teléfono inválido. ej: 8099935647" ForeColor="#FF3300" ValidationExpression="^\d{10}"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="sexo" SortExpression="sexo">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("sexo") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Sexo inválido. ej: M o F" ForeColor="#FF3300" ValidationExpression="^[M,F]{1}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("sexo") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Sexo inválido. ej: M o F" ForeColor="#FF3300" ValidationExpression="^[M,F]{1}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("sexo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="fecha_nacimiento" SortExpression="fecha_nacimiento">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" TextMode="Date" runat="server" Text='<%# Bind("fecha_nacimiento") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2" 
                            runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre 18 y 200 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*200,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*18,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ControlToValidate="TextBox7" ForeColor="#FF3300"></asp:RangeValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" TextMode="Date" runat="server" Text='<%# Bind("fecha_nacimiento") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre 18 y 200 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*150,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*18,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ControlToValidate="TextBox7" ForeColor="#FF3300"></asp:RangeValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("fecha_nacimiento") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZionDBLocalConnectionString %>" DeleteCommand="DELETE FROM [Personas] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Personas] ([Nombres], [Apellidos], [Cedula], [Telefono], [sexo], [fecha_nacimiento]) VALUES (@Nombres, @Apellidos, @Cedula, @Telefono, @sexo, @fecha_nacimiento)" SelectCommand="SELECT * FROM [Personas] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [Personas] SET [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Cedula] = @Cedula, [fecha_nacimiento] = @fecha_nacimiento, [Telefono] = @Telefono, [sexo] = @sexo WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nombres" Type="String" />
                <asp:Parameter Name="Apellidos" Type="String" />
                <asp:Parameter Name="Cedula" Type="String" />
                <asp:Parameter Name="Telefono" />
                <asp:Parameter Name="sexo" />
                <asp:Parameter Name="fecha_nacimiento" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nombres" Type="String" />
                <asp:Parameter Name="Apellidos" Type="String" />
                <asp:Parameter Name="Cedula" Type="String" />
                <asp:Parameter Name="fecha_nacimiento" />
                <asp:Parameter Name="Telefono" Type="String" />
                <asp:Parameter Name="sexo" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
    
    </div>
    </form>
</body>
</html>
