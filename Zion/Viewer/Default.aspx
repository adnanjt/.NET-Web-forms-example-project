<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zion._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Este es la página Default del viewer</h1>
            </hgroup>
            <h1>Que contenido desea ver?</h1>
            <a href="Estudiantes.aspx">Estudiantes</a>
            <a href="Docentes.aspx">Docentes</a>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Default Viewer</h3>
</asp:Content>
