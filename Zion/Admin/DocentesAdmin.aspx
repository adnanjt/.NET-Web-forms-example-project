<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DocentesAdmin.aspx.cs" Inherits="Zion.DocentesAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    <asp:Label ID="lbCedulaFilter" runat="server" Text="Cédula"></asp:Label>
    <asp:TextBox ID="txtCedulaFilter" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Fecha Ingreso desde:"></asp:Label>
    <asp:TextBox ID="txtFrom" runat="server" TextMode="Date"></asp:TextBox>
    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFrom" 
            DefaultView="Years" 
            Format="dd/MM/yyyy">
        </ajaxToolkit:CalendarExtender>
    <asp:Label ID="Label4" runat="server" Text="hasta:"></asp:Label>
    <asp:TextBox ID="txtTo" runat="server" TextMode="Date"></asp:TextBox>
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtTo" 
            DefaultView="Years" 
            Format="dd/MM/yyyy">
        </ajaxToolkit:CalendarExtender>
    <br />
    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" />
    <asp:Button ID="btnIsertar" runat="server" OnClick="btnIsertar_Click1" Text="Insertar" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" 
        OnSelectedIndexChanged="item_seleccionado" 
        AllowPaging="True"
        ItemType="Zion.Modelo.Estudiante">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="FechaIngreso" HeaderText="FechaIngreso" SortExpression="FechaIngreso" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="sexo" HeaderText="sexo" SortExpression="sexo" />
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="fecha_nacimiento" SortExpression="fecha_nacimiento" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
    </asp:GridView>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableFlattening="False" EntitySetName="Personas" EntityTypeFilter="Docente">
    </asp:EntityDataSource>
    <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="EntityDataSource1">
            <asp:OrderByExpression DataField="Apellidos">
                <asp:ThenBy DataField="Nombres" />
            </asp:OrderByExpression>
            <asp:SearchExpression DataFields="Nombres" SearchType="Contains">
                <asp:ControlParameter ControlID="txtNombre" >
                </asp:ControlParameter >
            </asp:SearchExpression>
            <asp:SearchExpression DataFields="Cedula" SearchType="Contains">
                <asp:ControlParameter ControlID="txtCedulaFilter" >
                </asp:ControlParameter >
            </asp:SearchExpression>
            <asp:RangeExpression DataField="FechaIngreso" MaxType="Inclusive" MinType="Exclusive">
                <asp:ControlParameter ControlID="txtFrom" />
                <asp:ControlParameter ControlID="txtTo" />
            </asp:RangeExpression>
        </asp:QueryExtender>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="EntityDataSource2" Height="50px" Width="125px" OnItemDeleted="cliente_borrado" OnItemInserted="cliente_insertado" OnItemUpdated="cliente_updated">
        <Fields>
            <asp:TemplateField HeaderText="FechaIngreso" SortExpression="FechaIngreso">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("FechaIngreso","{0:dd/MM/yyyy}") %>' TextMode="Date"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="meeTextBox2TextBox8" runat="server" 
                            TargetControlID="TextBox8" MaskType="Date"
                             Mask="99/99/9999"></ajaxToolkit:MaskedEditExtender>
                    <asp:RequiredFieldValidator ID="rfvTextBox8" runat="server" ControlToValidate="TextBox8" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvTextBox8" 
                            ControlToValidate="TextBox8"
                            runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre hoy y hace 1 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*1,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*0,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ForeColor="#FF3300"></asp:RangeValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("FechaIngreso","{0:dd/MM/yyyy}") %>' TextMode="Date"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="meeTextBox2TextBox8" runat="server" 
                            TargetControlID="TextBox8" MaskType="Date"
                             Mask="99/99/9999"></ajaxToolkit:MaskedEditExtender>
                    <asp:RequiredFieldValidator ID="rfvTextBox8" runat="server" ControlToValidate="TextBox8" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvTextBox8" 
                            ControlToValidate="TextBox8"
                            runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre hoy y hace 1 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*1,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*0,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ForeColor="#FF3300"></asp:RangeValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("FechaIngreso","{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombres" SortExpression="Nombres">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Nombres") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox7" runat="server" ControlToValidate="TextBox7" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Nombres") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox7" runat="server" ControlToValidate="TextBox7" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Nombres") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellidos" SortExpression="Apellidos">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Apellidos") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox6" runat="server" ControlToValidate="TextBox6" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Apellidos") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox6" runat="server" ControlToValidate="TextBox6" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Apellidos") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cedula" SortExpression="Cedula">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cedula") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Cédula inválida. ej: 031-7264832-1" ForeColor="#FF3300" ValidationExpression="\d{3}-\d{7}-\d{1}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cedula") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Cédula inválida. ej: 031-7264832-1" ForeColor="#FF3300" ValidationExpression="\d{3}-\d{7}-\d{1}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cedula") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telefono" SortExpression="Telefono">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Teléfono inválido. ej: 8099935647" ForeColor="#FF3300" ValidationExpression="^\d{10}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Teléfono inválido. ej: 8099935647" ForeColor="#FF3300" ValidationExpression="^\d{10}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="sexo" SortExpression="sexo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sexo") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Sexo inválido. ej: M o F" ForeColor="#FF3300" ValidationExpression="^[M,F]{1}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sexo") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Sexo inválido. ej: M o F" ForeColor="#FF3300" ValidationExpression="^[M,F]{1}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("sexo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fecha_nacimiento" SortExpression="fecha_nacimiento">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha_nacimiento","{0:dd/MM/yyyy}") %>' TextMode="Date"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="meeTextBox2TextBox2" runat="server" 
                            TargetControlID="TextBox2" MaskType="Date"
                             Mask="99/99/9999"></ajaxToolkit:MaskedEditExtender>
                        <asp:RequiredFieldValidator ID="rfvTextBox2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvTextBox2" 
                            ControlToValidate="TextBox2"
                            runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre 18 y 200 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*200,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*18,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ForeColor="#FF3300"></asp:RangeValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha_nacimiento","{0:dd/MM/yyyy}") %>' TextMode="Date"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="meeTextBox2TextBox2" runat="server" 
                            TargetControlID="TextBox2" MaskType="Date"
                             Mask="99/99/9999"></ajaxToolkit:MaskedEditExtender>
                        <asp:RequiredFieldValidator ID="rfvTextBox2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvTextBox2" 
                            ControlToValidate="TextBox2"
                            runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre 18 y 200 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*200,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*18,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ForeColor="#FF3300"></asp:RangeValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("fecha_nacimiento","{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Correo invalido" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Correo invalido" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Personas" EntityTypeFilter="Docente" AutoGenerateWhereClause="True" Select="" Where="">
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
        </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
