<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="proyecto1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-flex flex-wrap justify-content-center align-items-center" style="z-index:1;">
        <% foreach (var articulo in articuloList) { %>
            <div class="card m-2" style="width: 18rem;">
                <img src="<%: !(string.IsNullOrEmpty(articulo.imagenUrl)) ? articulo.imagenUrl : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" class="" alt="">
                <div class="card-body d-flex justify-content-center align-items-center flex-column">
                    <h5 class="card-title"><%: articulo.nombre %></h5>
                    <p class="card-text"><%: articulo.descripcion %></p>
                    <a href=" verArticulo.aspx?id=<%: articulo.id %>" class="btn btn-primary">Ver</a>
                </div>
            </div>
        <% } %>
    </div>               


</asp:Content>
