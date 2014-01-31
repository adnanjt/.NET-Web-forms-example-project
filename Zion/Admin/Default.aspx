<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zion._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Este es la página Default del administrador</h1>
            </hgroup>
            <h1>Que contenido desea editar?</h1>
            <a href="EstudiantesAdmin.aspx">Estudiantes</a>
            <a href="DepartamentosAdmin.aspx">Departamentos</a>
            <a href="DocentesAdmin.aspx">Docentes</a>
            <a href="CursosAdmin.aspx">Cursos</a>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Default Admin</h3>
</asp:Content>
