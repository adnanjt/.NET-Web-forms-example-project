<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EstudiantesAdmin.aspx.cs" Inherits="Zion.EstudiantesAdmin" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <br />
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
        <asp:TextBox ID="txtFrom" runat="server" TextMode="Date" meta:resourcekey="txtFromResource1"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFrom" 
            DefaultView="Years" 
            Format="dd/MM/yyyy" Enabled="True">
        </ajaxToolkit:CalendarExtender>
        <asp:Label ID="Label4" runat="server" Text="hasta:" meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:TextBox ID="txtTo" runat="server" TextMode="Date" meta:resourcekey="txtToResource1"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtTo" 
            DefaultView="Years" 
            Format="dd/MM/yyyy" Enabled="True">
        </ajaxToolkit:CalendarExtender>
        <br />
        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click1" Text="Buscar" meta:resourcekey="btnBuscarResource1" />
        <asp:Button ID="btnIsertar" runat="server" OnClick="click_insertar" Text="Insertar" meta:resourcekey="btnIsertarResource1" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="entdsEstudiantesGrid" OnSelectedIndexChanged="item_seleccionado" 
            ItemType="Zion.Modelo.Estudiante" meta:resourcekey="GridView1Resource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
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
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="entsdsEstudiantesDetails" Height="50px" Width="125px" OnItemDeleted="cliente_borrado" OnItemInserted="cliente_insertado" OnItemUpdated="cliente_updated" meta:resourcekey="DetailsView1Resource1">
            <Fields>
                <asp:TemplateField HeaderText="Matricula" SortExpression="Matricula" meta:resourcekey="TemplateFieldResource1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Matricula") %>' TargetControlID="TextBox9" meta:resourcekey="TextBox9Resource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox9" runat="server" 
                            ControlToValidate="TextBox9" ErrorMessage="* Campo requerido" 
                            ForeColor="#FF3300" meta:resourcekey="rfvTextBox9Resource1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTextBox9" 
                            runat="server" 
                            ControlToValidate="TextBox9" 
                            ErrorMessage="* Matrícula inválida. ej: 20090195" 
                            ForeColor="#FF3300" ValidationExpression="^\d{8}$" meta:resourcekey="revTextBox9Resource1"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Matricula") %>' meta:resourcekey="TextBox9Resource2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox9" runat="server" ControlToValidate="TextBox9" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox9Resource2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTextBox9" runat="server" ControlToValidate="TextBox9" ErrorMessage="* Matrícula inválida. ej: 2009-0195" ForeColor="#FF3300" ValidationExpression="^\d{8}" meta:resourcekey="revTextBox9Resource2"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Matricula") %>' meta:resourcekey="Label9Resource1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PerodoIngreso" SortExpression="PerodoIngreso" meta:resourcekey="TemplateFieldResource2">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("PerodoIngreso") %>' meta:resourcekey="TextBox8Resource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox8" runat="server" ControlToValidate="TextBox8" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox8Resource1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTextBox8" runat="server" 
                            ControlToValidate="TextBox8" ErrorMessage="* Período de ingreso inválido. ej: 2013-2014/1" 
                            ForeColor="#FF3300" ValidationExpression="\d{4}-\d{4}/\d{1}" meta:resourcekey="revTextBox8Resource1"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("PerodoIngreso") %>' meta:resourcekey="TextBox8Resource2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox8" runat="server" ControlToValidate="TextBox8" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox8Resource2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTextBox8" runat="server" ControlToValidate="TextBox8" ErrorMessage="* Período de ingreso inválido. ej: 2013-2014/1" ForeColor="#FF3300" ValidationExpression="\d{4}-\d{4}/\d{1}" meta:resourcekey="revTextBox8Resource2"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("PerodoIngreso") %>' meta:resourcekey="Label8Resource1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombres" SortExpression="Nombres" meta:resourcekey="TemplateFieldResource3">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Nombres") %>' meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox7" runat="server" ControlToValidate="TextBox7" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox7Resource1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Nombres") %>' meta:resourcekey="TextBox7Resource2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox7" runat="server" ControlToValidate="TextBox7" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox7Resource2"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Nombres") %>' meta:resourcekey="Label7Resource1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellidos" SortExpression="Apellidos" meta:resourcekey="TemplateFieldResource4">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Apellidos") %>' meta:resourcekey="TextBox6Resource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox6" runat="server" ControlToValidate="TextBox6" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox6Resource1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Apellidos") %>' meta:resourcekey="TextBox6Resource2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox6" runat="server" ControlToValidate="TextBox6" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox6Resource2"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Apellidos") %>' meta:resourcekey="Label6Resource1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cedula" SortExpression="Cedula" meta:resourcekey="TemplateFieldResource5">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cedula") %>' meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Cédula inválida. ej: 031-7264832-1" ForeColor="#FF3300" ValidationExpression="\d{3}-\d{7}-\d{1}" meta:resourcekey="rsvTextBox5Resource1"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox5Resource1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Cedula") %>' meta:resourcekey="TextBox5Resource2"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Cédula inválida. ej: 031-7264832-1" ForeColor="#FF3300" ValidationExpression="\d{3}-\d{7}-\d{1}" meta:resourcekey="rsvTextBox5Resource2"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox5Resource2"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cedula") %>' meta:resourcekey="Label5Resource1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telefono" SortExpression="Telefono" meta:resourcekey="TemplateFieldResource6">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telefono") %>' meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Teléfono inválido. ej: 8099935647" ForeColor="#FF3300" ValidationExpression="^\d{10}" meta:resourcekey="rsvTextBox4Resource1"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox4Resource1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telefono") %>' meta:resourcekey="TextBox4Resource2"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Teléfono inválido. ej: 8099935647" ForeColor="#FF3300" ValidationExpression="^\d{10}" meta:resourcekey="rsvTextBox4Resource2"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox4Resource2"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Telefono") %>' meta:resourcekey="Label4Resource2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="sexo" SortExpression="sexo" meta:resourcekey="TemplateFieldResource7">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sexo") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Sexo inválido. ej: M o F" ForeColor="#FF3300" ValidationExpression="^[M,F]{1}$" meta:resourcekey="rsvTextBox3Resource1"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox3Resource1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sexo") %>' meta:resourcekey="TextBox3Resource2"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rsvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Sexo inválido. ej: M o F" ForeColor="#FF3300" ValidationExpression="^[M,F]{1}$" meta:resourcekey="rsvTextBox3Resource2"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox3Resource2"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("sexo") %>' meta:resourcekey="Label3Resource2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fecha_nacimiento" SortExpression="fecha_nacimiento" meta:resourcekey="TemplateFieldResource8">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha_nacimiento","{0:dd/MM/yyyy}") %>' TextMode="Date" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTextBox2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox2Resource1"></asp:RequiredFieldValidator>
                        <ajaxToolkit:MaskedEditExtender ID="meeTextBox2" runat="server" TargetControlID="TextBox2" MaskType="Date" Mask="99/99/9999" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True"></ajaxToolkit:MaskedEditExtender>
                        <asp:RangeValidator ID="rvTextBox2" 
                            ControlToValidate="TextBox2"
                            runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre 18 y 200 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*200,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*18,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ForeColor="#FF3300" meta:resourcekey="rvTextBox2Resource1"></asp:RangeValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha_nacimiento","{0:dd/MM/yyyy}") %>' TextMode="Date" meta:resourcekey="TextBox2Resource2"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="meeTextBox2" runat="server" 
                            TargetControlID="TextBox2" MaskType="Date"
                             Mask="99/99/9999" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True"></ajaxToolkit:MaskedEditExtender>
                        <asp:RequiredFieldValidator ID="rfvTextBox2" runat="server" ControlToValidate="TextBox2" 
                            ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox2Resource2"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvTextBox2" 
                            ControlToValidate="TextBox2"
                            runat="server" 
                            ErrorMessage="* Formato requerido: dd/mm/aaaa entre 18 y 200 años " 
                            MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*200,0,0,0)).Date.ToShortDateString() %>" 
                            MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*18,0,0,0)).Date.ToShortDateString() %>" 
                            Type="Date" ForeColor="#FF3300" meta:resourcekey="rvTextBox2Resource2"></asp:RangeValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("fecha_nacimiento","{0:dd/MM/yyyy}") %>' meta:resourcekey="Label2Resource2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email" meta:resourcekey="TemplateFieldResource9">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Correo invalido" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="revTextBox1Resource1"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox1Resource1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>' meta:resourcekey="TextBox1Resource2"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Correo invalido" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="revTextBox1Resource2"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo requerido" ForeColor="#FF3300" meta:resourcekey="rfvTextBox1Resource2"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>' meta:resourcekey="Label1Resource2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" meta:resourcekey="CommandFieldResource2" />
            </Fields>
        </asp:DetailsView>
        <asp:EntityDataSource ID="entsdsEstudiantesDetails" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=ZionModelContainer" DefaultContainerName="ZionModelContainer" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Personas" EntityTypeFilter="Estudiante" Where="">
            <WhereParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
            </WhereParameters>
        </asp:EntityDataSource>
</asp:Content>
