<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="proyecto1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-flex flex-wrap justify-content-center align-items-center mt-5" style="z-index:1;">
        <% foreach (var articulo in articuloList) { %>
            <div class="card m-2" style="width: 18rem;">
                <img src="<%: !(string.IsNullOrEmpty(articulo.imagenUrl)) ? articulo.imagenUrl : "https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg" %>" alt="" height="255px">
                <div class="card-body d-flex justify-content-center align-items-center flex-column">
                    <h5 class="card-title"><%: articulo.nombre %></h5>
                    <p class="card-text"><%: articulo.descripcion %></p>
                    <div class="d-flex justify-content-center align-items-center flex-row">
                        <h1 class="fw-bold">$ <%: articulo.precioEntero %></h1>
                        <h1 class="fw-bold pb-3" style="font-size:20px;"><%: articulo.precioDecimal %></h1>
                    </div>
                    <a href=" verArticulo.aspx?id=<%: articulo.id %>" class="btn btn-primary px-5">Ver</a>
                </div>
            </div>
        <% } %>
    </div>               
</asp:Content>
