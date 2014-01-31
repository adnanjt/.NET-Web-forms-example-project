<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroAsignaturas.aspx.cs" Inherits="Zion.RegistroAsignaturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label4" runat="server" Text="Registro de Asignaturas" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Clave"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Clave inválida. ej: ADH-256" ForeColor="#FF3300" ValidationExpression="^[A-Z]{3}-\d{3}"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="lbNombres" runat="server" Text="Nombre"></asp:Label>
    <asp:TextBox ID="tbNombres" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
        runat="server" ControlToValidate="tbNombres" 
        ErrorMessage="* Campo requerido" 
        ForeColor="#FF3300">
    </asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Créditos"></asp:Label>
    <asp:TextBox ID="tbExperiencia" runat="server" TextMode="Number"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator1" 
            runat="server" 
            ControlToValidate="tbExperiencia" 
            ErrorMessage="* Créditos inválidos, deben ser de 0 a 15" 
            ForeColor="#FF3300" 
            MaximumValue="15" MinimumValue="0" Type="Integer"></asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbExperiencia" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Departamento"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>Ingeniería Civil</asp:ListItem>
        <asp:ListItem>Ingeniería Electromecánica</asp:ListItem>
        <asp:ListItem>Ingeniería Electrónica</asp:ListItem>
        <asp:ListItem>Ingeniería en Sistemas</asp:ListItem>
        <asp:ListItem>Ingeniería Telemática</asp:ListItem>
        <asp:ListItem>Administración de Empresas</asp:ListItem>
        <asp:ListItem>Administración Hotelera</asp:ListItem>
        <asp:ListItem>Ciencias Jurídicas</asp:ListItem>
        <asp:ListItem>Comunicación Social</asp:ListItem>
        <asp:ListItem>Gestión Financiera y Auditoría</asp:ListItem>
        <asp:ListItem>Mercadotecnia</asp:ListItem>
        <asp:ListItem>Psicología</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="* Campo requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Sumit" OnClientClick="return ValidatePage();" OnClick="Button1_Click" />
    <br />
    <asp:TreeView ID="TreeView1" runat="server">
        <Nodes>
            <asp:TreeNode Text="Ingeniería Civil" Value="Ingeniería Civil">
                <asp:TreeNode Text="Topografía I" Value="Topografía I"></asp:TreeNode>
                <asp:TreeNode Text="Lab. de IC-201" Value="Lab. de IC-201"></asp:TreeNode>
                <asp:TreeNode Text="Mecánica Estruct Arq" Value="Mecánica Estruct Arq"></asp:TreeNode>
                <asp:TreeNode Text="Dibujo Civil" Value="Dibujo Civil"></asp:TreeNode>
                <asp:TreeNode Text="Geología Física" Value="Geología Física"></asp:TreeNode>
                <asp:TreeNode Text="Lab de Geología Físi" Value="Lab de Geología Físi"></asp:TreeNode>
                <asp:TreeNode Text="Análisis Estruct. I" Value="Análisis Estruct. I"></asp:TreeNode>
                <asp:TreeNode Text="Diseño Miembro Estru" Value="Diseño Miembro Estru"></asp:TreeNode>
                <asp:TreeNode Text="Sistema Estruc. I" Value="Sistema Estruc. I"></asp:TreeNode>
                <asp:TreeNode Text="Dis. Estructura I" Value="Dis. Estructura I"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Ingeniería Electromecánica" Value="Ingeniería Electromecánica">
                <asp:TreeNode Text="Diseño y Dib. Técn I	" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Diseño y Dib. Téc II	" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Ingeniería Fabricac	" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Taller IEM-104" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Fabricación Mecán. I" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Taller IEM-202" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Taller IEM-202" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Materiales" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Lab. de IEM-204" Value="New Node"></asp:TreeNode>
                <asp:TreeNode Text="Circuito Eléctrico I" Value="New Node"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Ingeniería Electrónica" Value="Ingeniería Electrónica">
                <asp:TreeNode Text="Lab. de IEM-211" Value="Lab. de IEM-211"></asp:TreeNode>
                <asp:TreeNode Text="Circuito Eléctri. II" Value="Circuito Eléctri. II"></asp:TreeNode>
                <asp:TreeNode Text="Lab. de IEM-212" Value="Lab. de IEM-212"></asp:TreeNode>
                <asp:TreeNode Text="Ilum e Instalación E" Value="Ilum e Instalación E"></asp:TreeNode>
                <asp:TreeNode Text="Estática" Value="Estática"></asp:TreeNode>
                <asp:TreeNode Text="Fundición y Moldeo" Value="Fundición y Moldeo"></asp:TreeNode>
                <asp:TreeNode Text="Taller IEM-303" Value="Taller IEM-303"></asp:TreeNode>
                <asp:TreeNode Text="Mantenimiento Indust" Value="Mantenimiento Indust"></asp:TreeNode>
                <asp:TreeNode Text="Controles Eléctr. I" Value="Controles Eléctr. I"></asp:TreeNode>
                <asp:TreeNode Text="Taller IEM-313" Value="Taller IEM-313"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Ingeniería en Sistemas" Value="Ingeniería en Sistemas">
                <asp:TreeNode Text="Introd Sistemas Comp" Value="Introd Sistemas Comp"></asp:TreeNode>
                <asp:TreeNode Text="Fund de Programación" Value="Fund de Programación"></asp:TreeNode>
                <asp:TreeNode Text="Introduc a la Inform	" Value="Introduc a la Inform	"></asp:TreeNode>
                <asp:TreeNode Text="Programación I" Value="Programación I"></asp:TreeNode>
                <asp:TreeNode Text="Lab. de ISC-202" Value="Lab. de ISC-202"></asp:TreeNode>
                <asp:TreeNode Text="Introd. a la Program" Value="Introd. a la Program"></asp:TreeNode>
                <asp:TreeNode Text="Lab. de ISC-204" Value="Lab. de ISC-204"></asp:TreeNode>
                <asp:TreeNode Text="Algoritmos y Program" Value="Algoritmos y Program"></asp:TreeNode>
                <asp:TreeNode Text="Lab. de ISC-205" Value="Lab. de ISC-205"></asp:TreeNode>
                <asp:TreeNode Text="Princ Programación" Value="Princ Programación"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Ingeniería Telemática" Value="Ingeniería Telemática">
                <asp:TreeNode Text="Conmutación Analógic" Value="Conmutación Analógic"></asp:TreeNode>
                <asp:TreeNode Text="Redes de Datos I" Value="Redes de Datos I"></asp:TreeNode>
                <asp:TreeNode Text="Lab. ITT-224" Value="Lab. ITT-224"></asp:TreeNode>
                <asp:TreeNode Text="Electrónica Comunica" Value="Electrónica Comunica"></asp:TreeNode>
                <asp:TreeNode Text="Lab. ITT-233" Value="Lab. ITT-233"></asp:TreeNode>
                <asp:TreeNode Text="Introd. Sistema Comp" Value="Introd. Sistema Comp"></asp:TreeNode>
                <asp:TreeNode Text="Fundamentos Telecomu" Value="Fundamentos Telecomu"></asp:TreeNode>
                <asp:TreeNode Text="Lab. ITT-237" Value="Lab. ITT-237"></asp:TreeNode>
                <asp:TreeNode Text="Redes de Datos II" Value="Redes de Datos II"></asp:TreeNode>
                <asp:TreeNode Text="Lab. ITT-325" Value="Lab. ITT-325"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Administración de Empresas" Value="Administración de Empresas">
                <asp:TreeNode Text="Teoría Organizaciona" Value="Teoría Organizaciona"></asp:TreeNode>
                <asp:TreeNode Text="Comportam. Organizac" Value="Comportam. Organizac"></asp:TreeNode>
                <asp:TreeNode Text="Matemáticas Financie	" Value="Matemáticas Financie	"></asp:TreeNode>
                <asp:TreeNode Text="Mét Cuantitativos I	" Value="Mét Cuantitativos I	"></asp:TreeNode>
                <asp:TreeNode Text="Admin. Pequeñas y Me	" Value="Admin. Pequeñas y Me	"></asp:TreeNode>
                <asp:TreeNode Text="Comportamiento Organ	" Value="Comportamiento Organ	"></asp:TreeNode>
                <asp:TreeNode Text="Gerencia de Operacio	" Value="Gerencia de Operacio	"></asp:TreeNode>
                <asp:TreeNode Text="Pasantía Empresarial	" Value="Pasantía Empresarial	"></asp:TreeNode>
                <asp:TreeNode Text="New NodeRespons. Social Corp	" Value="New NodeRespons. Social Corp	"></asp:TreeNode>
                <asp:TreeNode Text="Respon Social Corpor	" Value="Respon Social Corpor	"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Administración Hotelera" Value="Administración Hotelera">
                <asp:TreeNode Text="Oper de Alime y Beb.	" Value="Oper de Alime y Beb.	"></asp:TreeNode>
                <asp:TreeNode Text="Operaciones de Recep	" Value="Operaciones de Recep	"></asp:TreeNode>
                <asp:TreeNode Text="Prepar. Alimentos I	" Value="Prepar. Alimentos I	"></asp:TreeNode>
                <asp:TreeNode Text="Seguridad Hotelera	" Value="Seguridad Hotelera	"></asp:TreeNode>
                <asp:TreeNode Text="Atención al Cliente,	" Value="Atención al Cliente,	"></asp:TreeNode>
                <asp:TreeNode Text="Pasantía Específica	" Value="Pasantía Específica	"></asp:TreeNode>
                <asp:TreeNode Text="Proyecto Restaurante	" Value="Proyecto Restaurante	"></asp:TreeNode>
                <asp:TreeNode Text="Admin. Recur Humanos	" Value="Admin. Recur Humanos	"></asp:TreeNode>
                <asp:TreeNode Text="Cocina Fría	" Value="Cocina Fría	"></asp:TreeNode>
                <asp:TreeNode Text="Promoción Hotelera	" Value="Promoción Hotelera	"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Ciencias Jurídicas" Value="Ciencias Jurídicas">
                <asp:TreeNode Text="Historia del Derecho	" Value="Historia del Derecho	"></asp:TreeNode>
                <asp:TreeNode Text="Derecho Empresar I	" Value="Derecho Empresar I	"></asp:TreeNode>
                <asp:TreeNode Text="Int. al Dere I	" Value="Int. al Dere I	"></asp:TreeNode>
                <asp:TreeNode Text="Métodos de Investiga	" Value="Métodos de Investiga	"></asp:TreeNode>
                <asp:TreeNode Text="Der. Empresarial III	" Value="Der. Empresarial III	"></asp:TreeNode>
                <asp:TreeNode Text="Derecho Personas y F	" Value="Derecho Personas y F	"></asp:TreeNode>
                <asp:TreeNode Text="Francés Jurídico	" Value="Francés Jurídico	"></asp:TreeNode>
                <asp:TreeNode Text="Derecho Penal Esp I	" Value="Derecho Penal Esp I	"></asp:TreeNode>
                <asp:TreeNode Text="Der Procesal Civil I	" Value="Der Procesal Civil I	"></asp:TreeNode>
                <asp:TreeNode Text="Derecho Comparado	" Value="Derecho Comparado	"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Comunicación Social" Value="Comunicación Social">
                <asp:TreeNode Text="Nat/Hist Com. Social	" Value="Nat/Hist Com. Social	"></asp:TreeNode>
                <asp:TreeNode Text="Seminario I	" Value="Seminario I	"></asp:TreeNode>
                <asp:TreeNode Text="Expresión Oral	" Value="Expresión Oral	"></asp:TreeNode>
                <asp:TreeNode Text="Hist del Periodi Dom	" Value="Hist del Periodi Dom	"></asp:TreeNode>
                <asp:TreeNode Text="Debate de Comunic So	" Value="Debate de Comunic So	"></asp:TreeNode>
                <asp:TreeNode Text="Teoría Imagen Fílmic	" Value="Teoría Imagen Fílmic	"></asp:TreeNode>
                <asp:TreeNode Text="Práctica Profes. I	" Value="Práctica Profes. I	"></asp:TreeNode>
                <asp:TreeNode Text="Comunicación y Educa	" Value="Comunicación y Educa	"></asp:TreeNode>
                <asp:TreeNode Text="Periodismo de Invest	" Value="Periodismo de Invest	"></asp:TreeNode>
                <asp:TreeNode Text="Gestión de Marca	" Value="Gestión de Marca	"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Gestión Financiera y Auditoría" Value="Gestión Financiera y Auditoría">
                <asp:TreeNode Text="Contab. Financiera I	" Value="Contab. Financiera I	"></asp:TreeNode>
                <asp:TreeNode Text="Anál. Comput CNT-115	" Value="Anál. Comput CNT-115	"></asp:TreeNode>
                <asp:TreeNode Text="Contab. Intermedia I	" Value="Contab. Intermedia I	"></asp:TreeNode>
                <asp:TreeNode Text="Costos Estratégicos	" Value="Costos Estratégicos	"></asp:TreeNode>
                <asp:TreeNode Text="Análisis Com CNT-223	" Value="Análisis Com CNT-223	"></asp:TreeNode>
                <asp:TreeNode Text="Análisis CNT-215	" Value="Análisis CNT-215	"></asp:TreeNode>
                <asp:TreeNode Text="Análisis Comp CNT217	" Value="Análisis Comp CNT217	"></asp:TreeNode>
                <asp:TreeNode Text="Gestión Cont. Financ	" Value="Gestión Cont. Financ	"></asp:TreeNode>
                <asp:TreeNode Text="Cont de Gestión	" Value="Cont de Gestión	"></asp:TreeNode>
                <asp:TreeNode Text="Contabilidad Fiscal" Value="Contabilidad Fiscal"></asp:TreeNode>
            </asp:TreeNode>
        </Nodes>
    </asp:TreeView>
    <br />
</asp:Content>
