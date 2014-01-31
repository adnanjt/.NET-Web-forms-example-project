<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroDepartamentos.aspx.cs" Inherits="Zion.RegistroDepartamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label4" runat="server" Text="Registro de Departamentos" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Clave del departamento"></asp:Label>
    <asp:TextBox ID="clavedepartamento" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="clavedepartamento" ErrorMessage="*Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="clavedepartamento" ErrorMessage="*Error  Ej: MED (Solo 3 letras mayuscula)" ForeColor="#FF3300" ValidationExpression="^[A-Z]{3}$"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Nombre del departamento"></asp:Label>
    <asp:TextBox ID="Nombredepartamento" runat="server" Height="16px" Width="261px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Nombredepartamento" ErrorMessage="*Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Nombre del director"></asp:Label>
    <asp:TextBox ID="nombredirector" runat="server" Width="268px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nombredirector" ErrorMessage="*Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" ShowMessageBox="True" />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick="return ValidatePage();" Text="Sumit" />

</asp:Content>
