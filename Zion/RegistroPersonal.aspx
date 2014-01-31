<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroPersonal.aspx.cs" Inherits="Zion.RegistroPersonal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link href="RegistroStyle.css" rel="stylesheet" type="text/css" />
    <asp:Label ID="Label4" runat="server" Text="Registro del personal" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lbNombres" runat="server" Text="Nombres"></asp:Label>
    <asp:TextBox ID="tbNombres" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbNombres" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lbApellidos" runat="server" Text="Apellidos" ></asp:Label>
    <asp:TextBox ID="tbApellidos" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbApellidos" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lbFechaNacimiento" runat="server" Text="Fecha de Nacimiento"></asp:Label>
    <asp:TextBox ID="tbFecha" runat="server" TextMode="Date"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="* Fecha de nacimiento invalida. Debe ser mayor de edad" MinimumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*200,0,0,0)).Date.ToShortDateString() %>" MaximumValue="<%# DateTime.Now.Subtract(new TimeSpan(365*18,0,0,0)).Date.ToShortDateString() %>" Type="Date" ControlToValidate="tbFecha" ForeColor="#FF3300"></asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbFecha" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Correo Electronico"></asp:Label>
    <asp:TextBox ID="tbCorreo" runat="server" TextMode="Email"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbCorreo" ErrorMessage="* Correo invalido" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbCorreo" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Cargo"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rblCargo" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <asp:RadioButtonList ID="rblCargo" runat="server" CssClass="radioButtonList" RepeatDirection="Horizontal" >
        <asp:ListItem>Docente</asp:ListItem>
        <asp:ListItem>Administrativo</asp:ListItem>
    </asp:RadioButtonList>
    <asp:Label ID="Label3" runat="server" Text="Años de experiencia"></asp:Label>
    <asp:TextBox ID="tbExperiencia" runat="server" TextMode="Number"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbExperiencia" ErrorMessage="* Años invalidos" ForeColor="#FF3300" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbExperiencia" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Sumit" OnClientClick="return ValidatePage();" OnClick="Button1_Click" />
    <br />
</asp:Content>


